defmodule Morseficator.Adapter.Midi do
  @behaviour Morseficator.Adapter

  @unit 30
  @instrument_code 83
  @pitch 78
  @initial_pause 1000

  def setup do
    {:ok, synth} = MIDISynth.start_link([])
    MIDISynth.Keyboard.change_program(synth, @instrument_code)

    :timer.sleep(@initial_pause)

    {synth}
  end

  def beep({synth}) do
    MIDISynth.Keyboard.play(synth, @pitch, @unit)
  end

  def beep_3x({synth}) do
    MIDISynth.Keyboard.play(synth, @pitch, @unit*3)
  end

  def sleep(n) do
    :timer.sleep(@unit*n)
  end
end
