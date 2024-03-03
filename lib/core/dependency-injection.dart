import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:tipster/core/firebase_options.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tipster/features/auth/cubit/auth_cubit.dart';
// ...

final getIt = GetIt.instance;
Future<void> initiatilizeDependencies() async {
  FirebaseApp firebase = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseAuth firebaseAuth = FirebaseAuth.instanceFor(app: firebase);

  FirebaseStorage firebaseStorage = FirebaseStorage.instanceFor(
    app: firebase,
    bucket: dotenv.env['FIREBASE_MAIN_BUCKET'],
  );

  FirebaseFirestore firebaseFireStore =
      FirebaseFirestore.instanceFor(app: firebase);

  AuthCubit authCubit =
      AuthCubit(firebaseAuth: firebaseAuth, firebaseStore: firebaseFireStore);

  getIt.registerSingleton(firebase);
  getIt.registerSingleton(firebaseAuth);
  getIt.registerSingleton(firebaseStorage);
  getIt.registerSingleton(firebaseFireStore);
  getIt.registerSingleton(authCubit);
}
