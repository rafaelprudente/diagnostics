import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Doctor {
  final int? id;
  final int crm;
  final String name;
  final String status;
  final DateTime subscription;
  final DateTime? inactivation;
  final String? city;
  final String? uf;
  final String? specialties;

  Doctor(
      {this.id,
      required this.crm,
      required this.name,
      required this.status,
      required this.subscription,
      this.inactivation,
      this.city,
      this.uf,
      this.specialties});

  static String tableName = "Doctors";

  factory Doctor.fromJson(Map<String, dynamic> json) {
    int a = 1;
    return Doctor(
      id: json['id'] as int?,
      crm: json['crm'] as int,
      name: json['name'] as String,
      status: json['status'] as String,
      subscription: DateTime.parse(json['subscription'] as String),
      inactivation: json['inactivation'] == null ? null : DateTime.parse(json['inactivation'] as String),
      city: json['city'] as String?,
      uf: json['uf'] as String?,
      specialties: json['specialties'] as String?,
    );
  }

  Map<String, dynamic> toJson(Doctor instance) {
    return <String, dynamic>{
      'id': instance.id,
      'crm': instance.crm,
      'name': instance.name,
      'status': instance.status,
      'subscription': instance.subscription.toIso8601String(),
      'inactivation': instance.inactivation?.toIso8601String(),
      'city': instance.city,
      'uf': instance.uf,
      'specialties': instance.specialties,
    };
  }
}
