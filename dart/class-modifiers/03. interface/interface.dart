interface class Vehicle {

  int passengers = 4;

  void moveForward(int meters) {}

  void moveBackward(int meters) {}

  // ILLEGAL: Default implementation is required
  // void moveBackward(int meters);

}
