import 'package:meta/meta.dart';


// bloc state is in presentation layer
@immutable
abstract class SignInFormState {}

class InitialSignInFormState extends SignInFormState {}
