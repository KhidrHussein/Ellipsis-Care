import 'dart:io';

import 'package:ellipsis_care/core/enums/file_storage_type.dart';
import 'package:ellipsis_care/core/utils/extensions.dart';
import 'package:ellipsis_care/core/utils/helpers.dart';
import 'package:path_provider/path_provider.dart';

class FileStorageService {
  Future<void> storeFile({
    required FileStorageType type,
    required List<int> bytes,
    required String createdAt,
  }) async {
    try {
      final Directory dir = await getApplicationDocumentsDirectory();
      final String date = UtilHelpers.getDateFromIsoString(createdAt);
      final String time = UtilHelpers.getHourMinutes(createdAt);
      final String filePath = "${dir.path}/${type.name}_${date}_$time.wav";

      final File file = File(filePath);
      await file.writeAsBytes(bytes).then((file) {
        "$runtimeType stored File at ${file.path}".printLog();
      });
    } catch (e) {
      "$runtimeType Error: ${e.runtimeType} $e".printLog();
    }
  }

  Future<File?> getFile(FileStorageType type, String createdAt) async {
    try {
      final Directory dir = await getApplicationDocumentsDirectory();
      final String date = UtilHelpers.getDateFromIsoString(createdAt);
      final String time = UtilHelpers.getHourMinutes(createdAt);
      final String filePath = "${dir.path}/${type.name}_${date}_$time.wav";
      File file = File(filePath);

      if (!file.existsSync()) return null;

      "$runtimeType fetched File at ${file.path}".printLog();
      return file;
    } catch (e) {
      "$runtimeType Error: ${e.runtimeType} $e".printLog();
    }
    return null;
  }
}
