import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const FunnyQuotesApp());
}

class FunnyQuotesApp extends StatelessWidget {
  const FunnyQuotesApp({super.key}); //กำหนดconstructor

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true, //version 3 แลดูโมเดิน
      ),
      home: HomePage(), //เรียกใช้ Homepage
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const List<String> quoteList = [
    'น้ำขึ้นให้รีบตัก ผู้หญิงทักให้รีบตอบ',
    'กลางคืนอย่างห้าว ตอนเช้าอย่างง่วง',
    'พูดไม่เก่ง แต่กินหมดจาน',
    'ใบไม้ยังร่วง นับประสาอะไรกับคนง่วงอย่างเรา',
    'ถึงเรื่องเงินเราติดดิน แต่เรื่องกินเราติดดาว',
    'ในวันที่เราเจอของหนักๆ อย่างน้อยกระเป๋าตังค์เราก็เบา'
  ];
  static const List<MaterialColor> colorList = [
    //ฉันพลาดตรงนี้ที่ไม่รู้ว่า สี เป็นไทป์อะไร
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.orange,
  ];

  var quote = quoteList[0];
  var color = Colors.teal;
  // ลิสต์สำหรับเก็บสีที่ถูกใช้แล้ว

  void handleClickGo() {
    setState(() {
      var rand = Random();
      var randomIndex;
      var randomIndexColor;

      do {
        randomIndex = rand.nextInt(quoteList.length);
      } while (quoteList[randomIndex] == quote);

      quote = quoteList[randomIndex];

      do {
        randomIndexColor = rand.nextInt(colorList.length);
      } while (colorList[randomIndexColor] == color);

      color = colorList[randomIndexColor];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('คำคมกวนๆ'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: handleClickGo,
        child: const Text('Next Quote',),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Text(
            quote,
            style: TextStyle(
              color: color,
              fontSize: 50,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
