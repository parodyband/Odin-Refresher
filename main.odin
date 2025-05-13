package main
import "core:fmt"
import "core:os"
import "core:strconv"

import "Modules/HelloWorld"
import "Modules/ReadTextFromFile"
import "Modules/Bitwise"
import "Modules/LuaTest"

ProgramEntry :: struct {
    name: string,
    run : proc(),
}

programs: []ProgramEntry = {
    ProgramEntry{"Hello World", HelloWorld.Run},
    ProgramEntry{"Read File"  , ReadTextFromFile.Run},
    ProgramEntry{"Bitwise"    , Bitwise.Run},
    ProgramEntry{"Lua Test"   , LuaTest.Run},
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