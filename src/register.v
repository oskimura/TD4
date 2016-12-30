module register(in,ld,clk,out);
  input [3:0] in;
  input ld;
  input clk;
  output [3:0] out;

  reg [3:0] mem;
  always @(posedge clk) begin
    if (ld==0) begin
      mem = in;
    end 
    else begin
      mem = mem;
    end
  end
  assign out = mem;

endmodule