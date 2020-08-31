defmodule ElixirNeuralNet do
    def main do
        inputs = [1,2,3]
        weights = [4,5,6]
        bias = 3
        propagate_sum(inputs, weights, bias)
    end

    # returns Inputs * Weights + bias
    def propagate_sum(inputs, weights, bias) do
        Enum.zip(inputs, weights)
        |> Enum.map(fn {x,y} -> x * y end)
        |> Enum.sum()
        # Cannot pipe into addition without Kernel namespace
        |> Kernel.+(bias)
    end 
end
