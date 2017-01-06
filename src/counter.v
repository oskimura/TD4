module counter(reset, in,ld,clk,out);
    input reset;
    input [3:0] in;
    input ld;
    input clk;
    output [3:0] out;

    reg [3:0] cnt=4'b0000;
    always @(posedge clk or negedge reset) begin
        if (!reset) begin 
            cnt<= #1 4'b0000;
        end
        else if(ld==0) begin
            cnt<= #1 in;
        end 
        else begin
            cnt <= #1 cnt+1;
        end
    end
    assign out = cnt;

endmodule