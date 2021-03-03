defmodule ElixirNeuralNet do
    # todo: check validity of lengths of inputs weights and biases
    def main do
        # Currently only used for testing
        x = [[1,2,3,2.5], [2.0, 5.0, -1.0, 2.0], [-1.5, 2.7, 3.3, -0.8]]
        layer1 = Layer.create_layer_dense(4,5)
        layer2 = Layer.create_layer_dense(5,2)

        # The functions are currently not acting "deep enough" in the lists, use Enum.map to fix
        _out = Layer.forward(x, Enum.at(layer1, 0), Enum.at(layer1, 1))
    end
end
