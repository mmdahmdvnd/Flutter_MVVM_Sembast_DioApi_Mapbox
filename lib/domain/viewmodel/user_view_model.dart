import 'package:com.petroimensharif.pishco/di/components/service_locator.dart';
import 'package:com.petroimensharif.pishco/domain/enums/view_state.dart';
import 'package:com.petroimensharif.pishco/domain/models/login/login_response.dart';
import 'package:com.petroimensharif.pishco/domain/repositories/user_repository.dart';
import 'package:com.petroimensharif.pishco/domain/viewmodel/base_view_model.dart';

class UserViewModel extends BaseViewModel {
  final UserRepository _userRepository = getIt<UserRepository>();
  late User user = User();

  Future<bool> isUserLoggedIn() async {
    setState(ViewState.BUSY);
    var success = await _userRepository.getUser();
    setState(ViewState.IDLE);
    if (success.first.id != null) {
      user = success.first;
      return true;
    } else {
      user = User();
      return false;
    }
  }
}
