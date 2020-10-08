import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Movie{
  String title, description, image;
  double rating;
  Movie(this.title, this.description, this.image, this.rating);

}

List<Movie> movies = [
  Movie('Parasite', 'Drama', 'm1.jpg', 3.9),
  Movie('Advangers', "Action", 'm2.jpg', 3.4),
  Movie("Batman", "Action", 'm3.jpg', 4.0),
  Movie('Joker', 'Deama', 'm4.jpg', 4.4)
];


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Movies List')),
            body: ListView.builder(
              itemCount: movies.length,
              itemBuilder: (BuildContext context, int index){
                return MovieItem(
                  image: movies[index].image,
                  title: movies[index].title,
                  description: movies[index].description,
                  rating: movies[index].rating);
              },
            ),
      ),

    );
  }
}

class MovieItem extends StatelessWidget{
  final String image;
  final String title;
  final String description;
  final double rating;

  MovieItem({@required this.image, this.title, this.description, this.rating});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      height: 140,
      child: Card(
        child: Row(
          children: [
            Image.asset('assets/imgs/' + this.image),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(this.title, style: TextStyle(fontWeight: FontWeight.bold),),
                    Text(this.description),
                    Container(
                      alignment: Alignment.centerRight,
                      child:Text('Rating:' + this.rating.toString()) ,
                    )

                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );

  }

}
