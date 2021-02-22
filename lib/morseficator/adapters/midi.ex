defmodule Morseficator.Adapter.Midi do
  @behaviour Morseficator.Adapter

  @unit 30
  @instrument_code 83
  @pitch 78
  @initial_pause 1000

  @spec setup :: {pid}
  def setup do
    {:ok, synth} = MIDISynth.start_link([])
    MIDISynth.Keyboard.change_program(synth, @instrument_code)

    :timer.sleep(@initial_pause)

    {synth}
  end

  @spec beep({atom}) :: :ok
  def beep({synth}) do
    MIDISynth.Keyboard.play(synth, @pitch, @unit)
  end

  @spec beep_3x({atom}) :: :ok
  def beep_3x({synth}) do
    MIDISynth.Keyboard.play(synth, @pitch, @unit*3)
  end

  @spec sleep(non_neg_integer) :: :ok
  def sleep(n) do
    :timer.sleep(@unit*n)
  end
end
