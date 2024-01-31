import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:developer' as dev;
import 'package:http/http.dart' as http;
import 'package:movvvies/utils/secrets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  //const HomeScreen(Key? key) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // Test zone
    testApiCallWithAccessTokenAuth();
    fetchingMovies();

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
          SizedBox(height: 250, child: movies()),
          Text("Porpular",style: categoryHeaderStyle,),
          SizedBox(height: 250, child: movies()),
          Text("Favourites",style: categoryHeaderStyle,),
          SizedBox(height: 250, child: movies()),
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
      width: 130,
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(movie ? 'https://api.lorem.space/image/movie?w=150&h=220'
                  : "https://api.lorem.space/image/face?w=130&h=130")
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

  testApiCallWithAccessTokenAuth() async{
    dev.log('Fetching data with Access Token Auth ...');
    Uri uri = Uri.parse('https://api.themoviedb.org/3/authentication');
    final response = await http.get(
        uri,
        headers: {
          HttpHeaders.authorizationHeader : 'Bearer ${Secrets.accessTokenAuth}',
          HttpHeaders.acceptHeader : 'application/json',
        }
    );
    if(response.statusCode == 200){
      dev.log(response.body.toString());
    }else{
      throw Exception('Failed to fetch data with Access Token Auth');
    }
  }

 fetchingMovies() async {
    dev.log('Fetching data with API key ...');
    final response = await http.get(
        Uri.parse('https://api.themoviedb.org/3/movie/popular?language=en-US&page=1'),
        headers: {
          HttpHeaders.authorizationHeader : 'Bearer ${Secrets.accessTokenAuth}',
          HttpHeaders.acceptHeader : 'application/json',
        }
    );
    if(response.statusCode == 200){
      dev.log('Success');
      dev.log(response.body.toString());
    }else{
      throw Exception('Failed to fetch data with API Key');
    }

  }
}
