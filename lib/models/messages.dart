class Messages {
  final String? name;
  final String? messageBody;
  final Map<String, dynamic>? featuredImage;
  final Map<String, dynamic>? createdBy;
  final String? description;

  Messages(
      {this.name,
      this.messageBody,
      this.featuredImage,
      this.createdBy,
      this.description});

  Messages.fromJson(Map<String, dynamic> json)
      : messageBody = json['MessageBody'],
        name = json['Name'],
        featuredImage = json['FeaturedImage'],
        createdBy = json['created_by'],
        description = json['Description'];
}
