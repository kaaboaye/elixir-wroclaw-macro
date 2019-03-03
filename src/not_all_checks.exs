defmodule Fail do
  defmacro matcher(args) do
    head =
      Enum.reduce(args, nil, fn
        text, nil when is_binary(text) -> text
        param, nil -> {param, [], Elixir}
        text, acc when is_binary(text) -> quote do: unquote(acc) <> unquote(text)
        param, acc -> quote do: unquote(acc) <> unquote({param, [], Elixir})
      end)

    ast =
      quote do
        def match(unquote(head)), do: :ok
      end

    ast
    |> Macro.to_string()
    |> IO.puts()

    ast
  end
end

defmodule Third do
  import Fail

  matcher(["a", :b, "c"])
end

from(s in Suite,
      join: r in Reservation,
      on:
s.id == r.suite_id,
      where: r.public_token == ^public_token,
      prelo
ad: [
        :address,
        :photos
      ]
    )
