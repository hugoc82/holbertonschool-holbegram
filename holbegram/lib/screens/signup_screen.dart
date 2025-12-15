import 'package:flutter/material.dart';
import '../widgets/text_field.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onSignUp() {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Sign up clicked (TODO)')));
  }

  void _goToLogin() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFieldInput(
              controller: _usernameController,
              hintText: 'Username',
              ispassword: false,
              suffixIcon: const Icon(Icons.person),
              keyboardType: TextInputType.text,
            ),
            const SizedBox(height: 12),
            TextFieldInput(
              controller: _emailController,
              hintText: 'Email',
              ispassword: false,
              suffixIcon: const Icon(Icons.email),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 12),
            TextFieldInput(
              controller: _passwordController,
              hintText: 'Password',
              ispassword: true,
              suffixIcon: const Icon(Icons.lock),
              keyboardType: TextInputType.text,
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _onSignUp,
                child: const Text('Create account'),
              ),
            ),
            const SizedBox(height: 8),
            TextButton(
              onPressed: _goToLogin,
              child: const Text('Already have an account? Login'),
            ),
          ],
        ),
      ),
    );
  }
}
