import 'abstract.dart';

class Car extends Vehicle {

  @override
  void moveBackward(int meters) {}

}

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

  Car car = Car();
  car.moveForward(10);
  car.moveBackward(4);

}
