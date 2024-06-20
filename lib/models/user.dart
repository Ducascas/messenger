class User {
  final String id;
  final String name;
  final String surname;

  User({required this.id, required this.name, required this.surname});

  User copyWith({
    String? id,
    String? name,
    String? surname,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      surname: surname ?? this.surname,
    );
  }
}
