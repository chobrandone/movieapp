

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../movieDataModel/movieData.dart';

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
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [Color(0x00f5f5),Color(0xfff5f5f5)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter
              )
          ),
          height: 80,
        )

      ],
    );
  }
}
class MovieDetailsHeaderWithPoster extends StatelessWidget {
  const MovieDetailsHeaderWithPoster({Key? key, required this.movie}) : super(key: key);
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          MoviePoster( poster: movie.images[0].toString()),
          SizedBox(width: 16,),
          Expanded(child: MovieDetailsHeader(movie: movie))
        ],

      ),
    );
  }
}

class MovieDetailsHeader extends StatelessWidget {
  const MovieDetailsHeader({Key? key, required this.movie}) : super(key: key);
  final Movie movie;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("${movie.year} . ${movie.genre}" .toUpperCase(),
          style: TextStyle(
              fontWeight: FontWeight.w400,
              color: Colors.cyan
          ),
        ),
        Text(movie.title, style: TextStyle(fontWeight: FontWeight.w500,fontSize: 32),),
        Text.rich(TextSpan(style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),

            children: <TextSpan>[
              TextSpan(
                text: movie.plot,
              ) , TextSpan(
                  text: "more ....",
                  style: TextStyle(color: Colors.indigo)
              )
            ]
        )

        )
      ],

    );
  }
}

class MoviePoster extends StatelessWidget {
  const MoviePoster({Key? key, required this.poster}) : super(key: key);
  final String poster;
  @override
  Widget build(BuildContext context) {
    var borderRadius = BorderRadius.all(Radius.circular(10));
    return  Card(
        child: ClipRRect(
          borderRadius: borderRadius,
          child: Container(
            width: MediaQuery.of(context).size.width/4,
            height: 160,
            decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage(poster),
                  fit: BoxFit.cover),


            ),

          ),
        )
    );
  }
}
class MovieDetailsCast extends StatelessWidget {
  const MovieDetailsCast({Key? key, required this.movie}) : super(key: key);
  final Movie movie;
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: <Widget>[
          MovieField(field : "cast",value : movie.actors),
          SizedBox(height: 5,),
          MovieField(field: "Directors", value : movie.director)

        ],
      ),
    );
  }
}
class MovieField extends StatelessWidget {
  const MovieField({Key? key, required this.field, required this.value}) : super(key: key);
  final String field;
  final String value;
  @override
  Widget build(BuildContext context) {
    return  Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:<Widget> [
        Text("$field:", style: TextStyle(
            color: Colors.black38,
            fontSize: 12,fontWeight: FontWeight.w300
        ),),

        Expanded(
          child: Text(value ,style: TextStyle(
              color: Colors.black38,
              fontSize: 12,fontWeight: FontWeight.w300
          ),),
        )
      ],
    );
  }
}
class HorizontalLine extends StatelessWidget {
  const HorizontalLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: Container(
        height: 0.5,
        color: Colors.grey,
      ),
    );
  }
}
class MovieDetailsExtraPoster extends StatelessWidget {
  const MovieDetailsExtraPoster({Key? key, required this.posters}) : super(key: key);
  final List<String> posters;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text("More Movie Poster".toUpperCase(),
            style: TextStyle(
              fontSize: 14, color: Colors.black26,
            ),



          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Container(
            height: 150,
            padding: EdgeInsets.symmetric(vertical: 10),
            child: ListView.separated(
              scrollDirection: Axis.horizontal,

              separatorBuilder: (context, index) => SizedBox(width: 8,),
              itemCount: posters.length,
              itemBuilder: (context ,index) => ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: Container(
                  width: MediaQuery.of(context).size.width/4,
                  height: 160,
                  decoration: BoxDecoration(
                      image: DecorationImage(image: NetworkImage(posters[index]),
                          fit: BoxFit.cover)
                  ),
                ),
              ),

            ),

          ),
        )

      ],
    );
  }
}

