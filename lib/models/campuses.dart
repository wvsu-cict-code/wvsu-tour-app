class Campuses {
  final String? shortDescription;
  final String? fullDescription;
  final String? name;
  final Map<String, dynamic>? logo;
  final Map<String, dynamic>? featuredImage;
  final Map<String, dynamic>? createdBy;

  Campuses(
      {this.shortDescription,
      this.fullDescription,
      this.name,
      this.logo,
      this.featuredImage,
      this.createdBy});

  Campuses.fromJson(Map<String, dynamic> json)
      : shortDescription = json['ShortDescription'],
        fullDescription = json['FullDescription'],
        name = json['Name'],
        logo = json['Logo'],
        featuredImage = json['FeaturedImage'],
        createdBy = json['created_by'];
}
