import 'dart:io';
import 'package:path_provider/path_provider.dart';

Future<void> processHtmlFiles() async {
  final directory = await getApplicationDocumentsDirectory();
  final files = Directory(directory.path).listSync();

  for (var file in files) {
    if (file is File && file.path.endsWith('.html')) {
      final fileName = file.uri.pathSegments.last;
      print('Found HTML file: $fileName');
      // يمكنك تنفيذ أي عملية أخرى هنا
    }
  }
}
