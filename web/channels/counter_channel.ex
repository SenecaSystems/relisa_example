defmodule Counter.CounterChannel do
  use Phoenix.Channel

  def join("counter", _auth_msg, socket) do
    Process.flag(:trap_exit, true)
    :timer.send_interval(25, :increment)
    :timer.send_interval(250, :version)
    {:ok, socket}
  end

  def handle_info(:increment, socket) do
    push socket, "increment", %{}
    {:noreply, socket}
  end

  def handle_info(:version, socket) do
    version =
      :application.which_applications
      |> List.keyfind(:counter, 0)
      |> elem(2)
      |> List.to_string
    push socket, "version", %{version: version}
    {:noreply, socket}
  end
end
