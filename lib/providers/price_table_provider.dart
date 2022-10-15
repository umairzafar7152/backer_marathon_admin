import 'package:backer_marathon_admin/models/single_unit.dart';
import 'package:backer_marathon_admin/reusable_widgets/custom_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class PriceTableProvider extends ChangeNotifier {
  final CollectionReference requestsRef =
      FirebaseFirestore.instance.collection('prices_list');

  final List<String> _ids = [];
  List<SingleUnit> _unitsList = [];
  List<SingleUnit> get unitsList => _unitsList;

  Future<void> deleteRow(int numAt, BuildContext context) async {
    // print("$numAt\n${_ids.toList().toString()}");
    try {
      await requestsRef.doc(_ids[numAt]).delete().then((_) {
        Navigator.of(context).pop();
        displayDialog(context, "Success", "Record deleted successfully!");
      });
    } catch(e) {
      Navigator.of(context).pop();
      displayDialog(context, "Error", "Error deleting the record!");
    }
    notifyListeners();
  }

  Future<void> fetchAllUnits(BuildContext context) async {
    var listSnapshot =
        await requestsRef.get();
    var listDocs = listSnapshot.docs;
    if (listDocs.isNotEmpty) {
      List<SingleUnit> unitsList = [];
      try {
        listDocs.map((document) {
          _ids.add(document.id);
          SingleUnit req = SingleUnit.fromDocument(document);
          unitsList.add(req);
        }).toList();
        _unitsList = unitsList;
      } catch (e) {
        print("Exception $e");
      }
    } else {
      Navigator.of(context).pop();
      displayDialog(context, "Error", "Please enter valid values!");
    }
    notifyListeners();
  }

  Future<void> addUnitValue(String diameter, String length, String watts,
      String partNumber, String price, BuildContext context) async {
    await requestsRef
        .add(SingleUnit(
            voltage: partNumber,
            diameter: diameter,
            length: length,
            price: price,
            watts: watts).toJson())
        .then((value) {
      Navigator.of(context).pop();
      displayDialog(context, "Success", "Record added successfully!");
    });

    notifyListeners();
  }
}
