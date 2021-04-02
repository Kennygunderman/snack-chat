import 'dart:math';
import 'package:snack_chat/data/model/user.dart';
import 'package:snack_chat/data/repo/user_repo.dart';
import 'package:snack_chat/util/color_util.dart';

class UserCreationService {
  final UserRepo _userRepo;

  UserCreationService(this._userRepo);

  void createUser(String email) async {
    await _userRepo.saveUser(
      User(
        id: null,
        email: email,
        username: _createUsername(email),
        chatIconColor: _getRandomChatColor()
      ),
    );
  }

  //Username should be 7 characters or less
  String _createUsername(String email) {
    var username = email.split('@')[0];
    if (username.length <= 7) return username;
    return username.substring(0, 7);
  }

  String _getRandomChatColor() {
    Random random = new Random();
    int rng = random.nextInt(ColorUtil.colorNames.length);
    return ColorUtil.colorNames[rng];
  }
}
