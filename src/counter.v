module counter(in,ld,clk,out);
    input [3:0] in;
    input ld;
    input clk;
    output [3:0] out;

    reg [3:0] cnt;
    always @(posedge clk) begin
        if (ld==0) begin
            cnt <= in;
        end else begin
            cnt <= cnt+1; 
        end 
    end
    assign out = cnt;

endmodule