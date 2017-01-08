module rom(addr,out);
    input [3:0] addr;
    output reg [7:0] out;
   
    always @(addr) begin
        case (addr) 
            4'b0000: out=8'b10110111; // out 5

//1           
            4'b0001: out=8'b00000001; // add a 1
            //2
            4'b0010: out=8'b11100001; // jnc 1

//3
            4'b0011: out=8'b00000001; // add a 1
            //4
            4'b0100: out=8'b11100011; // jnc 3

//5
            4'b0101: out=8'b10110110; // out 6
            //6
            4'b0110: out=8'b00000001; // add a 1
            //7
            4'b0111: out=8'b11100110; // jnc 6

//8
            4'b1000: out=8'b00000001; // add a 1
            //9
            4'b1001: out=8'b11101000; // jnc 8

            //10
            4'b1010: out=8'b10110000; // out 0
            //11
            4'b1011: out=8'b10110100; // out 4
            //12
            4'b1100: out=8'b00000001; // add a 1
            //13
            4'b1101: out=8'b11101010; // jnc 10

//14
            4'b1110: out=8'b10111000; // out 8
            //15
            4'b1111: out=8'b11111111; // jmp 15
        endcase
    end
 
endmodule
