import 'package:flutter/material.dart';

class ResponsiveSpacePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Responsive Space Page'),
        titleSpacing: 0,
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constraints.maxHeight
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                group1(),
                group2(),
              ],
            ),
          ),
        );
      }),
    );
  }

  Column group2() {
    return Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Text("Don't have an account? Register"),
                SizedBox(
                  height: 16,
                ),
              ],
            );
  }

  Column group1() {
    return Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Center(
                  child: Icon(
                    Icons.account_circle,
                    size: 150,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                  width: 250,
                  height: 40,
                  alignment: Alignment.center,
                  child: Text("input satu"),
                  color: Colors.blue[100],
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                  width: 250,
                  height: 40,
                  alignment: Alignment.center,
                  child: Text("input dua"),
                  color: Colors.blue[100],
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(onPressed: () {}, child: Text('LOGIN')),
              ],
            );
  }
}
