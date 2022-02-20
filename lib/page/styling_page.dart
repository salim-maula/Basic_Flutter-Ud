import 'dart:ui';

import 'package:flutter/material.dart';

class StylingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Text('Styling Page'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Opacity'),
            tileColor: Colors.grey.shade200,
          ),
          Center(
            child: Opacity(
              opacity: 0.5,
              child: Container(
                height: 200,
                width: 200,
                color: Colors.amber,
              ),
            ),
          ),
          ListTile(
            title: Text('BackdropFilter'),
            tileColor: Colors.grey.shade200,
          ),
          Center(
            child: SizedBox(
              height: 200,
              width: 200,
              child: Stack(
                children: [
                  Text('0' * 400),
                  Center(
                    child: ClipRRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaX: 5.0,
                          sigmaY: 5.0,
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          width: 200.0,
                          height: 200.0,
                          child: const Text('Hello World'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            title: Text('RotateBox'),
            tileColor: Colors.grey.shade200,
          ),
          Center(
            child: RotatedBox(
              quarterTurns: 1,
              child: Container(
                color: Colors.amber[300],
                width: 100,
                height: 30,
                alignment: Alignment.center,
                child: Text('Rotate Box'),
              ),
            ),
          ),
          ListTile(
            title: Text('ClipRect'),
            tileColor: Colors.grey.shade200,
          ),
          Center(
            child: ClipRect(
              child: Align(
                alignment: Alignment.topCenter,
                heightFactor: 0.6,
                widthFactor: 0.3,
                child: Image.asset('asset/image/animal/birds.jfif'),
              ),
            ),
          ),
          ListTile(
            title: Text('ClipOval'),
            tileColor: Colors.grey.shade200,
          ),
          Center(
            child: SizedBox(
              child: ClipOval(
                child: Image.asset(
                  'asset/image/animal/birds.jfif',
                ),
              ),
            ),
          ),
          ListTile(
            title: Text('ClipPath'),
            tileColor: Colors.grey.shade200,
          ),
          SizedBox(
            height: 550,
            child: ClipPath(
              clipper: _CustomCliptPath(),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Colors.blue,
                    Colors.purple
                  ])
                ),
              ),
            ),
          ),
          SizedBox(
            height: 200,
          )
        ],
      ),
    );
  }
}

class _CustomCliptPath extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    Path path = Path();
    double width = size.width;
    double height = size.height;

    path.lineTo(0, height);
    path.quadraticBezierTo(0, height -300, width, 180);
    path.lineTo(width, 0);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
  
}
