module counter(clk,out);
    input clk;
    output [3:0] out;

    reg [3:0] cnt;
    always @(posedge clk) begin
        cnt <= cnt+1;  
    end
    assign out = cnt;
    
endmodule