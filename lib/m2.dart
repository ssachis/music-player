

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import 'package:music/audio_file.dart';

class AudioPage extends StatefulWidget {

  const AudioPage({Key? key}) : super(key: key);

  @override
  _AudioPageState createState() => _AudioPageState();
}


class _AudioPageState extends State<AudioPage> {
  late AudioPlayer advancedPlayer  ;
@override
  void initState(){
  super.initState();
  advancedPlayer  = AudioPlayer();

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

                  ), onPressed: () {  },
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
                      Text("2002",
                        style:
                          TextStyle(
                            fontSize:30,
                            fontWeight:FontWeight.bold,

                          )

                      ),
                      Text("Anne Marie",
                      style:
                      TextStyle(
                        fontSize:20,)
                      ),
                      AudioFile(advancedPlayer:advancedPlayer),

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
                    image:NetworkImage("https://i.ytimg.com/vi/4Bv10XSLpjg/maxresdefault.jpg"),
                  fit:BoxFit.cover
                  )

                ),



              )
            ),



          ],

        )
    );
  }
}
