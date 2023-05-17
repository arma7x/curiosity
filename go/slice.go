package main

import "fmt"

func main() {
	arr := make([]int, 10)
	foo(arr)
	for key, value := range arr {
		fmt.Println(key, value)
	}
	arr2 := new([10]int)
	foo2(arr2)
	for key, value := range arr2 {
		fmt.Println(key, value)
	}
	fmt.Println("Hello, 世界")
}

func foo(arr []int) {
	fmt.Println(len(arr))
	for key, _ := range arr {
		arr[key] = key
	}
}

func foo2(arr *[10]int) {
	for key, _ := range *arr {
		arr[key] = key
	}
}
