import 'package:flutter/material.dart';

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
    final infoTextStyle = TextStyle(color: Colors.white,fontSize: 30);
    return Padding(
      padding: const EdgeInsets.only(top:10,left: 5,right: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          header(),
          const SizedBox(height: 10,),
          Text("Popular",style: infoTextStyle,),
          SizedBox(height: 250, child: movies()),
          Text("Actor",style: infoTextStyle,),
          SizedBox(height: 250, child: actors()),

        ],
      )
    );
  }

  Widget header(){
    String title = '¡Buenos días!';
    double iconSize = 30;
    Color iconColor = Colors.white;
    return Row(
      //mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(title,
          style: TextStyle(fontSize: 30,color: iconColor),
          textAlign: TextAlign.left,
        ),
        const Spacer(),
        Row(
          children: [
            Icon(Icons.new_releases_outlined,color: iconColor,size: iconSize,),
            //const SizedBox(width: 10,),
            //Icon(Icons.settings,color: iconColor,size: iconSize,)
          ],
        )
      ]
    );
  }

  Widget movies(){
    List<Widget> movies = [];
    for(int i = 0; i<10; i++){
      movies.add(movieCard("Movie ${i}",true));
    }

    return ListView.separated(
        itemBuilder: (context,index){
          return movies[index];
        },
        separatorBuilder: (context, index) => SizedBox(width: 10,),
        itemCount: movies.length,
      scrollDirection: Axis.horizontal,
    );
  }

  Widget actors(){
    List<Widget> movies = [];
    for(int i = 0; i<10; i++){
      movies.add(movieCard("Damián Suarez",false));
    }

    return ListView.separated(
      itemBuilder: (context,index){
        return movies[index];
      },
      separatorBuilder: (context, index) => SizedBox(width: 10,),
      itemCount: movies.length,
      scrollDirection: Axis.horizontal,
    );
  }

  Widget movieCard(String title,bool movie){
    final textStyle = TextStyle(color: Colors.white,fontSize: 20);

    return Column(
      children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(movie ? 'https://api.lorem.space/image/movie?w=150&h=220'
                : "https://api.lorem.space/image/face?w=150&h=150")
        ),
        Text(title,style: textStyle,)
      ],
    );
  }

}
