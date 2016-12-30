module decorder(op,c,sel,ld);
    input [3:0] op;
    input c;
    output [1:0] sel;
    output [3:0] ld;

    reg [3:0] load;
    reg [1:0] select;

    always @(op) begin      
        case (op) 
            // ADD,A,Im
            4'b0000 : load<=4'b1110; 
            // MOV A,B
            4'b0001: load=4'b1110; 
            // IN A
            4'b0010: load=4'b1110;
            // MOV A,Im
            4'b0011: load=4'b1110;
            
            // MOV B,A
            4'b0100: load=4'b1101; 
            // MOV B,Im
            4'b0101: load=4'b1101; 
            // IN B
            4'b0110: load=4'b1101; 
            // MOV B,Im
            4'b0111: load=4'b1101; 

            // OUT B
            4'b1001: load=4'b1011; 
            // OUT Im
            4'b1011: load=4'b1011; 

            // JMC
            4'b1110:  if(c==0) begin 
                        // JMC(C=0) 
                            load=4'b0111; 
                        end 
                        else begin
                        // JMC(C=1) 
                            load=4'b1111; 
                        end
            // JMP
            4'b1111: load=4'b0111;
        endcase
    end

    always @(op) begin      
        case (op) 
            // ADD,A,Im
            4'b0000 : select<=2'b00;
            // MOV A,B
            4'b0001: select=2'b01;
            // IN A
            4'b0010:  select=2'b10;
            // MOV A,Im
            4'b0011: select=2'b11;
            
            // MOV B,A
            4'b0100:  select=2'b00;
            // MOV B,Im
            4'b0101:  select=2'b01;
            // IN B
            4'b0110:  select=2'b10;
            // MOV B,Im
            4'b0111: select=2'b11;

            // OUT B
            4'b1001: select=2'b11;
            // OUT Im
            4'b1011: select=2'b11;

            // JMC
            4'b1110:  if(c==0) begin 
                            // JMC(C=0) 
                            select=2'b11;
                        end 
                        else begin
                            // JMC(C=1) 
                            select=2'bxx;
                        end
            // JMP
            4'b1111: select=2'b11;
    endcase end
    
    assign ld=load;
    assign sel=select;
endmodule