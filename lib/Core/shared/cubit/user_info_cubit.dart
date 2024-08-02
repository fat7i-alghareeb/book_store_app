import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../../constants.dart';
import '../models/user.dart';
import 'user_info_state.dart';

class UserInfoCubit extends Cubit<UserInfoState> {
  UserInfoCubit() : super(UserInfoInitial());
  final userBox = Hive.box<User>(Constants.kUserBox);

  late final User _user =
      userBox.isNotEmpty ? userBox.getAt(0)! : User(lightThem: true);

  get userTheme {
    return _user.lightThem;
  }

  get user => _user;
  Future<void> saveUser() async {
    if (userBox.isEmpty) {
      await userBox.add(_user);
    }
  }

  void changeTheme() {
    _user.lightThem = !_user.lightThem;
    userBox.putAt(0, _user);

    emit(EditThemeUserInfo());
  }
}
