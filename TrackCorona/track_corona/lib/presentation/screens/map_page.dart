import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:latlong/latlong.dart';
import 'package:trackcorona/map/bloc/maps_bloc.dart';
import 'package:trackcorona/map/core/shape_painter.dart';
import 'package:trackcorona/presentation/models/person.dart';
import 'package:trackcorona/utilities/fake_marker.dart';
import 'package:trackcorona/utilities/person_condition_enum.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {

  List<Marker> markers;
  int pointIndex;
  List points = [
    LatLng(51.5, -0.09),
    LatLng(49.8566, 3.3522),
  ];
  List<Person> fakePersonList;
  List<Marker> fakeMarkerList;

  // Create Maps Bloc
  MapsBloc _mapsBloc;

  @override
  void initState() {

    // instantiate MapsBloc
    _mapsBloc = MapsBloc();


    pointIndex = 0;
    markers = [
      Marker(
        anchorPos: AnchorPos.align(AnchorAlign.center),
        height: 30,
        width: 30,
        point: points[pointIndex],
        builder: (ctx) => Stack(
          children: [
            CustomPaint(
              painter: ShapesPainter(PersonCondition.well),
              child: Container(
                height: 0,
              ),
            ),
          ],
        ),
      ),
      Marker(
        anchorPos: AnchorPos.align(AnchorAlign.center),
        height: 30,
        width: 30,
        point: LatLng(53.3498, -6.2603),
        builder: (ctx) => Stack(
          children: [
            CustomPaint(
              painter: ShapesPainter(PersonCondition.well),
              child: Container(
                height: 0,
              ),
            ),
          ],
        ),
      ),
      Marker(
        anchorPos: AnchorPos.align(AnchorAlign.center),
        height: 30,
        width: 30,
        point: LatLng(53.3488, -6.2613),
        builder: (ctx) => Stack(
          children: [
            CustomPaint(
              painter: ShapesPainter(PersonCondition.well),
              child: Container(
                height: 0,
              ),
            ),
          ],
        ),
      ),
      Marker(
        anchorPos: AnchorPos.align(AnchorAlign.center),
        height: 30,
        width: 30,
        point: LatLng(53.3488, -6.2613),
        builder: (ctx) => Icon(Icons.pin_drop),
      ),
      Marker(
        anchorPos: AnchorPos.align(AnchorAlign.center),
        height: 30,
        width: 30,
        point: LatLng(48.8566, 2.3522),
        builder: (ctx) => Icon(Icons.pin_drop),
      ),
      Marker(
        anchorPos: AnchorPos.align(AnchorAlign.center),
        height: 30,
        width: 30,
        point: LatLng(49.8566, 3.3522),
        builder: (ctx) => Icon(Icons.pin_drop),
      ),
    ];; // list ends


    super.initState();

  } // ENDS initState

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => MapsBloc(),
      child: Scaffold(
        floatingActionButton: null,
        body: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width * 1,
              height: MediaQuery.of(context).size.height*0.70,
              padding: EdgeInsets.all(3.0),
              margin: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueAccent)
              ),
              child: FlutterMap(
                options: MapOptions(
                  center: points[0],
                  zoom: 5,
                  plugins: [
                    MarkerClusterPlugin(),
                  ],
                ),
                layers: [
                  TileLayerOptions(
                    urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                    subdomains: ['a', 'b', 'c'],
                  ),
                  MarkerClusterLayerOptions(
                    maxClusterRadius: 120,
                    size: Size(40, 40),
                    anchor: AnchorPos.align(AnchorAlign.center),
                    fitBoundsOptions: FitBoundsOptions(
                      padding: EdgeInsets.all(50),
                    ),
                    markers: markers,
                    polygonOptions: PolygonOptions(
                        borderColor: Colors.blueAccent,
                        color: Colors.black12,
                        borderStrokeWidth: 3),
                    builder: (context, markers) {
                      return FloatingActionButton(
                        child: Text(markers.length.toString()),
                        onPressed: null,
                      );
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            CustomRadioButton(
              buttonColor: Theme.of(context).canvasColor,
              buttonLables: ['Well', 'Symptoms','Infected'],
              buttonValues: ['Well', 'Symptoms','Infected'],
              radioButtonValue: (value) => // TODO on click, change the color of the marker
              print(value),
              selectedColor: Theme.of(context).accentColor,
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ButtonTheme(
                  minWidth: MediaQuery.of(context).size.width * 0.45,
                  height: 50,
                  child: RaisedButton(
                    onPressed: () {
                      print('clicked Toggle On/Off');},
                    child: Text("Toggle On/Off"),
                  ),
                ),
                ButtonTheme(
                  minWidth: MediaQuery.of(context).size.width * 0.45,
                  height: 50,
                  child: RaisedButton(
                    onPressed: () {
                      print('clicked update status');
                    },
                    child: Text("Update Status"),

                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}