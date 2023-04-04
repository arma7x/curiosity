package main

type Car struct {
	name string
}

func (c *Car) setName(value string) string {
	c.name = value
	return c.name
}

func (c *Car) getName() string {
	return c.name
}

func main() {
	c := new(Car)
	c.setName("BMW")
	type NoMethod Car
	// raw := NoMethod(*c)
	// println(raw.getName())
}
