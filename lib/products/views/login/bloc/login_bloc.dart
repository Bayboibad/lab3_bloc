import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final Future<SharedPreferences> sharedPreferences;

  LoginBloc({required this.sharedPreferences}) : super(LoginInitial()) {
    on<LoginButton>((event, emit) async {
      final prefs = await sharedPreferences;
      if (event.username.isEmpty || event.password.isEmpty) {
        emit(const LoginFailure("Không để trống"));
      } else if (event.username == 'admin' && event.password == '123456') {
        prefs.setString("username", event.username);
        prefs.setString("password", event.password);
        emit(LoginSuccess());
      } else {
        emit(const LoginFailure("Sai username hoặc password"));
      }
    });
  }
}
