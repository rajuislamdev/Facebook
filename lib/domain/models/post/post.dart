class Post {
  final int id;
  final String userName;
  final String userImage;
  final String postDay;
  final String postDescription;
  final String likeCount;
  final String likerName;
  final List<String> images;

  Post({
    required this.id,
    required this.userName,
    required this.userImage,
    required this.postDay,
    required this.postDescription,
    required this.likeCount,
    required this.likerName,
    required this.images,
  });

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      id: map['id'],
      userName: map['userName'],
      userImage: map['userImage'],
      postDay: map['postDay'],
      postDescription: map['postDescription'],
      likeCount: map['likeCount'],
      likerName: map['likerName'],
      images: List<String>.from(map['images']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userName': userName,
      'userImage': userImage,
      'postDay': postDay,
      'postDescription': postDescription,
      'likeCount': likeCount,
      'likerName': likerName,
      'images': images,
    };
  }
}
