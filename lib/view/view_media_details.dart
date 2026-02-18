import 'package:flutter/material.dart';
import 'package:flutter_movies_app/model/media.dart';
import 'package:flutter_movies_app/model/media_details.dart';
import 'package:flutter_movies_app/services/data.dart';
import 'package:provider/provider.dart';

class ActorWidget extends StatelessWidget {
  final Actor actor;
  const ActorWidget({super.key, required this.actor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey,
            radius: 40,
            backgroundImage: actor.img.isEmpty ? null : NetworkImage(actor.img),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(actor.name),
          ),
          Text(actor.character, style: TextStyle(color: Colors.deepPurple)),
        ],
      ),
    );
  }
}

class ViewMediaDetails extends StatelessWidget {
  final Media media;

  const ViewMediaDetails({super.key, required this.media});
  @override
  Widget build(BuildContext context) {
    final Data data = context.watch<Data>();
    data.getMovieDetails(media.id, media.mediaType);
    MediaDetails? mediaDetails = data.mediaDetails;
    return Scaffold(
      appBar: AppBar(title: Text(media.name)),
      body: mediaDetails == null
          ? Center(child: CircularProgressIndicator())
          : ListView(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      height: 300,
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        image: DecorationImage(
                          fit: BoxFit.contain,
                          image: NetworkImage(mediaDetails.posteImg),
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Icon(
                                Icons.star,
                                color: Colors.orange,
                                size: 40,
                              ),
                            ),
                            Text(
                              mediaDetails.vote.toStringAsFixed(1),
                              style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(142, 130, 178, 255),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              mediaDetails.time(),
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        for (String item in mediaDetails.genres)
                          Container(
                            margin: EdgeInsets.symmetric(
                              vertical: 5,
                              horizontal: 10,
                            ),
                            padding: EdgeInsets.symmetric(
                              vertical: 2,
                              horizontal: 10,
                            ),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(120, 180, 136, 255),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Text(item, style: TextStyle(fontSize: 15)),
                          ),
                      ],
                    ),
                  ],
                ),

                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  child: Text(
                    mediaDetails.overview,
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  child: Text(
                    "Release Date \t\t${mediaDetails.releaseDate}",
                    style: TextStyle(fontSize: 18),
                  ),
                ),

                SizedBox(
                  height: 150,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: mediaDetails.actors.length,
                    itemBuilder: (context, index) {
                      return ActorWidget(actor: mediaDetails.actors[index]);
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
