import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class AudioPlaye extends StatefulWidget {
  final AudioPlayer advancedPlay;
  AudioPlaye(this.advancedPlay, {super.key});

  @override
  State<AudioPlaye> createState() => _AudioPlayeState();
}

class _AudioPlayeState extends State<AudioPlaye> {
  Duration _duration = new Duration(seconds: 100);
  Duration _position = new Duration();
  String path =
      "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-13.mp3";
  bool isPlaying = false;
  bool isPaused = false;
  bool isLoop = false;
  bool isRepeat = false;
  Color color = Colors.black;
  List<IconData> _icons = [Icons.play_circle_fill, Icons.pause_circle_filled];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    this.widget.advancedPlay.onDurationChanged.listen(
      (d) {
        setState(
          () {
            _duration = d;
            print(_duration);
          },
        );
      },
    );
    this.widget.advancedPlay.onPositionChanged.listen(
      (p) {
        setState(
          () {
            _position = p;
          },
        );
      },
    );
    this.widget.advancedPlay.setSourceUrl(path);
    this.widget.advancedPlay.onPlayerComplete.listen((event) {
      setState(() {
        _position = Duration(seconds: 0);
        if (isRepeat == true) {
          isPlaying = true;
        } else {
          isPlaying = false;
          isRepeat = false;
        }
      });
    });
  }

  Widget btnFast() {
    return IconButton(
      icon: ImageIcon(
        AssetImage('assets/forward.png'),
        size: 15,
        color: Colors.black,
      ),
      onPressed: () => {
        this.widget.advancedPlay.setPlaybackRate(1.5),
      },
    );
  }

  Widget btnSlow() {
    return IconButton(
      icon: ImageIcon(
        AssetImage('assets/backword.png'),
        size: 15,
        color: Colors.black,
      ),
      onPressed: () => {
        this.widget.advancedPlay.setPlaybackRate(0.5),
      },
    );
  }

  Widget slider() {
    return Slider(
      activeColor: Colors.red,
      inactiveColor: Colors.grey,
      value: _position.inSeconds.toDouble(),
      min: 0.0,
      max: _duration.inSeconds.toDouble(),
      onChanged: (double value) {
        setState(() {
          changedToSecond(value.toInt());
          value = value;
        });
      },
    );
  }

  void changedToSecond(int second) {
    Duration newDuration = Duration(seconds: second);
    this.widget.advancedPlay.seek(newDuration);
  }

  Widget btnRepeat() {
    return IconButton(
      icon: ImageIcon(
        AssetImage('assets/repeat.png'),
        size: 15,
        color: color,
      ),
      onPressed: () => {
        if (isRepeat == false)
          {
            this.widget.advancedPlay.setReleaseMode(ReleaseMode.loop),
            setState(
              () {
                isRepeat = true;
                color = Colors.blue;
              },
            ),
          }
        else if (isRepeat == true)
          {
            this.widget.advancedPlay.setReleaseMode(ReleaseMode.release),
            setState(
              () {
                isRepeat = false;
                color = Colors.black;
              },
            ),
          }
      },
    );
  }

  Widget btnLoop() {
    return IconButton(
      icon: ImageIcon(
        AssetImage('assets/loop.png'),
        size: 15,
        color: Colors.black,
      ),
      onPressed: () => {},
    );
  }

  Widget btnStart() {
    return IconButton(
      padding: EdgeInsets.all(1),
      icon: isPlaying == false
          ? Icon(
              _icons[0],
              size: 50.0,
              color: Colors.blue,
            )
          : Icon(
              _icons[1],
              size: 50.0,
              color: Color.fromARGB(255, 9, 188, 232),
            ),
      onPressed: () {
        if (isPlaying == false) {
          this.widget.advancedPlay.play(UrlSource(path));
          this.widget.advancedPlay.setPlaybackRate(1.0);
          print('i am playing');
          setState(() {
            isPlaying = true;
            // isPaused = true;
          });
        } else if (isPlaying == true) {
          this.widget.advancedPlay.pause();
          setState(() {
            isPlaying = false;
            // isPaused = false;
          });
        }
      },
    );
  }

  Widget loadAsset() {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          btnStart(),
        ],
      ),
    );
  }

  // now list the important things for this
  @override
  Widget build(BuildContext context) {
    return Container(
        // now everything is done here
        child: Column(
      children: [
        SizedBox(
          height: 20.0,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _position.toString().split(".")[0],
              ),
              Text(
                _duration.toString().split(".")[0],
              ),
            ],
          ),
        ),
        slider(),
        SizedBox(height: 20.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            btnRepeat(),
            btnSlow(),
            loadAsset(),
            btnFast(),
            btnLoop(),
          ],
        )
      ],
    ));
  }
}
