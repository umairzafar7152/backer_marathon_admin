import 'package:backer_marathon_admin/providers/price_table_provider.dart';
import 'package:backer_marathon_admin/reusable_widgets/custom_loadin_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PriceTable extends StatelessWidget {

  const PriceTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // bool ascending = false;
    return Column(
      children: <Widget>[
        Padding(
            padding: const EdgeInsets.all(24.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: const <Widget>[
                      Text('Price Table',
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.w400)),
                      SizedBox(height: 5),
                      Text('Prices',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w700))
                    ],
                  ),
                  // Column(
                  //     crossAxisAlignment: CrossAxisAlignment.end,
                  //     children: <Widget>[
                  //       const Text('Sort by',
                  //           style: TextStyle(
                  //               fontSize: 14, fontWeight: FontWeight.w700)),
                  //       const SizedBox(height: 5),
                  //       Row(children: <Widget>[
                  //         GestureDetector(
                  //             onTap: () {
                  //               onSortColumn(
                  //                   0,
                  //                   ascending,
                  //                   Provider.of<PriceTableProvider>(context,
                  //                       listen: false));
                  //               ascending = !ascending;
                  //             },
                  //             child: Row(children: [
                  //               const Text('Length',
                  //                   style: TextStyle(
                  //                       fontSize: 12,
                  //                       fontWeight: FontWeight.w500)),
                  //               Image.asset('assets/arrow.png',
                  //                   height: 16, width: 16)
                  //             ])),
                  //         const SizedBox(width: 10),
                  //         GestureDetector(
                  //             onTap: () {
                  //               onSortColumn(
                  //                   1,
                  //                   ascending,
                  //                   Provider.of<PriceTableProvider>(context,
                  //                       listen: false));
                  //               ascending = !ascending;
                  //             },
                  //             child: Row(children: [
                  //               const Text('Price',
                  //                   style: TextStyle(
                  //                       fontSize: 12,
                  //                       fontWeight: FontWeight.w500)),
                  //               Image.asset('assets/arrow.png',
                  //                   height: 16, width: 16)
                  //             ]))
                  //       ])
                  //     ])
                ])),
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: FittedBox(child: Consumer<PriceTableProvider>(
                builder: (context, provider, child) {
              return DataTable(
                  columns: const [
                    DataColumn(
                        label: Text('Diameter',
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.w400))),
                    DataColumn(
                        label: Text('Length',
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.w400))),
                    DataColumn(
                        label: Text('Watts',
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.w400))),
                    DataColumn(
                        label: Text('Voltage',
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.w400))),
                    DataColumn(
                        label: Text('Price',
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.w400))),
                    DataColumn(
                        label: Text('Delete',
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.w400))),
                  ],
                  rows: provider.unitsList
                      .map((element) => DataRow(
                            cells: <DataCell>[
                              DataCell(Text(element.diameter.toString(),
                                  style: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400))),
                              DataCell(Text(element.length.toString(),
                                  style: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400))),
                              DataCell(Text(element.watts.toString(),
                                  style: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400))),
                              DataCell(Text(element.voltage.toString(),
                                  style: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400))),
                              DataCell(Text("\$${element.price.toString()}",
                                  style: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold))),
                              DataCell(GestureDetector(
                                  onTap: () {
                                    displayLoadingDialog(context);
                                    provider.deleteRow(provider.unitsList.indexOf(element), context).then((value) {
                                      Provider.of<PriceTableProvider>(context,
                                          listen: false).fetchAllUnits(context);
                                    });
                                  },child: const Icon(Icons.delete, color: Colors.red))),
                            ],
                          ))
                      .toList());
            })))
      ],
    );
  }

  // onSortColumn(int columnIndex, bool ascending, PriceTableProvider provider) {
  //   if (columnIndex == 0) {
  //     if (ascending) {
  //       provider.unitsList.sort((a, b) => a.length.compareTo(b.length));
  //     } else {
  //       provider.unitsList.sort((a, b) => b.length.compareTo(a.length));
  //     }
  //   } else {
  //     if (ascending) {
  //       provider.unitsList.sort((a, b) => a.price.compareTo(b.price));
  //     } else {
  //       provider.unitsList.sort((a, b) => b.price.compareTo(a.price));
  //     }
  //   }
  // }
}
