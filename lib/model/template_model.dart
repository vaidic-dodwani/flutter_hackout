class Template {
  final int id;
  final String templateName;
  final String openRate;
  final String clickRate;
  final String replyRate;
  final String meetingRate;
  final String noResponse;
  final String bounceRate;

  Template({
    required this.id,
    required this.templateName,
    required this.openRate,
    required this.clickRate,
    required this.replyRate,
    required this.meetingRate,
    required this.noResponse,
    required this.bounceRate,
  });

  Template copyWith({
    int? id,
    String? templateName,
    String? openRate,
    String? clickRate,
    String? replyRate,
    String? meetingRate,
    String? noResponse,
    String? bounceRate,
  }) =>
      Template(
        id: id ?? this.id,
        templateName: templateName ?? this.templateName,
        openRate: openRate ?? this.openRate,
        clickRate: clickRate ?? this.clickRate,
        replyRate: replyRate ?? this.replyRate,
        meetingRate: meetingRate ?? this.meetingRate,
        noResponse: noResponse ?? this.noResponse,
        bounceRate: bounceRate ?? this.bounceRate,
      );

  factory Template.fromJson(Map<String, dynamic> json) => Template(
        id: json["id"],
        templateName: json["template_name"],
        openRate: json["open_rate"],
        clickRate: json["click_rate"],
        replyRate: json["reply_rate"],
        meetingRate: json["meeting_rate"],
        noResponse: json["no_response"],
        bounceRate: json["bounce_rate"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "template_name": templateName,
        "open_rate": openRate,
        "click_rate": clickRate,
        "reply_rate": replyRate,
        "meeting_rate": meetingRate,
        "no_response": noResponse,
        "bounce_rate": bounceRate,
      };
}
