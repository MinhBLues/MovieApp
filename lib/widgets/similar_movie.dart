import 'package:MovieApp/bloc/get_similar_movie_bloc.dart';
import 'package:MovieApp/model/movie.dart';
import 'package:MovieApp/model/movie_response.dart';
import 'package:MovieApp/screens/detail_screen.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:MovieApp/style/theme.dart' as Style;

class SimilarMovies extends StatefulWidget {
  final int id;

  const SimilarMovies({Key key, this.id}) : super(key: key);

  @override
  _SimilarMoviesState createState() => _SimilarMoviesState(id);
}

class _SimilarMoviesState extends State<SimilarMovies> {
  final int id;

  _SimilarMoviesState(this.id);
  @override
  void initState() {
    super.initState();
    movieSimilarBloc..getMovies(id);
  }

  @override
  void dispose() {
    super.dispose();
    movieSimilarBloc..drainStreams();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 10.0, top: 10.0),
          child: Text("Cùng thể loại",
              style: TextStyle(
                color: Style.Colors.titleColor,
                fontWeight: FontWeight.w500,
                fontSize: 12.0,
              )),
        ),
        SizedBox(
          height: 5.0,
        ),
        StreamBuilder<MovieResponse>(
          stream: movieSimilarBloc.subject.stream,
          builder: (context, AsyncSnapshot<MovieResponse> snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data.error != null &&
                  snapshot.data.error.length > 0) {
                return _buildErrorWidget(snapshot.data.error);
              }
              return _buildMoviesWidget(snapshot.data);
            } else if (snapshot.hasError) {
              return _buildErrorWidget(snapshot.error);
            } else {
              return _buildLoadingWidget();
            }
          },
        )
      ],
    );
  }

  Widget _buildLoadingWidget() {
    return Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
          SizedBox(
              height: 25.0,
              width: 25.0,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                strokeWidth: 4.0,
              ))
        ]));
  }

  Widget _buildErrorWidget(String error) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[Text("Error occurred: $error")],
      ),
    );
  }

  Widget _buildMoviesWidget(MovieResponse data) {
    List<Movie> movies = data.movies;
    if (movies.length == 0) {
      return Container(
        // child: Text("No movies"),
      );
    } else {
      return Container(
        height: 270.0,
        padding: EdgeInsets.only(left: 10.0),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: movies.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(top: 10.0, bottom: 10.0, right: 10.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              MovieDetailScreen(movie: movies[index])));
                },
                child: Column(
                  children: <Widget>[
                    movies[index].poster == null
                        ? Container(
                            width: 120.0,
                            height: 180.0,
                            decoration: BoxDecoration(
                                color: Style.Colors.secondColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(2.0)),
                                shape: BoxShape.rectangle),
                            child: Column(children: <Widget>[
                              Icon(
                                EvaIcons.filmOutline,
                                color: Colors.white,
                                size: 50.0,
                              )
                            ]),
                          )
                        : Container(
                            width: 120.0,
                            height: 180.0,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(2.0)),
                              shape: BoxShape.rectangle,
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "https://image.tmdb.org/t/p/w200/" +
                                          movies[index].poster),
                                  fit: BoxFit.cover),
                            ),
                          ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      width: 100.0,
                      child: Text(movies[index].title,
                          maxLines: 2,
                          style: TextStyle(
                            height: 1.4,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 11.0,
                          )),
                    ),
                    SizedBox(height: 5.0),
                    Row(
                      children: <Widget>[
                        Text(
                          movies[index].rating.toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 5.0),
                        RatingBar(
                            itemSize: 8.0,
                            initialRating: movies[index].rating / 2,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                            itemBuilder: (context, _) => Icon(
                                  EvaIcons.star,
                                  color: Style.Colors.secondColor,
                                ),
                            onRatingUpdate: (rating) {
                              print(rating);
                            })
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        ),
      );
    }
  }
}
