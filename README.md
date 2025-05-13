# Odin Programs Collection

This repository contains a collection of small programs written in the Odin programming language. The main entry point is `main.odin`, which serves as a launcher for various modules or sub-programs.

## Overview

The `main.odin` file provides a simple command-line interface to run different programs. It lists available programs and allows the user to select one by entering its corresponding number.

## Available Programs

- **Hello World**: A basic program that prints a greeting message.
- **Read File**: A utility to read and display text from a file.
- **Bitwise**: Demonstrates bitwise operations in Odin.
- **Lua Test**: Integrates Lua scripting with Odin, showcasing how to call Lua scripts from Odin and vice versa.

## How to Run

1. Ensure you have the Odin compiler installed on your system.
2. Clone this repository or navigate to the directory containing `main.odin`.
3. Compile and run the program using the Odin compiler:
   ```
   odin run .
   ```
4. Follow the on-screen instructions to select and run a program by entering its number.

## Structure

- **main.odin**: The main launcher that lists and runs the available programs.
- **Modules/**: Directory containing individual program modules.
  - **HelloWorld/**: Contains the Hello World program.
  - **ReadTextFromFile/**: Contains the file reading utility.
  - **Bitwise/**: Contains the bitwise operations demo.
  - **LuaTest/**: Contains the Lua integration test with a sample Lua script.
