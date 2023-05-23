import 'interface.dart';

// ILLEGAL: Cannot be implemented outside library
// class Car extends Vehicle {}

class MockVehicle implements Vehicle {

  int passengers = 4;

  @override
  void moveForward(int meters) {}

  @override
  void moveBackward(int meters) {}

}

void main() {

  Vehicle myVehicle = Vehicle();

}
