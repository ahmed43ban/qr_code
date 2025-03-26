import 'dart:io';
import 'package:path_provider/path_provider.dart';

import '../core/firebaseHandeler.dart';
import '../core/model/person.dart';

Future<String> saveHtmlToFile(String fileName, String htmlContent) async {
  final directory = await getApplicationDocumentsDirectory();
  final file = File('${directory.path}/$fileName.html');
  await file.writeAsString(htmlContent);
  return file.path;
}

Future<void> generateAndUploadHtmlFiles(List<Person> people) async {
  for (var person in people) {
    String fileName = person.name.replaceAll(" ", "_");
    String htmlContent = """
    <html>
      <head><title>${person.name}</title></head>
      <body>
        <h1>${person.name}</h1>
        <p>Phone: ${person.phoneNumber}</p>
        <p>Email: <a href="mailto:${person.mail}">${person.mail}</a></p>
        <p>Website: <a href="${Person.websiteCompany}">${Person.websiteCompany}</a></p>
        <p>LinkedIn: <a href="${Person.linkedInCompany}">${Person.linkedInCompany}</a></p>
        <p>WhatsApp: <a href="${person.whatsLink}">${person.whatsLink}</a></p>
        <p>Facebook: <a href="${Person.faceLink}">${Person.faceLink}</a></p>
        <p>Location: <a href="${Person.locationLink}">${Person.locationLink}</a></p>
      </body>
    </html>
    """;

    await saveHtmlToFile(fileName, htmlContent);
  }

  // بعد إنشاء جميع الملفات، قم برفعها إلى Firebase
  
}

