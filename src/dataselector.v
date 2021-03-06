module dataselector(sel,c0,c1,c2,c3,y);
input [1:0] sel;
input [3:0] c0,c1,c2,c3;
output [3:0] y;

reg [3:0] out;
always @(sel or c0 or c1 or c2 or c3) begin
    case (sel) 
    2'b00: out=c0;
    2'b01: out=c1;
    2'b10: out=c2;
    2'b11: out=c3; 
    endcase
end

assign y=out;

endmodule