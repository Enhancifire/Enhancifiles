package examples

import "fmt"

var foobar1 = ""
var foobar2 bool = true
var foobar3 = 1
var foobar4 = 1.0
var foobar5 = Foo()
var foobar6 = Foo2{}
var foobar7 *Foo2 = nil

type Foo2 struct {
	Foo string
}

type Bar interface{}

func Foo() bool {
	fmt.Println("test")
	return true
}

////////////////////////////////////////////////////////////////////////////////
// ^ Screenshot (23 lines)
