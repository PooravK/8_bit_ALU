`timescale  1ns/1ps

module tb_alu();
    reg [7:0] input_1;
    reg [7:0] input_2;
    reg [2:0] sel;
    reg cin;
    wire add_overflow;
    wire sub_overflow;
    wire overflow_flag;
    wire zero_flag;
    wire [7:0] alu_out;
    wire [7:0] add_out;
    wire [7:0] sub_out;
    wire [7:0] and_out;
    wire [7:0] or_out;
    wire [7:0] xor_out;
    wire [7:0] xnor_out;

    alu uut (
        .input_1(input_1),
        .input_2(input_2),
        .sel(sel),
        .cin(cin),
        .add_overflow(add_overflow),
        .sub_overflow(sub_overflow),
        .overflow_flag(overflow_flag),
        .zero_flag(zero_flag),
        .alu_out(alu_out),
        .add_out(add_out),
        .sub_out(sub_out),
        .and_out(and_out),
        .or_out(or_out),
        .xor_out(xor_out),
        .xnor_out(xnor_out)
    );

    initial begin
        $dumpfile ("aluwaveform.vcd");
        $dumpvars (0, tb_alu);

        //Addition test cases
        input_1 = 8'b00000001; input_2 = 8'b00000001; sel = 3'b000; cin = 1'b0; #5;
        $display("sel = %b | input_1 = %b input_2 = %b | output = %b | overflow_flag = %b | zero_flag = %b |", sel, input_1, input_2, alu_out, overflow_flag, zero_flag);
        input_2 = 8'b11111111; input_2 = 8'b00000001; sel = 3'b000; cin = 1'b0; #5;
        $display("sel = %b | input_1 = %b input_2 = %b | output = %b | overflow_flag = %b | zero_flag = %b |", sel, input_1, input_2, alu_out, overflow_flag, zero_flag);
        input_1 = 8'b01010101; input_2 = 8'b00110011; sel = 3'b000; cin = 1'b0; #5;
        $display("sel = %b | input_1 = %b input_2 = %b | output = %b | overflow_flag = %b | zero_flag = %b |", sel, input_1, input_2, alu_out, overflow_flag, zero_flag);

        //Subtraction test cases
        input_1 = 8'b00000010; input_2 = 8'b00000001; sel = 3'b001; #5;
        $display("sel = %b | input_1 = %b input_2 = %b | output = %b | overflow_flag = %b | zero_flag = %b |", sel, input_1, input_2, alu_out, overflow_flag, zero_flag);
        input_1 = 8'b00000000; input_2 = 8'b00000001; sel = 3'b001; #5;
        $display("sel = %b | input_1 = %b input_2 = %b | output = %b | overflow_flag = %b | zero_flag = %b |", sel, input_1, input_2, alu_out, overflow_flag, zero_flag);
        input_1 = 8'b11111111; input_2 = 8'b11111111; sel = 3'b001; #5;
        $display("sel = %b | input_1 = %b input_2 = %b | output = %b | overflow_flag = %b | zero_flag = %b |", sel, input_1, input_2, alu_out, overflow_flag, zero_flag);

        //and test cases
        input_1 = 8'b11001100; input_2 = 8'b10101010; sel = 3'b010; #5;
        $display("sel = %b | input_1 = %b input_2 = %b | output = %b | overflow_flag = %b | zero_flag = %b |", sel, input_1, input_2, alu_out, overflow_flag, zero_flag);

        //or test cases
        input_1 = 8'b11001100; input_2 = 8'b10101010; sel = 3'b011; #5;
        $display("sel = %b | input_1 = %b input_2 = %b | output = %b | overflow_flag = %b | zero_flag = %b |", sel, input_1, input_2, alu_out, overflow_flag, zero_flag);

        //xor test cases
        input_1 = 8'b11001100; input_2 = 8'b10101010; sel = 3'b100; #5;
        $display("sel = %b | input_1 = %b input_2 = %b | output = %b | overflow_flag = %b | zero_flag = %b |", sel, input_1, input_2, alu_out, overflow_flag, zero_flag);

        //xnor test cases
        input_1 = 8'b11001100; input_2 = 8'b10101010; sel = 3'b101; #5;
        $display("sel = %b | input_1 = %b input_2 = %b | output = %b | overflow_flag = %b | zero_flag = %b |", sel, input_1, input_2, alu_out, overflow_flag, zero_flag);

        //Zeorp path test case
        sel = 3'b110; #5;
        $display("sel = %b | input_1 = %b input_2 = %b | output = %b | overflow_flag = %b | zero_flag = %b |", sel, input_1, input_2, alu_out, overflow_flag, zero_flag);
        sel = 3'b111; #5;
        $display("sel = %b | input_1 = %b input_2 = %b | output = %b | overflow_flag = %b | zero_flag = %b |", sel, input_1, input_2, alu_out, overflow_flag, zero_flag);

        $finish;
    end
endmodule
