module td4(clk,inp,outp);
    input clk;
    input inp;
    output outp;

    wire [3:0] ch0,ch1,ch2,ch3;
    wire [3:0] addr;

    wire [3:0] a;

    wire [7:0] memdata;

    wire [3:0] alu_out;
    wire [3:0] ld;

    reg cflag;
    wire cflga_r;

    register areg(.in(alu_out),.ld(ld[0]),.clk(clk),.out(ch0));
    register breg(.in(alu_out),.ld(ld[1]),.clk(clk),.out(ch1));
    register creg(.in(alu_out),.ld(ld[2]),.clk(clk),.out(ch2));
    counter pc(.in(alu_out),.ld(ld[3]),.clk(clk),.out(addr));

    mem mem_u(.addr(addr),.out(memdata));

    wire [1:0] sel;

    wire [3:0] op,im;
    assign op = memdata[7:4];
    assign im = memdata[3:0];
    dataselector dataselector_u(.sel(sel),.c0(ch0),.c1(ch1),.c2(ch2),.c3(ch3),.y(a));

    
    alu alu_u(.ain(a), .bin(im), .c(cflag_r), .out(alu_out));

    always @(cflag_r) begin   
        cflag = cflag_r;
    end

    decorder decorder_u(.op(op),.c(cflag),.sel(sel),.ld(ld));


endmodule