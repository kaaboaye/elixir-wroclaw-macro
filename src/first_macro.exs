defmodule First do
  defmacro to_map(keyword) do
    {:%{}, [], keyword}
  end
end
