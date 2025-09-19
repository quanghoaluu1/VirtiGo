class UserDto {
  final String id;
  final String username;
  final String? email;
  final String? fullName;
  final String? avatarUrl;
  final String? sex;
  final String? birthday;

  UserDto({
    required this.id,
    required this.username,
    this.email,
    this.fullName,
    this.avatarUrl,
    this.sex,
    this.birthday,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) {
    return UserDto(
      id: json['id'] ?? '',
      username: json['userName'] ?? '',
      email: json['email'],
      fullName: json['fullName'],
      avatarUrl: json['avatarUrl'],
      sex: json['sex'],
      birthday: json['birthday'],
    );
  }
}