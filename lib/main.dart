import 'package:second_flutter/data/api_provider.dart';
import 'package:second_flutter/model/popular_movies.dart';
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

String imageBaseUrl = 'https://image.tmdb.org/t/p/w500'; //sementara

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
              return ListView.builder(
                itemCount   : snapshot.data.results.length,       //Banyak Film
                itemBuilder : (BuildContext context,int index){   //Looping sebanyak index -> banyak film
                  return moviesItem(
                    poster: '$imageBaseUrl${snapshot.data.results[index].posterPath}',
                    title: '${snapshot.data.results[index].title}',
                    date: '${snapshot.data.results[index].releaseDate}',
                    voteAverage: '${snapshot.data.results[index].voteAverage}',
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context)=>MovieDetail(
                            movie: snapshot.data.results[index] //bawa index movie yang di tap
                          ) //MaterialPageRoute
                        )
                      ); //layering halaman baru makanya di push
                    }
                  );
                },
              );
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

    Widget moviesItem({
      String poster, 
      String title, 
      String date,
      String voteAverage,
      Function onTap}) {  //biar movie nya bisa di tap
      return InkWell(
        onTap:onTap,
              child: Container(
          child: Card(
            margin: EdgeInsets.all(10),
            child: Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,   //crossaxis soalnya di row pengen pindahin sumbu y biar ketengah
                children: <Widget>[
                  Container(
                    width: 100,
                    child: CachedNetworkImage(
                      imageUrl: poster,
                    ),
                  ),
                  SizedBox(       //Pake SizedBox soalnya di Row
                    width: 10,
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(
                        top: 20,
                      ),
                      //color: Colors.lightBlueAccent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(title, 
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
                              Text(date),
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
                              Text(voteAverage),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    }
}

class MovieDetail extends StatelessWidget {

  final Results movie; //variable konstan

  const MovieDetail({Key key, this.movie}) : super(key: key); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(    //Return untuk halaman baru pake scaffold
      appBar: AppBar(
        title: Text(movie.title),
      ),
      body: Container(
        child: Text(movie.overview),
      ),
    );
  }
}