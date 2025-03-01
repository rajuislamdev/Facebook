class Story {
  final int id;
  final String image;
  final String name;

  Story({required this.id, required this.image, required this.name});

  factory Story.fromMap(Map<String, dynamic> map) {
    return Story(id: map['id'], image: map['image'], name: map['name']);
  }

  Map<String, dynamic> toMap() {
    return {'id': id, 'image': image, 'name': name};
  }
}
