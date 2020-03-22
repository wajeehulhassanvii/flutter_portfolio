import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:trackcorona/utilities/markers_by_list.dart';
import 'package:trackcorona/utilities/person.dart';
import 'package:trackcorona/utilities/person_condition_enum.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Track Corona',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    // Fake Person List For Testing
    List<Person> fakePersonList;
    fakePersonList = [Person(LatLng(51.5,-0.09), PersonCondition.symptoms),
      Person(LatLng(52,-0.09), PersonCondition.infected),
      Person(LatLng(53,-1.09), PersonCondition.well),
      Person(LatLng(50,-2.09), PersonCondition.well)];

    // MarketList class for getting converting person into marker
    MarkersByList markerByList= MarkersByList();

    List<Marker> markerByLatLngList;
    setState(() {
      markerByLatLngList= markerByList.getMarkerListByLatLonList(fakePersonList);
    });

    return FlutterMap(
      options: MapOptions(
        center: LatLng(51.5, -0.09),
        zoom: 13.0,
      ),
      layers: [
        TileLayerOptions(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: ['a', 'b', 'c']),
        MarkerLayerOptions(
          markers:
          markerByLatLngList,
        ),
      ],
    );
  }
}
