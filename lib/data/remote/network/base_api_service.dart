abstract class BaseApiService {
  final String baseUrl = "";

  Future<dynamic> getResponse(String url, Map<String, String> header);
  Future<dynamic> postResponse(
      String url, Map<String, dynamic> jsonBody, Map<String, String> header);

  Future<dynamic> patchResponse(
      String url, Map<String, dynamic> jsonBody, Map<String, String> header);
  Future<dynamic> deleteResponse(String url, Map<String, String> header);
}
