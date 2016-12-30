module mem(addr,out);
    input [3:0] addr;
    output [7:0] out;
    reg [7:0] memory[15:0];

    reg [7:0] buff;
    always @(addr) begin
      buff = memory[addr];
    end
    assign out = buff;

endmodule