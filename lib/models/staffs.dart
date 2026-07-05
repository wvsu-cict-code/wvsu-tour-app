class Staffs {
  final String? name;
  final String? office;
  final String? description;
  final Map<String, dynamic>? profilePicture;
  final Map<String, dynamic>? createdBy;
  final String? campus;

  Staffs(
      {this.name,
      this.office,
      this.campus,
      this.profilePicture,
      this.createdBy,
      this.description});

  Staffs.fromJson(Map<String, dynamic> json)
      : office = json['Office'],
        name = json['Name'],
        campus = json['Campus'],
        profilePicture = json['ProfilePicture'],
        createdBy = json['created_by'],
        description = json['Description'];
}
