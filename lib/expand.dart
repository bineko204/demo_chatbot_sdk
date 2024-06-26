import 'package:flutter/material.dart';

class Expand extends StatefulWidget {
  Function onTap;
  dynamic data;

  Expand({Key? key, required this.onTap, required this.data}) : super(key: key);

  @override
  State<Expand> createState() => _ExpandState();
}

class _ExpandState extends State<Expand> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.9,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: () {
              widget.onTap();
            },
            child: Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(500)),
              child: const Icon(
                Icons.chat_bubble,
                color: Colors.green,
                size: 50,
              ),
            ),
          ),
          Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(top: 20),
            color: Colors.white,
            child: Text(
              widget.data.toString(),
              style: const TextStyle(color: Colors.black),
            ),
          ))
        ],
      ),
    );
  }
}
