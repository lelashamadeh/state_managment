
import 'dart:convert';

class PostsModel {
  String title;
  String body;
  PostsModel({
    required this.title,
    required this.body,
  });

  PostsModel copyWith({
    String? title,
    String? body,
  }) {
    return PostsModel(
      title: title ?? this.title,
      body: body ?? this.body,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'body': body,
    };
  }

  factory PostsModel.fromMap(Map<String, dynamic> map) {
    return PostsModel(
      title: map['title'] as String,
      body: map['body'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PostsModel.fromJson(String source) => PostsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'PostsModel(title: $title, body: $body)';

  @override
  bool operator ==(covariant PostsModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.title == title &&
      other.body == body;
  }

  @override
  int get hashCode => title.hashCode ^ body.hashCode;
}