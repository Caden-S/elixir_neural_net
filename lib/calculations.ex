defmodule Calc do
    def matrix_multiply(input_rows, weight_cols) do
        Enum.map(input_rows, fn input_row ->
            Enum.map(weight_cols, fn weight_col ->
                weights_with_index = Enum.with_index(weight_col)
    
                Enum.map(weights_with_index, fn {weight, weight_index} -> 
                    input = Enum.at(input_row, weight_index)
                    weight * input
                end)
            |> Enum.sum
            end)
        end)
    end

    # Outputs a linearly spaced list of numbers with a given start, stop,
    # and desired length of list
    def linspace(start, stop, length) do
        0..length-1
        |> Enum.map(fn x -> start + (x * ( (stop-start)/(length-1) )) end)
    end

    def transpose(rows) do
        rows
        |> List.zip
        |> Enum.map(&Tuple.to_list/1)
    end
end
