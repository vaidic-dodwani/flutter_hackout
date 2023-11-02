import 'dart:developer';
import 'dart:io';

import 'package:flutter_leadify/model/lead_backend_model.dart';

import '../data/remote/network/api_end_points.dart';
import '../data/remote/network/network_api_service.dart';

abstract class ILeadsRepository {
  Future<List<LeadModelBackend>> getLeads();
  Future<void> deleteAllLeads();
}

class LeadsRepository implements ILeadsRepository {
  final _apiService = NetworkApiService();
  Map<String, String> header = {
    HttpHeaders.contentTypeHeader: "application/json",
  };

  @override
  Future<List<LeadModelBackend>> getLeads() async {
    try {
      final resp =
          await _apiService.getResponse(ApiLinks.getleads,header);
      print(resp);
      return List<LeadModelBackend>.from(resp.map((e)=>LeadModelBackend.fromJson(e)));
    } on Exception catch (_) {
      log(_.toString());
      rethrow;
    }
  }

  @override
  Future<void> deleteAllLeads() async {
    try {
      final resp =
          await _apiService.getResponse(ApiLinks.deleteLeads,header);
    } on Exception catch (_) {
      log(_.toString());
      rethrow;
    }
  }
}
