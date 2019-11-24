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
            children: <Widget>[
              Container(
                width: 100,
                child: CachedNetworkImage(
                  imageUrl:
                      'https://image.tmdb.org/t/p/w600_and_h900_bestv2/hj8pyoNnynGeJTAbl7jcLZO8Uhx.jpg',
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                color: Colors.lightGreen,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text('Midway'),
                    Text('12-12-2020'),
                    Text('9.2'),
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
