import 'package:flutter/material.dart';

class Collapse extends StatelessWidget {
  Function onTap;
  Collapse({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onTap();
      },
      child: Container(
        width: 70,
        height: 70,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(500)),
        child: const Icon(
          Icons.chat_bubble,
          color: Colors.green,
          size: 50,
        ),
      ),
    );
  }
}
