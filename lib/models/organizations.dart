class Organizations {
  final String? name;
  final Map<String, dynamic>? logo;
  final Map<String, dynamic>? createdBy;
  final String? description;

  Organizations({this.name, this.logo, this.createdBy, this.description});

  Organizations.fromJson(Map<String, dynamic> json)
      : name = json['Name'],
        logo = json['Logo'],
        createdBy = json['created_by'],
        description = json['Description'];
}
