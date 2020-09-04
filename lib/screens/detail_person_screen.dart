import 'package:MovieApp/bloc/get_person_image_bloc.dart';
import 'package:MovieApp/model/person.dart';
import 'package:MovieApp/model/person/person_image_response.dart';
import 'package:flutter/material.dart';
import 'package:MovieApp/style/theme.dart' as Style;
import 'package:sliver_fab/sliver_fab.dart';

class PersonDetailScreen extends StatefulWidget {
  final Person person;

  const PersonDetailScreen({Key key, this.person}) : super(key: key);
  @override
  _PersonDetailScreenState createState() => _PersonDetailScreenState(person);
}

class _PersonDetailScreenState extends State<PersonDetailScreen> {
  final Person person;

  _PersonDetailScreenState(this.person);
  @override
  void initState() {
    super.initState();
    // personImageBloc..getPersonImage(person.id);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.Colors.mainColor,
      body: Builder(
        builder: (context) {
          return SliverFab(
            floatingPosition: FloatingPosition(
              right: 20.0,
            ),
            // floatingWidget: StreamBuilder<PersonImageResponse>(
            //   stream: personImageBloc.subject.stream,
            //   builder: (context, AsyncSnapshot<PersonImageResponse> snapshot) {
            //     if (snapshot.hasData) {
            //       if (snapshot.data.error != null &&
            //           snapshot.data.error.length > 0) {
            //         return _buildErrorWidget(snapshot.data.error);
            //       }
            //       return _buildVideoWidget(snapshot.data);
            //     } else if (snapshot.hasError) {
            //       return _buildErrorWidget(snapshot.error);
            //     } else {
            //       return _buildLoadingWidget();
            //     }
            //   },
            // ),
            expandedHeight: 200.0,
            slivers: <Widget>[
              SliverAppBar(
                backgroundColor: Style.Colors.mainColor,
                expandedHeight: 200.0,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text(
                    movie.title.length > 40
                        ? movie.title.substring(0, 37) + "..."
                        : movie.title,
                    style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  background: Stack(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            image: DecorationImage(
                                image: NetworkImage(
                                    "https://image.tmdb.org/t/p/original/" +
                                        movie.backPoster))),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.5)),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Colors.black.withOpacity(0.5),
                              Colors.black.withOpacity(0.0),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.all(0.0),
                sliver: SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      Padding(
                        padding: EdgeInsets.only(left: 10.0, top: 20.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              movie.rating.toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            RatingBar(
                              itemSize: 8.0,
                              initialRating: movie.rating / 2,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemPadding:
                                  EdgeInsets.symmetric(horizontal: 2.0),
                              itemBuilder: (context, _) => Icon(
                                EvaIcons.star,
                                color: Style.Colors.secondColor,
                              ),
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10.0, top: 20.0),
                        child: Text(
                          "Nội dung phim",
                          style: TextStyle(
                            color: Style.Colors.titleColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 12.0,
                          ),
                        ),
                      ),
                      SizedBox(height: 5.0),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Center(
                          child: Text(
                            movie.overview,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13.0,
                              height: 1.5,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      MovieInfo(
                        id: movie.id,
                      ),
                      Casts(id: movie.id),
                      SimilarMovies(id: movie.id),
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
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

  // Widget _buildVideoWidget(VideoResponse response) {
  //   List<Video> video = response.videos;
  //   return FloatingActionButton(
  //     backgroundColor: Style.Colors.secondColor,
  //     child: Icon(Icons.play_arrow),
  //     onPressed: () {
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(
  //           builder: (context) => VideoPlayerScreen(
  //             controller: YoutubePlayerController(
  //               initialVideoId: video[0].key,
  //               flags: YoutubePlayerFlags(
  //                 autoPlay: true,
  //               ),
  //             ),
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }
}
