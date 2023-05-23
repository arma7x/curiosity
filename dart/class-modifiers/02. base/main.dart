import 'base.dart';

base class Car extends Vehicle {

  @override
  void moveForward(int meters) {}

}

/*
// ILLEGAL: Cannot be implemented outside library
base class MockVehicle implements Vehicle {

  int passengers = 4;

  @override
  void moveForward(int meters) {}

  @override
  void moveBackward(int meters) {}

}
*/

void main() {

  Vehicle myVehicle = Vehicle();

}
