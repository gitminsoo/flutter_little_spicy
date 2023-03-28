// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'i don\'t know',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('you have pushed the button this many times: '),
              Text(
                '$counter',
                style: Theme.of(context).textTheme.displayLarge,
              ),
              Checkbox(value: false, onChanged: (bool? value) {}),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                    child: Icon(Icons.add),
                    onPressed: () {
                      setState(() {
                        counter++;
                        print("$counter");
                      });
                    },
                  ),
                  FloatingActionButton(
                    child: Icon(Icons.minimize_outlined),
                    onPressed: () {
                      setState(() {
                        counter--;
                        print("$counter");
                      });
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
