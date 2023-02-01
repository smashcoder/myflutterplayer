
import 'package:musicplayer/model/song_model.dart';

class Playlist{
  final String title;
  final List<Song> songs;
  final String imageUrl;

  Playlist({
    required this.title,
    required this.songs,
    required this.imageUrl
  });

  static List<Playlist> playlists = [
    Playlist(
        title: 'Dildaara',
        songs: Song.songs,
        imageUrl:
        'https://lh3.googleusercontent.com/ev2blQxLfdvHD_M6CqkMo_7xmIB_RhcZ6bQ0Aax-txvXmulVXodOSI5L_xumqOq3AUMgp1464tUQLs9QIg=w544-h544-l90-rj'
    ),
    Playlist(
        title: 'Dildaara',
        songs: Song.songs,
        imageUrl:
        'https://lh3.googleusercontent.com/ev2blQxLfdvHD_M6CqkMo_7xmIB_RhcZ6bQ0Aax-txvXmulVXodOSI5L_xumqOq3AUMgp1464tUQLs9QIg=w544-h544-l90-rj'
    ),
    Playlist(
        title: 'Dildaara',
        songs: Song.songs,
        imageUrl:
        'https://lh3.googleusercontent.com/ev2blQxLfdvHD_M6CqkMo_7xmIB_RhcZ6bQ0Aax-txvXmulVXodOSI5L_xumqOq3AUMgp1464tUQLs9QIg=w544-h544-l90-rj'
    ),
    Playlist(
        title: 'Dildaara',
        songs: Song.songs,
        imageUrl:
        'https://lh3.googleusercontent.com/ev2blQxLfdvHD_M6CqkMo_7xmIB_RhcZ6bQ0Aax-txvXmulVXodOSI5L_xumqOq3AUMgp1464tUQLs9QIg=w544-h544-l90-rj'
    ),
  ];
}