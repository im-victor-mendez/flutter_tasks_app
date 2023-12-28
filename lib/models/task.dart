import 'package:equatable/equatable.dart';

class Task extends Equatable {
  final bool? isDeleted;
  final bool? isDone;
  final String id;
  final String title;

  const Task({
    required this.id,
    required this.title,
    this.isDeleted = false,
    this.isDone = false,
  });

  Task copyWith({bool? isDeleted, bool? isDone, String? title}) => Task(
        id: id,
        isDeleted: isDeleted ?? this.isDeleted,
        isDone: isDone ?? this.isDone,
        title: title ?? this.title,
      );

  Map<String, dynamic> toJson() => {
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
      );

  @override
  List<Object?> get props => [isDeleted, isDone, title];
}
