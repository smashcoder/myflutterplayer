class Song{
  final String title;
  final String description;
  final String url;
  final String coverUrl;

  Song({
    required this.title,
    required this.description,
    required this.url,
    required this.coverUrl,
  });

  static List<Song> songs = [
    Song(
      title: ' Dildaara',
      description: 'Movie Song',
      url: 'assets/music/Dildara.mp3',
      coverUrl: 'assets/images/album art.jpeg',
    ),
    Song(
        title: ' Dildaara',
        description: 'Movie Song',
        url: 'assets/music/Dildara.mp3',
        coverUrl: 'assets/images/album art.jpeg',
    ),
    Song(
        title: ' Dildaara',
        description: 'Movie Song',
        url: 'assets/music/Dildara.mp3',
        coverUrl: 'assets/images/album art.jpeg',
    ),
    Song(
        title: ' Dildaara',
        description: 'Movie Song',
        url: 'assets/music/Dildara.mp3',
        coverUrl: 'assets/images/album art.jpeg',
    ),
  ];
}