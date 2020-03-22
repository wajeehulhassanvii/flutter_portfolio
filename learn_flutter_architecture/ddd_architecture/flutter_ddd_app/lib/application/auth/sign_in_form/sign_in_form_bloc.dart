import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

// the block file is in application layer
// blocs will validate and will have raw data
// add events when email and password string changes

class SignInFormBloc extends Bloc<SignInFormEvent, SignInFormState> {
  @override
  SignInFormState get initialState => InitialSignInFormState();

  @override
  Stream<SignInFormState> mapEventToState(
    SignInFormEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
