// mark any class which implements or extends a base class as base, final, or sealed. This prevents outside libraries from breaking the base class guarantees.

base class Vehicle {

  int passengers = 4;

  void moveForward(int meters) {}

  void moveBackward(int meters) {}

  // ILLEGAL: Default implementation is required
  // void moveBackward(int meters);

}
