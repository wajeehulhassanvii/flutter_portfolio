import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutterdddapp/domain/auth/auth_failure.dart';

import 'value_objects.dart';

//Facades are same as repositories

// Catch exceptions inside facade and should return failure
// because we don't want to catch exception in application layer
// we will again use Either for error or non error for authentication
// avoid void in right side of either, we can use Unit instead of void, which
// is almost similar, void isnt a class but unit is


abstract class IAuthFacade{
  // Facade is a design pattern which helps us connect two different classes
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword({
    @required EmailAddress emailAddress,
    @required Password password
  });

  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword({
    @required EmailAddress emailAddress,
    @required Password password
  });

  Future<Either<AuthFailure, Unit>> signInWithGoogle();

  // if we want to return string then the below command will be used.
  //Future<Either<AuthFailure, Unit>> returnsAValueString();
}