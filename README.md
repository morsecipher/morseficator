# Morseficator

A package to convert text into morse code

## Installation

To install dependecies and run a REPL execute the following:
```
$ mix deps.get
$ iex -S mix
```
## How to use it?
```elixir
iex(1)> Morseficator.convert("Goedemorgen")       
["--.", "---", ".", "-..", ".", "--", "---", ".-.", "--.", ".", "-."]
```

To run tests:
```
mix test
```

If you want to generate the documentation:
```
mix docs
```