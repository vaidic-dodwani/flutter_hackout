import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_leadify/model/template_model.dart';
import 'package:flutter_leadify/repository/templates_repository.dart';

class TemplateViewModel extends ChangeNotifier {
//
  bool _isLoading = false;
  bool get isLoading => _isLoading;
//
  final TemplatesRepository _templatesRepository = TemplatesRepository();

//
  List<Template> _templates = [];
  List<Template> get templates => _templates;
  set templates(List<Template> _) {
    _templates = _;
    notifyListeners();
  }
//

  Future<void> getTemplates() async {
    try {
      _isLoading = true;
      notifyListeners();
      _templates = await _templatesRepository.getTemplates();
      _isLoading = false;
    } catch (e) {
      log(e.toString());
    }
    notifyListeners();
  }

  Future<void> getTemplatesIfEmpty() async {
    if (_templates.isEmpty) {
      try {
        await getTemplates();
      } catch (e) {
        log(e.toString());
      }
    }
  }
}
