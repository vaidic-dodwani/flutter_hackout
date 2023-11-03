import 'dart:io';
import 'package:flutter_leadify/data/remote/network/api_end_points.dart';
import 'package:flutter_leadify/data/remote/network/network_api_service.dart';
import 'package:flutter_leadify/model/campaign_model.dart';

abstract class _CampaignsAbstarct {
  Future<List<Campaign>> getCampaigns();
}

class CampaignsRepository implements _CampaignsAbstarct {
  final _apiService = NetworkApiService();
  Map<String, String> header = {
    HttpHeaders.contentTypeHeader: "application/json",
  };

  @override
  Future<List<Campaign>> getCampaigns() async {
    try {
      final resp = await _apiService.getResponse(ApiLinks.campaign, header);
      return List<Campaign>.from(resp.map((e) => Campaign.fromJson(e)));
    } on Exception catch (_) {
      rethrow;
    }
  }
}
