import 'api_exception.dart';
import 'api_exception_strings.dart';
abstract class ApiExceptionMapper {
  static String toErrorMessage(Object error) {
    if (error is ApiException) {
      if (error is ConnectionException) {
        return ApiExceptionStrings.connectionError;
      } else if (error is ClientErrorException) {
        return ApiExceptionStrings.clientError;
      } else if (error is ServerErrorException) {
        return ApiExceptionStrings.serverError;
      } else if (error is EmptyResultException) {
        return ApiExceptionStrings.emptyResultError;
      } else {
        return ApiExceptionStrings.unknownError;
      }
    } else {
      return ApiExceptionStrings.unknownError;
    }
  }
}
