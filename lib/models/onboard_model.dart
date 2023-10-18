class OnboardModel {
  final String header;
  final String title;
  final String imageUrl;

  OnboardModel({required this.header, required this.title, required this.imageUrl});

  OnboardModel.fromJson(Map<String, dynamic> json)
      : header = json['header'],
        title = json['title'],
        imageUrl = json['imageUrl'];

  Map<String, dynamic> toJson() => {
        'header': header,
        'title': title,
        'imageUrl': imageUrl,
      };
}
