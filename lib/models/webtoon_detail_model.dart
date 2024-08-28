class WebtoonDetailModel {
  final String title, about, gener, age;

  WebtoonDetailModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        about = json['about'],
        gener = json['gener'],
        age = json['age'];
}
