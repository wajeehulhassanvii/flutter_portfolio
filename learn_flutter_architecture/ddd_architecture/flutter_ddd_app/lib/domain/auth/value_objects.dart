import 'package:dartz/dartz.dart';
import 'package:flutterdddapp/domain/core/failures.dart';
import 'package:flutterdddapp/domain/core/value_objects.dart';
import 'package:flutterdddapp/domain/core/value_validators.dart';


class EmailAddress extends ValueObject<String>{
  final Either<ValueFailure<String>, String> value;

  factory EmailAddress(String input) {
    assert(input != null);
    return EmailAddress._(
      validateEmailAddress(input),
    );
  }

  const EmailAddress._(this.value);

}

class Password extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory Password(String input) {
    assert(input != null);
    return Password._(
      validatePassword(input),
    );
  }

  const Password._(this.value);
}




/// ONLY FOR ONE FIELD
/// HOW TO USE NOW,
/// void showingTheEmailOrFailure(){
/// final emailAddress = EmailAddress('fasdasd');
///
/// THE LONGER WAY, to populate TextField
/// String emailText = emailAddress.value.fold(
/// (left) => 'failure happened $left',
/// (right) => right,
/// );
///
/// HOW TO USE THE SHORTER WAY
/// String emailText2 = emailAddress.value.getOrElse(() => 'Some faillure happened');
///
/// }



/// REPLACED THE EXPLANATION CODE BELOW


/*
* METHOD 1, we want to avoid
* to throw particular exception,
* just not any exception we don't use catch block but instead
* and we do this every time we instantiate Email Address otherwise this can be
* used for different things at different places
*
* void f(){
*   try{
*     EmailAddress('asdasd');
*     } on InvalidEmailException catch (e){
*   } on ExceedingLengthException catch (e){
*   }
* }
*
*
* METHOD 2, we will change to InvalidEmailFailure and instantiate in the EmailAddress class
* we will not implement InvalidEmailException with 'implements Exception'
*INSTEAD we will use IF-ELSE checks
* LIKE
* void insideTheUI(EmailAddress emailAddress){
* if(emailAddress.failure == null){
* emailAdress.value;
* } else {
* // Error Snackbar
* }
* }
*
*
* IMPROVING
* combine field with failure
* We will use 'Either' Union
* Specially used for this type of cases
* Two types of Either - > LEFT or RIGHT
* Left side is usually for Failure and Right side is correct
* To handle more failures, we implement two classes
* Because we don't want to remember the Failure, we will make both
* failures subclass of abstract class Failure and both Failure will go in Union type
*
*
* */