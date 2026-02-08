class StudyModel {
  int? id;
  String subject;
  int hours;
  String priority;

  StudyModel({
    this.id,
    required this.subject,
    required this.hours,
    required this.priority,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'subject': subject,
      'hours': hours,
      'priority': priority,
    };
  }
}
