import 'dart:io';
import 'package:mime/mime.dart';
import 'package:noticias123/src/app_config.dart';
import 'package:path/path.dart';
import 'package:result_dart/result_dart.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class StorageService {
  AsyncResult<String, StorageException> uploadFile(
      File file, String bucketName) async {
    try {
      // Gera um nome único para o arquivo
      String fileName =
          '${DateTime.now().millisecondsSinceEpoch}_${basename(file.path)}';
      String filePath = 'uploads/$fileName';

      // Obtém o tipo MIME do arquivo
      final mimeType = lookupMimeType(file.path);

      // Upload para o Supabase
      await supabase.storage.from(bucketName).upload(
            filePath,
            file,
            fileOptions: FileOptions(
                contentType: mimeType, cacheControl: '3600', upsert: true),
          );

      // Retorna a URL pública do arquivo
      final url = supabase.storage.from(bucketName).getPublicUrl(filePath);
      return Success(url);
    } catch (e) {
      return Failure(StorageException(e.toString()));
    }
  }
}
