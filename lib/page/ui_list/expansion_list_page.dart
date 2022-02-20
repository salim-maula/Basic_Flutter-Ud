import 'package:flutter/material.dart';

class ExpansionListPage extends StatefulWidget {
  @override
  _ExpansionListPageState createState() => _ExpansionListPageState();
}

class _ExpansionListPageState extends State<ExpansionListPage> {
  final List<Map> _listPanel = [
    {'title': 'Order', 'content': 'Make your order here'},
    {'title': 'Payment', 'content': 'Here payment can you use'},
    {'title': 'Send', 'content': 'your order has been sent'},
    {'title': 'Arrive', 'content': 'Your order has arrived'},
  ];

  List<bool> _listExpanded = [];

  void setListExpanded() {
    _listExpanded.clear();
    _listPanel.forEach((element) => _listExpanded.add(false));
  }

  @override
  void initState() {
    setListExpanded();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expansion List Page'),
        titleSpacing: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              child: ExpansionPanelList(
                expansionCallback: (panelIndex, isExpanded) {
                  _listExpanded[panelIndex] = !_listExpanded[panelIndex];
                  setState(() {});
                },
                children: List.generate(_listPanel.length, (index) {
                  var item = _listPanel[index];
                  return ExpansionPanel(
                    headerBuilder: (context, isExpanded) {
                      return ListTile(
                        title: Text(item['title']),
                      );
                    },
                    canTapOnHeader: true,
                    body: Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: Text(item['content']),
                    ),
                    isExpanded: _listExpanded[index],
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
