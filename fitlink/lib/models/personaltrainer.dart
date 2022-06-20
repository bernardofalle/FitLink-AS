import 'dart:convert';

class PersonalTrainer {
  final int age;
  final String name;
  final String specialization;

  PersonalTrainer({
    required this.age,
    required this.name,
    required this.specialization
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'age': age});
    result.addAll({'name': name});
    result.addAll({'specialization': specialization});
  
    return result;
  }

  factory PersonalTrainer.fromMap(Map<String, dynamic> map) {
    return PersonalTrainer(
      age: map['age'] ?? '',
      name: map['name'] ?? '',
      specialization: map['specialization'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory PersonalTrainer.fromJson(String source) => PersonalTrainer.fromMap(json.decode(source));
}