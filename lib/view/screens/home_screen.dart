import 'package:flutter/material.dart';

import '../../utils/Secrets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  //const HomeScreen(Key? key) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(child: body())
      ),
    );
  }

  Widget body() {
    const categoryHeaderStyle = TextStyle(color: Colors.deepOrange,fontSize: 20);
    return Padding(
      padding: const EdgeInsets.only(top:10,left: 7,right: 7),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          header(),
          const SizedBox(height: 10,),
          Text("Latest",style: categoryHeaderStyle,),
          SizedBox(height: 270, child: movies()),
          Text("Porpular",style: categoryHeaderStyle,),
          SizedBox(height: 270, child: movies()),
          Text("Favourites",style: categoryHeaderStyle,),
          SizedBox(height: 270, child: movies()),
        ],
      )
    );
  }

  Widget header(){
    //Improve this header
    String title = 'Movvvies';
    double iconSize = 30;
    Color iconColor = Colors.white;

    return Row(
      children: [
        Text(title,
          style: TextStyle(fontSize: 30,color: iconColor),
          textAlign: TextAlign.left,
        ),
        const Spacer(),
        Row(
          children: [
            Icon(Icons.cast,color: iconColor,size: iconSize),
            SizedBox(width: 10,),
            //Trying out Icons like this
            Text(
              String.fromCharCode(Icons.search_outlined.codePoint),
              style: TextStyle(
                inherit: false,
                color: Colors.white,
                fontSize: iconSize,
                fontWeight: FontWeight.w100,
                fontFamily: Icons.search_outlined.fontFamily,
                package: Icons.search_outlined.fontPackage,
              ),
            )
          ],
        )
      ]
    );
  }

  Widget movies(){
    List<Widget> movies = [];
    for(int i = 0; i<10; i++){
      movies.add(movieCard("Random movie name even tho i dont ${i}",true));
    }

    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: ListView.separated(
          itemBuilder: (context,index){
            return movies[index];
          },
          separatorBuilder: (context, index) => SizedBox(width: 10,),
          itemCount: movies.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }

  Widget movieCard(String title,bool movie){
    const textStyle = TextStyle(color: Colors.white,fontSize: 17,
        overflow: TextOverflow.ellipsis);

    return SizedBox(
      width: 150,
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(movie ? 'https://api.lorem.space/image/movie?w=150&h=220'
                  : "https://api.lorem.space/image/face?w=150&h=150")
          ),
          Text(title,style: textStyle,textAlign: TextAlign.left,),
          Row(
            children: [
              Text("5.4",style: TextStyle(color: Colors.white70),),
              SizedBox(width: 5,),
              Icon(Icons.star,size: 15,color: Colors.white54,)
            ],
          )
        ],
      ),
    );
  }

}
