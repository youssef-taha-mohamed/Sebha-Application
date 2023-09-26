import 'package:e_sebha/layout/dialog_screen.dart';
import 'package:e_sebha/layout/sebha_layout.dart';
import 'package:e_sebha/modules/myprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widget/dismisable.dart';

class ZikrScreen extends StatelessWidget {
  const ZikrScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<MyProvider>(context).stateFun();
    Provider.of<MyProvider>(context).retreivedata();
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "قائمة الأذكار",
            style: TextStyle(
                color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        body: Provider.of<MyProvider>(context).listText == null
            ? const Center(
                child: Text('لا يوجد أذكار', style: TextStyle(fontSize: 22)))
            : Consumer<MyProvider>(
                builder: (ct, value, child) => ListView.separated(
                  itemBuilder: (ctx, index) => Container(
                    margin: const EdgeInsets.only(top: 15),
                    height: MediaQuery.of(context).size.height * 0.13,
                    child: buildDismissible(
                      key: value.listText![index].id.toString(),
                      context: context,
                      delete: () {},
                      edit: () {},
                      child: ListTile(
                        onTap: () {
                          value.getZikrById(value.listText![index].id!);
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const SebhaScreen()));
                        },
                        textColor: Colors.teal,
                        leading: CircleAvatar(
                          radius: 40,
                          child: Text(
                            value.listText![index].count.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        title: Text(
                          value.listText![index].name,
                          textDirection: TextDirection.rtl,
                          style: const TextStyle(
                            fontSize: 23,
                          ),
                        ),
                      ),
                    ),
                  ),
                  separatorBuilder: (ctx, i) => Padding(
                    padding: const EdgeInsetsDirectional.only(end: 20.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      color: Colors.grey,
                      height: 1.0,
                    ),
                  ),
                  itemCount: value.listText!.length,
                ),
              ),
        floatingActionButton: SizedBox(
          height: 60,
          width: 180,
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
                //side: BorderSide(width: 2,color: Colors.orange),
                //padding: EdgeInsets.all(10),
                textStyle:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.5))),
            label: const Text(
              "أضافة ذكر",
              // textDirection: TextDirection.rtl,
            ),
            onPressed: () {
              DialogScreen dialogScreen = const DialogScreen();
              dialogScreen.showAlertDialog(context);
            },
            icon: const Icon(Icons.add),
          ),
        ));
  }
}
