import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tipster/models/user_models.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firebaseStore;
  AuthCubit({
    required this.firebaseAuth,
    required this.firebaseStore,
  }) : super(AuthInitial());

  Future<void> createUser(UserModel user, String password, Function? onSuccess,
      Function(String error) onError) async {
    try {
      await firebaseAuth
          .createUserWithEmailAndPassword(email: user.email, password: password)
          .then((user_) async {
        CollectionReference users = firebaseStore.collection('/users');
        await users.doc(user_.user?.uid).set(
            UserModel(userName: user.userName, email: user.email).toJson());
        emit(state.copyWith(user: user, authStatus: AuthStatus.authenticated));
        onSuccess!();
      });
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString()));
      onError((e as FirebaseException).message!);
    }
  }

  Future<void> getUser() async {
    final user = firebaseAuth.currentUser;
    if (user == null) {
      emit(state.copyWith(authStatus: AuthStatus.unauthenticated));
    } else {
      final userDoc =
          await firebaseStore.collection('/users').doc(user.uid).get();
      final user_ = UserModel.fromJson(userDoc.data() as Map<String, dynamic>);
      emit(state.copyWith(user: user_, authStatus: AuthStatus.authenticated));
      user_.profileComplete
          ? emit(state.copyWith(profileComplete: true))
          : emit(state.copyWith(profileComplete: false));
    }
  }

  Future<void> updateUser(
      UserModel payload, Function? onSuccess, Function onError) async {
    final user =
        firebaseStore.collection('/users').doc(firebaseAuth.currentUser!.uid);
    try {
      await user.update(payload.toJson());
      emit(state.copyWith(profileComplete: true, user: payload));
      onSuccess!();
    } catch (e) {
      onError((e as FirebaseException).message!);
    }
  }

  Future<void> logout() async {
    await firebaseAuth.signOut().then((value) =>
        emit(state.copyWith(authStatus: AuthStatus.unauthenticated)));
  }
}
