module sub(
    input [7:0] input_1,
    input [7:0] input_2,
    output [7:0] sub_out,
    output cout,
    output sub_overflow
);

    wire [7:0] input_2_comp;
    wire connect;

    assign input_2_comp = ~input_2;

    Adder4bit instance1(.input_1(input_1[3:0]), .input_2(input_2_comp[3:0]), .cin(1'b1), .cout(connect), .add_out(sub_out[3:0]));
    Adder4bit instance2(.input_1(input_1[7:4]), .input_2(input_2_comp[7:4]), .cin(connect), .cout(cout), .add_out(sub_out[7:4]));

    assign sub_overflow = (input_1[7] != input_2[7]) && (input_1[7] != sub_out[7]);


endmodule
