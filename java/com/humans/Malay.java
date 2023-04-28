package com.humans;

import com.species.*;

public class Malay extends HumanAbstract implements HumanInteraface {

  public Malay(String name, int age, String races) {
    this.name = name;
    this.age = age;
    this.races = races;
  }

  public String getName() {
    return this.name;
  }

  public String setName(String name) {
    this.name = name;
    return this.name;
  }

  public int getAge() {
    return this.age;
  }

  public int setAge(int age) {
    this.age = age;
    return this.age;
  }

  public String getRaces() {
    return this.races;
  }

  public String setRaces(String races) {
    this.races = races;
    return this.races;
  }

}
