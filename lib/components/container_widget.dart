import 'package:flutter/material.dart';

class ContainerWidget extends StatelessWidget {
  String? text;

  ContainerWidget({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height / 4,
      width: MediaQuery.of(context).size.width / 2-20,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
            colors: [(Colors.deepPurple), (Colors.black)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter),
      ),
      child: Text(
        text!,
        style: const TextStyle(
          fontSize: 20,
          color: Colors.white,
        ),
      ),
    );
  }
}
