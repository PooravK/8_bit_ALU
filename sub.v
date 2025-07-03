module sub(
    input [7:0]input_1,
    input [7:0]input_2,
    output [7:0]sub_out,
    output sub_overflow
    );
    wire boutconnect;
    wire [3:0]zero_out;
    wire [3:0]one_out;
    wire [3:0]final_upperdiff;
    wire bout_zero;
    wire bout_one;
    wire [7:0]input2_comp;

    assign input2_comp = ~(input_2);

    sub4bit outer_module(
        .input_1(input_1[3:0]),
        .input_2(input2_comp[3:0]),
        .diff(sub_out[3:0]),
        .bin(1),
        .bout(boutconnect)
    );
    sub4bit zero_module(
        .input_1(input_1[7:4]),
        .input_2(input2_comp[7:4]),
        .diff(zero_out),
        .bin(1),
        .bout(bout_zero)
    );
    sub4bit one_module(
        .input_1(input_1[7:4]),
        .input_2(input2_comp[7:4]),
        .diff(one_out),
        .bin(1),
        .bout(bout_one)
    );

    assign final_upperdiff = (boutconnect)?one_out:zero_out;
    assign sub_overflow = (boutconnect)?bout_one:bout_zero;
    assign sub_out[7:4] = final_upperdiff;

endmodule

module sub4bit(
    input [3:0]input_1,
    input [3:0]input_2,
    input bin,
    output [3:0]diff, bout
    );
    wire connect1;
    wire connect2;
    wire connect3;

    sub1bit instance1(
        .input_1(input_1[0]),
        .input_2(input_2[0]),
        .diff(diff[0]),
        .bout(connect1)
    );
    sub1bit instance2(
        .input_1(input_1[1]),
        .input_2(input_2[1]),
        .diff(diff[1]),
        .bin(connect1),
        .bout(connect2)
    );
    sub1bit instance3(
        .input_1(input_1[2]),
        .input_2(input_2[2]),
        .diff(diff[2]),
        .bin(connect2),
        .bout(connect3)
    );
    sub1bit instance4(
        .input_1(input_1[3]),
        .input_2(input_2[3]),
        .diff(diff[3]),
        .bin(connect3),
        .bout(bout)
    );

endmodule

module sub1bit(
    input input_1, input_2, bin,
    output diff, bout
    );

    assign diff = input_1 ^ input_2 ^ bin;
    assign bout = (~input_1 & input_2) | (bin & (~input_1 ^ input_2));

endmodule