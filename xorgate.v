module gate_xor(
    input [7:0]input_1,
    input [7:0]input_2,
    output [7:0]xor_out
    );

    assign xor_out = input_1 ^ input_2;
endmodule