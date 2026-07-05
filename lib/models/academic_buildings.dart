class AcademicBuildings {
  final String? name;
  final Map<String, dynamic>? featuredImage;
  final Map<String, dynamic>? createdBy;
  final String? longDescription;
  AcademicBuildings(
      {this.name, this.featuredImage, this.createdBy, this.longDescription});

  AcademicBuildings.fromJson(Map<String, dynamic> json)
      : name = json['Name'],
        featuredImage = json['FeaturedImage'],
        longDescription = json['LongDescription'],
        createdBy = json['created_by'];
}
