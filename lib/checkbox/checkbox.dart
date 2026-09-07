import 'package:flutter/material.dart';

class checkboxx extends StatefulWidget {
  const checkboxx({super.key});

  @override
  State<checkboxx> createState() => _checkboxxState();
}

class _checkboxxState extends State<checkboxx> {
  bool checked = false;

  void setCheckboxValue() {
    setState(() {
      checked = !checked;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body : SafeArea(
        child: Column(
          children: [
            Center(
              child: CheckboxListTile(
                title: Text("Remember me"),
                value: checked,
                onChanged: (v) => setState(
                  (){
                    checked = v!;
                  },
                ),
              ),
            ),
            Text('Read: $checked'),
            ElevatedButton(
              onPressed: setCheckboxValue,
              child: const Text("Submit"),
            ),
          ],
            
         
        ),
      ),
    );
  }
}