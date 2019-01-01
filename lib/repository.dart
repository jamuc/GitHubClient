import 'dart:convert';

class Repository {
  final String name;
  final String description;
  final bool forked;

  Repository(this.name, this.description, this.forked);

  factory Repository.fromJSON(String jsonString) {
    try {
      Map<String, dynamic> _json = jsonDecode(jsonString);
      return new Repository(_json["name"], _json["description"], _json["forked"]);
    } catch(e) {
      return null;
    }
  }
}