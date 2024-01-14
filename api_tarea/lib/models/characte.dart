import 'package:equatable/equatable.dart';

class Character extends Equatable {
  final int id;
  final String name;
  final String image;
  final String status;
  final String species;
  final String gender;
  final (String name, String url) origin;

  const Character({
    required this.id,
    required this.name,
    required this.image,
    required this.status,
    required this.species,
    required this.gender,
    required this.origin,
  });

  factory Character.fromJson(dynamic json) {
    return Character(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      status: json['status'],
      species: json['species'],
      gender: json['gender'],
      origin: (json['origin']['name'], json['origin']['url']),
    );
  }

  @override
  List<Object?> get props => [id];
}
