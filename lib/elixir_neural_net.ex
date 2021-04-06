defmodule NeuralNet do
    # todo: check validity of lengths of inputs weights and biases
    def main do
        # intentionally blank
    end

    def test do
        x = [[1,2,3,2.5], [2.0, 5.0, -1.0, 2.0], [-1.5, 2.7, 3.3, -0.8]]
        layer1 = Layer.create_layer_dense(4,5)
        layer2 = Layer.create_layer_dense(5,2)
        _out = Layer.forward_pass(x, Enum.at(layer1, 0), Enum.at(layer1, 1))
            |> Layer.forward_pass(Enum.at(layer2, 0), Enum.at(layer2, 1))
    end

    # Used to make an exemplary data set
    def create_data(points, classes) do
        c = 
            for _x <- 0..(points * classes)-1, do: for _y <- 0..1, do: 0.0
        d =
            for _x <- 0..(points * classes)-1, do: 0
        
        for class <- 0..classes, do:
            (
            ix = abs(points * (class + 1) - (points * class))
            r = Calc.linspace(0.0, 1, points)

            y = for _x <- 0..points, do: :rand.normal * 0.2
            t = 
                Calc.linspace(class * 4, (class + 1) * 4, points)
                |> Enum.zip(y)
                |> Enum.map(fn {x,y} -> x + y end)

            a = Enum.zip(r, (for _x <- 0..length(r), do: Enum.map(t, &:math.sin(&1*2.5))))
                |> Enum.map(fn {x, y} -> Enum.map(y, &Kernel.*(&1, x)) end)
            b = Enum.zip(r, (for _x <- 0..length(r), do: Enum.map(t, &:math.cos(&1*2.5))))
                |> Enum.map(fn {x, y} -> Enum.map(y, &Kernel.*(&1, x)) end)
            List.replace_at(c, ix, 
                [] ++ a
                |> Kernel.++(b)
                |> Calc.transpose()
            )
            List.replace_at(d, ix, class)
            )
        _out = [c, d]
    end
end
