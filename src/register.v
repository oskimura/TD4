module register(reset,in,ld,clk,out);
  input reset;
  input [3:0] in;
  input ld;
  input clk;
  output [3:0] out;

  reg [3:0] mem=4'b000;
  always @(posedge clk or negedge reset) begin
    if(!reset) begin
       mem = 4'b0000;
    end else if(!ld)begin
      mem = in;
    end
  end 
  assign out = mem;

endmodule