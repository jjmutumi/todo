import 'package:uuid/uuid.dart';

class Todo {
  Todo({
    this.id,
    this.content,
    this.completedAt,
    this.createdAt,
  }) {
    if (id == null || id.isEmpty) {
      id = Uuid().v4();
    }
    if (createdAt == null) {
      createdAt = DateTime.now();
    }
  }

  String id;
  String content;
  DateTime completedAt;
  DateTime createdAt;

  factory Todo.fromJson(Map<String, dynamic> json) => Todo(
        id: json["id"] ?? null,
        content: json["content"] ?? null,
        completedAt: json["completedAt"] == null
            ? null
            : DateTime.parse(json["completedAt"]),
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "content": content,
        "completedAt": completedAt?.toIso8601String(),
        "createdAt": createdAt.toIso8601String(),
      };

  bool get isComplete => completedAt != null;

  complete(bool isComplete) {
    completedAt = isComplete ? DateTime.now() : null;
  }
}
