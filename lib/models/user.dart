class User {
  final String id;
  final String name;
  final String surname;
  final String password;

  User({
    required this.id,
    required this.name,
    required this.surname,
    required this.password,
  });

  User copyWith({
    String? id,
    String? name,
    String? surname,
    String? password,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      surname: surname ?? this.surname,
      password: password ?? this.password,
    );
  }
}
