defmodule Assertion.Generator do
  defmacro defassert(operator, err) do
    quote do
      defmacro assert({unquote(operator), _, [lhs, rhs]} = expr) do
        err = unquote(Macro.escape(err))

        quote do
          unquote(expr) ||
            unquote(err).(unquote(lhs), unquote(rhs))
            |> IO.puts()
        end
      end
    end
  end
end

defmodule Assertion do
  import Assertion.Generator

  defassert(:==, &"#{&1} is not equal to #{&2}")
  defassert(:!=, &"#{&1} is equal to #{&2}")
  defassert(:<=, &"#{&1} is greater then #{&2}")
end

defmodule Second do
  import Assertion

  def main do
    assert 2 + 2 == 4
    assert 2 + 2 == 5
    assert 2 + 2 != 5
    assert 2 + 2 != 4
    assert 2 + 2 <= 4
    assert 2 + 3 <= 3
  end
end
