`timescale 1ns/1ps

module tb_rca();
    reg [7:0]a;
    reg [7:0]b;
    reg cin;
    wire [7:0]sum;
    wire cout;

    RippleCarry8bit uut(
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    initial begin

        $dumpfile("RCAwaveform.vcd");
        $dumpvars(0, tb_RippleCarry8bit);

        a = 8'b00000001; b = 8'b00000010; cin = 0; #10;
        $display("a = %b b = %b cin = %b sum = %b", a, b, cin, sum);
        a = 8'b11111111; b = 8'b00000001; cin = 0; #10;
        $display("a = %b b = %b cin = %b sum = %b", a, b, cin, sum);
        a = 8'b00000000; b = 8'b00000000; cin = 1; #10;
        $display("a = %b b = %b cin = %b sum = %b", a, b, cin, sum);
        a = 8'b11110000; b = 8'b00001111; cin = 0; #10;
        $display("a = %b b = %b cin = %b sum = %b", a, b, cin, sum);
        a = 0; b = 0; cin = 0; #10;
        $display("a = %b b = %b cin = %b sum = %b", a, b, cin, sum);
        a = 8'b10000000; b = 8'b10000000; cin = 1; #10;
        $display("a = %b b = %b cin = %b sum = %b", a, b, cin, sum);
        $finish;
    end
endmodule