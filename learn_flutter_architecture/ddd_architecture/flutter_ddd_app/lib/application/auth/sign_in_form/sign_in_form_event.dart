part of 'sign_in_form_bloc.dart';

// bloc event is in presentation layer
// we should create freezed union


@freezed
abstract class SignInFormEvent with _$SignInFormEvent{
  const factory SignInFormEvent.emailChanged(String emailStr)= EmailChanged;
  const factory SignInFormEvent.passwordChanged(String passwordStr)= PasswordChanged;
  const factory .registeredWithEmailAndPasswordPressed() = RegisteredWithEmailAndPasswordPressed;
  const factory .signInWithEmailAndPasswordPressed() =
  SignInWithEmailAndPasswordPressed;
  const factory .signInWithGooglePressed() =
  SignInWithGooglePressed;
}
