import 'package:flutter/material.dart';

import '../movieDataModel/movieData.dart';

class MovieListView extends StatelessWidget {

  static  List<Movie> movieList = Movie.getMovies();

    MovieListView({Key? key}) : super(key: key);

  final List movies = [
    "Avatar",
    "I Am Legend",
    "300",
    "The Avengers",
    "The Wolf of Wall Street",
    "Interstellar",
    "Game of Thrones",
    "Vikings",
    "Gotham",
    "Power",
    "Narcos",
    "Breaking Bad",
    "Doctor Strange",
    "Rogue One: A Star Wars Story",
    "Assassin's Creed",
    "Luke Cage",
  ];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Movies'),
        backgroundColor: Colors.blueGrey.shade900,
      ),
      backgroundColor: Colors.blueGrey.shade900,
      body: ListView.builder(
          itemCount: movieList.length,
          itemBuilder: (BuildContext context, index) {
          return Stack(children:<Widget> [
             movieCard(movieList[index], context),
            Positioned(
              top: 10.0,


                child: movieImage(movieList[index].images[0])),
          ]);
          }),
    );
  }
  Widget movieCard(Movie movie, BuildContext context ){
    return InkWell(
      child: Container(
        margin: EdgeInsets.only(left: 40.0),
        width: MediaQuery.of(context).size.width,
        height: 120,
        child: Card(
          color: Colors.black45,
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0 ,left: 54,right: 5),
            child: Column(

              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget> [

               Row(

                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children:<Widget> [
                   Flexible(
                     child: Text(movie.title, style: TextStyle(
                       fontWeight: FontWeight.bold,
                       fontSize: 18.0,
                       color: Colors.white,
                     ),),
                   ),
                   Text("Rating: ${movie.imdbRating }/ 10 ",style: mainTextStyle(),),
                 ],
               ),
                Row(
                  mainAxisAlignment:MainAxisAlignment.spaceBetween,
              children: [
                Text("Realeased  ${movie.imdbRating } " ,style: mainTextStyle(),),
                Text(movie.runtime,style: mainTextStyle(),),
                Text(movie.rated,style: TextStyle(

                  fontSize: 14.0,
                  color: Colors.grey,
                ),),
              ],
          )

              ]
            ),
          ),
        ),
      ),
      onTap: ()=> Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => MovieListViewDetails(
                movieName: movie.title, movie: movie,
              ))),
    );
  }
  TextStyle mainTextStyle(){
    return TextStyle(

      fontSize: 14.0,
      color: Colors.grey,
    );
  }
  // CREATING A METHOD TO RETURN THE IMAGE OF THE MOVIE
Widget movieImage( String imageURL){
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: NetworkImage(imageURL ?? 'https://www.google.com/imgres?imgurl=https%3A%2F%2Fstatic-cse.canva.com%2Fblob%2F1021650%2F1131w-jpUdye0-K50.jpg&imgrefurl=https%3A%2F%2Fwww.canva.com%2Fcreate%2Fmovie-posters%2F&tbnid=pgnq460nAzTj-M&vet=12ahUKEwj914yP9dH9AhVMsCcCHSHsASQQMygCegUIARDuAQ..i&docid=FYJwTA3jJidPCM&w=1131&h=1600&q=movie%20thumbnail&ved=2ahUKEwj914yP9dH9AhVMsCcCHSHsASQQMygCegUIARDuAQ'),
        fit: BoxFit.cover,
        )
      ),
    );
}
}

// invoke the new route
class MovieListViewDetails extends StatelessWidget {
  final String movieName;
  final Movie movie;

  const MovieListViewDetails({Key? key, required this.movieName, required this.movie})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movies  "),
        backgroundColor: Colors.blueGrey.shade900,
      ),

      body: ListView(
        children: <Widget>[
          MovieDetailsThumbNails(thumbnail: movie.images[0],)
        ],
      ),

      /*   body: Center(
        child: Container(
            child: ElevatedButton(
              child: Text("Go back  ${this.movie.director}"),
              onPressed: () {
                Navigator.pop(context);
              },
            )),
      ),...   */
    );

    
  }
  
}
class MovieDetailsThumbNails extends StatelessWidget {
  const MovieDetailsThumbNails({Key? key, required this.thumbnail}) : super(key: key);
      final String thumbnail;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children:<Widget> [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 190,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(thumbnail),
                  fit: BoxFit.cover
                ),

              ),
            ),
            Icon(Icons.play_circle_outlined,color: Colors.white, size: 100,)
          ],
        ),
A1
      ],
    );
  }
}


