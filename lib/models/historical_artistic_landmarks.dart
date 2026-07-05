class HistoricalArtisticLandmarks {
  final String? name;
  final String? location;
  final Map<String, dynamic>? createdBy;
  final Map<String, dynamic>? featuredImage;

  HistoricalArtisticLandmarks(
      {this.name, this.location, this.featuredImage, this.createdBy});

  HistoricalArtisticLandmarks.fromJson(Map<String, dynamic> json)
      : name = json['Name'],
        location = json['Location'],
        featuredImage = json['FeaturedImage'],
        createdBy = json['created_by'];
}
