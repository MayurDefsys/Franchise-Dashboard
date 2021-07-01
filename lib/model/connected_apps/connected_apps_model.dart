class ConnectedAppsModel {
  final int id;
  final String name;
  final String description;
  final String imageLink;
  final String redirectUrl;

  ConnectedAppsModel({
    this.id,
    this.name,
    this.description,
    this.imageLink,
    this.redirectUrl,
  });

  factory ConnectedAppsModel.fromJson(Map<String, dynamic> json) {
    return ConnectedAppsModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      imageLink: json['imageLink'],
      redirectUrl: json['redirectUrl'],
    );
  }
}
