import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../modules/myprovider.dart';
import '../modules/zikr.dart';

TextEditingController controllerText = TextEditingController();
TextEditingController controllerGoal = TextEditingController();

class DialogScreen extends StatelessWidget {
  const DialogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return showAlertDialog(context);
  }

  showAlertDialog(BuildContext context) {
   // var pro = Provider.of<MyProvider>(context, listen: false);
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'أضافة ذكر',
            style: TextStyle(),
            textDirection: TextDirection.rtl,
          ),
          content: SizedBox(
            height: MediaQuery.of(context).size.height * 0.17,
            child: Column(
              children: [
                TextFormField(
                  textDirection: TextDirection.rtl,
                  controller: controllerText,
                  decoration: const InputDecoration(
                      hintText: "أسم الذكر  ",
                      hintStyle: TextStyle(
                        color: Colors.black,
                      ),
                      hintTextDirection: TextDirection.rtl),
                ),
                TextFormField(
                  textDirection: TextDirection.rtl,
                  controller: controllerGoal,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      hintText: "0 ",
                      hintStyle: TextStyle(
                        color: Colors.black,
                      ),
                      hintTextDirection: TextDirection.rtl),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            Consumer<MyProvider>(
              builder: (ct, value, child) => Center(
                child: TextButton(
                  child: const Text(
                    'أضافة',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  onPressed: () async {
                    Navigator.of(context).pop();
                    value.zikrModel = Zikr(
                        name: controllerText.text,
                        count: int.parse(controllerGoal.text),
                        clicked: 0);
                    value.zikr.insert(value.zikrModel);
                    value.listText = await value.zikr.retrieve();
                    value.notifyListeners();
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
