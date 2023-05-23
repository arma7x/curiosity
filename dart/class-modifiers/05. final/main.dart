import "final.dart";

// ERROR: Cannot be inherited
// class Car extends Vehicle {}

/*
// ILLEGAL: Cannot be implemented outside library
class MockVehicle implements Vehicle {

  int position = 4;

  @override
  void moveForward(int meters) {}

  @override
  void moveBackward(int meters) {}

}
* */

void main() {
  Vehicle myVehicle = Vehicle();
}
