enum UserType { PARTICULAR, PROFESSIONAL }

class User {
  String id, name, email, phone, password;
  UserType type;
  DateTime createdAt;
  User({
    this.id,
    this.name,
    this.email,
    this.password,
    this.phone,
    this.type = UserType.PARTICULAR,
    this.createdAt,
  });

  @override
  String toString() =>
      'User(id: $id, name: $name, email: $email, phone: $phone, type: ${type.toString()}, createdAt: $createdAt)';
}
