import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FireStoreDataBase {
  List studentList = [];

  final CollectionReference collectionRef =
      FirebaseFirestore.instance.collection('test');

  Future getData() async {
    try {
      await collectionRef.get().then((QuerySnapshot) {
        for (var result in QuerySnapshot.docs) {
          studentList.add(result.data());
        }
      });
      return studentList;
    } catch (e) {
      debugPrint("Error-$e");
      return null;
    }
  }
}
