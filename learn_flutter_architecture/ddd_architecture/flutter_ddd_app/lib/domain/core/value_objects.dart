import 'package:flutter/foundation.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutterdddapp/domain/core/failures.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

@immutable
abstract class ValueObject<T> {
  const ValueObject();
  Either<ValueFailure<T>, T> get value;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is ValueObject<T> && value == other.value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() {
    return 'Value($value)';
  }
}