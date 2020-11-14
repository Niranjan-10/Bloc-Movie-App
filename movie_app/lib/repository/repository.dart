import 'package:dio/dio.dart';
import 'package:movie_app/model/genre_response.dart';
import 'package:movie_app/model/movie_response.dart';
import 'package:movie_app/model/person_response.dart';

class MovieRepository{
  final String apiKey = "6e5c9c24ce12789bdf2e98b03654fd87";
  static String mainUrl = "https://api.themoviedb.org/3";

  final _dio = Dio();

  var getPopularUrl = "$mainUrl/movie/top_rated";
  var getMovieUrl = "$mainUrl/discover/movie";
  var getPlayingUrl = "$mainUrl/movie/now_playing";
  var getGenreUrl = "$mainUrl/genre/movie/list";
  var getPersonUrl = "$mainUrl/trending/person/week";


  Future<MovieResponse> getMovies()async{
    var params = {
      "api_key":apiKey,
      "language":"en-US",
      "page":1,

    };
    try{
      Response response = await _dio.get(getPopularUrl,queryParameters: params);
      print(response.statusCode);
      return MovieResponse.fromJson(response.data);
    }catch(error, stacktrace){
      print("Exception occuered: $error stackTrace: $stacktrace");
      return MovieResponse.withError(error);

    }
  }

    Future<MovieResponse> getPlayingMovies()async{
    var params = {
      "api_key":apiKey,
      "language":"en-US",
      "page":1,

    };
    try{
      Response response = await _dio.get(getPlayingUrl,queryParameters: params);
      print(response.data);
      return MovieResponse.fromJson(response.data);
    }catch(error, stacktrace){
      print("Exception occuered: $error stackTrace: $stacktrace");
      return MovieResponse.withError(error);

    }
  }

    Future<GenreResponse> getGenres()async{
    var params = {
      "api_key":apiKey,
      "language":"en-US",
      "page":1,

    };
    try{
      Response response = await _dio.get(getGenreUrl,queryParameters: params);
      return GenreResponse.fromJson(response.data);
    }catch(error, stacktrace){
      print("Exception occuered: $error stackTrace: $stacktrace");
      return GenreResponse.withError(error);

    }
  }

      Future<PersonResponse> getPersons()async{
    var params = {
      "api_key":apiKey

    };
    try{
      Response response = await _dio.get(getPersonUrl,queryParameters: params);
      return PersonResponse.fromJson(response.data);
    }catch(error, stacktrace){
      print("Exception occuered: $error stackTrace: $stacktrace");
      return PersonResponse.withError(error);

    }
  }

     Future<MovieResponse> getMovieByGenre(int id)async{
    var params = {
      "api_key":apiKey,
      "language":"en-US",
      "page":1,
      "with_genres":id

    };
    try{
      Response response = await _dio.get(getMovieUrl,queryParameters: params);
      return MovieResponse.fromJson(response.data);
    }catch(error, stacktrace){
      print("Exception occuered: $error stackTrace: $stacktrace");
      return MovieResponse.withError(error);

    }
  }
  

}