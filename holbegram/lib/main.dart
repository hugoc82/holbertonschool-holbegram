import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';
import 'screens/login_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/upload_image_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return MaterialApp(
      title: 'Holbegram',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LoginScreen(
        emailController: emailController,
        passwordController: passwordController,
      ),
      routes: {
        '/login': (_) => LoginScreen(
          emailController: TextEditingController(),
          passwordController: TextEditingController(),
        ),
        '/signup': (_) => SignupScreen(
          emailController: TextEditingController(),
          usernameController: TextEditingController(),
          passwordController: TextEditingController(),
          passwordConfirmController: TextEditingController(),
        ),
        '/upload': (_) => const UploadImageScreen(),
      },
    );
  }
}
