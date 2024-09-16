import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AppStarted extends AuthEvent {}

class LoggedIn extends AuthEvent {
  final String username;

  LoggedIn(this.username);

  @override
  List<Object?> get props => [username];
}

class LoggedOut extends AuthEvent {}
