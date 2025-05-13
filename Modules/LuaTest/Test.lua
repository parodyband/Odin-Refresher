-- A basic Lua program to demonstrate some fundamental concepts
print("Hello from Lua!")

-- Variables and data types
local number = 42
local text = "Lua is awesome"
local boolean = true
local tableExample = {1, 2, 3, 4, 5}

-- Printing variables
print("Number:", number)
print("Text:", text)
print("Boolean:", boolean)

-- Working with tables (similar to arrays or dictionaries)
print("Table contents:")
for i, value in ipairs(tableExample) do
    print("Index " .. i .. ": " .. value)
end

-- Simple function
local function greet(name)
    return "Hello, " .. name .. "!"
end

-- Calling the function
print(greet("Programmer"))

-- Add Numbers (func from odin)
print("Add 2 Numbers from Odin: " .. add_numbers(356,4567))

-- While loop countdown test for 5 seconds
print("Starting 5-second countdown:")
local start_time = os.time()
local elapsed = 0
while elapsed < 5 do
    elapsed = os.time() - start_time
    print("Time remaining: " .. (5 - elapsed) .. " seconds")
    os.execute("sleep 1") -- Sleep for 1 second (works on Unix-like systems; for Windows, use "timeout /t 1")
end
print("Countdown finished!")

-- Returning a value to the calling Odin program
return "Lua script executed successfully!"