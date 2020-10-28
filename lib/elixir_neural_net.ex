defmodule ElixirNeuralNet do
    def main do
        inputs = [1,2,3,2.5]
        weights = [[0.2,0.8,-0.5,1.0], [0.5,-0.91,0.26,-0.5], [-0.26,-0.27,0.17,0.87]]
        biases = [2,3,0.5]
        layer_outputs = propagate_sum(inputs, weights, biases)
    end

    # returns Inputs * Weights + bias
    def propagate_sum(inputs, weights, biases) do
        Enum.map(weights, fn x -> Enum.zip(x, inputs) end)
        |> Enum.map(&input_weight_multiply(&1))
        |> Enum.zip(biases)
        |> Enum.map(&sum_values_bias(&1))
    end

    def input_weight_multiply(weight_input_list) do
        weight_input_list 
        |> Enum.map(fn {w,i} -> w * i end)
    end

    def sum_values_bias(values_bias_tuple) do
        values_bias_tuple
        |> (fn {v,b} -> Enum.sum(v) + b end).()
    end
    # todo: check validity of lengths of inputs weights and biases
end

# inputs_with_weights = 
        #     Enum.with_index(inputs)
        #     |> Enum.map(fn {x,y} -> {x, Enum.map(weights, fn z -> Enum.at(z,y) end)} end)