import 'package:flutter/material.dart';
import '../widgets/text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onLogin() {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Login clicked (TODO)')));
  }

  void _goToSignUp() {
    Navigator.pushNamed(context, '/signup');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFieldInput(
              controller: _emailController,
              hintText: 'Email',
              ispassword: false,
              suffixIcon: null,
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
                onPressed: _onLogin,
                child: const Text('Login'),
              ),
            ),
            const SizedBox(height: 8),
            TextButton(
              onPressed: _goToSignUp,
              child: const Text("Don't have an account? Sign up"),
            ),
          ],
        ),
      ),
    );
  }
}
