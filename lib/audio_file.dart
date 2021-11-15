import 'package:flutter/cupertino.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class AudioFile extends StatefulWidget {
  final AudioPlayer advancedPlayer;
  const AudioFile({Key? key,required this.advancedPlayer}) : super(key: key);

  @override
  _AudioFileState createState() => _AudioFileState();
}

class _AudioFileState extends State<AudioFile> {
 Duration _duration=new Duration();
 Duration _position=new Duration();
 final String path="assets/songs/Alone(PaglaSongs).mp3";
 bool isPlay=false;
 bool isPause=false;
 bool isLoop=false;
 List<IconData> _icons=[
   Icons.play_circle_fill,
   Icons.pause_circle_filled,
 ];


  @override
  void initState(){

    super.initState();


    this.widget.advancedPlayer.onDurationChanged.listen(( d) {
      setState((){
   _duration=d;
      });
    });

    this.widget.advancedPlayer.onAudioPositionChanged.listen((d){
      setState((){
        _position=d;
      });
    });
this.widget.advancedPlayer.setUrl(path);
  }
Widget btnStart(){
    return IconButton(
      padding :const EdgeInsets.only(bottom:10),
      icon:Icon(_icons[0]),
      onPressed:(){
    this.widget.advancedPlayer.play(path);
    },
    );

}
Widget loadAsset(){
    return
        Container(
          child:Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment:MainAxisAlignment.spaceEvenly,
            children: [
              btnStart(),
            ],
          )
        );
}
@override
  Widget build(BuildContext context) {
    return Container(
      child:
        Column(
          children:[
            Padding(
              padding:const EdgeInsets.only(
                left:20,
                  right:20
              ),
               child:Row( mainAxisAlignment:MainAxisAlignment.spaceBetween,
              children:[

              ]
               )

            ),
            loadAsset(),
          ]

        )
    );
  }
}
