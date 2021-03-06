import 'package:flutter/material.dart';

class TablePage extends StatelessWidget {
  final List<Map> _listData = [
    {'title': 'Order', 'content': 'Make your order here'},
    {'title': 'Payment', 'content': 'Here payment can you use'},
    {'title': 'Send', 'content': 'your order has been sent'},
    {'title': 'Arrive', 'content': 'Your order has arrived'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Table Page'),
        titleSpacing: 0,
      ),
      body: ListView(
        children: [
          _tableStatis(),
          SizedBox(
            height: 30,
          ),
          Table(
            columnWidths: const <int, TableColumnWidth>{
              0: FractionColumnWidth(.3),
              1: FractionColumnWidth(.7),
            },
            border: TableBorder.all(),
            children: _listData.map((e) {
              return TableRow(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(e['title']),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(e['content']),
                  ),
                ],
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Table _tableStatis() {
    return Table(
      border: TableBorder.all(),
      columnWidths: const <int, TableColumnWidth>{
        0: FractionColumnWidth(.5),
        1: FractionColumnWidth(.1),
        2: FractionColumnWidth(.4),
      },
      children: [
        TableRow(children: [
          Container(
            height: 32,
            color: Colors.green,
          ),
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.top,
            child: Container(
              height: 32,
              width: 32,
              color: Colors.red,
            ),
          ),
          Container(
            height: 64,
            color: Colors.blue,
          ),
        ])
      ],
    );
  }
}
