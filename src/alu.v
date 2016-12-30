module alu(ain, bin, out);
    input wire [3:0] ain,bin;
    output wire [3:0] out;

    assign out = ain + bin;
endmodule