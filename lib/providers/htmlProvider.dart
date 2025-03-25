import 'dart:io';
import 'package:path_provider/path_provider.dart';

Future<String> saveHtmlToFile(String fileName, String htmlContent) async {
  final directory = await getApplicationDocumentsDirectory();
  final file = File('${directory.path}/$fileName.html');
  await file.writeAsString(htmlContent);
  return file.path;
}
