class FacilitiesAmenities {
  final String? name;
  final String? shortDescription;
  final Map<String, dynamic>? createdBy;
  final Map<String, dynamic>? featuredImage;

  FacilitiesAmenities(
      {this.name, this.shortDescription, this.featuredImage, this.createdBy});

  FacilitiesAmenities.fromJson(Map<String, dynamic> json)
      : name = json['Name'],
        shortDescription = json['ShortDescription'],
        featuredImage = json['FeaturedImage'],
        createdBy = json['created_by'];
}
