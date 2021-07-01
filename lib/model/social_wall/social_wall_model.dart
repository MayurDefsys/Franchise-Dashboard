class SocialWallModel {
  final int id;
  final String title;
  final String description;
  final String applicationType;
  final String author;
  final String postedDate;
  final String userImageUrl;

  SocialWallModel({
    this.id,
    this.title,
    this.description,
    this.applicationType,
    this.author,
    this.postedDate,
    this.userImageUrl,
  });

  factory SocialWallModel.fromJson(Map<String, dynamic> json) {
    return SocialWallModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      applicationType: json['applicationType'],
      author: json['author'],
      postedDate: json['postedDate'],
      userImageUrl: json['userImageUrl'],
    );
  }
}
