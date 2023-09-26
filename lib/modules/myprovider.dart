import 'package:e_sebha/modules/zikr.dart';
import 'package:flutter/material.dart';
import '../db/zikr_reposetory.dart';

class MyProvider with ChangeNotifier {
  bool swVal = false;
  ThemeMode tm = ThemeMode.light;
  int counter = 0;
  String name = "سبحة";
  late Zikr zikrModel=Zikr(name: '', count: 0, clicked: 0);
  List<Zikr>? listText=[];
  late ZikrRepository zikr = ZikrRepository();

  void switchChange(bool value) {
    swVal = value;

    if (swVal == false) {
      tm = ThemeMode.light;
    } else {
      tm = ThemeMode.dark;
    }
    notifyListeners();
  }

  void increment() {
    if(counter<zikrModel.count) {
      counter++;
    }
    notifyListeners();
  }

  void zero() {
    counter = 0;
    notifyListeners();
  }

  void clickedData(String name, int count) {
    notifyListeners();
  }

  void stateFun() {
    retreivedata();
    //notifyListeners();
  }

  void retreivedata() async {
    listText = await zikr.retrieve();
    notifyListeners();
  }
  void del(int id) async {
   listText = await zikr.deleted(id);
    notifyListeners();
  }

  void getZikrById(int id) async{
    List<Zikr> zikrList = await zikr.retrieveById(id);
    zikrModel= zikrList[0];
    counter=zikrModel.clicked;
    notifyListeners();
  }
}
