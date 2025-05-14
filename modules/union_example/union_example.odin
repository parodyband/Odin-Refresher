package union_example
import "core:fmt"

// -----------------------------------------------------------------------------
//  A SIMPLE, *USEFUL* UNION EXAMPLE
// -----------------------------------------------------------------------------
//  `Value` can hold either an `int`, a `f64`, or a `string`.  At runtime we can
//  query which one it currently contains and act accordingly.  This kind of
//  union is handy for tiny JSON-like data, AST nodes, variant messages, etc.

Value :: union {
    int,
    f64,
    string,
}

print_value :: proc(v: Value) {
    switch x in v {
    case int:    fmt.printf("int    → %d\n", x)
    case f64:    fmt.printf("float  → %.3f\n", x)
    case string: fmt.printf("string → %s\n", x)
    case:        fmt.println("nil    → <empty>")
    }
}

// Adds up all numeric variants inside the slice and ignores strings / nils.
sum_numbers :: proc(list: []Value) -> f64 {
    total: f64
    for v in list {
        #partial switch n in v {
        case int: total += f64(n)
        case f64: total += n
        }
    }
    return total
}

Run :: proc() {
    data := []Value{
        42,          // int variant
        3.14159,     // f64 variant
        "hello",    // string variant
        7,
    }

    // Demonstrate formatted printing for each union element
    for v in data {
        print_value(v)
    }

    // Show numeric aggregation via pattern-matching on the union
    fmt.printf("sum of numeric values = %.3f\n", sum_numbers(data))

    // Optional-ok type assertion example
    if s, ok := data[2].(string); ok {
        fmt.printf("'%s' has length %d\n", s, len(s))
    }
}