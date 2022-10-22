import 'package:equatable/equatable.dart';
import 'package:inthekloud_shop_app/features/home/domain/entities/products_entity.dart';

class UserEntity extends Equatable {
  int? id;
  String? username;
  String? email;
  String? firstName;
  String? lastName;
  String? gender;
  String? image;
  String? token;
  List<ProductsEntity>? cart;

  UserEntity(
      {this.id,
      this.username,
      this.email,
      this.firstName,
      this.lastName,
      this.gender,
      this.image,
      this.token,
      this.cart});

  @override
  List<Object?> get props =>
      [id, username, email, firstName, lastName, gender, image, token, cart];
}
