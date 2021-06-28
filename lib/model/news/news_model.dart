class NewsModel {
  final int id;
  final String title;
  final String description;
  final String newsImage;
  final String author;
  final String date;

  NewsModel({
    this.id,
    this.title,
    this.description,
    this.newsImage,
    this.author,
    this.date,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      newsImage: json['newsImage'],
      author: json['author'],
      date: json['date'],
    );
  }
}
