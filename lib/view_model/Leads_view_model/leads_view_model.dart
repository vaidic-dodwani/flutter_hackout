import 'package:flutter/material.dart';
import 'package:flutter_hackout/model/lead_backend_model.dart';
import 'package:flutter_hackout/repository/leads_repository.dart';

class LeadNotifier extends ChangeNotifier {
  LeadsRepository repository = LeadsRepository();

  List<LeadModelBackend>? _leads;
  List<LeadModelBackend>? get leads => _leads;

  getLeads() async {
    _leads = null;
    notifyListeners();
    _leads = await repository.getLeads();
    notifyListeners();
  }

  deleteallLead() async {
    _leads = [];
    notifyListeners();
    repository.deleteAllLeads();
  }
}
