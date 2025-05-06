import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:get_storage/get_storage.dart';

import '../../constants/session.dart';
import '../../core/service/network_exceptions.dart';
import '../../domain/entity/profile.dart';
import '../../domain/repositories/user_repository.dart';
import '../../utils/type_defs.dart';
import '../datasource/user_data_source.dart';
import '../model/profile_model.dart';
import '../model/responses/failure_response.dart';

class UserRepositoryImpl extends UserRepository {
  final UserDataSource _dataSource;

  UserRepositoryImpl({
    required UserDataSource dataSource,
  }) : _dataSource = dataSource;

  @override
  FutureEither<Profile> getProfile() async {
    try {
      final response = await _dataSource.getProfile();
      await setProfileLocal(response.data!);
      return right(response.data!.toEntity());
    } catch (e) {
      return left(
        FailureResponse(
          error: NetworkExceptions.getDioException(e),
          errorRes: NetworkExceptions.getErrorRes(e),
        ),
      );
    }
  }

  Future<void> setProfileLocal(ProfileModel profile) async {
    final box = GetStorage();
    String jsonString = jsonEncode(profile.toJson());
    await box.write(Session.profile, jsonString);
  }

  @override
  Future<Profile?> getProfileLocal() async {
    final box = GetStorage();
    String? jsonString = box.read(Session.profile);
    if (jsonString != null) {
      ProfileModel data = ProfileModel.fromJson(jsonDecode(jsonString));
      Profile profile = data.toEntity();
      return profile;
    }
    return null;
  }
}
