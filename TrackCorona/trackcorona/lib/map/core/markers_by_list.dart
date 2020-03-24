import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:trackcorona/presentation/models/person.dart';
import 'package:trackcorona/core/map/shape_painter.dart';

class MarkersByList{

  MarkersByList();

  List<Person> personList;

  List<Marker> getMarkerListByLatLonList(personList){

    List<Marker> listOfMarker;

    for (Person everyPerson in personList) {
      listOfMarker.add(
          Marker(
            width: 0.0,
            height: 0.0,
            point: everyPerson.getLatLng(),
            builder: (ctx) => Stack(
              children: [
                CustomPaint(
                  painter: ShapesPainter(everyPerson.getPersonCondition()),
                  child: Container(
                    height: 0,
                  ),
                ),
              ],
            ),
          ),
      );
    }



    return listOfMarker;
  } // end of getMarkerListByLatLon


}