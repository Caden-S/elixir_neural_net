defmodule Layer do
    def create_layer_dense(num_inputs, num_neurons) do
        weights = 
            for _x <- 0..num_neurons-1, do: for _y <- 0..num_inputs-1, do: :rand.normal * 0.10
        biases = 
            for _x <- 0..num_neurons-1, do: 0
        _layer = [weights, biases]
    end

    def forward(inputs, weights, biases) do
        Calc.matrix_multiply(inputs, weights)
        |> apply_biases(biases)
    end

    def add_biases_at_index(number, index, biases) do
        Float.round((number + Enum.at(biases, index)), 5)
    end

    def apply_biases(matrix, biases) do
        Enum.map(matrix, fn vector -> 
            vector_with_index = Enum.with_index(vector)
    
            Enum.map(vector_with_index, fn {value, index} ->
                add_biases_at_index(value, index, biases) 
            end)
        end)
    end
end
