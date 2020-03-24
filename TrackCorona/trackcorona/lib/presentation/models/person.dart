import 'package:latlong/latlong.dart';
import 'package:trackcorona/utilities/person_condition_enum.dart';

class Person{
  LatLng latlng;
  PersonCondition personCondition;

  Person(LatLng latLng, PersonCondition personCondition);

  LatLng getLatLng(){
    return latlng;
  }

  PersonCondition getPersonCondition(){
    return personCondition;
  }

}