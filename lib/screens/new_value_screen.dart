import 'package:backer_marathon_admin/providers/price_table_provider.dart';
import 'package:backer_marathon_admin/reusable_widgets/custom_dialog.dart';
import 'package:backer_marathon_admin/reusable_widgets/custom_loadin_dialog.dart';
import 'package:backer_marathon_admin/reusable_widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewValueScreen extends StatelessWidget {
  const NewValueScreen({Key? key}) : super(key: key);
  static final TextEditingController _diameterController =
      TextEditingController();
  static final TextEditingController _lengthController =
      TextEditingController();
  static final TextEditingController _partNumberController =
      TextEditingController();
  static final TextEditingController _wattsController = TextEditingController();
  static final TextEditingController _priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
                child: Column(children: <Widget>[
      Padding(
          padding: const EdgeInsets.only(top: 30, bottom: 13),
          child: Center(
              child: Hero(
                  tag: 'logo1',
                  child: Image.asset('assets/fcs_logo.png',
                      height: 62, width: 110)))),
      const Text('Catridge Heaters',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Card(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                const Padding(
                  padding: EdgeInsets.fromLTRB(8, 16, 8, 16),
                  child: Center(
                    child: Text('Enter all the values',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400)),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Text('Diameter',
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w500)),
                      SizedBox(
                          width: 180,
                          height: 32,
                          child: CustomTextField(
                              controller: _diameterController,
                              inputType: TextInputType.text)),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Text('Length',
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w500)),
                      SizedBox(
                          width: 180,
                          height: 32,
                          child: CustomTextField(
                              controller: _lengthController,
                              inputType: TextInputType.text)),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Text('Watts',
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w500)),
                      SizedBox(
                          width: 180,
                          height: 32,
                          child: CustomTextField(
                              controller: _wattsController,
                              inputType: TextInputType.text)),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Text('Part Number',
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w500)),
                      SizedBox(
                          width: 180,
                          height: 32,
                          child: CustomTextField(
                              controller: _partNumberController,
                              inputType: TextInputType.text)),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Text('Price',
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w500)),
                      SizedBox(
                          width: 180,
                          height: 32,
                          child: CustomTextField(
                              controller: _priceController,
                              inputType: TextInputType.text)),
                    ],
                  ),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                          padding: const EdgeInsets.fromLTRB(8, 16, 8, 32),
                          child: Center(
                              child: SizedBox(
                            height: 41,
                            width: 123,
                            child: TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('Go Back',
                                    style: TextStyle(color: Colors.white)),
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0))),
                                    backgroundColor: MaterialStateProperty.all(
                                        const Color(0xBD221A1A)))),
                          ))),
                      Padding(
                          padding: const EdgeInsets.fromLTRB(8, 16, 8, 32),
                          child: Center(
                              child: SizedBox(
                            height: 41,
                            width: 123,
                            child: TextButton(
                                onPressed: () {
                                  if (_partNumberController.text.isNotEmpty &&
                                      _diameterController.text.isNotEmpty &&
                                      _lengthController.text.isNotEmpty &&
                                      _wattsController.text.isNotEmpty &&
                                      _priceController.text.isNotEmpty) {
                                    displayLoadingDialog(context);
                                    Provider.of<PriceTableProvider>(context,
                                            listen: false)
                                        .addUnitValue(
                                            _diameterController.text,
                                            _lengthController.text,
                                            _wattsController.text,
                                            _partNumberController.text,
                                            _priceController.text,
                                            context).then((value) {
                                      Provider.of<PriceTableProvider>(context,
                                          listen: false).fetchAllUnits(context);
                                    });
                                  } else {
                                    displayDialog(context, "Error",
                                        "Please enter all values");
                                  }
                                  Future.delayed(const Duration(seconds: 3),
                                      () {
                                    _partNumberController.text = '';
                                    _lengthController.text = '';
                                    _diameterController.text = '';
                                    _wattsController.text = '';
                                    _priceController.text = '';
                                  });
                                },
                                child: const Text('Add',
                                    style: TextStyle(color: Colors.white)),
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0))),
                                    backgroundColor: MaterialStateProperty.all(
                                        const Color(0xBD221A1A)))),
                          )))
                    ])
              ])))
    ]))));
  }
}
