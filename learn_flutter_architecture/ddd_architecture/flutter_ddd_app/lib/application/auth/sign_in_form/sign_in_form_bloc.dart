import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutterdddapp/domain/auth/auth_failure.dart';
import 'package:flutterdddapp/domain/auth/i_auth_facade.dart';
import 'package:flutterdddapp/domain/auth/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

part 'sign_in_form_event.dart';
part 'sign_in_form_state.dart';

part 'sign_in_form_bloc.freezed.dart';


// the block file is in application layer
// blocs will validate and will have raw data
// add events when email and password string changes

class SignInFormBloc extends Bloc<SignInFormEvent, SignInFormState> {

  // import facade for writing logic, we must have IAuthFacade
  final IAuthFacade _authFacade;

  SignInFormBloc(this._authFacade);

  @override
  SignInFormState get initialState => SignInFormState.initial();

  @override
  Stream<SignInFormState> mapEventToState(
    SignInFormEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
