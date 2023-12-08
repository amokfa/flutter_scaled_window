import 'package:flutter/material.dart';
import 'package:scaled_window/scaled_window.dart';

void main() {
  runApp(
    ScaledWindow(
      resolution: Size(1366, 768),
      builder: (_, scale) => MyApp(scale: scale),
    ),
  );
}

class MyApp extends StatelessWidget {
  double scale;
  MyApp({Key? key, required this.scale}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width - 50;
    final textStyle = TextStyle(fontSize: 40, );
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(title: const Text('A Desktop App')),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Material(
                elevation: 10,
                child: SizedBox(
                  width: width / 4,
                  child: const RotatedBox(
                    quarterTurns: 1,
                    child: FittedBox(
                      child: Text('Left Sidebar'),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Material(
                elevation: 10,
                child: SizedBox(
                  width: width / 2,
                  child: Column(
                    children: [
                      Text("Main View", style: textStyle),
                      Text("This app thinks it's running in a 1366x768 window", style: textStyle, textAlign: TextAlign.center,),
                      Text("Window scale: ${scale.toStringAsFixed(2)}", style: textStyle, textAlign: TextAlign.center,),
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Material(
                elevation: 10,
                child: SizedBox(
                  width: width / 4,
                  child: const RotatedBox(
                    quarterTurns: 1,
                    child: FittedBox(
                      child: Text('Right Sidebar'),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
