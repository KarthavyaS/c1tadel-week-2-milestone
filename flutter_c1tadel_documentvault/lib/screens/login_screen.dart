import 'package:flutter/material.dart';
import '../services/auth_service.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';
  String? _error;

  void _login() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      bool success = await AuthService.login(_email, _password);
      if (success) {
        Navigator.pushReplacementNamed(context, '/dashboard');
      } else {
        setState(() => _error = 'Invalid email or password!');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = Colors.deepPurpleAccent;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Colors.deepPurple, Colors.purpleAccent]),
        ),
        child: Center(
          child: Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
            margin: EdgeInsets.symmetric(horizontal: 32),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Document Vault', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: primaryColor)),
                      SizedBox(height: 24),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Email', prefixIcon: Icon(Icons.email)),
                        validator: (value) => value != null && value.contains('@') ? null : 'Enter a valid email',
                        onSaved: (value) => _email = value ?? '',
                      ),
                      SizedBox(height: 16),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Password', prefixIcon: Icon(Icons.lock)),
                        obscureText: true,
                        validator: (value) => value != null && value.length >= 6 ? null : 'Min 6 characters',
                        onSaved: (value) => _password = value ?? '',
                      ),
                      SizedBox(height: 24),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                          minimumSize: Size(double.infinity, 50),
                        ),
                        onPressed: _login,
                        child: Text('Sign In', style: TextStyle(fontSize: 18)),
                      ),
                      if (_error != null) ...[
                        SizedBox(height: 16),
                        Text(_error!, style: TextStyle(color: Colors.red)),
                      ]
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
