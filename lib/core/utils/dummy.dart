import 'package:frip_trading/src/data/models/models.dart';

class Dummy {
  static User userFacke() {
    return const User(id: 0, name: 'name', email: 'email@gmail.com');
  }

  // fake list Specializations
  static List<Specialization> specializationFake() {
    return [
      Specialization(id: 1, name: 'name1'),
      Specialization(id: 2, name: 'name2'),
      Specialization(id: 3, name: 'name3'),
      Specialization(id: 4, name: 'name4'),
      Specialization(id: 5, name: 'name5'),
    ];
  }

  // fake list Countries
  static List<Country> countryFake() {
    return [
      Country(id: 1, name: 'name1'),
      Country(id: 2, name: 'name2'),
      Country(id: 3, name: 'name3'),
      Country(id: 4, name: 'name4'),
      Country(id: 5, name: 'name5'),
    ];
  }
}
