import 'package:bubbme/app/data/model/responses/failure_response.dart';
import 'package:dartz/dartz.dart';

typedef FutureEither<T> = Future<Either<FailureResponse, T>>;
typedef FutureVoid = FutureEither<void>;
