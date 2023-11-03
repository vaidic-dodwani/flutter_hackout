import 'dart:convert';

LeadModelBackend leadModelBackendFromJson(String str) => LeadModelBackend.fromJson(json.decode(str));

String leadModelBackendToJson(LeadModelBackend data) => json.encode(data.toJson());

class LeadModelBackend {
    final int? id;
    final String? profileUrl;
    final String? fullName;
    final String? firstName;
    final String? lastName;
    final String? profileImageUrl;
    final String? currentJob;
    final String? connectionDegree;
    final String? job;
    final String? location;
    final String? sharedConnections;
    final String? url;
    final String? name;
    final String? query;
    final String? category;
    final String? timestamp;
    final String? additionalInfo;
    final String? pastJob;
    final Map<String, String>? detailedLeads;
    final int? stateProgress;
    final String? leadScore;
    final String? email;

    LeadModelBackend({
        this.id,
        this.profileUrl,
        this.fullName,
        this.firstName,
        this.lastName,
        this.profileImageUrl,
        this.currentJob,
        this.connectionDegree,
        this.job,
        this.location,
        this.sharedConnections,
        this.url,
        this.name,
        this.query,
        this.category,
        this.timestamp,
        this.additionalInfo,
        this.pastJob,
        this.detailedLeads,
        this.stateProgress,
        this.leadScore,
        this.email,
    });

    factory LeadModelBackend.fromJson(Map<String, dynamic> json) => LeadModelBackend(
        id: json["id"],
        profileUrl: json["profileUrl"],
        fullName: json["fullName"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        profileImageUrl: json["profileImageUrl"],
        currentJob: json["currentJob"],
        connectionDegree: json["connectionDegree"],
        job: json["job"],
        location: json["location"],
        sharedConnections: json["sharedConnections"],
        url: json["url"],
        name: json["name"],
        query: json["query"],
        category: json["category"],
        timestamp: json["timestamp"],
        additionalInfo: json["additionalInfo"],
        pastJob: json["pastJob"],
        detailedLeads: Map.from(json["detailed_leads"]!).map((k, v) => MapEntry<String, String>(k, v)),
        stateProgress: json["state_progress"],
        leadScore: json["lead_score"],
        email: json["email"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "profileUrl": profileUrl,
        "fullName": fullName,
        "firstName": firstName,
        "lastName": lastName,
        "profileImageUrl": profileImageUrl,
        "currentJob": currentJob,
        "connectionDegree": connectionDegree,
        "job": job,
        "location": location,
        "sharedConnections": sharedConnections,
        "url": url,
        "name": name,
        "query": query,
        "category": category,
        "timestamp": timestamp,
        "additionalInfo": additionalInfo,
        "pastJob": pastJob,
        "detailed_leads": Map.from(detailedLeads!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "state_progress": stateProgress,
        "lead_score": leadScore,
        "email": email,
    };
}
