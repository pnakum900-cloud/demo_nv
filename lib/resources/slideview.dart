import 'package:flutter/material.dart';
import 'package:demo_nv/resources/imagestring.dart';

class Scrollview extends StatefulWidget {
  const Scrollview({super.key});

  @override
  State<Scrollview> createState() => _ScrollviewState();
}

class _ScrollviewState extends State<Scrollview> {

  Widget ScrollDisp(){
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: s2.length,
        itemBuilder: (context, index){
          return Padding(padding: EdgeInsets.all(10.0),
            child: Image.asset(
             s2[index],
             height: 70,
             width: 70,
             fit: BoxFit.cover, 
            ),
          );
        },
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ScrollDisp(),
      ),
    );
  }
}