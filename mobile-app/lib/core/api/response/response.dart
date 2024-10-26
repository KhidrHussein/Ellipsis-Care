export 'failed_api_response/failed_api_response.dart';
export 'successful_api_response/successful_api_response.dart';

typedef ApiResult<S, F> = ({S? response, F? exception});
