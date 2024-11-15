import 'dart:convert';

class InputModel {
  String? message;
  String? assignmentInstructionUrl;
  String? information;
  JsonResponse? jsonResponse;

  InputModel({
    this.message,
    this.assignmentInstructionUrl,
    this.information,
    this.jsonResponse,
  });

  factory InputModel.fromRawJson(String str) => InputModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory InputModel.fromJson(Map<String, dynamic> json) => InputModel(
    message: json["message"],
    assignmentInstructionUrl: json["assignmentInstructionUrl"],
    information: json["information"],
    jsonResponse: json["json_response"] == null ? null : JsonResponse.fromJson(json["json_response"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "assignmentInstructionUrl": assignmentInstructionUrl,
    "information": information,
    "json_response": jsonResponse?.toJson(),
  };
}

class JsonResponse {
  List<Attribute>? attributes;

  JsonResponse({
    this.attributes,
  });

  factory JsonResponse.fromRawJson(String str) => JsonResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory JsonResponse.fromJson(Map<String, dynamic> json) => JsonResponse(
    attributes: json["attributes"] == null ? [] : List<Attribute>.from(json["attributes"]!.map((x) => Attribute.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "attributes": attributes == null ? [] : List<dynamic>.from(attributes!.map((x) => x.toJson())),
  };
}

class Attribute {
  String? id;
  String? title;
  String? type;
  List<String>? options;

  Attribute({
    this.id,
    this.title,
    this.type,
    this.options,
  });

  factory Attribute.fromRawJson(String str) => Attribute.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Attribute.fromJson(Map<String, dynamic> json) => Attribute(
    id: json["id"],
    title: json["title"],
    type: json["type"],
    options: json["options"] == null ? [] : List<String>.from(json["options"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "type": type,
    "options": options == null ? [] : List<dynamic>.from(options!.map((x) => x)),
  };
}
