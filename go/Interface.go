package main

import (
	"fmt"
)

type Mammal interface {
	getFoo()
}

type Human struct{}

func (self *Human) getFoo() { fmt.Println("Human") }

type Cat struct{}

func (self *Cat) getFoo() { fmt.Println("Cat") }

func Last[T *Mammal](s []T) T {
	return s[len(s)-1]
}

func First(s []*Mammal) *Mammal {
	return s[0]
}

func Push(ms []*Mammal, m *Mammal) []*Mammal {
	ms = append(ms, m)
	return ms
}

func main() {
	var ms []*Mammal
	var h Mammal
	h = new(Human)
	var c Mammal
	c = &Cat{}
	ms = Push(ms, &h)
	ms = Push(ms, &c)
	(*Last(ms)).getFoo()
	(*First(ms)).getFoo()
}
