import 'package:flutter/material.dart';

class Dropex extends StatefulWidget {
  const Dropex({super.key});

  @override
  State<Dropex> createState() => _DropexState();
}

class _DropexState extends State<Dropex> {

  String unit = "Unit 1";

  void setDropdownValue(){
    setState(() {
      unit = "Unit 2";
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton <String>(
              value: unit,
              items: const[
                DropdownMenuItem(value: "Unit 1",child: Text("Unit 1"),),
                DropdownMenuItem(value: "Unit 2",child: Text("Unit 2"),),
                DropdownMenuItem(value: "Unit 3",child: Text("Unit 3"),),
              ],
              onChanged: (v) => setState(() => unit = v!),
            ),
            Text('Read: $unit'),
            ElevatedButton(
              onPressed: setDropdownValue,
              child: const Text("Change Dropdown Value"),
            )
          ],
        ),
      ),
    );
  }
}