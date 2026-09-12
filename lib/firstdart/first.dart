import 'package:flutter/material.dart';
import 'output.dart';

class FirstEx extends StatefulWidget {
  const FirstEx({super.key});

  @override
  State<FirstEx> createState() => _FirstExState();
}

class _FirstExState extends State<FirstEx> {

  bool _isPasswordVisible = false;
  String? gender;
  String? BloodGroup;
  double LanguageEfficincy = 1; 

  final nameController = TextEditingController();
  final mailController = TextEditingController();
  final passwordController = TextEditingController();
  final ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        centerTitle: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.water_drop,
              color: Colors.blue,
              size: 45,    
            ),
            const SizedBox(width: 10,),
            const Text("Life-Link",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            ),
            const SizedBox(height: 100,),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Form(
          child: Column(
            children: [
              const SizedBox(height: 50,),
              SizedBox(
                height: 50,
                // width: 450,
                child: TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: "Name",
                    hintText: "Enter your name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)
                    ),
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
              ),
              const SizedBox(height: 15,),
              
              SizedBox(
                height: 50,
                child: TextFormField(
                  controller: mailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: "Mail",
                    hintText: "Enter your Mail",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    prefixIcon: Icon(Icons.mail),
                  ),
                ),
              ),
              const SizedBox(height: 15,),

              
              SizedBox(
                height: 50,
                child: TextFormField(
                  controller: passwordController,
                  obscureText: !_isPasswordVisible,
                  decoration:  InputDecoration(
                    labelText: "Password",
                    hintText: "Enter your Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12) 
                    ),
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(_isPasswordVisible ? Icons.visibility: Icons.visibility_off),
                      onPressed: (){
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                      ),
                      
                  ),
                ),
              ),
              const SizedBox(height: 15,),

              SizedBox(
                height: 50,
                child: TextFormField(
                  controller: ageController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Age",
                    hintText: "Enter Age",
                    prefixIcon: Icon(Icons.cake),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15,),
              Column(
                children: [
                  RadioListTile<String>(
                    title: const Text("Male"),
                    value: "Male",
                    groupValue: gender,
                    onChanged: (value){
                      setState(() {
                        gender = value;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: const Text("Female"),
                    value: "Female",
                    groupValue: gender,
                    onChanged: (value){
                      setState(() {
                        gender = value;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 15,),
              
              SizedBox(
                height: 50,
                child: DropdownButtonFormField<String>(
                  value: BloodGroup,
                  decoration: InputDecoration(
                    labelText: "Select Blood-Group",
                    prefixIcon: Icon(Icons.bloodtype),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)
                    ),
                  ),
                  items: [
                    DropdownMenuItem(
                      value: "A+",
                      child: Text("A+"),
                      ),
                      DropdownMenuItem(
                      value: "A-",
                      child: Text("A-"),
                      ),
                      DropdownMenuItem(
                      value: "AB+",
                      child: Text("AB+"),
                      ),
                      DropdownMenuItem(
                      value: "AB-",
                      child: Text("AB-"),
                      ),
                      DropdownMenuItem(
                      value: "O+",
                      child: Text("O+"),
                      ),
                      DropdownMenuItem(
                      value: "O-",
                      child: Text("O-"),
                      ),
                  ],
                  onChanged: (value){
                    setState(() {
                      BloodGroup = value;
                    });
                  },
                ),
              ),
              const SizedBox(height: 15,),
              const Text("Enter Your Language Efficiency"),
              SizedBox(
                height: 50,
                child: Slider(
                  value: LanguageEfficincy,
                  min: 1,
                  max: 15,
                  divisions:14,
                  label: LanguageEfficincy.round().toString(),
                  onChanged: (value){
                    setState(() {
                      LanguageEfficincy = value;
                    });
                  },
                ),
              ),

              const SizedBox(height: 25,),
              ElevatedButton(onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OutputOFRegister(
                    name: nameController.text, 
                    mail: mailController.text, 
                    password: passwordController.text, 
                    gender: gender ?? "Not Selected", 
                    age: ageController.text, 
                    bloodGroup: BloodGroup ?? "Not Selected", 
                    languageEfficiency: LanguageEfficincy
                   ),
                  ),
                );
              }, child: Text("Register") ),  
            ],
          ),
        ),
      ),
    );
  }
}