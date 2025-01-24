import 'package:ellipsis_care/core/api/exceptions/exceptions.dart';
import 'package:ellipsis_care/core/api/response/api_response.dart';
import 'package:fpdart/fpdart.dart';

typedef FutureEitherResponseOf<T> = Future<Either<ApiResponse<T>, AppExceptions>>;
