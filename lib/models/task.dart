import 'package:equatable/equatable.dart';

class Task extends Equatable {
  final DateTime date;
  final String description;
  final String id;
  final String title;
  final bool? isDeleted;
  final bool? isDone;
  final bool? isFavorite;

  const Task({
    required this.date,
    required this.description,
    required this.id,
    required this.title,
    this.isDeleted = false,
    this.isDone = false,
    this.isFavorite = false,
  });

  @override
  List<Object?> get props => [
        date,
        description,
        id,
        isDeleted,
        isDone,
        isFavorite,
        title,
      ];

  Task copyWith({
    bool? isDeleted,
    bool? isDone,
    bool? isFavorite,
    String? description,
    String? title,
  }) =>
      Task(
        date: date,
        description: description ?? this.description,
        id: id,
        isDeleted: isDeleted ?? this.isDeleted,
        isDone: isDone ?? this.isDone,
        isFavorite: isFavorite ?? this.isFavorite,
        title: title ?? this.title,
      );

  Map<String, dynamic> toJson() => {
        'date': date.toString(),
        'description': description,
        'id': id,
        'isDeleted': isDeleted,
        'isDone': isDone,
        'isFavorite': isFavorite,
        'title': title,
      };

  static Task fromJson(Map<String, dynamic> json) => Task(
        date: DateTime.parse(json['date']),
        description: json['description'] ?? '',
        id: json['id'] ?? '',
        isDeleted: json['isDeleted'],
        isDone: json['isDone'],
        isFavorite: json['isFavorite'],
        title: json['title'] ?? '',
      );
}
