class LatestDocumentModel {
  final int id;
  final String documentName;
  final String docTypeName;
  final String url;
  final String updatedDate;

  LatestDocumentModel({
    this.id,
    this.documentName,
    this.docTypeName,
    this.url,
    this.updatedDate,
  });

  factory LatestDocumentModel.fromJson(Map<String, dynamic> json) {
    return LatestDocumentModel(
      id: json['id'],
      documentName: json['documentName'],
      docTypeName: json['docTypeName'],
      url: json['url'],
      updatedDate: json['updatedDate'],
    );
  }
}
