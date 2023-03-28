// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '2_dice_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dice game',
      home: LogIn(),
    );
  }
}

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  TextEditingController controller = TextEditingController();
  TextEditingController controller2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Log in'),
        backgroundColor: Colors.redAccent,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          )
        ],
      ),
      body: Builder(builder: (context) {
        return SingleChildScrollView(
          // 키보드가 올라오는 만큼 스크롤을 해주는 것,
          // 지금의 에뮬은 상관이 없지만 폰의 사이즈가 작을 경우 중요
          child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Padding(padding: EdgeInsets.only(top: 50)),
              // 패딩으로 gif의 위치 조정
              Center(
                child: Image(
                  image: AssetImage('image/chef.gif'),
                  width: 170.0,
                  height: 190.0,
                ),
              ),
              Form(
                child: Theme(
                  data: ThemeData(
                      primaryColor: Colors.teal,
                      inputDecorationTheme: InputDecorationTheme(
                          labelStyle: TextStyle(
                        color: Colors.teal,
                        fontSize: 15.0,
                      ))),
                  child: Container(
                    padding: EdgeInsets.all(40.0),
                    // 입력 창에 대해 패딩을 준다
                    child: Column(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        TextField(
                          decoration:
                              InputDecoration(labelText: 'Enter "dice"'),
                          keyboardType: TextInputType.text,
                          controller: controller,
                        ),
                        TextField(
                          decoration:
                              InputDecoration(labelText: 'Enter "password"'),
                          keyboardType: TextInputType.text,
                          obscureText: true,
                          // 이거 해주면 비번 치는거처럼 값들이 안나옴
                          controller: controller2,
                        ),
                        SizedBox(
                          height: 40.0,
                        ),
                        ButtonTheme(
                          minWidth: 100.0,
                          height: 50.0,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.amberAccent,
                            ),
                            child: Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                              size: 35.0,
                            ),
                            onPressed: () {
                              if (controller.text == "dice" &&
                                  controller2.text == "1234") {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            Dice()));
                              } else if (controller.text != "dice" &&
                                  controller2.text == "1234") {
                                showSnackBar3(context);
                              } else if (controller.text == "dice" &&
                                  controller2.text != "1234") {
                                showSnackBar2(context);
                              } else {
                                showSnackBar(context);
                              }
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}

void showSnackBar(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      '로그인 정보를 다시 확인하세요',
      textAlign: TextAlign.center,
    ),
    duration: Duration(seconds: 2),
    backgroundColor: Colors.blue,
  ));
}

void showSnackBar2(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      '비밀번호가 일치하지 않습니다',
      textAlign: TextAlign.center,
    ),
    duration: Duration(seconds: 2),
    backgroundColor: Colors.blue,
  ));
}

void showSnackBar3(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      'dice의 철자를 확인해 주세요',
      textAlign: TextAlign.center,
    ),
    duration: Duration(seconds: 2),
    backgroundColor: Colors.blue,
  ));
}
