// Import flutter library
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import './models/movie_model.dart';
import 'dart:convert';
import './widgets/movies_list.dart';
// Create a class that will be our custom widget
// extend StateLess Widget base class.

class App extends StatefulWidget {
  createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  String searchValue = "";
  List<MovieModel> movies = [];
  void fetchMovies() async {
    movies.clear();
    final response = await get('http://www.omdbapi.com/?s=$searchValue&apikey=2eba0a3b');
    final decodedArray = json.decode(response.body);
    if(decodedArray['Response'] == 'True'){
      List found = decodedArray["Search"] as List;
      setState(() {
        found.map((dynamic element){
        movies.add(MovieModel.fromJson(element));
      }).toList();
      });
    }
  }

  // Must define a 'build method that returns '
// the widgets that *this* widget will show abstract
  Widget build(context) {
    return MaterialApp(
        home: Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(children: <Widget>[
          Expanded(child: TextField(
          autofocus: true,
          autocorrect: true,
          textAlign:TextAlign.center,
          onChanged: (String value){searchValue = value;},
          )
          ,),
          IconButton(icon: Icon(Icons.search),onPressed: (){fetchMovies();},)
          ],),
          Expanded(
          child: MoviesList(movies)
          )

        ],
      ),
      appBar: AppBar(
        title: Text("Let's see some movies"),

      ),
    ));
  }
}
