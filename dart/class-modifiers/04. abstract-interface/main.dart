import 'abstract-interface.dart';

/*
// ILLEGAL: Cannot be extends outside library
class Car extends Vehicle {

  @override
  void moveBackward(int meters) {}

}
*/

class MockVehicle implements Vehicle {

  int position = 4;

  @override
  void moveForward(int meters) {}

  @override
  void moveBackward(int meters) {}

}

void main() {

  // ILLEGAL: Cannot be constructed
  // Vehicle myVehicle = Vehicle();

}
