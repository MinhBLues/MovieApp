import 'package:MovieApp/bloc/get_person_external_bloc.dart';
import 'package:MovieApp/model/person/person_external.dart';
import 'package:MovieApp/model/person/person_external_response.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants.dart';

class External extends StatefulWidget {
  final int id;

  const External({Key key, this.id}) : super(key: key);
  @override
  _ExternalState createState() => _ExternalState(id);
}

class _ExternalState extends State<External> {
  final int id;

  _ExternalState(this.id);

  @override
  void initState() {
    super.initState();
    personExternalBloc..getPersonExternal(id);
  }

  @override
  void dispose() {
    super.dispose();
    personExternalBloc..drainStreams();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<PersonExternalResponse>(
      stream: personExternalBloc.subject.stream,
      builder: (context, AsyncSnapshot<PersonExternalResponse> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.error != null && snapshot.data.error.length > 0) {
            return _buildErrorWidget(snapshot.data.error);
          }
          return _buildExternalWidget(snapshot.data);
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

  Widget _buildExternalWidget(PersonExternalResponse data) {
    PersonExternal personExternal = data.personExternal;
    return Container(
      child: Column(
        children: <Widget>[
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
                  onPressed: () => {
                        _launchSocial(
                            'https://www.facebook.com/${personExternal.instagramId}/',
                            '')
                      }),
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
                    onPressed: () => {
                          _launchSocial(
                              'https://www.instagram.com/${personExternal.instagramId}/',
                              '')
                        }),
              ),
            ),
          ),
        ],
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

void _launchSocial(String url, String fallbackUrl) async {
  // Don't use canLaunch because of fbProtocolUrl (fb://)
  try {
    bool launched =
        await launch(url, forceSafariVC: false, forceWebView: false);
    if (!launched) {
      await launch(fallbackUrl, forceSafariVC: false, forceWebView: false);
    }
  } catch (e) {
    await launch(fallbackUrl, forceSafariVC: false, forceWebView: false);
  }
}
