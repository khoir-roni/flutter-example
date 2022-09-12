import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gesture Detector',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final double boxSize = 150.0;
  int numTaps = 0;
  int numDoubleTaps = 0;
  int numLongPress = 0;

  double posX = 0.0;
  double posY = 0.0;

  //fungsi untuk mendapatkan posisi tengah dari layar
  void center(BuildContext context) {
    final mediaSize = MediaQuery.of(context).size;
    posX = (mediaSize.width / 2) - boxSize / 2;
    posY = (mediaSize.height / 2) - boxSize / 2 - 30;
    setState(() {
      this.posX = posX;
      this.posY = posY;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (posX == 0) {
      center(context);
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gesture Detector'),
      ),
      body: Stack(
        children: [
          Positioned(
            top: posY,
            left: posX,
            child: GestureDetector(
              // onVerticalDragUpdate: (details) {
              //   setState(() {
              //     double deltaY = details.delta.dy;

              //     posY += deltaY;
              //   });
              // },
              // onHorizontalDragUpdate: (details) {
              //   setState(() {
              //     double deltaX = details.delta.dx;

              //     posX += deltaX;
              //   });
              // },
              onPanUpdate: (details) {
                setState(() {
                  double deltaY = details.delta.dy;
                  double deltaX = details.delta.dx;
                  posY += deltaY;
                  posX += deltaX;
                });
              },
              onTap: () {
                setState(() {
                  numTaps++;
                });
              },
              onDoubleTap: () {
                setState(() {
                  numDoubleTaps++;
                });
              },
              onLongPress: () {
                setState(() {
                  numLongPress++;
                });
              },
              child: Container(
                width: boxSize,
                height: boxSize,
                decoration: const BoxDecoration(color: Colors.red),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.yellow,
        padding: const EdgeInsets.all(16.0),
        child: Text(
          'Taps: $numTaps - Double Taps: $numDoubleTaps - Long Press: $numLongPress',
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
    );
  }
}
