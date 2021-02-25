# Morseficator

A package to convert text into morse code

## Specifications

https://en.wikipedia.org/wiki/Morse_code#/media/File:International_Morse_Code.svg

## Installation

In order to use `Morseficator.Adapter.Midi` you have to install fluidsynth library.

On OSX: 
```
brew install fluidsynth
```

On Debian/Ubuntu:
```
sudo apt install libfluidsynth-dev
```

On Fedora:
```
sudo dnf install fluidsynth-devel
```

To install dependecies and run a REPL execute the following:
```
$ mix deps.get
$ iex -S mix
```
## How to use it?
```elixir
iex(1)> Morseficator.encode("sos")       
"... --- ..."
```

In case you want to play audio via MIDISynth library you can use `Morseficator.Adapter.Midi` adapter:
```elixir
iex(1) Morseficator.Adapter.interpret("sos sos sos", Morseficator.Adapter.Midi)
```

To run tests:
```
mix test
```

If you want to generate the documentation:
```
mix docs
```