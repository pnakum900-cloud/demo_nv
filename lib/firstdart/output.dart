import 'package:flutter/material.dart';

class OutputOFRegister extends StatelessWidget {
  final String name;
  final String mail;
  final String password;
  final String gender;
  final String age;
  final String bloodGroup;
  final double languageEfficiency;

  const OutputOFRegister({
    super.key,
    required this.name,
    required this.mail,
    required this.password,
    required this.gender,
    required this.age,
    required this.bloodGroup,
    required this.languageEfficiency,
    });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Registerd Data"),
        centerTitle: true,
      ),
      body: Padding(padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Name: $name"),
            Text("Mail: $mail"),
            Text("Password: $password"),
            Text("Gender: $gender"),
            Text("Age: $age"),
            Text("Blood Group: $bloodGroup"),
            Text("Language Efficiency: ${languageEfficiency.round()}")
          ],
        ),
      ),
    );
  }
}