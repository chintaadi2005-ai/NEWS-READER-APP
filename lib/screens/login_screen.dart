import 'package:flutter/material.dart';
import '../services/auth_service.dart';

class LoginScreen extends StatefulWidget {
  final VoidCallback onLogin;
  final VoidCallback onSignupClick;
  const LoginScreen({
    super.key,
    required this.onLogin,
    required this.onSignupClick,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _email = TextEditingController();
  final _password = TextEditingController();

  void _submit() {
    // Basic validation
    if (_email.text.isEmpty || _password.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Enter email and password'),
        backgroundColor: Colors.red,
      ));
      return;
    }

    // Authenticate user
    final success = AuthService.login(
      email: _email.text,
      password: _password.text,
    );

    if (success) {
      widget.onLogin();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Invalid email or password'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.newspaper, size: 72),
          const SizedBox(height: 12),
          Text('Welcome back',
              style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 20),
          TextField(
              controller: _email,
              decoration: const InputDecoration(labelText: 'Email')),
          const SizedBox(height: 12),
          TextField(
              controller: _password,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true),
          const SizedBox(height: 20),
          ElevatedButton(
              onPressed: _submit,
              child: const SizedBox(
                  width: double.infinity, child: Center(child: Text('Login')))),
          const SizedBox(height: 8),
          TextButton(onPressed: () {}, child: const Text('')),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                  child: OutlinedButton(
                      onPressed: () {}, child: const Text('NEWS READER'))),
            ],
          ),
          const SizedBox(height: 12),
          TextButton(
            onPressed: widget.onSignupClick,
            child: const Text('Don\'t have an account? Sign up'),
          ),
        ],
      ),
    );
  }
}
