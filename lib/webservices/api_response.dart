class ApiResponse<Response> {
  final Response? response;
  final Exception? error;

  ApiResponse(this.response, this.error);
}