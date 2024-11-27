// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'emergency_contact.g.dart';

@HiveType(typeId: 2)
class EmergencyContact extends HiveObject {
  EmergencyContact(
      {required this.id, required this.name, this.phoneNumber, this.photo});

  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String? phoneNumber;

  @HiveField(3)
  final Uint8List? photo;

  EmergencyContact copyWith({
    String? id,
    String? name,
    String? phoneNumber,
    Uint8List? photo,
  }) {
    return EmergencyContact(
      id: id ?? this.id,
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      photo: photo ?? this.photo,
    );
  }

  @override
  String toString() =>
      'EmergencyContact(id: $id, name: $name, phoneNumbers: $phoneNumber, photo: $photo)';
}
