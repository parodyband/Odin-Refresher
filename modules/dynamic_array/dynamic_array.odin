package dynamic_array

import "core:fmt"

Run :: proc() {
    numbers := []i32{1,2,3,4,5,6,7,8,9,10}
    even_numbers := [dynamic]i32{}

    for number in numbers {
        if number % 2 == 0 {
            append(&even_numbers, number)
        }
    }

    fmt.printfln("Amount of Numbers: %d", len(numbers))

    for number in even_numbers {
        fmt.printfln("Even Number Found: %d", number)
    }
}