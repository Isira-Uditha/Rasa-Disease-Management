import 'package:flutter/material.dart';
import 'package:sidma_app/screens/chat/chat_room.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SIDMA',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xff809b7b),

      ),
      home: const MyHomePage(title: 'SIDMA'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return const ChatRoom();
  }
}
