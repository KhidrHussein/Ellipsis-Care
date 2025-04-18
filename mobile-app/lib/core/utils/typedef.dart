import '../api/exceptions/exceptions.dart';
import '../api/response/api_response.dart';
import 'package:fpdart/fpdart.dart';

typedef FutureEitherResponseOf<T>
    = Future<Either<ApiResponse<T>, AppExceptions>>;
typedef FutureEitherOf<T> = Future<Either<T, AppExceptions>>;
