abstract class BaseApiService {
  final String baseUrl = "https://fe8a-103-164-25-215.ngrok-free.app/";

  Future<dynamic> getResponse(String url, Map<String, String> header);
  Future<dynamic> postResponse(
      String url, Map<String, dynamic> jsonBody, Map<String, String> header);

  Future<dynamic> patchResponse(
      String url, Map<String, dynamic> jsonBody, Map<String, String> header);
  Future<dynamic> deleteResponse(String url, Map<String, String> header);
}
