class Source {
  String id;
  String name;

  Source({required this.id, required this.name});

   factory Source.fromJson(Map<String?, dynamic> json) {
    return Source(
      id: json['id'],
      name: json['name']
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      
    };
  }

  factory Source.fromMap(Map<String, dynamic> map) {
    return Source(
      id: map['id'],
      name: map['name'],
      
    );
  }
}