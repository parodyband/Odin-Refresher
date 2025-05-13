package slice_array

import "core:fmt"

Enemy :: struct {
    name     : string,
    distance : f32
}

Run :: proc() {
    enemies := [5]Enemy{
        Enemy{"Goblin", 3.2},
        Enemy{"Orc",    5.7},
        Enemy{"Troll",  8.1},
        Enemy{"Dragon", 12.4},
        Enemy{"Giant",  9.3},
    }

    attack_range: f32 = 10.0

    in_range_count := 0
    fmt.printfln("Enemies:")
    for enemy in enemies {
        fmt.printf(" - %s (%.1f units)\n", enemy.name, enemy.distance)
        if enemy.distance > attack_range {
            break
        }
        in_range_count += 1
    }

    in_range := enemies[0:in_range_count]

    fmt.printfln("Enemies in Attack Range (%.1f):", attack_range)
    for enemy in in_range {
        fmt.printf(" - %s (%.1f units)\n", enemy.name, enemy.distance)
    }
}