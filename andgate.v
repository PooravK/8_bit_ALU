module andgate(
    input [7:0]input_1,
    input [7:0]input_2
    output [7:0]and_out
    );

    assign and_out = input_1 & input_2;

endmodule