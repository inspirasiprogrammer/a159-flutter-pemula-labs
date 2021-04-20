import 'package:flutter/material.dart';
import 'package:wisatabandung/detail_screen.dart';
import 'package:wisatabandung/model/tourism_place.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  TourismPlace selectedPlace;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        // print(constraints.maxWidth);
        // if (constraints.maxWidth > 800) {
        //   return Row(
        //     children: [
        //       SizedBox(
        //         child: TourismPlaceList(
        //           onItemClick: (TourismPlace place) {
        //             setState(() {
        //               selectedPlace = place;
        //             });
        //           },
        //         ),
        //         width: 400,
        //       ),
        //       Expanded(
        //         child: selectedPlace == null
        //             ? Material(
        //                 child: Center(
        //                   child: Text('Select one place'),
        //                 ),
        //               )
        //             : DetailScreen(
        //                 place: selectedPlace,
        //                 onBackPressed: () {
        //                   setState(() {
        //                     selectedPlace = null;
        //                   });
        //                 },
        //               ),
        //       ),
        //     ],
        //   );
        // } else {
        return TourismPlaceList(
          onItemClick: (TourismPlace place) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return DetailScreen(
                    place: place,
                  );
                },
              ),
            );
          },
        );
        // }
      },
    );
  }
}

class TourismPlaceList extends StatelessWidget {
  final Function(TourismPlace place) onItemClick;

  const TourismPlaceList({@required this.onItemClick});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bandung Wisata'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
            children: tourismPlaceList.map((place) {
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DetailScreen(
                  place: place,
                );
              }));
            },
            child: Card(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Image.asset(
                      place.imageAsset,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            place.name,
                            style: TextStyle(fontSize: 16.0),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(place.location),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        }).toList()),
      ),
    );
  }
}
