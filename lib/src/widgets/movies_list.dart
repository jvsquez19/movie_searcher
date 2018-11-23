import 'package:flutter/material.dart';
import '../models/movie_model.dart';

class MoviesList extends StatelessWidget {
final List<MovieModel> images;

MoviesList(this.images);

Widget build(context) {
return ListView.builder(
  itemCount: images.length,
  itemBuilder: (context, int index) {
     return buildImage(images[index]);
  }
);
}

buildImage(MovieModel image){
  return Card(
  child: Column(
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      ListTile(
        trailing: Text(image.type),
        leading: Icon(Icons.movie),
        title: Text(image.title),
        subtitle: Text(image.year),
      ),
      Image.network(image.poster),
      

    ],
  ),
);
}


}