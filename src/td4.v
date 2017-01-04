module td4(reset,clk,inp,outp);
    input reset;
    input clk;
    input [3:0] inp;
    output [3:0] outp;

    wire [3:0] ch0,ch1,ch2,ch3;
    wire [3:0] addr;

    wire [3:0] a;

    wire [7:0] memdata;

    wire [3:0] alu_out;
    wire [3:0] ld;

    reg cflag;
    wire cflga_r;

    wire [1:0] sel;

    assign outp = ch2;
    wire [3:0] op,im;

    mem mem_u(.addr(addr),.out(memdata));
    assign ch3=4'b0000;

    register areg(.reset(reset),.in(alu_out),.ld(ld[0]),.clk(clk),.out(ch0));
    register breg(.reset(reset),.in(alu_out),.ld(ld[1]),.clk(clk),.out(ch1));
    register creg(.reset(reset),.in(alu_out),.ld(ld[2]),.clk(clk),.out(outp));
    counter pc(.reset(reset),.in(alu_out),.ld(ld[3]),.clk(clk),.out(addr));

    assign op = memdata[7:4];
    assign im = memdata[3:0];
    dataselector dataselector_u(.sel(sel),.c0(ch0),.c1(ch1),.c2(inp),.c3(ch3),.y(a));
   
    alu alu_u(.ain(a), .bin(im), .c(cflag_r), .out(alu_out));

    always @(cflag_r or reset) begin
    always @(posedge clk  or reset) begin
        if (!reset) begin
            cflag = 1'b0;
        end
        else begin   
            cflag = cflag_r;
        end
    end

    decorder decorder_u(.op(op),.c(cflag),.sel(sel),.ld(ld));


endmodule