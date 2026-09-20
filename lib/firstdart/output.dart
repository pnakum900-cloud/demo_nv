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
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: (){
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Edit button pressed"),
                ),
              );
            },
          ),
          IconButton(
            onPressed: (){
              showDialog(context: context, 
              builder: (context){
                return AlertDialog(
                  title: const Text("Delete data"),
                  content: const Text("Are you sure to delete data"),
                  actions: [
                    TextButton(
                      onPressed: (){
                        Navigator.pop(context);
                    }, 
                    child: const Text("Cancle")
                    ),
                    TextButton(
                      onPressed:(){
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Data Deleted")
                          ),
                        );
                      } , 
                      child: const Text("Delete"),
                      ),
                  ],
                );
              });
          }, 
          icon: const Icon(Icons.delete),
          ),
        ],
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