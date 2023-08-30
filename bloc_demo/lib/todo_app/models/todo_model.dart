class Todo {
  final String title;
  final String message;
  bool isDone;

  Todo({
    this.title = "",
    this.message = "",
    this.isDone = false,
  });

  Todo copyWith({
    String? title,
    String? message,
    bool? isDone,
  }) {
    return Todo(
        title: title ?? this.title,
        message: message ?? this.message,
        isDone: isDone ?? this.isDone);
  }

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      title: json['title'],
      message: json['message'],
      isDone: json['isDone'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "message": message,
      "isDone": isDone,
    };
  }

  @override
  String toString() {
    return ''' Todo: {
      title: $title\n
      message: $message\n
      isDone: $isDone\n
    }''';
  }
}
