package main

import "fmt"

type Number interface {
	int64 | float64
}

type Common[T Number] interface {
	Less(Common[T]) bool
	GetValue() T
}

type MyType[T Number] struct {
	value T
}

func (t *MyType[T]) GetValue() T {
	return t.value
}

func (t *MyType[T]) Less(c Common[T]) bool {
	return t.GetValue() < c.GetValue()
}

func compare[T Number](a Common[T], b Common[T]) bool {
	return a.Less(b)
}

func compareV2[T Number, I Common[T]](a I, b I) bool {
	return a.Less(b)
}

func main() {
	a := &MyType[int64]{1}
	b := &MyType[int64]{2}
	fmt.Println(compare[int64](a, b))
	fmt.Println(compareV2[int64](a, b))
}
