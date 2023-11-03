import 'package:flutter_leadify/view_model/Leads_view_model/leads_view_model.dart';
import 'package:flutter_leadify/view_model/campaign_view_model/campaign_view_model.dart';
import 'package:flutter_leadify/view_model/home_view_model/home_view_model.dart';
import 'package:flutter_leadify/view_model/templates_view_model/templates_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class AppProvider {
  static List<SingleChildWidget> providers = [
    ChangeNotifierProvider(create: (_) => HomeNotifier()),
    ChangeNotifierProvider(create: (_) => LeadNotifier()..getLeads()),
    ChangeNotifierProvider(create: (_) => TemplateViewModel()),
    ChangeNotifierProvider(create: (_) => CampaignViewModel())
  ];
}
