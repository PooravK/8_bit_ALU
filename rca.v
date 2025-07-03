module rca(
    input [7:0]input_1,
    input [7:0]input_2,
    input cin,
    output [7:0]add_out,
    output cout,
    output add_overflow
    );

    wire connect;

    Adder4bit instance1(.input_1(input_1[3:0]), .input_2(input_2[3:0]), .cout(connect), .add_out(add_out[3:0]), .cin(cin));
    Adder4bit instance2(.input_1(input_1[7:4]), .input_2(input_2[7:4]), .cout(cout), .add_out(add_out[7:4]), .cin(connect));

    assign add_overflow = cout;
endmodule

module Adder4bit(
    input [3:0]input_1,
    input [3:0]input_2,
    input cin,
    output [3:0]add_out,
    output cout
    );

    wire connect1;
    wire connect2;
    wire connect3;

    Adder1bit instance1 (.input_1(input_1[0]), .input_2(input_2[0]), .cout(connect1), .add_out(add_out[0]), .cin(cin));
    Adder1bit instance2 (.input_1(input_1[1]), .input_2(input_2[1]), .cin(connect1), .add_out(add_out[1]), .cout(connect2));
    Adder1bit instance3 (.input_1(input_1[2]), .input_2(input_2[2]), .cin(connect2), .add_out(add_out[2]), .cout(connect3));
    Adder1bit instance4 (.input_1(input_1[3]), .input_2(input_2[3]), .cin(connect3), .add_out(add_out[3]), .cout(cout));

endmodule

module Adder1bit(
    input input_1, input_2, cin,
    output add_out, cout
    );

    assign add_out = input_1 ^ input_2 ^ cin;
    assign cout = input_1 & input_2 | input_1 & cin | input_2 & cin;

endmodule