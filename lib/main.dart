import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

void main() => runApp(MoviesApp());

class MoviesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NoMovie',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NoMovie'),
      ),
      body: Card(
        margin: EdgeInsets.all(10),
        child: Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment
                .start, //crossaxis soalnya di row pengen pindahin sumbu y biar ketengah
            children: <Widget>[
              Container(
                width: 100,
                child: CachedNetworkImage(
                  imageUrl:
                      'https://image.tmdb.org/t/p/w600_and_h900_bestv2/hj8pyoNnynGeJTAbl7jcLZO8Uhx.jpg',
                ),
              ),
              SizedBox(
                //Pake SizedBox soalnya di Row
                width: 10,
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 20,
                ),
                //color: Colors.lightBlueAccent,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      'Midway',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.calendar_today,
                          size: 15,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text('12-12-2020'),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.star,
                          size: 15,
                        ),
                        Text('9.2'),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
