import 'package:e_sebha/layout/drawer.dart';
import 'package:e_sebha/layout/zikr_page.dart';
import 'package:e_sebha/modules/myprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../modules/zikr.dart';

class SebhaScreen extends StatefulWidget {
  const SebhaScreen({Key? key}) : super(key: key);

  @override
  State<SebhaScreen> createState() => _SebhaScreenState();
}

class _SebhaScreenState extends State<SebhaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            Provider.of<MyProvider>(context).name,
          ),
        ),
        drawer: const MyDrawer(),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/BGG.gif"), fit: BoxFit.cover),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * .15),
                  child: Column(
                    children: [
                      Text(
                        Provider.of<MyProvider>(context).zikrModel == null ?"":Provider.of<MyProvider>(context).zikrModel.name
                        , style:const TextStyle(
                          color: Colors.white,
                          fontSize: 35.0,
                          fontWeight: FontWeight.w400),
                      ),
                      Text(
                        Provider.of<MyProvider>(context).zikrModel == null ?"":Provider.of<MyProvider>(context).zikrModel.count.toString(),
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  )
                ),
                const Spacer(),
                Text(
                  Provider.of<MyProvider>(context).counter.toString(),
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 90.0,
                      fontWeight: FontWeight.w400),
                ),
                const Spacer(),
                const Spacer(),
                const Spacer(),
              ],
            ),
          ),
        ),
        floatingActionButton: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 31),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: FloatingActionButton.extended(
                  label: const Text(
                    "تصفير",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.teal),
                  ),
                  icon: const Icon(
                    Icons.settings_backup_restore,
                    color: Colors.green,
                  ),
                  backgroundColor: Colors.white,
                  onPressed: () {
                    Provider.of<MyProvider>(context, listen: false).zero();
                  },
                  heroTag: null,
                ),
              ),
            ),
            Align(
              alignment: const Alignment(0.1, 0.7),
              child: FloatingActionButton.extended(
                label: const Text(
                  "تسبيح",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.teal),
                ),
                icon: const Icon(
                  Icons.fingerprint,
                  color: Colors.green,
                ),
                backgroundColor: Colors.white,
                onPressed: () {
                  Provider.of<MyProvider>(context, listen: false).increment();
                },
                heroTag: null,
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton.extended(
                label: const Text(
                  "ذكر",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.teal),
                ),
                icon: const Icon(
                  Icons.book,
                  color: Colors.green,
                ),
                backgroundColor: Colors.white,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ZikrScreen()));
                },
                heroTag: null,
              ),
            ),
          ],
        ),
    );
  }
}
