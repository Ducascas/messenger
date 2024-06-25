class User {
  final String id;
  final String name;
  final String surname;
  final String password;
  final bool status;

  User({
    required this.id,
    required this.name,
    required this.surname,
    required this.password,
    required this.status,
  });

  User copyWith({
    String? id,
    String? name,
    String? surname,
    String? password,
    bool? status,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      surname: surname ?? this.surname,
      password: password ?? this.password,
      status: status ?? this.status,
    );
  }
}
