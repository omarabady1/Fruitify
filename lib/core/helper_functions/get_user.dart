import 'dart:convert';

import 'package:fruitify/constants.dart';
import 'package:fruitify/core/services/shared_preferences_singleton.dart';
import 'package:fruitify/features/authentication/data/models/user_model.dart';
import 'package:fruitify/features/authentication/domain/entities/user_entity.dart';

UserEntity getUser() {
  var userData = Prefs.getString(kUserData);
  return UserModel.fromJson(jsonDecode(userData));
}