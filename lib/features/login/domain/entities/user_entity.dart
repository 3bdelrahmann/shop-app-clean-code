import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  int? id;
  String? username;
  String? email;
  String? firstName;
  String? lastName;
  String? gender;
  String? image;
  String? token;

  UserEntity({
    this.id,
    this.username,
    this.email,
    this.firstName,
    this.lastName,
    this.gender,
    this.image,
    this.token,
  });

  @override
  List<Object?> get props =>
      [id, username, email, firstName, lastName, gender, image, token];
}
