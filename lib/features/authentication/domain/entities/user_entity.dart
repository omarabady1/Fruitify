class UserEntity {
  final String name;
  final String email;
  final String userID;

  UserEntity({required this.name, required this.email, required this.userID});

  toMap() {
    return {'name': name, 'email': email, 'userID': userID};
  }
}
