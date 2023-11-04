import 'package:flutter_leadify/view_model/Leads_view_model/leads_view_model.dart';
import 'package:flutter_leadify/view_model/scarp_view_model/scarp_view_model.dart';
import 'package:flutter_leadify/view_model/temp_view_model/temp_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class AppProvider {
  static List<SingleChildWidget> providers = [
    ChangeNotifierProvider(create: (_) => HomeNotifier()),
    ChangeNotifierProvider(create: (_) => LeadNotifier()..getLeads()),
    ChangeNotifierProvider(create: (_) => ScrapViewModel())
  ];
}
