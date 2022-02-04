import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DataBaseService {
  final CollectionReference testcollection =
      FirebaseFirestore.instance.collection("test");

  Future addNewDetails(
      String data1, String data2, double data3, String data4) async {
    try {
      return await testcollection.doc().set({
        "field1": data1,
        "field2": data2,
        "field3": data3,
        "field4": data4,
      });
    } catch (e) {
      print(e.toString());
    }
  }
}

Map<String, dynamic> data = {};
