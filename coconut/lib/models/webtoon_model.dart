class WebtoonModel {
  final String title, thumb, id;

// fromJson은 map을 받음
  WebtoonModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        thumb = json['thumb'],
        id = json['id'];
}
