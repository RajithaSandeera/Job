import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:picture_galary/screens/home/components/storage_service.dart';
import 'package:picture_galary/services/database.dart';
import 'package:picture_galary/services/retrieveDatabase.dart';

class DataUpload extends StatelessWidget {
  // const DataUpload({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    TextEditingController sampledata1 = new TextEditingController();
    TextEditingController sampledata2 = new TextEditingController();
    TextEditingController sampledata3 = new TextEditingController();
    TextEditingController sampledata4 = new TextEditingController();
    return Scaffold(
        appBar: AppBar(
          title: const Text("Data input"),
        ),
        body: Stack(
          children: [
            Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/background/chefbg8.jpg"),
                        fit: BoxFit.cover)),
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(9),
                  child: Container(
                    padding: EdgeInsets.all(130.0),
                    child: Column(
                      children: [
                        // Image.asset(
                        //   "",
                        //   // "assets/images/it.jpg",
                        //   width: 150,
                        //   height: 120,
                        // ),
                        TextFormField(
                            controller: sampledata1,
                            decoration: const InputDecoration(
                              labelText: "Title",
                            )),
                        const SizedBox(
                          height: 10.0,
                        ),
                        TextFormField(
                            controller: sampledata2,
                            decoration:
                                const InputDecoration(hintText: "Description")),
                        const SizedBox(
                          height: 10.0,
                        ),
                        TextFormField(
                            controller: sampledata3,
                            decoration:
                                const InputDecoration(hintText: "Bugget")),
                        const SizedBox(
                          height: 10.0,
                        ),
                        TextFormField(
                            controller: sampledata4,
                            decoration:
                                const InputDecoration(hintText: "Location")),
                        const SizedBox(
                          height: 10.0,
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            final result = await FilePicker.platform.pickFiles(
                              allowMultiple: false,
                              type: FileType.custom,
                              allowedExtensions: ['png', 'jpg'],
                            );
                            if (result == null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('no file selected')));
                              return null;
                            }

                            final Path = result.files.single.path!;
                            final fileName = result.files.single.name;
                            Storage()
                                .uploadFile(Path, fileName)
                                .then((value) => print('done'));
                          },
                          child: Text('Choose images'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            DataBaseService().addNewDetails(
                                sampledata1.text,
                                sampledata2.text,
                                double.parse(sampledata3.value.text),
                                sampledata4.text);

                            sampledata1.clear();
                            sampledata3.clear();
                            sampledata2.clear();
                            sampledata4.clear();
                          },
                          child: Text("Submit"),
                        ),
                      ],
                    ),
                  ),
                ))
          ],
        ));
    // body: Center(

    //     reverse: true,
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
