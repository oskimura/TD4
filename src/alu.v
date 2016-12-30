module alu(ain, bin, c, out);
    input wire [3:0] ain,bin;
    output c;
    output wire [3:0] out;

    assign {c,out} = ain + bin;
endmodule