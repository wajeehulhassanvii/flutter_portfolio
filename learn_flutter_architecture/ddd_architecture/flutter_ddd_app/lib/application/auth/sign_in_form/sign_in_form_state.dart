part of 'sign_in_form_bloc.dart';

//bloc output different states
// sign in out put single state class instead of multiple classes,
// shouldn't have created union but simple data class
// bloc state is in presentation layer
@freezed
abstract class SignInFormState with _$SignInFormState {
  const factory SignInFormState({
    @required EmailAddress emailAddress,
    @required Password password,
    @required bool showErrorMessages,
    @required bool isSubmitting,
    @required Option<Either<AuthFailure, Unit>> authFailureOrSuccess,
  })= _SignInFormState;
  //for union we put '.' and define a function

  factory SignInFormState.initial() => SignInFormState(
    emailAddress: EmailAddress(''),
    password: Password(''),
    isSubmitting: false,
    authFailureOrSuccess: none(),
  );

}

