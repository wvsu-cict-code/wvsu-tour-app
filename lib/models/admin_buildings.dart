class AdminBuildings {
  final String? name;
  final Map<String, dynamic>? featuredImage;
  final Map<String, dynamic>? createdBy;
  final String? longDescription;
  AdminBuildings(
      {this.name, this.featuredImage, this.createdBy, this.longDescription});

  AdminBuildings.fromJson(Map<String, dynamic> json)
      : name = json['Name'],
        featuredImage = json['FeaturedImage'],
        longDescription = json['LongDescription'],
        createdBy = json['created_by'];
}
