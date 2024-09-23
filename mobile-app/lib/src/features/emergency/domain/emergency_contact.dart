// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'emergency_contact.g.dart';

@HiveType(typeId: 1)
class EmergencyContact extends HiveObject {
  EmergencyContact({
    required this.name,
    this.phoneNumbers,
    this.photo,
  });

  @HiveField(0)
  final String name;

  @HiveField(1)
  final List<String>? phoneNumbers;

  @HiveField(2)
  final Uint8List? photo;

  @override
  String toString() =>
      'EmergencyContact(name: $name, phoneNumbers: $phoneNumbers, photo: $photo)';
}
