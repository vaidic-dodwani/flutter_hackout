import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_leadify/model/campaign_model.dart';
import 'package:flutter_leadify/repository/campaigns_repository.dart';

class CampaignViewModel extends ChangeNotifier {
//
  bool _isLoading = false;
  bool get isLoading => _isLoading;
//
  final CampaignsRepository _campaignsRepository = CampaignsRepository();

//
  List<Campaign> _campaigns = [];
  List<Campaign> get campaigns => _campaigns;
  set campaigns(List<Campaign> _) {
    _campaigns = _;
    notifyListeners();
  }
//

//
  Set<Target> _targets = {};
  Set<Target> get targets => _targets;
  set targets(Set<Target> _) {
    _targets = _;
    notifyListeners();
  }
//

  void initializeTargets() {
    for (var element in _campaigns) {
      _targets.add(element.target);
    }
  }

  Future<void> getCampaigns() async {
    try {
      _isLoading = true;
      notifyListeners();
      _campaigns = await _campaignsRepository.getCampaigns();
      initializeTargets();
      _isLoading = false;
    } catch (e) {
      log(e.toString());
    }
    notifyListeners();
  }

  Future<void> getCampaignsIfEmpty() async {
    if (_campaigns.isEmpty) {
      try {
        await getCampaigns();
      } catch (e) {
        log(e.toString());
      }
    }
  }
}
