# String Calculator - TDD Implementation

A Ruby implementation of the String Calculator kata using Test-Driven Development (TDD) principles.

## Overview

This project implements a string calculator that can add numbers from a string input. It follows the classic String Calculator kata requirements and demonstrates clean code practices with comprehensive test coverage.

## Features

- Add empty string (returns 0)
- Add single number (returns the number)
- Add two numbers separated by comma
- Add multiple numbers separated by comma
- Support for newline delimiters
- Support for mixed delimiters (comma and newline)
- Custom delimiter specification using `//delimiter\n` format
- Input validation for consecutive delimiters
- Negative number validation with detailed error messages
- Object-oriented design with clean separation of concerns

## Requirements

- Ruby 2.7+ (tested with Ruby 3.x)
- RSpec for testing

## Installation

1. Clone the repository:
```bash
git clone <repository-url>
cd incubyt-tdd
```

2. Install dependencies:
```bash
bundle install
```

## Running Tests

### Run all tests:
```bash
bundle exec rspec
```
### Run a specific test file:
```bash
bundle exec rspec spec/string_calc_spec.rb
```

### Run tests in watch mode (reruns on file changes):
```bash
bundle exec rspec --watch
```

## Usage

### Basic Usage

```ruby
require_relative 'lib/string_calculator'

# Empty string
StringCalculator.add("") # => 0

# Single number
StringCalculator.add("5") # => 5

# Multiple numbers
StringCalculator.add("1,2,3") # => 6

# Mixed delimiters
StringCalculator.add("1\n2,3") # => 6

# Custom delimiter
StringCalculator.add("//;\n1;2;3") # => 6
```

### Error Handling

```ruby
# Invalid consecutive delimiters
StringCalculator.add("1,\n") # => RuntimeError: "Invalid string"

# Negative numbers
StringCalculator.add("1,-2,3") # => RuntimeError: "negative numbers not allowed <-2>"

# Multiple negative numbers
StringCalculator.add("1;-2;-3;4") # => RuntimeError: "negative numbers not allowed <-2,-3>"
```