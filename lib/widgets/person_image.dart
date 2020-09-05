import 'package:MovieApp/bloc/get_person_image_bloc.dart';
import 'package:MovieApp/model/person/person_image.dart';
import 'package:MovieApp/model/person/person_image_response.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants.dart';

class PersonImageScreen extends StatefulWidget {
  final int id;
  const PersonImageScreen({Key key, @required this.id}) : super(key: key);
  @override
  _PersonImageState createState() => _PersonImageState(id);
}

class _PersonImageState extends State<PersonImageScreen> {
  final int id;

  _PersonImageState(this.id);

  @override
  void initState() {
    super.initState();
    personImageBloc..getPersonImage(id);
  }

  @override
  void dispose() {
    super.dispose();
    personImageBloc..drainStreams();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<PersonImageResponse>(
      stream: personImageBloc.subject.stream,
      builder: (context, AsyncSnapshot<PersonImageResponse> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.error != null && snapshot.data.error.length > 0) {
            return _buildErrorWidget(snapshot.data.error);
          }
          return _buildImageWidget(snapshot.data);
        } else if (snapshot.hasError) {
          return _buildErrorWidget(snapshot.error);
        } else {
          return _buildLoadingWidget();
        }
      },
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

  Widget _buildImageWidget(PersonImageResponse response) {
    PersonImage images = response.personImage;
    return Container(
      child: SafeArea(
        bottom: false,
        child: Column(
          children: <Widget>[
            Container(
              height: 550,
              padding: EdgeInsets.only(left: 32.0),
              child: Swiper(
                autoplay: true,
                itemCount: images.images.length,
                itemWidth: MediaQuery.of(context).size.width - 2 * 64,
                layout: SwiperLayout.STACK,
                pagination: SwiperPagination(
                  builder: DotSwiperPaginationBuilder(
                    activeSize: 15.0,
                    color: Colors.white24,
                    activeColor: Colors.white,
                  ),
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                    child: Stack(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            SizedBox(height: 30.0),
                            Container(
                              height: 470,
                              width: 300,
                              child: Card(
                                elevation: 8.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(28.0),
                                ),
                                color: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 24.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      SizedBox(height: 345.0),
                                      Container(
                                        height: 50,
                                        width: 60,
                                        child: Center(
                                          child: IconButton(
                                              icon: Icon(
                                                FontAwesomeIcons.facebookSquare,
                                                size: 35,
                                                color: facebook,
                                              ),
                                              onPressed: () => {print("ss")}),
                                        ),
                                      ),
                                      Container(
                                        height: 50,
                                        width: 60,
                                        child: Center(
                                          child: RadiantGradientMask(
                                            child: IconButton(
                                                icon: Icon(
                                                  FontAwesomeIcons.instagram,
                                                  size: 35,
                                                  color: Colors.white,
                                                ),
                                                onPressed: () => {print("ss")}),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          bottom: 40.0,
                          right: 30.0,
                          child: Text(
                            index.toString(),
                            style: position,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 47.0, left: 16.0),
                          width: 200.0,
                          height: 320.0,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(28.0)),
                            shape: BoxShape.rectangle,
                            image: DecorationImage(
                                image: NetworkImage(
                                    "https://image.tmdb.org/t/p/original/" +
                                        images.images[index]),
                                fit: BoxFit.cover),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RadiantGradientMask extends StatelessWidget {
  RadiantGradientMask({this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return RadialGradient(
          center: Alignment.topLeft,
          // radius: 0.5,
          colors: <Color>[
            gradientInsStartColor,
            gradientInsFirstColor,
            gradientInsSecondColor,
            gradientInsThirdColor,
            gradientInsFourthColor,
            gradientInsFivethColor,
            gradientInsSixthColor,
            gradientInsSeventhColor,
            gradientInsEightthColor,
            gradientInsEndColor
          ],
          tileMode: TileMode.mirror,
        ).createShader(bounds);
      },
      child: child,
    );
  }
}
