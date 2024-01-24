import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final TextEditingController _myInputEmail = TextEditingController();
  final TextEditingController _myInputPassword = TextEditingController();
  bool _shakedEmail = false;
  bool _shakedPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Authentication'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _myInputEmail,
              decoration: InputDecoration(
                labelText: 'Email',
                errorText: _shakedEmail ? 'Invalid email' : null,
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              obscureText: true,
              controller: _myInputPassword,
              decoration: InputDecoration(
                labelText: 'Password',
                errorText: _shakedPassword ? 'Invalid password' : null,
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Implement login logic
                // Example: Validate email and password
                setState(() {
                  _shakedEmail =
                      _myInputEmail.text.isEmpty; // Example validation
                  _shakedPassword =
                      _myInputPassword.text.isEmpty; // Example validation
                });
                // Add further authentication logic here
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
