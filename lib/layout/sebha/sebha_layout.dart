import 'package:e_sebha/modules/new_page/page.dart';
import 'package:flutter/material.dart';

class SebhaScreen extends StatefulWidget {
  const SebhaScreen({Key? key}) : super(key: key);

  @override
  State<SebhaScreen> createState() => _SebhaScreenState();
}

class _SebhaScreenState extends State<SebhaScreen> {

  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration:const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/BGG.gif"),
            fit: BoxFit.cover
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "$counter",
                style:const TextStyle(
                  color: Colors.white,
                  fontSize: 50.0,
                  fontWeight: FontWeight.w400
                ),
              ),
              const Text(
                "عدد التسبيح",
                style:TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                    fontWeight: FontWeight.w800
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Stack(
        children: [
          Padding(
              padding:const EdgeInsets.only(left: 31),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: FloatingActionButton.extended(
                label:const Text(
                    "تصفير",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.teal
                  ),
                ),
                icon:const Icon(Icons.settings_backup_restore),
                backgroundColor: Colors.white,
                onPressed: (){
                  setState(() {
                    counter = 0;
                  });
                },
                heroTag: null,
              ),
            ),
          ),
          Align(
            alignment:const Alignment(0.1,0.7),
            child: FloatingActionButton.extended(
              label:const Text(
                "تسبيح",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.teal
                ),
              ),
              icon:const Icon(Icons.fingerprint),
              backgroundColor: Colors.white,
              onPressed: (){
                setState(() {
                  counter ++;
                });
              },
              heroTag: null,
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton.extended(
              label:const Text(
                "ذكر",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.teal
                ),
              ),
              icon:const Icon(Icons.book),
              backgroundColor: Colors.white,
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) =>const NewScreen()));
              },
              heroTag: null,
            ),
          ),
        ],
      ),
    );
  }
}
