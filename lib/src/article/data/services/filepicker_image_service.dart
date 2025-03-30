import 'dart:io';

import 'package:file_picker/file_picker.dart';

class FilePickerSelectImageService {
  Future<File?> select() async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ['jpg', 'png']);
    if (result != null) {
      File file = File(result.files.single.path!);
      return file;
    }
    return null;
  }
}
