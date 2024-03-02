import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:tipster/core/constants.dart';
import 'package:tipster/core/dependency-injection.dart';
import 'package:tipster/core/input_styles.dart';
import 'package:tipster/core/methods.dart';
import 'package:tipster/features/home/index.dart';
import 'package:tipster/routes/app_router.gr.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  FirebaseAuth firebaseAuth = getIt<FirebaseAuth>();
  bool signingUp = false;
  String email = '';
  String password = '';
  String username = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.black87,
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Login to Tipster',
              style: TextStyle(
                  color: Colors.amberAccent,
                  fontWeight: FontWeight.w700,
                  fontSize: 24),
            ),
            Form(
                key: formKey,
                autovalidateMode: autovalidateMode,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: CustomInputDecoration(hintText: 'Email'),
                      validator: ValidationBuilder().email().build(),
                      style: const TextStyle(color: Colors.white),
                      onChanged: (value) => {
                        email = value,
                      },
                    ),
                    hSpace1,
                    TextFormField(
                        decoration: CustomInputDecoration(hintText: 'Password'),
                        validator:
                            ValidationBuilder().required().minLength(5).build(),
                        style: TextStyle(color: Colors.white),
                        obscureText: true,
                        onChanged: (value) => {
                              password = value,
                            }),
                    hSpace4,
                    ElevatedButton.icon(
                      onPressed: login,
                      icon: signingUp
                          ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: const CircularProgressIndicator.adaptive(),
                            )
                          : const Icon(Icons.arrow_forward),
                      label: const Text('Login'),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 12),
                      ),
                    ),
                    hSpace4,
                    TextButton(
                        onPressed: () {
                          context.pushRoute(const SignUpRoute());
                        },
                        child: const Text(
                          'Create an account',
                          style: TextStyle(color: Colors.amber),
                        ))
                  ],
                ))
          ],
        ),
      ),
    );
  }

  login() async {
    setState(() {
      autovalidateMode = AutovalidateMode.always;
    });
    formKey.currentState!.save();
    bool isValid = formKey.currentState!.validate();
    if (isValid) {
      try {
        setState(() {
          signingUp = true;
        });
        await firebaseAuth.signInWithEmailAndPassword(
            email: email, password: password);
        context.pushRoute(const HomeRoute());
      } catch (e) {
        showSnackBar(
            context, (e as FirebaseAuthException).message.toString() ?? '');
      } finally {
        setState(() {
          signingUp = false;
        });
      }
    }
  }
}
