class Doctor {
  final int id;
  final String name;

  Doctor({required this.id, required this.name});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{"id": id, "title": name};
  }
}
