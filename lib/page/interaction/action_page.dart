import 'package:flutter/material.dart';

class ActionPage extends StatefulWidget {
  @override
  State<ActionPage> createState() => _ActionPageState();
}

class _ActionPageState extends State<ActionPage> {
  List animals = [
    'Ayam',
    'Bebek',
    'Gajah',
    'Sapi',
    'Kerbau',
    'Kambing',
  ];

  int boxQuantity = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Text('Picker Page'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              customButton(),
              SizedBox(
                height: 16,
              ),
              ListTile(
                title: Text('Dismissible'),
                tileColor: Colors.green[300],
              ),
              buildDismissible(),
              SizedBox(
                height: 16,
              ),
              ListTile(
                title: Text('Dragable'),
                tileColor: Colors.green[300],
              ),
              buildDraggable(),
              SizedBox(
                height: 16,
              ),
              ListTile(
                title: Text('Interactive Viewer'),
                tileColor: Colors.green[300],
              ),
              SizedBox(
                height: 16,
              ),
              InteractiveViewer(
                child: Image.asset(
                  'asset/image/animal/birds.jfif',
                  
                ),
              ),
              SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDraggable() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Draggable<int>(
          data: 1,
          child: Container(
            height: 80,
            width: 80,
            color: Colors.purple,
            alignment: Alignment.center,
            child: Text(
              'Box',
              style: TextStyle(color: Colors.white),
            ),
          ),
          feedback: Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  blurRadius: 6,
                  color: Colors.black45,
                  offset: Offset.zero,
                )
              ],
              color: Colors.purple,
            ),
            alignment: Alignment.center,
            child: Text(
              'Box',
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
          ),
          childWhenDragging: Container(
            height: 80,
            width: 80,
            color: Colors.grey,
          ),
        ),
        DragTarget<int>(
          builder: (context, candidateData, rejectedData) {
            return Container(
              height: 100,
              width: 100,
              color: Colors.amber[300],
              alignment: Alignment.center,
              child: Text(
                'Box receive : \n$boxQuantity',
                textAlign: TextAlign.center,
              ),
            );
          },
          onAccept: (int data) {
            setState(() {
              boxQuantity += data;
            });
          },
        ),
      ],
    );
  }

  ListView buildDismissible() {
    return ListView.builder(
      itemCount: animals.length,
      //digunakan agar tidak bentrok dengan singlechild scroll diatas
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Dismissible(
          key: Key(animals[index]),
          background: Container(color: Colors.amber[300]),
          onDismissed: (direction) {
            setState(() => animals.removeAt(index));
          },
          child: ListTile(
            title: Text(animals[index]),
          ),
        );
      },
    );
  }

  Widget customButton() {
    return Material(
      borderRadius: BorderRadius.circular(30),
      color: Colors.amber[300],
      child: InkWell(
        borderRadius: BorderRadius.circular(30),
        splashColor: Colors.orange,
        onTap: () {},
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 8),
          child: Text('Custom Button'),
        ),
      ),
    );
  }
}
