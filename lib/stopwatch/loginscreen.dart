import 'package:flutter/material.dart';

class LoginFormScreen extends StatefulWidget {
  const LoginFormScreen({super.key});

  @override
  State<LoginFormScreen> createState() => _LoginFormScreenState();
}

class _LoginFormScreenState extends State<LoginFormScreen> {
  bool loggedIn = false;
  String name = '';

  final _nameController = TextEditingController();
  final _mailController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  Widget _buildSuccess() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.check,
          color: Colors.green,
          size: 100,
        ),
        Text(
          'Hi $name',
          style: const TextStyle(fontSize: 50),
        ),
      ],
    );
  }

  void _validate() {
    final form = _formKey.currentState;

    if (form!.validate()) {
      setState(() {
        loggedIn = true;
        name = _nameController.text;
      });
    }
  }

  Widget _buildLoginForm() {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: "Enter Name",
              ),
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return "Please write name";
                }
                return null;
              },
            ),

            const SizedBox(height: 30),

            TextFormField(
              controller: _mailController,
              decoration: const InputDecoration(
                labelText: "Enter Mail",
              ),
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return "Please enter your mail";
                }

                final regex = RegExp(
                  '[^@+@[^.]+...+]'
                );

                if (!regex.hasMatch(text)) {
                  return "Enter valid mail";
                }

                return null;
              },
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: _validate,
              child: const Text("Login"),
            ),
          ],
        ),
      ),
    );
  }


  @override
  void dispose() {
    _nameController.dispose();
    _mailController.dispose();
    super.dispose();
  }
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Form"),
      ),
      body: Center(
        child: loggedIn ? _buildSuccess() : _buildLoginForm(),
      ),
    );
  }
}