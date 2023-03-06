class UserModel {
  final String? userId;
  final String name;
  final String email;
  final String password;
  final bool isBlocked;

  UserModel({
    this.userId,
    required this.name,
    required this.email,
    required this.password,
    this.isBlocked = false,
  });

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      userId: map['userId'],
      name: map['name'],
      email: map['email'],
      password: map['password'],
      isBlocked: map['isBlocked'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'name': name,
      'email': email,
      'password': password,
      'isBlocked': isBlocked,
    };
  }

  UserModel copyWith({
    String? userId,
    String? name,
    String? email,
    String? password,
    bool? isBlocked,
  }) {
    return UserModel(
      userId: userId ?? this.userId,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      isBlocked: isBlocked ?? this.isBlocked,
    );
  }
}
