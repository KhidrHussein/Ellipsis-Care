import 'package:hive_flutter/hive_flutter.dart';

class StorageService {
  void initializeStorage() async => await Hive.initFlutter();
  
}
