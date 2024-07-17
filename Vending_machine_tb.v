module vending_machine_tb();
reg clk,rst; reg[1:0] in;
wire out; wire[1:0] change;

vending_machine dut(in,clk,rst,out,change);
    always #5 clk=~clk;
    initial
        begin
            clk=1;
            rst=1;
            #10 rst=0; in=2'b00;
            #10 in=2'b10;
            #10 in=2'b10;
            #10 rst=1;
            #10 rst=0; in=2'b01;
            #10 in=2'b01;
            #10 in=2'b00;
            #10 $finish;
        end
endmodule
