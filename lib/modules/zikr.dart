class Zikr {
  final int? id;
  final String name;
  final int count;
  final int clicked;

  Zikr({
    this.id,
    required this.name,
    required this.count,
    required this.clicked,
  });

  Zikr.fromMap(Map<String, dynamic> res)
      : id = res["id"],
        name = res["name"],
        count = res["count"],
        clicked = res['clicked'];

  Map<String, Object?> toMap() {
    return {'id': id, 'name': name, 'count': count, 'clicked': clicked};
  }
}
