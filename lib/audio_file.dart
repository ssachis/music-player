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
  final String path="https://audio-previews.elements.envatousercontent.com/files/281404327/preview.mp3?response-content-disposition=attachment%3B+filename%3D%22GBUXGY3-is-it-hip-hop.mp3%22";
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
      icon:isPlay==false?Icon(_icons[0],size:45,color:Colors.blue):Icon(_icons[1],size:45,color:Colors.blue),
      onPressed:(){
        if(isPlay==false){
    this.widget.advancedPlayer.play(path);
    setState(() {
      isPlay = true;


    });
        }else if(isPlay==true){
          this.widget.advancedPlayer.pause();
          setState(() {
            isPlay = false;


          });

        }
    },

    );

}
 Widget slider() {
   return Slider(
     value:_position.inSeconds.toDouble(),

     min: 0.0,
     max: _duration.inSeconds.toDouble(),


     onChanged: (double value) {
       setState(() {
         changeToSecond(value.toInt());
         value=value;

       });
     },
   );
 }
void changeToSecond(int second){
    Duration newDuration=Duration(seconds:second);
   this.widget.advancedPlayer.seek(newDuration);
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
                Text(_position.toString().split(".")[0],style:TextStyle(fontSize:16),),
                Text(_duration.toString().split(".")[0],style:TextStyle(fontSize:16),)

              ]
               )

            ),
            slider(),
            loadAsset(),
          ]

        )
    );
  }
}
