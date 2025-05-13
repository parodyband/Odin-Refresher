package bitwise
import "core:fmt"

Run :: proc() {
    fmt.println("Demonstrating Bitwise Operations:")
    fmt.println("-------------------------------")
    
    // AND operator (&)
    x := 12  // 1100 in binary
    y := 10  // 1010 in binary
    fmt.println("AND Operation (&):")
    fmt.println("  x =", x, "(1100 in binary)")
    fmt.println("  y =", y, "(1010 in binary)")
    fmt.println("  x & y =", x & y, "(1000 in binary)")  // 8
    fmt.println()

    // OR operator (|)
    fmt.println("OR Operation (|):")
    fmt.println("  x =", x, "(1100 in binary)")
    fmt.println("  y =", y, "(1010 in binary)")
    fmt.println("  x | y =", x | y, "(1110 in binary)")  // 14
    fmt.println()

    // XOR operator (~)
    fmt.println("XOR Operation (~):")
    fmt.println("  x =", x, "(1100 in binary)")
    fmt.println("  y =", y, "(1010 in binary)")
    fmt.println("  x ~ y =", x ~ y, "(0110 in binary)")  // 6
    fmt.println()

    // Bitwise complement (unary ~)
    z := 5  // 0101 in binary
    fmt.println("Bitwise Complement (unary ~):")
    fmt.println("  z =", z, "(0101 in binary)")
    fmt.println("  ~z =", ~z, "(1111...1010 in binary)")  // -6 (in two's complement)
    fmt.println()

    // Bitwise AND-NOT operator (&~)
    fmt.println("AND-NOT Operation (&~):")
    fmt.println("  x =", x, "(1100 in binary)")
    fmt.println("  y =", y, "(1010 in binary)")
    fmt.println("  x &~ y =", x &~ y, "(0100 in binary)")  // 4
    fmt.println()

    // Left shift (<<)
    a := 1  // 0001 in binary
    fmt.println("Left Shift Operation (<<):")
    fmt.println("  a =", a, "(0001 in binary)")
    fmt.println("  a << 2 =", a << 2, "(0100 in binary)")  // 4
    fmt.println()

    // Right shift (>>)
    b := 8  // 1000 in binary
    fmt.println("Right Shift Operation (>>):")
    fmt.println("  b =", b, "(1000 in binary)")
    fmt.println("  b >> 2 =", b >> 2, "(0010 in binary)")  // 2
    fmt.println()

    // Combining operators
    c := 15  // 1111 in binary
    d := 3   // 0011 in binary
    fmt.println("Combined Operations (& and <<):")
    fmt.println("  c =", c, "(1111 in binary)")
    fmt.println("  d =", d, "(0011 in binary)")
    fmt.println("  (c & d) << 1 =", (c & d) << 1, "(0110 in binary)")  // 6
}