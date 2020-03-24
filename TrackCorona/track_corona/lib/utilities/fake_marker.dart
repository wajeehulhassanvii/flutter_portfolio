import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:trackcorona/map/core/shape_painter.dart';
import 'package:trackcorona/presentation/models/person.dart';
import 'package:trackcorona/utilities/person_condition_enum.dart';

class FakeMarker{

  List<Marker> getFakeMarkerList(){

    List<Marker> fakeMarkerList;

    List<Person> fakePersonListDynamic=[ Person(LatLng(24.974, 66.99), PersonCondition.well ),
      Person(LatLng(24.974, 67.99), PersonCondition.symptoms ),
      Person(LatLng(25.974, 66.99), PersonCondition.infected ),
      Person(LatLng(25.974, 68.99), PersonCondition.well ),
      Person(LatLng(26.974, 62.99), PersonCondition.well ),
      Person(LatLng(27.974, 64.99), PersonCondition.symptoms ),
    ];

    for (Person everyPerson in fakePersonListDynamic){
      fakeMarkerList.add(
          Marker(
            anchorPos: AnchorPos.align(AnchorAlign.center),
            height: 30,
            width: 30,
            point: everyPerson.getLatLng(),
            builder: (ctx) => Stack(
              children: [
                CustomPaint(
                  painter: ShapesPainter(everyPerson.getPersonCondition()),
                  child: Icon(Icons.pin_drop),
                ),
              ],
            ),
          ));
    } // For loop ends for adding creating fakeMarkerList for fakePersonList

    return fakeMarkerList;
  }// method ends here


}
