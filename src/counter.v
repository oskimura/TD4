module counter(reset, in,ld,clk,out);
    input reset;
    input [3:0] in;
    input ld;
    input clk;
    output [15:0] out;

    reg [15:0] cnt;
    always @(posedge clk or negedge reset) begin
        if (!reset) begin 
            cnt<=4'b0000;
        end
        else if(ld==0) begin
            cnt<=in;
        end 
        else begin
            cnt <= cnt+1;
        end
    end
    assign out = cnt;

endmodule