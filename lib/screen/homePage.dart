import 'package:flutter/material.dart';
import 'package:my_startup/screen/detailscreen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Center(
          child: IconButton(
        icon: Icon(Icons.arrow_back_ios_sharp),
        onPressed: () => {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DetailScreen()),
          ),
        },
      )),
    );
  }
}
