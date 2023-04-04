package main

import (
	"context"
	"fmt"
	"time"
)

func withDeadline(ctx context.Context) {
	fmt.Println("WithDeadline => " + ctx.Value("title").(string))
	ctxDeadline, cancel := context.WithDeadline(ctx, time.Now().Add(time.Second*2))
	defer cancel()
	for {
		select {
		case <-ctxDeadline.Done():
			fmt.Println("WithDeadline timed out")
			return
		default:
			fmt.Println("exec WithDeadline")
		}
		time.Sleep(500 * time.Millisecond)
	}
}

func withTimeout(ctx context.Context) {
	fmt.Println("withTimeout => " + ctx.Value("title").(string))
	ctxTimeout, cancel := context.WithTimeout(ctx, 3*time.Second)
	defer cancel()
	for {
		select {
		case <-ctxTimeout.Done():
			fmt.Println("withTimeout timed out")
			return
		default:
			fmt.Println("exec withTimeout")
		}
		time.Sleep(500 * time.Millisecond)
	}

}

func main() {
	fmt.Println("Go Context Tutorial")
	root := context.Background()
	ctx := context.WithValue(root, "title", "Go Context")
	go withTimeout(ctx)
	go withDeadline(ctx)

	time.Sleep(5 * time.Second)
}
