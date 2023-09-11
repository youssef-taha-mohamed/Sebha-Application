import 'package:flutter/material.dart';

class NewScreen extends StatefulWidget {
  const NewScreen({Key? key}) : super(key: key);

  @override
  State<NewScreen> createState() => _NewScreenState();
}

class _NewScreenState extends State<NewScreen> {
  TextEditingController controllerText = TextEditingController();
  TextEditingController controllerGoel = TextEditingController();
  List<String> listText = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.separated(
        itemBuilder: (ctx, index) => Container(
          child: Text(listText[index]),
        ),
        separatorBuilder: (ctx, i) => const SizedBox(
          height: 100,
        ),
        itemCount: listText.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAlertDialog(context);
        },
        child: Icon(
          Icons.add,
          color: Colors.teal.shade700,
        ),
      ),
    );
  }

  _showAlertDialog(BuildContext context) {
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
                  controller: controllerGoel,
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
            Center(
              child: TextButton(
                child: const Text(
                  'أضافة',
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
                onPressed: () {
                  setState(() {
                    Navigator.of(context).pop();
                    listText.add(controllerText.text);
                  });
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
