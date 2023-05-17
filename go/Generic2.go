package main

import "fmt"

type Number interface {
	int64 | float64
}

type fn[T Number] func(T)

func main() {
	fmt.Println("Hello, 世界")
	echo(i64, 4)
	echo(f64, 4)
}

func echo[T Number](f fn[T], v T) {
	f(v)
}

func i64(v int64) {
	fmt.Println("INT64", v)
}

func f64(v float64) {
	fmt.Println("FLOAT64", v)
}
