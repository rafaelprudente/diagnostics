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
  final String? email;
  final String? mobilePhone;

  Doctor(
      {this.id,
      required this.crm,
      required this.name,
      required this.status,
      required this.subscription,
      this.inactivation,
      this.city,
      this.uf,
      this.specialties,
      this.email,
      this.mobilePhone});

  static String tableName = "Doctors";

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'crm': crm,
      'name': name,
      'status': status,
      'subscription': subscription.toIso8601String(),
      'inactivation': inactivation?.toIso8601String(),
      'city': city,
      'uf': uf,
      'specialties': specialties,
      'email': email,
      'mobilePhone': mobilePhone
    };
  }
}
