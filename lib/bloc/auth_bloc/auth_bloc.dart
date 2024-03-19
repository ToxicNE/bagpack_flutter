import 'package:bagpack/bloc/auth_bloc/auth_events.dart';
import 'package:bagpack/bloc/auth_bloc/auth_states.dart';
import 'package:bagpack/domain/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(
    this.userRepository,
  ) : super(AuthInitial()) {
    on<LogIn>(_logIn);
    on<LogOut>(_logOut);
  }

  UserRespository userRepository;


  Future<void> _logIn(LogIn event, Emitter<AuthState> emit) async {
    emit(AuthedState());
  }

  Future<void> _logOut(LogOut event, Emitter<AuthState> emit) async {
    emit(NotAuthState());
  }
  }