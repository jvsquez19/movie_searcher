

class MovieModel{
  String title;
  String year;
  String imdbID;
  String poster;
  String type;

  MovieModel(this.title,this.imdbID,this.poster,this.year,this.type);

  MovieModel.fromJson(Map<String,dynamic> parsedJson){
    title = parsedJson['Title'];
    year = parsedJson['Year'];
    imdbID = parsedJson['imdbID'];
    poster = parsedJson['Poster'];
    type = parsedJson['Type'];
  }

}