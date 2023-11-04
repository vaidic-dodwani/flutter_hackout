import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_hackout/model/campaign_model.dart';
import 'package:flutter_hackout/repository/campaigns_repository.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CampaignViewModel extends ChangeNotifier {
//
  bool _isLoading = false;
  bool get isLoading => _isLoading;
//
  bool _isAddCampaignLoading = false;
  bool get isAddCampaignLoading => _isAddCampaignLoading;
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
  Set<String> _targets = {};
  Set<String> get targets => _targets;
  set targets(Set<String> _) {
    _targets = _;
    notifyListeners();
  }
//

  void initializeTargets() {
    for (var element in _campaigns) {
      _targets.add(element.target.targetName);
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

  Future<void> addCampaign(BuildContext context, String templateName) async {
    try {
      _isAddCampaignLoading = true;
      notifyListeners();
      final body = ({"template_name": templateName});
      await _campaignsRepository.addCampaign(body);
      Fluttertoast.showToast(
        msg: "Campaign Added Successfully",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      await getCampaigns();
      if (context.mounted) {
        Navigator.pop(context);
      }
    } catch (e) {
      log(e.toString());
    }
    _isAddCampaignLoading = false;
    notifyListeners();
  }
}
