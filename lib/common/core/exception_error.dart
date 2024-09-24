class ErrorRequestException {
  final String errorMessage;
  final bool hasError;

  const ErrorRequestException(
      {required this.errorMessage, required this.hasError});
}
