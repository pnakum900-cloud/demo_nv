import 'package:flutter/material.dart';

class calex extends StatefulWidget {
  const calex({super.key});

  @override
  State<calex> createState() => _calexState();
}

class _calexState extends State<calex> {

  DateTime? Date;
  void setDateValue(){
    setState(() {
      Date = DateTime(2027, 12, 31);
    });
  }

  Future<void> pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: Date ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (mounted || picked != null) return;
     setState(() {
      Date = picked;
  });
  }  
  


  @override
  Widget build(BuildContext context) {
    final text = Date == null?
    'No date selected' : '${Date!.day}/${Date!.month}/${Date!.year}';     
    return Scaffold(
     body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text),
            ElevatedButton(
              onPressed: pickDate,
              child: const Text('Pick a date'),
            ),
            ElevatedButton(
              onPressed: setDateValue,
              child: const Text('Submit'),
            ),
          ],
        ),
      )
    );
      
  }
}