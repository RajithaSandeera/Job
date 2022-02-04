import 'package:flutter/material.dart';
import 'package:picture_galary/screens/home/components/frontPage.dart';
import 'package:picture_galary/services/retrieveDatabase.dart';
// import 'package:picture_galary/screens/home/components/frontPage.dart';

import 'components/body.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(),
        body: Body(),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DataUpload()),
            );
          },
        ));
  }

  AppBar buildAppBar() {
    return AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          color: Colors.black,
          onPressed: () {
            DataReceiver();
            // assets/icons/back.png
          },
        ),
        actions: <Widget>[
          // IconButton(
          //   icon: Image.asset("assets/icons/back.png"),
          //   color: kTextColor,
          //   onPressed: () {
          //     DataReceiver();
          //   },
          // ),
          //   IconButton(
          //     icon: Image.asset("assets/icons/back.png"),
          //     color: kTextColor,
          //     onPressed: () {},
          //   ),
          // SizedBox(width: kDefaultPaddin / 2)
        ]);
  }
}

class DataReceiver extends StatelessWidget {
  // const DataReceiver({Key? key}) : super(key: key);

  List dataList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fire base"),
      ),
      body: FutureBuilder(
          future: FireStoreDataBase().getData(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasError) {
              return const Text(
                "Something went wrong",
              );
            }
            if (snapshot.connectionState == ConnectionState.done) {
              dataList = snapshot.data as List;
              return buildItems(dataList);
            }
            return const Center(child: CircularProgressIndicator());
          }),
    );
  }

  Widget buildItems(dataList) => ListView.separated(
        padding: const EdgeInsets.all(8),
        itemCount: dataList.length,
        separatorBuilder: (Buildcontext, int index) => const Divider(),
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(
              dataList[index]["field1"],
            ),
            subtitle: Text(dataList[index]["field2"]),
            trailing: Text(dataList[index]["field4"]),
          );
        },
      );
}
