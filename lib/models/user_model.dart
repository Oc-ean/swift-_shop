import 'package:hive/hive.dart';

part 'user_model.g.dart';

enum UserRole { user, admin }

@HiveType(typeId: 3)
class UserModel {
  @HiveField(0)
  final String? id;
  @HiveField(1)
  final String firstName;
  @HiveField(2)
  final String lastName;
  @HiveField(3)
  final UserRole role;
  @HiveField(4)
  final String email;
  @HiveField(5)
  final String password; // Plain text password, will be hashed before saving

  UserModel({
    this.id,
    required this.firstName,
    required this.lastName,
    required this.role,
    required this.email,
    required this.password,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['_id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      role:
          UserRole.values.firstWhere((role) => role.toString() == json['role']),
      email: json['email'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'role': role,
      'email': email,
      'password': password,
    };
  }
}
