package main
import "core:fmt"
import "core:os"
import "core:strconv"

import "modules/hello_world"
import "modules/read_text_from_file"
import "modules/bitwise"
import "modules/lua_example"
import "modules/dynamic_array"
import "modules/slice_array"

ProgramEntry :: struct {
    name: string,
    run : proc(),
}

programs: []ProgramEntry = {
    ProgramEntry{"Hello World"          , hello_world.Run},
    ProgramEntry{"Read Text From File"  , read_text_from_file.Run},
    ProgramEntry{"Bitwise"              , bitwise.Run},
    ProgramEntry{"Lua Example"          , lua_example.Run},
    ProgramEntry{"Dynamic Arrays"       , dynamic_array.Run},
    ProgramEntry{"Slice Arrays"         , slice_array.Run}
}

main :: proc() {
    fmt.println("Available programs:")
    
    for program, i in programs {
        fmt.println(" ", i, ":", program.name)
    }
    
    fmt.print("Enter number of program to run: ")

    buffer: [256]byte
    n, _ := os.read(os.stdin, buffer[:])
    input := string(buffer[:n-1])

    idx, ok := strconv.parse_int(input)
    if !ok || idx < 0 || idx >= len(programs) {
        fmt.println("Invalid program number:", input)
        return
    }

    entry := programs[idx]
    if entry.run != nil {
        entry.run()
    } else {
        fmt.println("Unknown program:", entry.name)
    }
}