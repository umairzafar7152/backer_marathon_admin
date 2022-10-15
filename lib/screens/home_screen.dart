import 'package:backer_marathon_admin/providers/price_table_provider.dart';
import 'package:backer_marathon_admin/reusable_widgets/price_table.dart';
import 'package:backer_marathon_admin/screens/new_value_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    Provider.of<PriceTableProvider>(context,
        listen: false).fetchAllUnits(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("FCS Admin"),
          actions: <Widget>[
            Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const NewValueScreen()));
                  },
                  child: const Icon(
                    Icons.add,
                    size: 26.0,
                  ),
                ))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.only(top: 30, bottom: 13),
                  child: Center(
                      child: Hero(
                          tag: 'logo1',
                          child: Image.asset('assets/fcs_logo.png',
                              height: 62, width: 110)))),
              const Text('Catridge Heaters',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
              Consumer<PriceTableProvider>(builder: (context, provider, child) {
                try {
                  return provider.unitsList.isNotEmpty
                      ? const PriceTable()
                      : Image.asset('assets/fcs_image.png');
                } catch(e) {
                  return const Text('Something went wrong!');
                }
              })
              // StreamBuilder(
              //     stream: FirebaseFirestore.instance
              //         .collection('prices_list')
              //         .snapshots(),
              //     builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              //       if (!snapshot.hasData) return const Center(child: Text('Loading...', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)));
              //       var listDocs = snapshot.data!.docs;
              //       if (listDocs.isNotEmpty) {
              //         List<SingleUnit> unitsList = [];
              //         try {
              //           listDocs.map((document) {
              //             SingleUnit req = SingleUnit.fromDocument(document);
              //             unitsList.add(req);
              //           }).toList();
              //           // Navigator.of(context).pop();
              //           return PriceTable(snapshot: unitsList);
              //         } catch (e) {
              //           return const Center(child: Text('Something went wrong!', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)));
              //         }
              //       }
              //       return const Center(child: Text('Something went wrong!', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)));
              //       // return snapshot.data!.docs.isNotEmpty?PriceTable(snapshot: snapshot.data!.docs)
              //       //     : Image.asset('assets/fcs_image.png');
              //     })
            ],
          ),
        ),
      ),
    );
  }
}
