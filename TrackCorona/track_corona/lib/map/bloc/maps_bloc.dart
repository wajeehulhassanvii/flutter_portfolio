import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:gps/gps.dart';
import 'maps_state.dart';
import 'package:trackcorona/utilities/person_condition_enum.dart';
import './bloc.dart';
import 'package:latlng/latlng.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MapsBloc extends Bloc<MapsEvent, MapsState> {

  List<PersonCondition> personList;
  List<Marker> markerList;

  @override
  MapsState get initialState => InitialMapsState();

  // MapEventToState Function
  @override
  Stream<MapsState> mapEventToState(
    MapsEvent event,
  ) async* {
    if (event is GetUserLocation) {
      yield* _mapGetUserLocationToState();
    } else if (event is GpsLoading){
      yield* _mapGpsLoadingToState();
    } else if (event is UserLocationLoaded) {
      yield* _mapUserLocationLoadedToState();
    }
  } // MapEventToState Method ends here

  Stream<MapsState> _mapGetUserLocationToState() async* {
    try{
      yield InitialMapsState();
      GpsLatlng gpsLatlng = await Gps.currentGps();
      print(gpsLatlng.lat);
      print(gpsLatlng.lng);
      double tempLat= double.parse(gpsLatlng.lat);
      double tempLng= double.parse(gpsLatlng.lng);
      LatLng latLng = LatLng(tempLat,tempLng);
      yield UserLocationFound(
          latLng: latLng
      );
    } on PlatformException catch (_){
      yield FailedUserLocation();
    }
  } // _mapGetUserLocationToState method ends here


  Stream<MapsState> _mapGpsLoadingToState() async* {
    yield InitialMapsState();
  } // _mapGpsLoadingToState method ends here

  Stream<MapsState> _mapUserLocationLoadedToState() async* {
    yield UserLocationLoadedFromState();
  } // _mapUserLocationLoadedToState method ends here

}
