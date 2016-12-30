module dataselector(sel,c0,c1,c2,c3,y);
input [1:0] sel;
input [4:0] c0,c1,c2,c3;
output y;

reg out;
always @(sel) begin
    case (sel) 
    2'b00: out=c0;
    2'b01: out=c1;
    2'b10: out=c2;
    2'b11: out=c3; 
    endcase
end

assign y=out;

endmodule