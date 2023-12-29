import 'package:equatable/equatable.dart';

class Task extends Equatable {
  final bool? isDeleted;
  final bool? isDone;
  final String description;
  final String id;
  final String title;

  const Task({
    required this.description,
    required this.id,
    required this.title,
    this.isDeleted = false,
    this.isDone = false,
  });

  @override
  List<Object?> get props => [description, isDeleted, isDone, title];

  Task copyWith({
    bool? isDeleted,
    bool? isDone,
    String? description,
    String? title,
  }) =>
      Task(
        description: description ?? this.description,
        id: id,
        isDeleted: isDeleted ?? this.isDeleted,
        isDone: isDone ?? this.isDone,
        title: title ?? this.title,
      );

  Map<String, dynamic> toJson() => {
        'description': description,
        'id': id,
        'isDeleted': isDeleted,
        'isDone': isDone,
        'title': title,
      };

  static Task fromJson(Map<String, dynamic> json) => Task(
        id: json['id'],
        isDeleted: json['isDeleted'],
        isDone: json['isDone'],
        title: json['title'] ?? '',
        description: json['description'] ?? '',
      );
}
