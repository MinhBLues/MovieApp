import 'package:MovieApp/bloc/get_person_detail_bloc.dart';
import 'package:MovieApp/model/person.dart';
import 'package:MovieApp/model/person_detail_responese.dart';
import 'package:MovieApp/model/person_response.dart';
import 'package:MovieApp/widgets/person_image.dart';
import 'package:flutter/material.dart';
import 'package:MovieApp/style/theme.dart' as Style;
import 'package:sliver_fab/sliver_fab.dart';

import '../constants.dart';

class PersonDetailScreen extends StatefulWidget {
  final int id;

  const PersonDetailScreen({Key key, this.id}) : super(key: key);
  @override
  _PersonDetailScreenState createState() => _PersonDetailScreenState(id);
}

class _PersonDetailScreenState extends State<PersonDetailScreen> {
  final int id;

  _PersonDetailScreenState(this.id);
  @override
  void initState() {
    super.initState();
    personDetailBloc..getPersonDetail(id);
  }
  @override
  void dispose() {
    super.dispose();
    personDetailBloc..drainStreams();
  }
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<PersonDetailResponse>(
      stream: personDetailBloc.subject.stream,
      builder: (context, AsyncSnapshot<PersonDetailResponse> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.error != null && snapshot.data.error.length > 0) {
            return _buildErrorWidget(snapshot.data.error);
          }
          return _buildPersonDetailWidget(snapshot.data);
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

  Widget _buildPersonDetailWidget(PersonDetailResponse response) {
    final Person person = response.person;
    return Scaffold(
      backgroundColor: Style.Colors.mainColor,
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  person.name,
                  style: TextStyle(
                    fontFamily: 'Gilroy',
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          PersonImageScreen(id: person.id),
          SizedBox(height: 10.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 10.0, right: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Ngày sinh",
                          style: TextStyle(
                            color: Style.Colors.titleColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 12.0,
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          person.birthDate ?? person.birthDate.toString(),
                          style: TextStyle(
                            color: Style.Colors.secondColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 12.0,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Nghề nghiệp",
                          style: TextStyle(
                            color: Style.Colors.titleColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 12.0,
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          person.known,
                          style: TextStyle(
                            color: Style.Colors.secondColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 12.0,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Giới tính",
                          style: TextStyle(
                            color: Style.Colors.titleColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 12.0,
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          person.gender == 2 ? "Nam" : "Nữ",
                          style: TextStyle(
                            color: Style.Colors.secondColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 12.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Tiểu sử",
                      style: TextStyle(
                        color: Style.Colors.titleColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 12.0,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5.0),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Center(
                  child: Text(
                    person.biography ?? person.biography.toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13.0,
                      height: 1.5,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Một số phim đã tham gia",
                      style: TextStyle(
                        color: Style.Colors.titleColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 12.0,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
