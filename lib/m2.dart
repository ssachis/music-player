

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';


import 'package:music/tracks.dart';
class F {
  String name,artist,Url, ImageUrl;
  F(this.name,this.artist, this.Url,this.ImageUrl);
}
class AudioPage extends StatefulWidget {
  final F f;
  const AudioPage({Key? key,required this.f}) : super(key: key);

  @override
  _AudioPageState createState() => _AudioPageState();
}


class _AudioPageState extends State<AudioPage> {


  late AudioPlayer advancedPlayer  ;
  Duration _duration=new Duration();
  Duration _position=new Duration();

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
  advancedPlayer  = AudioPlayer();

     advancedPlayer.onDurationChanged.listen(( d) {
    setState((){
      _duration=d;
    });
  });

    advancedPlayer.onAudioPositionChanged.listen((d){
    setState((){
      _position=d;
    });
  });
    advancedPlayer.setUrl(widget.f.Url);
  }
  Widget btnStart(){
    return IconButton(
      padding :const EdgeInsets.only(bottom:10),
      icon:isPlay==false?Icon(_icons[0],size:45,color:Colors.blue):Icon(_icons[1],size:45,color:Colors.blue),
      onPressed:(){
        if(isPlay==false){
          advancedPlayer.play(widget.f.Url);
          setState(() {
            isPlay = true;


          });
        }else if(isPlay==true){
          advancedPlayer.pause();
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
   advancedPlayer.seek(newDuration);
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
    final double screenHeight=MediaQuery.of(context).size.height;
    final double screenWidth=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor:Colors.blue[100],
      body:
        Stack(
          children:[
            Positioned(
              top:0,
              left:0,
            right:0,
              height:screenHeight/3,

              child:
                Container(
                  color:Colors.lightBlueAccent,


                )
            ),
            Positioned(
               top:0,
                left:0,
                right:0,
                child: AppBar(
                  leading:IconButton(
                  icon:Icon(
                    Icons.arrow_back_ios,

                  ), onPressed: () {
                    _navigateToNextScreen(context);
                  },
                  ),
                  backgroundColor:Colors.lightBlueAccent,
                  elevation:0.0,

                )),
            Positioned(
              left:0,
                right:0,
                top:screenHeight*0.2,
                height:screenHeight*0.36,
                child: Container(

                  decoration:BoxDecoration(
                    borderRadius:BorderRadius.circular(40),
                    color:Colors.white,

                  ),
                  child:Column(
                    children:[
                      SizedBox(height:screenHeight*0.1),
                      Text(widget.f.name,
                        style:
                          TextStyle(
                            fontSize:30,
                            fontWeight:FontWeight.bold,

                          )

                      ),
                      Text(widget.f.artist,
                      style:
                      TextStyle(
                        fontSize:20,)
                      ),
                    Container(
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
                    )

                    ]
                  )


            )

            ),
            Positioned(
              top:screenHeight*0.12,
              left:(screenWidth-150)/2,
                right:(screenWidth-150)/2,
              height:screenHeight*0.16,
              child:Container(
                decoration:BoxDecoration(
                  borderRadius:BorderRadius.circular(20),
                  border:Border.all(color:Colors.grey,width:5),
                  image:DecorationImage(
                    image:NetworkImage(widget.f.ImageUrl),
                  fit:BoxFit.cover
                  )

                ),



              )
            ),



          ],

        )
    );
  }

  void _navigateToNextScreen(BuildContext context) {
    Navigator.of(context)
        .pop(MaterialPageRoute(builder: (context) => Tracks()));
  }
}
