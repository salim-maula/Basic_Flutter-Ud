import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogPage extends StatefulWidget {
  @override
  State<DialogPage> createState() => _DialogPageState();
}

class _DialogPageState extends State<DialogPage> {
  void openSimpleDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return SimpleDialog(
          title: Text('Simple Dialog'),
          contentPadding: EdgeInsets.all(16),
          children: [
            Text('Child 1'),
            Text('Child 2'),
            Text('Child 3'),
            Text('Child 4'),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Close'),
            )
          ],
        );
      },
    );
  }

  void openAlertDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: Text('Delete Item'),
          content: Text('Are you sure to delete this item'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                print('cancel Delete');
              },
              child: Text('No'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                print('Item Delete');
              },
              child: Text('Yes'),
            ),
          ],
        );
      },
    );
  }

  void openAboutDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AboutDialog(
          applicationIcon: Image.asset(
            'asset/image/profile.jpg',
            width: 70,
            height: 70,
            fit: BoxFit.cover,
          ),
          applicationName: 'Belajar Flutter',
          applicationVersion: '1.2.0',
          applicationLegalese: '@_salimmaula',
          children: [
            Text('test1'),
            Text('test2'),
            Text('test3'),
          ],
        );
      },
    );
    //kita juga bisa menggunakan showAboutDialog
  }

  void openCupertinoDialog() {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text('Delete Item'),
          content: Text('Are you sure to delete this item'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                print('cancel Delete');
              },
              child: Text('No'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                print('Item Delete');
              },
              child: Text('Yes'),
            ),
          ],
        );
      },
    );
  }

  void openPopUpMenu() {
    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(16, 300, 16, 200),
      items: [
        PopupMenuItem(
          child: Text('Menu 1'),
          value: 'Menu 1',
        ),
        PopupMenuItem(
          child: Text('Menu 2'),
          value: 'Menu 2',
        ),
        PopupMenuItem(
          child: Text('Menu 3'),
          value: 'Menu 3',
        ),
      ],
    );
  }

  void openBottomSheet(BuildContext ctx) {
    showBottomSheet(
        context: ctx,
        builder: (context1) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(60),
                topRight: Radius.circular(60),
              ),
              color: Colors.yellow[300],
            ),
            child: Column(
              children: [
                Image.asset(
                  'asset/image/profile.jpg',
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  height: 16,
                ),
                Text('Name Profile'),
                Text('Email@mail.com'),
              ],
            ),
          );
        },
        backgroundColor: Colors.transparent,
        elevation: 0);
  }

  void openModalBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              SizedBox(height: 8,),
              Divider(
                thickness: 3,
                color: Colors.grey,
                indent: 150,
                endIndent: 150,
              ),
              ListTile(
                      title: Text('Modal bottom sheet'),
                      trailing: IconButton(
                        onPressed: (){
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.close),
                      ),
                    ),
              Expanded(
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('Item $index'),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
      backgroundColor: Colors.amber[200],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        )
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Text('Dialog Page'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          ElevatedButton(
            onPressed: () => openSimpleDialog(),
            child: Text('Simple Dialog'),
          ),
          ElevatedButton(
            onPressed: () => openAboutDialog(),
            child: Text('About Dialog'),
          ),
          ElevatedButton(
            onPressed: () => openAlertDialog(),
            child: Text('Alert Dialog'),
          ),
          ElevatedButton(
            onPressed: () => openCupertinoDialog(),
            child: Text('Cupertino Alert Dialog'),
          ),
          ElevatedButton(
            onPressed: () => openPopUpMenu(),
            child: Text('PopUp Menu'),
          ),
          Builder(builder: (ctx) {
            return ElevatedButton(
              onPressed: () => openBottomSheet(ctx),
              child: Text('Bottom Sheet'),
            );
          }),
          ElevatedButton(
            onPressed: () => openModalBottomSheet(),
            child: Text('Modal BottomSheet'),
          ),
        ],
      ),
    );
  }
}
