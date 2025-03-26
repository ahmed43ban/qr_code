import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:qr_code/providers/htmlProvider.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'core/model/person.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  List<Person> people = [
    Person(name: "محمد علي", phoneNumber: "0123456789", mail: "mohamed@example.com", whatsLink: "https://wa.me/0123456789"),
    Person(name: "أحمد حسن", phoneNumber: "01122334455", mail: "ahmed@example.com", whatsLink: "https://wa.me/01122334455"),
  ];

  await generateAndUploadHtmlFiles(people);  // ⬅️ تصحيح مكان الاستدعاء

  runApp(MyApp(people: people));
}

class MyApp extends StatelessWidget {
  final List<Person> people;

  MyApp({required this.people});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('QR Code Generator')),
        body: ListView.builder(
          itemCount: people.length,
          itemBuilder: (context, index) {
            final person = people[index];
            final qrData = "https://qrcode-573e5.web.app/${person.name.replaceAll(" ", "_")}.html";

            return Card(
              margin: EdgeInsets.all(10),
              child: Column(
                children: [
                  ListTile(
                    title: Text(person.name),
                    subtitle: Text(person.phoneNumber),
                  ),
                  QrImageView(
                    data: qrData,
                    version: QrVersions.auto,
                    size: 150.0,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
