import 'dart:io';

import 'package:ellipsis_care/core/utils/enums/file_storage_type.dart';
import 'package:ellipsis_care/core/utils/extensions.dart';
import 'package:path_provider/path_provider.dart';

class FileStorageService {
  Future<void> storeFile({
    required FileStorageType type,
    required List<int> bytes,
    required String date,
  }) async {
    try {
      final Directory dir = await getApplicationDocumentsDirectory();
      final String filePath = "${dir.path}/${type.name}_$date.wav";

      final File file = File(filePath);
      await file.writeAsBytes(bytes).then((file) {
        "$runtimeType File stored at ${file.path}".printLog();
      });
    } catch (e) {
      "$runtimeType Error: ${e.runtimeType} $e".printLog();
    }
  }

  Future<File?> getFile(FileStorageType type, String date) async {
    try {
      final Directory dir = await getApplicationDocumentsDirectory();
      final String filePath = "${dir.path}/${type.name}_$date.wav";
      File file = File(filePath);

      if (!file.existsSync()) {
        throw Exception("File does not exist");
      }
      return file;
    } catch (e) {
      "$runtimeType Error: ${e.runtimeType} $e".printLog();
    }
    return null;
  }
}
