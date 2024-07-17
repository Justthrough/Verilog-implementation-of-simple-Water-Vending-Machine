module vending_machine(in,clk,rst,out,change);
input[1:0] in; input clk,rst;
output reg out; output reg[1:0] change;

parameter s0=2'b00;    //Rs 0 state
parameter s1=2'b01;    //Rs 5 state
parameter s2=2'b10;    //Rs 10 state

reg[1:0] cur_state,next_state;
always @(posedge clk)
    begin
        if(rst)
        begin
            cur_state=0;
            next_state=0;
            out=0;
        end
        else
        begin
            cur_state=next_state;
            begin
                case(cur_state)
                s0: if(in==2'b00)              //s0 state
                    begin
                        out=0; change=0;
                        next_state=s0;
                    end
                    else if(in==2'b01)
                    begin
                        out=0; change=0;
                        next_state=s1;
                    end
                    else if(in==2'b10)
                    begin
                        out=0; change=0;
                        next_state=s2;
                    end
                s1: if(in==2'b00)               //s1 state
                    begin
                        out=0; change=2'b01;
                        next_state=s0;
                    end
                    else if(in==2'b01)
                    begin
                        out=0; change=0;
                        next_state=s2;
                    end
                    else if(in==2'b10)
                    begin
                        out=1; change=0;
                        next_state=s0;
                    end
                s2: if(in==2'b00)               //s2 state
                    begin
                        out=0; change=2'b10;
                        next_state=s0;
                    end
                    else if(in==2'b01)
                    begin
                        out=1; change=0;
                        next_state=s0;
                    end
                    else if(in==2'b10)
                    begin
                        out=1; change=2'b01;
                        next_state=s0;
                    end
               endcase
            end 
           end
         end


endmodule
