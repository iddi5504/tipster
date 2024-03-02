import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:tipster/core/firebase_options.dart';
// ...

final getIt = GetIt.instance;
Future<void> initiatilizeDependencies() async {
  FirebaseApp firebase = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseAuth firebaseAuth = FirebaseAuth.instanceFor(app: firebase);
  getIt.registerSingleton(firebase);
  getIt.registerSingleton(firebaseAuth);
}
