# Morseficator

A package to convert text into morse code

## Specifications

https://en.wikipedia.org/wiki/Morse_code#/media/File:International_Morse_Code.svg

## How to use it?
```elixir
iex(1)> Morseficator.encode("sos")       
"... --- ..."
```

In case you want to play audio via Midi adapter you can use [`Morseficator.Adapter.Midi`](https://github.com/morsecipher/morseficator_adapter_midi):
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