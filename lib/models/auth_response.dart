import 'package:virtigo/models/user.dart';

class AuthResponse {
  final bool success;
  final String message;
  final String token;
  final UserDto user;
  final List<String> roles;

  AuthResponse({
    required this.success,
    required this.message,
    required this.token,
    required this.user,
    required this.roles,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      token: json['token'] ?? '',
      user: UserDto.fromJson(json['user']),
      roles: List<String>.from(json['roles'] ?? []),
    );
  }
}