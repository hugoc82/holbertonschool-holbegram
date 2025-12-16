import 'package:flutter/material.dart';

import '../methods/auth_methods.dart';
import '../widgets/text_field.dart';
import 'login_screen.dart';
import 'upload_image_screen.dart';

class SignupScreen extends StatefulWidget {
  final TextEditingController emailController;
  final TextEditingController usernameController;
  final TextEditingController passwordController;
  final TextEditingController passwordConfirmController;
  final bool passwordVisibleDefault;

  SignupScreen({
    super.key,
    required this.emailController,
    required this.usernameController,
    required this.passwordController,
    required this.passwordConfirmController,
    this.passwordVisibleDefault = true,
  });

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  late bool _passwordVisible;

  @override
  void initState() {
    super.initState();
    _passwordVisible = widget.passwordVisibleDefault;
  }

  @override
  void dispose() {
    widget.emailController.dispose();
    widget.usernameController.dispose();
    widget.passwordController.dispose();
    widget.passwordConfirmController.dispose();
    super.dispose();
  }

  void _goToLogin() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => LoginScreen(
          emailController: TextEditingController(),
          passwordController: TextEditingController(),
        ),
      ),
    );
  }

  Future<void> _onSignUp() async {
    final password = widget.passwordController.text;
    final confirm = widget.passwordConfirmController.text;

    if (password != confirm) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Passwords do not match")));
      return;
    }

    final res = await AuthMethode().signUpUser(
      email: widget.emailController.text.trim(),
      password: password,
      username: widget.usernameController.text.trim(),
      file: null,
    );

    if (!mounted) return;

    if (res == "success") {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("success")));

      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const UploadImageScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(res)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 28),
            const Text(
              'Holbegram',
              style: TextStyle(fontFamily: 'Billabong', fontSize: 50),
            ),
            Image.asset('assets/images/logo.webp', width: 80, height: 60),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(height: 28),
                  TextFieldInput(
                    controller: widget.usernameController,
                    ispassword: false,
                    hintText: 'Username',
                    suffixIcon: null,
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(height: 24),
                  TextFieldInput(
                    controller: widget.emailController,
                    ispassword: false,
                    hintText: 'Email',
                    suffixIcon: null,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 24),
                  TextFieldInput(
                    controller: widget.passwordController,
                    ispassword: !_passwordVisible,
                    hintText: 'Password',
                    keyboardType: TextInputType.visiblePassword,
                    suffixIcon: IconButton(
                      alignment: Alignment.bottomLeft,
                      icon: Icon(
                        _passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 24),
                  TextFieldInput(
                    controller: widget.passwordConfirmController,
                    ispassword: !_passwordVisible,
                    hintText: 'Confirm Password',
                    keyboardType: TextInputType.visiblePassword,
                    suffixIcon: IconButton(
                      alignment: Alignment.bottomLeft,
                      icon: Icon(
                        _passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 28),
                  SizedBox(
                    height: 48,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(
                          const Color.fromARGB(218, 226, 37, 24),
                        ),
                      ),
                      onPressed: _onSignUp,
                      child: const Text(
                        'Sign up',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Already have an account?'),
                      TextButton(
                        onPressed: _goToLogin,
                        child: const Text(
                          'Log in',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(218, 226, 37, 24),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
