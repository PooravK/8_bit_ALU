module csa(
    input [7:0]input_1,
    input [7:0]input_2,
    output [7:0]add_out,
    output add_overflow
    );
    wire coutconnect;
    wire [3:0]zero_out;
    wire [3:0]one_out;
    wire [3:0]final_uppersum;
    wire cout_zero;
    wire cout_one;

    add4bit outer_module(
        .input_1(input_1[3:0]),
        .input_2(input_2[3:0]),
        .sum(add_out[3:0]),
        .cin(0),
        .cout(coutconnect)
    );
    add4bit zero_module(
        .input_1(input_1[7:4]),
        .input_2(input_2[7:4]),
        .sum(zero_out),
        .cin(0),
        .cout(cout_zero)
    );
    add4bit one_module(
        .input_1(input_1[7:4]),
        .input_2(input_2[7:4]),
        .sum(one_out),
        .cin(1),
        .cout(cout_one)
    );

    assign final_uppersum = (coutconnect)?one_out:zero_out;
    assign add_overflow = (coutconnect)?cout_one:cout_zero;
    assign add_out[7:4] = final_uppersum;

endmodule

module add4bit(
    input [3:0]input_1,
    input [3:0]input_2,
    input cin,
    output [3:0]sum, cout
    );
    wire connect1;
    wire connect2;
    wire connect3;

    add1bit instance1(
        .input_1(input_1[0]),
        .input_2(input_2[0]),
        .sum(sum[0]),
        .cout(connect1)
    );
    add1bit instance2(
        .input_1(input_1[1]),
        .input_2(input_2[1]),
        .sum(sum[1]),
        .cin(connect1),
        .cout(connect2)
    );
    add1bit instance3(
        .input_1(input_1[2]),
        .input_2(input_2[2]),
        .sum(sum[2]),
        .cin(connect2),
        .cout(connect3)
    );
    add1bit instance4(
        .input_1(input_1[3]),
        .input_2(input_2[3]),
        .sum(sum[3]),
        .cin(connect3),
        .cout()
    );

endmodule

module add1bit(
    input input_1, input_2, cin,
    output sum, cout
    );

    assign sum = input_1 ^ input_2 ^ cin;
    assign cout = (input_1 & input_2) | (cin & (~(input_1 ^ input_2)));

endmodule