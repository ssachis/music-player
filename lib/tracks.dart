import 'package:flutter/material.dart';

import 'components/custom_list_title.dart';
import 'm2.dart';



class Tracks extends StatefulWidget {
  _TracksState createState() => _TracksState();
}

class _TracksState extends State<Tracks> {
  List <F>musicList=[
    F(
      "Night Sky",
     "Micheal Ramir",

          "https://assets.mixkit.co/music/preview/mixkit-night-sky-970.mp3",

          "https://discovery.sndimg.com/content/dam/images/discovery/fullset/2020/4/2/nightsky2_getty.jpg.rend.hgtvcom.616.411.suffix/1585862428885.jpeg",

  ), F
  ( "Thinking About You",
"Arulo",

"https://assets.mixkit.co/music/preview/mixkit-thinking-about-you-234.mp3",

"https://upload.wikimedia.org/wikipedia/en/3/3e/Powfu_-_Death_Bed.png",
), F
  ( "Astrology",
  "Arulo",

  "https://assets.mixkit.co/music/preview/mixkit-astrology-246.mp3",

  "https://www.dummies.com/wp-content/uploads/astrology-signs-sun.jpg",
  )

  , F
  ( "Valley sunset",
  "Alejandro Magaña ",

  "https://assets.mixkit.co/music/preview/mixkit-valley-sunset-127.mp3",

  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRAX0N11Xhf45GpqpicrXQerPkG4Y-VaIWJkeC7ZK7be0iasp9Blwmvv0QghYNFfXB4GwA&usqp=CAU",
  )
    , F
      ( "Forest Treasure",
      "Alejandro Magaña",

      "https://assets.mixkit.co/music/preview/mixkit-forest-treasure-138.mp3",

      "https://images.pexels.com/photos/312839/pexels-photo-312839.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
    ),
    F
      ( "Gimme that Groove!",
      "Micheal Ramir",

      "https://assets.mixkit.co/music/preview/mixkit-gimme-that-groove-872.mp3",

      "https://static01.nyt.com/images/2019/11/04/opinion/funk-promo/funk-promo-videoSixteenByNine3000.jpg?year=2019&h=1687&w=3000&s=3656c5f263514736ad46adc97436a557a3ef0ff28781b4a45e961acd912495fd&k=ZQJBKqZ0VN&tw=1",
    ),




  ];

  //get index => null;

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
                  onTap:(){
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => AudioPage(
                          f: musicList[index],
                        )));

                  },
                  title:musicList[index].name,
                singer:musicList[index].artist,
                cover:musicList[index].ImageUrl,


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
