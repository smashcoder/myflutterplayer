import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/song_model.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart' as rxdart;
import '../widgets/widget.dart';

class SongScreen extends StatefulWidget {
  const SongScreen({Key? key}) : super(key: key);

  @override
  State<SongScreen> createState() => _SongScreenState();
}

class _SongScreenState extends State<SongScreen> {
  AudioPlayer audioPlayer = AudioPlayer();
  Song song = Get.arguments ?? Song.songs[0];

  @override
  void initState(){
    super.initState();
    ConcatenatingAudioSource(
      children: [
        AudioSource.uri(Uri.parse('asset:///${song.url}')),
      ],
    );
  }
  //initState();

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }
  //dispose();

  Stream<SeekBarData> get _seekBarDataStream =>
      rxdart.Rx.combineLatest2<Duration, Duration?, SeekBarData>(
          audioPlayer.positionStream,
          audioPlayer.durationStream,
              (Duration position, Duration? duration,){
            return SeekBarData(position, duration ?? Duration.zero,);
          }
      );
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            song.coverUrl,
            fit: BoxFit.cover,
          ),
          const _BackgroundFilter(),
          _MusicPlayer(
              audioPlayer: audioPlayer,
              song: song,
              seekBarDataStream: _seekBarDataStream,
          ),
        ],
      ),
    );
  }
}

class _MusicPlayer extends StatelessWidget {
  const _MusicPlayer({
    Key? key,
    required this.audioPlayer,
    required this.song,
    required Stream<SeekBarData> seekBarDataStream,
  }) : _seekBarDataStream = seekBarDataStream,
        super(key: key);

  final AudioPlayer audioPlayer;
  final Stream<SeekBarData> _seekBarDataStream;
  final Song song;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 20.0, vertical: 50.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            song.title,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            song.description,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 30,),
          StreamBuilder<SeekBarData>(
              stream: _seekBarDataStream,
              builder:
              (context, snapshot){
              final positionData = snapshot.data;
                return SeekBar(
                    position: positionData?.position ?? Duration.zero,
                    duration: positionData?.duration ?? Duration.zero,
                    OnChangeEnd: audioPlayer.seek,
                    onChanged: (Duration value) {  },
                );
              }
          ),
          PlayerButtons(audioPlayer: audioPlayer),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.settings,
                    color: Colors.white,
                  ),
                iconSize: 35,
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.cloud_download,
                  color: Colors.white,
                ),
                iconSize: 35,
              ),
            ],
          )
        ],
      ),
    );
  }
}
class _BackgroundFilter extends StatelessWidget {
  const _BackgroundFilter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (rect){
        return LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.white,
            Colors.white.withOpacity(0.5),
            Colors.white.withOpacity(0.0),
          ],
          stops: const [0.0, 0.4, 0.6]
        ).createShader(rect);
      },
      blendMode: BlendMode.dstOut,
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.deepPurple.shade200,
                Colors.deepPurple.shade800,
              ],
            )
        ),
      ),
    );
  }
}