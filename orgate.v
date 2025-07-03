module orgate(
    input [7:0]input_1,
    input [7:0]input_2,
    output [7:0]or_out
    );

    assign or_out = input_1 | input_2;
endmodule