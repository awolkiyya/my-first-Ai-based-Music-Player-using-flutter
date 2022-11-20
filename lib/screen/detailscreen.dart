import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:my_startup/screen/adioplayer.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  AudioPlayer advancedPlay = AudioPlayer();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // advancedPlay = AudioPlayer();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 237, 236, 233),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: height / 3,
            child: Container(
              color: Color.fromARGB(255, 197, 106, 219),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
              backgroundColor: Color.fromARGB(255, 197, 106, 219),
              elevation: 0.0,
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios_new),
                onPressed: () => {
                  Navigator.pop(context),
                },
              ),
              actions: [
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () => {},
                )
              ],
            ),
          ),
          Positioned(
            top: 200,
            left: 0,
            right: 0,
            height: height / 2.5,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(48.0),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 100.0,
                  ),
                  Text(
                    'THE WATER CURE',
                    style:
                        TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Marin Hyten',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  AudioPlaye(advancedPlay),
                ],
              ),
            ),
          ),
          Positioned(
            top: 130,
            left: (width - 150) / 2,
            right: (width - 150) / 2,
            height: height * 0.16,
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 226, 236, 238),
                borderRadius: BorderRadius.circular(20.0),
                border: Border.all(color: Colors.white, width: 2),
              ),
              child: Container(
                padding: EdgeInsets.all(15.0),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/pic-4.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: height - 100,
            left: 10,
            right: 10,
            height: height * 0.1,
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 251, 251, 251),
                borderRadius: BorderRadius.circular(20.0),
                // border: Border.all(color: Colors.white, width: 2),
              ),
              child: Container(
                padding: EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: (() => {}),
                      icon: Icon(Icons.arrow_back_ios_new),
                    ),
                    IconButton(
                      onPressed: (() => {}),
                      icon: Icon(Icons.diamond_rounded),
                    ),
                    IconButton(
                      onPressed: (() => {}),
                      icon: Icon(Icons.arrow_forward_ios_rounded),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
