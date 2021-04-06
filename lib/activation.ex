defmodule ActivationReLU do
    def forward_pass(inputs) do
        _out = Enum.map(inputs, &max(0, &1))
    end
end