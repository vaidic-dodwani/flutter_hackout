import 'dart:convert';

import 'package:flutter_leadify/model/template_model.dart';

List<Campaign> campaignFromJson(String str) =>
    List<Campaign>.from(json.decode(str).map((x) => Campaign.fromJson(x)));

String campaignToJson(List<Campaign> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Campaign {
  final int id;
  final String impressions;
  final String totalLikes;
  final String percentageChange;
  final Target target;
  final String duration;
  final List<Template> marketingTemplates;
  final int? templates;

  Campaign({
    required this.id,
    required this.impressions,
    required this.totalLikes,
    required this.percentageChange,
    required this.target,
    required this.duration,
    required this.marketingTemplates,
    required this.templates,
  });

  Campaign copyWith({
    int? id,
    String? impressions,
    String? totalLikes,
    String? percentageChange,
    Target? target,
    String? duration,
    List<Template>? marketingTemplates,
    int? templates,
  }) =>
      Campaign(
        id: id ?? this.id,
        impressions: impressions ?? this.impressions,
        totalLikes: totalLikes ?? this.totalLikes,
        percentageChange: percentageChange ?? this.percentageChange,
        target: target ?? this.target,
        duration: duration ?? this.duration,
        marketingTemplates: marketingTemplates ?? this.marketingTemplates,
        templates: templates ?? this.templates,
      );

  factory Campaign.fromJson(Map<String, dynamic> json) => Campaign(
        id: json["id"],
        impressions: json["impressions"],
        totalLikes: json["total_likes"],
        percentageChange: json["percentage_change"],
        target: Target.fromJson(json["target"]),
        duration: json["duration"],
        marketingTemplates: List<Template>.from(
            json["marketing_templates"].map((x) => Template.fromJson(x))),
        templates: json["templates"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "impressions": impressions,
        "total_likes": totalLikes,
        "percentage_change": percentageChange,
        "target": target.toJson(),
        "duration": duration,
        "marketing_templates":
            List<dynamic>.from(marketingTemplates.map((x) => x.toJson())),
        "templates": templates,
      };
}

class Target {
  final int id;
  final String targetName;
  final String logo;

  Target({
    required this.id,
    required this.targetName,
    required this.logo,
  });

  Target copyWith({
    int? id,
    String? targetName,
    String? logo,
  }) =>
      Target(
        id: id ?? this.id,
        targetName: targetName ?? this.targetName,
        logo: logo ?? this.logo,
      );

  factory Target.fromJson(Map<String, dynamic> json) => Target(
        id: json["id"],
        targetName: json["target_name"],
        logo: json["logo"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "target_name": targetName,
        "logo": logo,
      };
}
