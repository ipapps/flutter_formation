class ApiResponse<T> {
  final T? response;
  final Exception? error;

  ApiResponse(this.response, this.error);

  bool get isOK => response != null;
}