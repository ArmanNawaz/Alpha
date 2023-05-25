import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class EResource extends StatefulWidget {
  const EResource({Key? key}) : super(key: key);

  @override
  State<EResource> createState() => _EResourceState();
}

class _EResourceState extends State<EResource> {
  final storage = FirebaseStorage.instance;

  Future<void> uploadPDF(String fileName, String filePath) async {
    File file = File(filePath);
    try {
      await storage.ref('PDFs/$fileName').putFile(file);
    } catch (e) {}
  }

  Future<ListResult> listFiles() async {
    ListResult listResult = await storage.ref("PDFs").listAll();
    return listResult;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('E-Resource'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          final result = await FilePicker.platform.pickFiles(
            allowMultiple: false,
            type: FileType.any,
          );
          if (result == null) {
            print("No file selected");
          } else {
            final filePath = result.files.single.path;
            final fileName = result.files.single.name;
            uploadPDF(fileName, filePath!);
          }
        },
      ),
      body: Center(
        child: FutureBuilder(
          future: listFiles(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting &&
                !snapshot.hasData) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.items.length,
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          height: 80,
                          alignment: Alignment.center,
                          child: ListTile(
                            leading: Icon(
                              Icons.picture_as_pdf,
                              size: 28,
                              color: Colors.black,
                            ),
                            title: Text(
                              snapshot.data!.items[index].name,
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.only(right: 20, bottom: 8),
                          child: CircleAvatar(
                            backgroundColor: Colors.blue,
                            child: TextButton(
                              onPressed: () {},
                              child: Icon(
                                Icons.download,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Divider(
                          height: 2,
                          thickness: 2,
                        )
                      ],
                    );
                  });
            }
            return const Text('Error!!!');
          },
        ),
      ),
    );
  }
}
