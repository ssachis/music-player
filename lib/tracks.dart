import 'package:flutter/material.dart';

import 'components/custom_list_title.dart';



class Tracks extends StatefulWidget {
  _TracksState createState() => _TracksState();
}

class _TracksState extends State<Tracks> {
  List musicList=[
    {
      'title':"alone",
      'singer':"marshmellow",
      'url':
          "https://soundcloud.com/marshmellomusic/alone",
      'coverUrl':
          "https://pbs.twimg.com/profile_images/1087600756541186048/sjZ3GY4l_400x400.jpg",

    },
{'title':"coffee for your head",
'singer':"death bed",
'url':
"https://soundcloud.com/powfu/death-bed-prod-otterpop",
'coverUrl':
"https://upload.wikimedia.org/wikipedia/en/3/3e/Powfu_-_Death_Bed.png",
},
    {'title':"2002",
      'singer':"anne marie",
      'url':
      "https://soundcloud.com/yumi-pies/anne-marie-2002-acoustic",
      'coverUrl':
      "https://i.scdn.co/image/ab67616d0000b273d04b0657298bd6401896de5e",
    },
    {'title':"fireflies",
      'singer':"Owl City",
      'url':
      "https://soundcloud.com/owlcityofficial/fireflies",
      'coverUrl':
      "https://i1.sndcdn.com/artworks-000138047568-lmgmfg-t500x500.jpg",
    },
    {'title':"Diamonds",
      'singer':"Rihanna",
      'url':
      "https://soundcloud.com/rihanna/diamonds",
      'coverUrl':
      "https://slm-assets.secondlife.com/assets/19196947/view_large/diamonds.jpg?1512907743",
    },
    {'title':"Happier",
      'singer':"marshmello ft-bastille",
      'url':
      "https://soundcloud.com/marshmellomusic/happier-ft-bastille",
      'coverUrl':
      "https://upload.wikimedia.org/wikipedia/en/e/e5/Marshmello_and_Bastille_Happier.png",
    },





  ];

  Widget build(context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        leading: Icon(Icons.music_note, color: Colors.grey[300]),
        title: Text('MUSICALLY', style: TextStyle(color: Colors.grey[400],
          shadows: <Shadow>[
            Shadow(
              offset: Offset(1.0, 1.0),
              blurRadius: 3.0,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
            Shadow(
              offset: Offset(1.0, 1.0),
              blurRadius: 8.0,
              color: Color.fromARGB(125, 0, 0, 255),
            ),
          ],


        ),),
        centerTitle: true,
        actions: [
          IconButton(
            icon:Icon(Icons.search,color: Colors.grey[300]),
            onPressed: (){},
          )
        ],
      ),
        body:
    Stack(
        children: [
          Positioned(
              top:15,
              left: 150,
              right: 150,
              height: 100,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),


                ),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Container(
                    decoration: BoxDecoration(

                      boxShadow:
                      [
                        BoxShadow(
                          color:Colors.lightBlueAccent,
                          blurRadius:10,
                          offset:Offset(5,5),
                          spreadRadius:3,



                        ),
                        BoxShadow(
                          color:Colors.white,
                          blurRadius:5,
                          offset:Offset(-5,-5),
                          spreadRadius:3,



                        )
                      ],

                        shape: BoxShape.circle,
                        border: Border.all(color:Colors.white, width: 2),
                        image:DecorationImage(
                            image:NetworkImage("https://media.istockphoto.com/vectors/isolated-bright-icon-of-watercolor-headphone-vector-id507143310?k=20&m=507143310&s=612x612&w=0&h=_y2pgkP9I2tyZa4wXiYPt2V8ZcO4NMyWupEv-XjbXkA="),
                    ),
                  ),
                ),
              )
              )

          ),


          Column(

              children: <Widget>[
                SizedBox(height: 120),
              Expanded(
              //flex: 9,

              child: ListView.builder(

                itemCount:musicList.length,
                itemBuilder: (context,index) =>customListTile(
                  onTap:(){},
                  title:musicList[index]['title'],
                singer:musicList[index]['singer'],
                cover:musicList[index]['coverUrl'],

              ),
          ),
          )
],
    )

],
    )


    );
  }
}
