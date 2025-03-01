class People {
  final int id;
  final String image;
  final String name;
  final String userName;

  const People({
    required this.id,
    required this.image,
    required this.name,
    required this.userName,
  });

  factory People.fromMap(Map<String, dynamic> map) {
    return People(
      id: map['id'],
      image: map['image'],
      name: map['name'],
      userName: map['userName'],
    );
  }

  Map<String, dynamic> toMap() {
    return {'id': id, 'image': image, 'name': name, 'userName': userName};
  }
}
