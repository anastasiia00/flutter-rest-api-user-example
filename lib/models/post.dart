import 'dart:convert';

List<Welcome> welcomeFromJson(String str) {
  print(str);
  return List<Welcome>.from(json.decode(str).map((x) => Welcome.fromJson(x)));
}

String welcomeToJson(List<Welcome> data) {
  print(data);
  return json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
}

class Welcome {
  Welcome({
    required this.userId,
    required this.id,
    required this.title,
    this.body,
  });

  int userId;
  int id;
  String title;
  String? body;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
}
