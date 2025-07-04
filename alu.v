module alu(
    input [7:0] input_1,
    input [7:0] input_2,
    input [2:0] sel,
    input cin,
    output add_overflow,
    output sub_overflow,
    output overflow_flag,
    output zero_flag,
    output reg [7:0] alu_out,
    output [7:0] add_out,
    output [7:0] sub_out,
    output [7:0] and_out,
    output [7:0] or_out,
    output [7:0] xor_out,
    output [7:0] xnor_out
   );
    
    gate_and and_module(
        .input_1(input_1),
        .input_2(input_2),
        .and_out(and_out)
    );
    gate_or or_module(
        .input_1(input_1),
        .input_2(input_2),
        .or_out(or_out)
    );
    gate_xor xor_module(
        .input_1(input_1),
        .input_2(input_2),
        .xor_out(xor_out)
    );
    gate_xnor xnor_module(
        .input_1(input_1),
        .input_2(input_2),
        .xnor_out(xnor_out)
    );

   rca adder_module (
    .input_1(input_1),
    .input_2(input_2),
    .cin(cin),
    .add_overflow(add_overflow),
    .add_out(add_out)
   );

   sub diff_module(
    .input_1(input_1),
    .input_2(input_2),
    .sub_overflow(sub_overflow),
    .sub_out(sub_out)
   );

    always @(*)begin
        case(sel)
        3'b000: alu_out = add_out;
        3'b001: alu_out = sub_out;
        3'b010: alu_out = and_out;
        3'b011: alu_out = or_out;
        3'b100: alu_out = xor_out;
        3'b101: alu_out = xnor_out;
        3'b110: alu_out = 8'b00000000;
        3'b111: alu_out = 8'b00000000;
        endcase
    end

    assign overflow_flag = (sel == 3'b000)? add_overflow :
    (sel == 3'b001)? sub_overflow :
    1'b0;

    assign zero_flag = (alu_out == 8'b00000000)? 1'b1 : 1'b0;
endmodule