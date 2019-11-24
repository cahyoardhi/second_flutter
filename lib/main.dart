import 'package:app_movies/data/api_provider.dart';
import 'package:app_movies/model/popular_movies.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';


/* Author : Gagah GK
  Co-Author : Cahyo Ardhi Copas Doang
*/
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

  class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

ApiProvider provider = ApiProvider();
Future<PopularMovies> popularMovies;
@override
  void initState() {
    
    popularMovies = provider.getPopularMovies();
    super.initState();
  }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Row(
            children: <Widget>[
              Icon(Icons.theaters),
              SizedBox(
                width: 5,
              ),
              Text('NoMovie'),
            ],
          ),
        ),
        body: FutureBuilder(  //metode untuk loading
          future: popularMovies,
          builder: (BuildContext context , AsyncSnapshot snapshot)  {
            if (snapshot.hasData){
              print('Has Data : {$snapshot.hasData}');
              return moviesItem();
            }
            else if (snapshot.hasError){
              print('Has Data : {$snapshot.hasError}');
              return Text('Error !!!');
            }
            else {  //kalau masih loading
              print('Lagi Loading');
              return CircularProgressIndicator();
            }
          }
        ),
      );
    }

    Container moviesItem() {
      return Container(
        child: Card(
          margin: EdgeInsets.all(10),
          child: Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,   //crossaxis soalnya di row pengen pindahin sumbu y biar ketengah
              children: <Widget>[
                Container(
                  width: 100,
                  child: CachedNetworkImage(
                    imageUrl: 'https://image.tmdb.org/t/p/w600_and_h900_bestv2/hj8pyoNnynGeJTAbl7jcLZO8Uhx.jpg',
                  ),
                ),
                SizedBox(       //Pake SizedBox soalnya di Row
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
                      Text('Midway', 
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
                            size: 12,
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
                            Icons.star_border,
                            size: 12,
                          ),
                          SizedBox(
                            width: 5, //Jarak Icon sama Text Rating
                            ),
                          Text('9.2'),
                        ],
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