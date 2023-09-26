import 'package:e_sebha/modules/myprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 10,
      backgroundColor: Colors.green,
      width: MediaQuery.of(context).size.width * .5,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
           children: [
            const Spacer(),
            const Padding(
            padding: EdgeInsets.all(10),
            child: Text("Light"),
          ),
          Switch(
            value: Provider.of<MyProvider>(context, listen: true).swVal,
            onChanged: (bool val) =>
                Provider.of<MyProvider>(context, listen: false)
                    .switchChange(val),
            activeColor: Colors.black,
            inactiveThumbColor: Colors.blue,
          ),
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text("Dark"),
          ),
        ]),
      ),
    );
  }
}
