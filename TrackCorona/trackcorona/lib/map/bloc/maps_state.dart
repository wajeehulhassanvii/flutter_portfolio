import 'package:equatable/equatable.dart';
import 'package:gps/gps.dart';
import 'package:latlong/latlong.dart';
import 'package:meta/meta.dart';
import 'package:trackcorona/utilities/person_condition_enum.dart';

abstract class MapsState extends Equatable {
  const MapsState();
}

class InitialMapsState extends MapsState {
  @override
  List<Object> get props => [];
} // Initial Maps State ends here


class ClosePersonListFound extends MapsState {

  final List<PersonCondition> personList;
  ClosePersonListFound({@required this.personList});

  @override
  String toString() {
    return 'FakePersonLocation ${personList.toString()} ';
  }

  @override
  // TODO: implement props
  List<Object> get props => [personList];
} // ClosePersonListFound class ends here


class UserLocationFound extends MapsState {

  final GpsLatlng latLng;
  UserLocationFound({@required this.latLng});

  @override
  String toString() {
    return 'UserLocationFound ${latLng.toString()} ';
  }

  @override
  // TODO: implement props
  List<Object> get props => [latLng];
} // UserLocationFound class ends here


class FailedUserLocation extends MapsState{
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class UserLocationLoadedFromState extends MapsState{
  @override
  // TODO: implement props
  List<Object> get props => [];
}
