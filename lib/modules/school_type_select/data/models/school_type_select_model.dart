class SchoolTypeSelectModel {
  int? id;
  String? schoolName;
  String? schoolType;

  SchoolTypeSelectModel({this.id, this.schoolName, this.schoolType});

  SchoolTypeSelectModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    schoolName = json['schoolName'];
    schoolType = json['schoolType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['schoolName'] = this.schoolName;
    data['schoolType'] = this.schoolType;
    return data;
  }
}