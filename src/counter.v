module counter(in,ld,clk,out);
    input [15:0] in;
    input ld;
    input clk;
    output [15:0] out;

    reg [15:0] cnt;
    always @(posedge clk or ld or in) begin
        if (ld==0) begin
            cnt <= in;
        end else begin
            cnt <= cnt+1; 
        end 
    end
    assign out = cnt;

endmodule