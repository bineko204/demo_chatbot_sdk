import 'dart:async';
import 'dart:convert';

import 'package:demo_chatbot_sdk2/expand.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'collapse.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainApp(),
    );
  }
}

class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);
  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  bool isExpand = false;
  dynamic data;
  StreamController streamController = StreamController();
  final methodChannel = const MethodChannel("flutter_method_channel");
  final expandKey = GlobalKey<ExpandState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // streamController.stream.listen((event) {
    //   print(event);

    // });
    methodChannel.setMethodCallHandler((call) async {
      if (call.method == "buttonClick") {
        final res = call.arguments;
        final jData = await jsonDecode(res);
        expandKey.currentState!.setData("kklasdjfa");
        // setState(() {
        //   data = jData["amount"];
        // });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        if (isExpand)
          Expand(
              key: expandKey,
              onTap: () {
            setState(() {
              isExpand = false;
            });
          })
        else
          Collapse(
            onTap: () {
              setState(() {
                isExpand = true;
              });
            },
          )
      ],
    );
  }
}
