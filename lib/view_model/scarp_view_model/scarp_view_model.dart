import 'package:flutter/material.dart';
import 'package:flutter_leadify/repository/scrap_repository.dart';
import 'package:flutter_leadify/view_model/Leads_view_model/leads_view_model.dart';
import 'package:provider/provider.dart';

class ScrapViewModel extends ChangeNotifier{
  ScrapRepository repository = ScrapRepository();
  bool _loading = false;
  bool get loading => _loading;
  scrap({required String companyName,required String keywords,required BuildContext context})async{
    _loading = true;
    notifyListeners();
    await repository.scrap(companyName, keywords);
    await repository.enrichData();
    _loading = false;
    Provider.of<LeadNotifier>(context,listen: false).getLeads();
    notifyListeners();
  }
}