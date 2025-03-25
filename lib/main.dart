import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'core/model/person.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<Person> people = [
    Person(name: "محمد علي", phoneNumber: "0123456789", mail: "mohamed@example.com", whatsLink: "https://wa.me/0123456789"),
    Person(name: "أحمد حسن", phoneNumber: "01122334455", mail: "ahmed@example.com", whatsLink: "https://wa.me/01122334455"),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('QR Code Generator')),
        body: ListView.builder(
          itemCount: people.length,
          itemBuilder: (context, index) {
            final person = people[index];
            final qrData = "https://yourfirebaseapp.web.app/${person.name.replaceAll(" ", "_")}.html";

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
