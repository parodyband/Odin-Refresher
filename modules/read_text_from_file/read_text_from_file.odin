package read_text_from_file

import "core:fmt"
import "core:os"

Run :: proc() {
    file, error := os.open("modules/read_text_from_file/test.txt")

    if error != os.ERROR_NONE {
        fmt.println("Error: Could Not Open File")
        return
    }

    text, read_error := os.read_entire_file(file)

    if !read_error {
        fmt.println("Error: Could Not Read File")
        return
    }

    fmt.println(string(text))
}