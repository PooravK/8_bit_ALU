module gate_xnor(
    input [7:0]input_1,
    input[7:0]input_2,
    output[7:0]xnor_out
    );

    assign xnor_out = ~(input_1 ^ input_2);
endmodule