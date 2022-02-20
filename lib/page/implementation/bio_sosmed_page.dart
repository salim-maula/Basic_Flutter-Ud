import 'package:flutter/material.dart';
import 'package:flutter_only/model/animal.dart';

class BioSosmedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    SizedBox(
                      height: 550,
                      child: ClipPath(
                        clipper: _CustomClipPath(),
                        child: Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.blue,
                                Colors.purple,
                              ],
                              begin: Alignment.centerRight,
                              end: Alignment.centerLeft,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        const SizedBox(height: 180),
                        Center(
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(width: 5, color: Colors.white),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(130),
                              child: Image.asset(
                                'asset/image/profile.jpg',
                                width: 130,
                                height: 130,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Salim Maula',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 50),
                          child: Text(
                            "I'm a Mobile Flutter Developer, my specially in Android Development. Beside work as Flutter Dev, I'm also Instructor Course",
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              child: Text('Following'),
                              style: ButtonStyle(
                                shape: MaterialStateProperty.resolveWith(
                                  (states) => RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                                backgroundColor:
                                    MaterialStateProperty.resolveWith(
                                  (states) => Colors.purple,
                                ),
                              ),
                            ),
                            const SizedBox(width: 30),
                            OutlinedButton(
                              onPressed: () {},
                              child: Text('Message'),
                              style: ButtonStyle(
                                side: MaterialStateProperty.resolveWith(
                                  (states) => BorderSide(
                                    color: Colors.blue,
                                  ),
                                ),
                                shape: MaterialStateProperty.resolveWith(
                                  (states) => RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            buildItem('Post', '1.2K'),
                            Container(
                              height: 30,
                              width: 2,
                              color: Colors.purple,
                            ),
                            buildItem('Follower', '49.5K'),
                            Container(
                              height: 30,
                              width: 2,
                              color: Colors.purple,
                            ),
                            buildItem('Following', '5.6K'),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                SizedBox(
                  height: 220,
                  child: ListView.builder(
                    itemCount: 4,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      Animal animal = listAnimal[index];
                      return Container(
                        width: 140,
                        margin: EdgeInsets.fromLTRB(
                          index == 0 ? 16 : 8,
                          0,
                          index == 3 ? 16 : 8,
                          0,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            animal.image,
                            width: 140,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 8),
                TextButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      SizedBox(width: 8),
                      Text('See All'),
                      SizedBox(width: 8),
                      Icon(Icons.navigate_next),
                    ],
                  ),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.resolveWith(
                      (states) => RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              title: const Text('salimmaula'),
              toolbarHeight: kToolbarHeight,
              actions: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildItem(String title, String data) {
    return Container(
      width: 100,
      child: Column(
        children: [
          Text(
            data,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 8),
          Text(title),
        ],
      ),
    );
  }
}

class _CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double width = size.width;
    double height = size.height;

    path.lineTo(0, height);
    path.quadraticBezierTo(0, height - 300, width, 180);
    path.lineTo(width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
