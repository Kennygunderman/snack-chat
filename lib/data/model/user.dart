class User {
  final String id;
  final String email;
  final String username;

  const User({this.id, this.email, this.username});

  Map<String, dynamic> toMap() {
    if (this.id == null) {
      return {'email': email, 'username': username};
    }
    return {'id': id, 'email': email, 'username': username};
  }
}
