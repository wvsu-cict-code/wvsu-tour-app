class CampusLife {
  final String? shortDescription;

  final Map<String, dynamic>? image;
  final Map<String, dynamic>? createdBy;

  CampusLife({this.shortDescription, this.image, this.createdBy});

  CampusLife.fromJson(Map<String, dynamic> json)
      : shortDescription = json['ShortDescription'],
        image = json['Image'],
        createdBy = json['created_by'];
}
