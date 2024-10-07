import 'package:equatable/equatable.dart';

class ErrorRequestException extends Equatable{
  final String errorMessage;
  final bool hasError;

  const ErrorRequestException(
      {required this.errorMessage, required this.hasError});

  const ErrorRequestException.initialState()
      : errorMessage = "",
        hasError = false;

  @override
  // TODO: implement props
  List<Object?> get props => [errorMessage, hasError];
}
