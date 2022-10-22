import 'package:inthekloud_shop_app/features/home/domain/entities/products_entity.dart';
import 'package:inthekloud_shop_app/features/login/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel(
      {int? id,
      String? username,
      String? email,
      String? firstName,
      String? lastName,
      String? gender,
      String? image,
      String? token,
      List<ProductsEntity>? cart})
      : super(
            id: id,
            username: username,
            email: email,
            firstName: firstName,
            lastName: lastName,
            gender: gender,
            image: image,
            token: token,
            cart: cart);

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    email = json['email'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    gender = json['gender'];
    image = json['image'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['email'] = email;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['gender'] = gender;
    data['image'] = image;
    data['token'] = token;
    return data;
  }
}
