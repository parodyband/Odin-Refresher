package lua_example

import "core:fmt"
import lua "vendor:lua/5.4"
import "core:c"
import "base:runtime"

state: ^lua.State

lua_allocator :: proc "c" (ud: rawptr, ptr: rawptr, osize, nsize: c.size_t) -> (buf: rawptr) {
	old_size := int(osize)
	new_size := int(nsize)
	context = (^runtime.Context)(ud)^

	if ptr == nil {
		data, err := runtime.mem_alloc(new_size)
		return raw_data(data) if err == .None else nil
	} else {
		if nsize > 0 {
			data, err := runtime.mem_resize(ptr, old_size, new_size)
			return raw_data(data) if err == .None else nil
		} else {
			runtime.mem_free(ptr)
			return
		}
	}
}

Run :: proc() {
	_context := context
	state = lua.newstate(lua_allocator, &_context)
	defer lua.close(state)

	lua.L_openlibs(state)
	lua.register(state, "add_numbers", add_numbers)

	lua.L_dofile(state, "modules/lua_example/example.lua")
	str := lua.tostring(state, -1)
	fmt.println(str)
}

add_numbers :: proc "c" (L: ^lua.State) -> i32 {
	a := lua.L_checknumber(L, 1)
	b := lua.L_checknumber(L, 2)
	result := a + b

	lua.pushnumber(L, result)
	return 1 
}