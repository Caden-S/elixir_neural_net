defmodule Math do
    def matrix_multiply(input_rows, weight_cols) do
        Enum.map(input_rows, fn input_row ->
            Enum.map(weight_cols, fn weight_col ->
                weights_with_index =
                    Enum.with_index(weight_col)
    
                Enum.map(weights_with_index, fn {weight, weight_index} -> 
                    input = Enum.at(input_row, weight_index)
                    weight * input
                end)
            |> Enum.sum
            end)
        end)
    end
end
