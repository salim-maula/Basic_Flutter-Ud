import 'package:flutter/material.dart';

class CustomScrollPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 250,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Custom Scroll Page'),
            ),
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200.0,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 4.0,
            ),
            delegate: SliverChildBuilderDelegate((context, index) {
              return Container(
                color: Colors.blue[100],
                child: Text('Grid item $index'),
              );
            },
            childCount: 30
            ),
          ),
          SliverFixedExtentList(
            itemExtent: 50,
            delegate:  SliverChildBuilderDelegate((context, index) {
              return Container(
                // color: Colors.amber[100],
                child: Text('List item $index'),
              );
            },
            childCount: 15,
            ),
          )
        ],
      ),
    );
  }
}
