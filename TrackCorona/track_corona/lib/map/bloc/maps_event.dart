import 'package:equatable/equatable.dart';

abstract class MapsEvent extends Equatable {
  const MapsEvent();

  @override
  List<Object> get props => [];
} // abstract class MapsEvents ends here

class GetUserLocation extends MapsEvent{}

class GpsLoading extends MapsEvent{}

class UserLocationLoaded extends MapsEvent{}

class GetMarkerListFromPersonList extends MapsEvent{}

class ConvertingMarkerFromPerson extends MapsEvent{}

class MarkersLoaded extends MapsEvent{}


