defmodule Queryx do
  use Application
  # use Hound.Helpers

  def start(_type, _args) do

    import Supervisor.Spec, warn: false

    children = [
      worker(hajar, [], restart: :temporary)
    ]
    #supervise(children, strategy: :simple_one_for_one)
    {:ok, sup_pid} = Supervisor.start_link(children, strategy: :simple_one_for_one)
  end

  def hajar do
    IO.puts "Queryx - declarative query language for web systems"
    IO.puts "Starting ..."
    # Hound.start_session
    # navigate_to "http://elixir-lang.org"
    contents = download("http://elixir-lang.org")
    IO.puts contents
  end

  def download(src) do
    #IO.puts "Downloading #{src} -> #{output_filename}"
    HTTPoison.get!(src).body
    #File.write!(output_filename, body)
    #IO.puts "Done Downloading #{src} -> #{output_filename}"
  end
 
end
