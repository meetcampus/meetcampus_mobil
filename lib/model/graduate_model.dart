class GraduateModel {
  int id;
  String name;
  String surname;
  String title;
  String placeOfWork;
  String twitterUrl;
  String linkedInUr;
  String avatarUrl;

  GraduateModel(
      {this.id,
      this.name,
      this.surname,
      this.title,
      this.placeOfWork,
      this.twitterUrl,
      this.linkedInUr,
      this.avatarUrl});

  GraduateModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    surname = json['surname'];
    title = json['title'];
    placeOfWork = json['placeOfWork' ];
    twitterUrl = json['twitterUrl'];
    linkedInUr = json['linkedInUr'];
    avatarUrl = json['avatarUrl'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['surname'] = surname;
    data['title'] = title;
    data['placeOfWork'] = placeOfWork;
    data['twitterUrl'] = twitterUrl;
    data['linkedInUr'] = linkedInUr;
    data['avatarUrl'] = avatarUrl;
    return data;
  }
}
