// ignore_for_file: one_member_abstracts

import 'package:clase_clean_architecture/core/utils/result.dart';

abstract class FutureUsecaseWithParams<Type, Params> {
  FutureResult<Type> call(Params params);
}

abstract class FutureUsecaseWithoutParams<Type> {
  FutureResult<Type> call();
}
