defmodule Morseficator.Adapter.Midi do
  @behaviour Morseficator.Adapter

  @unit 55
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

  @spec beep({pid}, non_neg_integer()) :: :ok
  def beep({synth}, times) do
    MIDISynth.Keyboard.play(synth, @pitch, @unit*times)
  end

  @spec sleep(non_neg_integer) :: :ok
  def sleep(n) do
    :timer.sleep(@unit*n)
  end
end
