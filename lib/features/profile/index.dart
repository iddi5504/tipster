import 'dart:typed_data';

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validator/form_validator.dart';
import 'package:tipster/core/constants.dart';
import 'package:tipster/core/dependency-injection.dart';
import 'package:tipster/core/input_styles.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tipster/core/methods.dart';
import 'package:tipster/features/auth/cubit/auth_cubit.dart';
import 'package:tipster/models/user_models.dart';
import 'package:tipster/routes/app_router.gr.dart';

@RoutePage()
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  FirebaseAuth firebaseAuth = getIt<FirebaseAuth>();
  FirebaseStorage firebaseStorage = getIt<FirebaseStorage>();
  FirebaseFirestore firebaseFirestore = getIt<FirebaseFirestore>();

  bool updating = false;
  Uint8List? selectedFile;
  String? displayName;
  String? username;
  String? phoneNumber;
  String? bio;
  List<Future> updateFutures = [];

  @override
  Widget build(BuildContext context) {
    UserModel user = context.read<AuthCubit>().state.user!;
    return Scaffold(
      backgroundColor: Colors.black54,
      body: PopScope(
          canPop: context.read<AuthCubit>().state.profileComplete,
          onPopInvoked: (didPop) {
            if (didPop == false) {
              showSnackBar(context, 'Complete your profile');
            }
          },
          child: CustomScrollView(
            shrinkWrap: false,
            slivers: [
              SliverAppBar(
                floating: true,
                backgroundColor: Colors.amberAccent,
                toolbarHeight: 85,
                forceMaterialTransparency: false,
                pinned: true,
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(90),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 35,
                          backgroundImage: CachedNetworkImageProvider(App.name,
                              cacheKey: user.profileImageURL ?? '', scale: 1),
                        ),
                        wSpace3,
                        Text(user.displayName ?? '',
                            style: const TextStyle(
                                color: Colors.black, fontSize: 20)),
                      ],
                    ),
                  ),
                ),
                flexibleSpace: FlexibleSpaceBar(
                    collapseMode: CollapseMode.parallax,
                    stretchModes: const [
                      StretchMode.zoomBackground,
                    ],
                    background: Stack(fit: StackFit.expand, children: [
                      if (selectedFile != null)
                        Image.memory(selectedFile!, fit: BoxFit.cover)
                      else if (user.profileImageURL != null &&
                          user.profileImageURL!.isNotEmpty)
                        CachedNetworkImage(
                          imageUrl: user.profileImageURL ?? '',
                          fit: BoxFit.cover,
                        )
                      else
                        const Center(
                          child: Text(
                            'No profile picture',
                            style: TextStyle(fontSize: 24, color: Colors.white),
                          ),
                        ),
                      Positioned.directional(
                        top: 25,
                        end: 3,
                        textDirection: TextDirection.ltr,
                        child: TextButton.icon(
                            onPressed: pickImage,
                            icon: const Icon(
                              Icons.edit,
                              color: Colors.amber,
                            ),
                            label: const Text(
                              'Edit',
                              style:
                                  TextStyle(color: Colors.amber, fontSize: 24),
                            )),
                      )
                    ])),
                expandedHeight: 400,
                onStretchTrigger: () {
                  return Future.delayed(
                    Duration.zero,
                  );
                },
              ),
              SliverToBoxAdapter(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  height: 700,
                  width: double.infinity,
                  child: Form(
                      child: Column(
                    children: [
                      TextFormField(
                        initialValue: user.bio ?? '',
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        decoration: CustomInputDecoration(hintText: 'Bio'),
                        maxLines: 4,
                        onChanged: (value) => bio = value,
                      ),
                      hSpace1,
                      TextFormField(
                        initialValue: user.displayName ?? '',
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        validator: ValidationBuilder().required().build(),
                        decoration: CustomInputDecoration(
                            hintText: 'Display name',
                            prefixIcon: const Icon(Icons.person)),
                        onChanged: (value) {
                          displayName = value;
                        },
                      ),
                      hSpace1,
                      TextFormField(
                        initialValue: user.userName,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        validator: ValidationBuilder().required().build(),
                        decoration: CustomInputDecoration(
                          hintText: 'User name',
                          prefixIcon: const Icon(Icons.person),
                        ),
                        onChanged: (value) => username = value,
                      ),
                      TextFormField(
                        initialValue: user.phoneNumber ?? '',
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        keyboardType: TextInputType.phone,
                        decoration: CustomInputDecoration(
                          hintText: 'Phone number',
                          prefixIcon: const Icon(Icons.phone),
                        ),
                        onChanged: (value) => phoneNumber = value,
                      ),
                      hSpace6,
                      // Spacer(),
                      ElevatedButton.icon(
                          onPressed: update,
                          icon: updating
                              ? const SizedBox(
                                  width: 13,
                                  height: 13,
                                  child: CircularProgressIndicator())
                              : const Icon(Icons.update),
                          label: const Text('Update')),
                      const Spacer()
                    ],
                  )),
                ),
              )
            ],
          )),
    );
  }

  pickImage() async {
    final ImagePicker picker = ImagePicker();
    await picker
        .pickImage(
      source: ImageSource.gallery,
    )
        .then((value) {
      if (value != null) {
        value.readAsBytes().then((file) {
          setState(() {
            selectedFile = file;
          });
        });
      }
    });
  }

  update() async {
    UserModel user = context.read<AuthCubit>().state.user!;
    setState(() {
      updating = true;
    });
    String? profileUrl;
    List<Future> futures = [
      firebaseAuth.currentUser!.updateDisplayName(displayName),
    ];

    if (selectedFile != null) {
      final docRef = firebaseStorage
          .ref("profile_images/${firebaseAuth.currentUser!.email!}");
      await docRef.putData(selectedFile!);
      profileUrl = await docRef.getDownloadURL();

      futures.add(firebaseAuth.currentUser!.updatePhotoURL(profileUrl));
    }
    UserModel payload = UserModel(
      userName: username ?? user.userName,
      phoneNumber: phoneNumber ?? user.phoneNumber,
      bio: bio ?? user.bio,
      email: firebaseAuth.currentUser?.email ?? '',
      profileImageURL: profileUrl ?? user.profileImageURL,
      profileComplete: true,
      displayName: displayName ?? user.displayName,
    );
    await getIt<AuthCubit>().updateUser(payload, () {
      showSnackBar(context, 'Profile updated successfully');
      context.router.popAndPush(const HomeRoute());
    }, () {
      showSnackBar(context, 'Profile update failed');
    });

    Future.wait(futures).then((value) {
      showSnackBar(
        context,
        'Profile updated successfully',
      );
    }).catchError((e) {
      showSnackBar(context, e.toString());
    });
    setState(() {
      updating = false;
    });
  }
}
