

class Library_podcast {
  final String title;
  final String description;
  final String url;

  Library_podcast(
      {required this.title,
        required this.description,
        required this.url,
      });

  static List<Library_podcast> library_podcasts = [
    Library_podcast(
      title: 'Tập mới',
      description: 'Cập nhập hôm qua',
      url: 'assets/images/download.jpg',
    ),
    Library_podcast(
      title: "SkyBooks Radio",
      description: "Podcast - SkyBook Raido",
      url: "assets/images/skyBook.png",
    ),
    Library_podcast(
      title: 'Huynh Duy Khuong Show',
      description: 'Podcast - Huỳnh Duy Khương',
      url: "assets/images/HDK.jpg",
    ),
    Library_podcast(
      title: 'Sunhuyn Podcast',
      description: 'Podcast - Sunhuyn',
      url: "assets/images/sunhuyn.jpg",
    ),
    // Library_podcast(
    //   title: 'Tri Kỷ Cảm Xúc',
    //   description: 'Podcast - Web5day',
    //   url: "assets/images/triKy.jpg",
    // ),
    Library_podcast(
      title: 'Luyện nghe Tiếng anh',
      description: 'Podcast - BeBetter',
      url: "assets/images/eng.jpg",
    ),
  ];
}

// ignore: camel_case_types
class Library_artist {
  final String title;
  final String description;
  final String url;

  Library_artist(
      {required this.title,
        required this.description,
        required this.url,
      });

  static List<Library_artist> library_artists = [
    Library_artist(
      title: 'Anh Tú',
      description: 'Nghệ sĩ',
      url: 'assets/images/anhtu.jpg',
    ),
    Library_artist(
      title: "Hòa Minzy",
      description: "Nghệ sĩ",
      url: "assets/images/hoaMinzy.jpg",
    ),
    Library_artist(
      title: 'Only C',
      description: 'Nghệ sĩ',
      url: "assets/images/onlyC.jpg",
    ),
    Library_artist(
      title: 'MONO',
      description: 'Nghệ sĩ',
      url: "assets/images/mono.jpg",
    ),
    Library_artist(
      title: 'Đen',
      description: 'Nghệ sĩ',
      url: "assets/images/den.jpg",
    ),
    Library_artist(
      title: 'Sơn Tùng M-TP',
      description: 'Nghệ sĩ',
      url: "assets/images/mtp.jpg",
    ),
    Library_artist(
      title: 'Vũ',
      description: 'Nghệ sĩ',
      url: "assets/images/vu.jpg",
    ),
  ];
}