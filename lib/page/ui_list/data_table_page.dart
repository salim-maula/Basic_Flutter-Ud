import 'package:flutter/material.dart';
import 'package:flutter_only/model/animal.dart';

class DataTablePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var listAnimal;
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Table Page'),
        titleSpacing: 0,
      ),
      body: Column(
        children: [
          _dataTableStatis(),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                  columns: [
                    DataColumn(label: Text('No')),
                    DataColumn(label: Text('Company')),
                    DataColumn(label: Text('Move')),
                    DataColumn(label: Text('Weight')),
                  ],
                  rows: List.generate(listAnimal.length, (index) {
                    Animal animal = listAnimal[index];
                    return DataRow(
                      cells: [
                        DataCell(Text('${index+1}')),
                        DataCell(Text(animal.name)),
                        DataCell(Text(animal.move)),
                        DataCell(Text('${animal.weight}')),
                      ],
                    );
                  })),
            ),
          ),
        ],
      ),
    );
  }

  SingleChildScrollView _dataTableStatis() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: [
            DataColumn(label: Text('No')),
            DataColumn(label: Text('Company')),
            DataColumn(label: Text('Address')),
            DataColumn(label: Text('Post Code')),
          ],
          rows: [
            DataRow(cells: [
              DataCell(Text('1')),
              DataCell(Text('Peruri')),
              DataCell(Text('Indonesia')),
              DataCell(Text('73450')),
            ])
          ],
        ),
      ),
    );
  }
}
