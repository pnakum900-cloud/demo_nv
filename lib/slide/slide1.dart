import 'package:flutter/material.dart';

class SlideEx extends StatefulWidget {
  const SlideEx({super.key});

  @override
  State<SlideEx> createState() => _SlideExState();
}

class _SlideExState extends State<SlideEx> {
  double val = 20;

  void setSliderValue(double v) {
    setState(() {
      val = v;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Slider(
              value: val,
              min: 0,
              max: 100,
              divisions: 10,
              onChanged:(v) => setState(() {
                val = v;
              }),
            ),
            Text('Value: $val'),
            ElevatedButton(
              onPressed: () => setSliderValue(20),
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}