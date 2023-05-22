class Point {
  final double x;
  final double y;
  double? z;

  // Point(this.x, this.y);
  // Point(this.x, this.y, this.z);

  /*
   * Point(this.x, this.y, double z) {
    z = z;
  }
  */

  // Point(double x, double y): x=x,y=y ;

  Point(double x, double y, double z): x=x,y=y { // Initializer list
    z = z;
  }

  /* illegal
  Point(double x, double y, double z) {
    this.x = x;
    this.y = y;
    this.z = z;
  } */
}

class Person {

  Person() {
    print('Person()');
  }

  String? firstName;

  Person.fromName(String data) {
    firstName = data;
    print('$firstName in Person');
  }
}

class Employee extends Person {

  Employee(): super() {
    print('Employee()');
  }


  Employee.fromName(String data) : super.fromName(data) {
    print('$firstName in Employee');
  }
/*
  Employee.fromName(super.data) : super.fromName() {
    print('$firstName in Employee');
  }*/
}

class Vector2d {
  final double x;
  final double y;

  Vector2d(this.x, this.y);
}

class Vector3d extends Vector2d {
  final double z;

  // Forward the x and y parameters to the default super constructor like:
  // Vector3d(final double x, final double y, this.z) : super(x, y);
  Vector3d(super.x, super.y, this.z);
}

void main() {
  var employee = Employee.fromName("John");
  print(employee);
}
