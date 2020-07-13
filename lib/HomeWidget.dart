import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
      "https://r3---sn-gpv7dn7e.googlevideo.com/videoplayback?expire=1588201404&ei=PJepXr7kObOxhwbK25TwBQ&ip=2607:5300:60:90b3::&id=53e60d7881efca55&itag=22&source=blogger&susc=bl&mime=video/mp4&dur=1461.696&lmt=1588159523813141&sparams=expire,ei,ip,id,itag,source,susc,mime,dur,lmt&sig=AOq0QJ8wRQIhAKQF246sNfLZ07bhBVdZgh5d7dOph1NjpjI2LEy3A9Y1AiA6Ne--tujJV7s-OaBpWUyuE1uYBKmm-2Gf73P1t-7xVQ%3D%3D&redirect_counter=1&rm=sn-p5qe7e7s&req_id=fcad788a0e1ea3ee&cms_redirect=yes&ipbypass=yes&mh=4i&mip=2804:7f7:db80:66cd:f4a7:8137:4e28:ab8b&mm=31&mn=sn-gpv7dn7e&ms=au&mt=1588171454&mv=u&mvi=2&pl=35&lsparams=ipbypass,mh,mip,mm,mn,ms,mv,mvi,pl&lsig=ALrAebAwRQIhAPllFBHZPiyjFYdE7dugRGE7TSQosGpq3Qvv-Cfma1YyAiB_KNyqTYwbMw9YoMGJtTkiVVBVJAgAtqxXOhtYk4gckA%3D%3D",
    )
      ..setLooping(true)
      ..initialize().then((value) {
        setState(() {
          //Iniciar Video automaticamente, pois quando o App abrir.
          _controller.play();
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _controller.value.initialized == false
            ? Text("Pressione Play")
            : AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
        onPressed: () {          
          setState(() {
            _controller.value.isPlaying ? _controller.pause() : _controller.play();
          });          
        },
      ),
    );
  }
}
