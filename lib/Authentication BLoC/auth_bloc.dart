import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AppStarted>((event, emit) async {
      await Future.delayed(Duration(seconds: 2)); // Simulate splash screen delay
      emit(AuthUnauthenticated());
    });

    on<LoggedIn>((event, emit) {
      emit(AuthAuthenticated(username: event.username));
    });

    on<LoggedOut>((event, emit) {
      emit(AuthUnauthenticated());
    });
  }
}
