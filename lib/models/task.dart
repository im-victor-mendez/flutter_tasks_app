import 'package:equatable/equatable.dart';

class Task extends Equatable {
  final bool? isDeleted;
  final bool? isDone;
  final String title;

  const Task({
    this.isDeleted = false,
    this.isDone = false,
    required this.title,
  });

  Task copyWith({bool? isDeleted, bool? isDone, String? title}) => Task(
        isDeleted: isDeleted ?? this.isDeleted,
        isDone: isDone ?? this.isDone,
        title: title ?? this.title,
      );

  Map<String, dynamic> toJson() => {
        'isDeleted': isDeleted,
        'isDone': isDone,
        'title': title,
      };

  Task fromJson(Map<String, dynamic> json) => Task(
        isDeleted: json['isDeleted'],
        isDone: json['isDone'],
        title: json['title'] ?? '',
      );

  @override
  List<Object?> get props => [isDeleted, isDone, title];
}
