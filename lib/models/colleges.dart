class Colleges {
  final String? campus;
  final List<dynamic>? photos;
  final String? longDescription;
  final String? shortDescription;
  final Map<String, dynamic>? createdBy;
  final Map<String, dynamic>? featuredImage;
  final Map<String, dynamic>? logo;
  final String? name;

  Colleges(
      {this.campus,
      this.featuredImage,
      this.createdBy,
      this.logo,
      this.name,
      this.shortDescription,
      this.longDescription,
      this.photos});

  Colleges.fromJson(Map<String, dynamic> json)
      : campus = json['Campus'],
        photos = json['Photos'],
        name = json['Name'],
        shortDescription = json['shortDescription'],
        featuredImage = json['FeaturedImage'],
        logo = json['Logo'],
        longDescription = json['LongDescription'],
        createdBy = json['created_by'];
}
