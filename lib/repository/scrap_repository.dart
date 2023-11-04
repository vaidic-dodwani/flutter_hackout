import 'dart:convert';
import 'dart:developer';
import 'dart:io';


import '../data/remote/network/api_end_points.dart';
import '../data/remote/network/network_api_service.dart';

abstract class IScrapRepository {
  Future<void> scrap(String companyName,String keywords);
  Future<void> enrichData();
}

class ScrapRepository implements IScrapRepository {
  final _apiService = NetworkApiService();
  Map<String, String> header = {
    HttpHeaders.contentTypeHeader: "application/json",
  };

  @override
  Future<void> scrap(String companyName,String keywords) async {
    try {
    
      await _apiService.postResponse(ApiLinks.scrap, jsonEncode({
  "target_url": "https://www.example.com/",
  "title": "This is a title",
  "company_name": companyName,
  "keywords": keywords,
  "institution": "Example Institution",
  "types_of_services": "service1",
  "age_category": "adult",
  "industry": "technology",
  "company_size": "small",
  "function": "engineering",
  "time": "10:00 AM",
  "date":"2023-11-03"
}),header);
      
    } on Exception catch (_) {
      log(_.toString());
      rethrow;
    }
  }

    @override
  Future<void> enrichData() async {
    try {
      log("get data");
       await _apiService.getResponse(ApiLinks.enrich, header);
      log("got data");
      
    } on Exception catch (_) {
      log(_.toString());
      rethrow;
    }
  }

}
