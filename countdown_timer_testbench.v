`timescale 1ns / 1ps

module clock_divider_testbench;
    reg clock_in;
    wire clock_out;
    
    clock_divider testbench (.clock_in(clock_in), .clock_out(clock_out));
    
    initial begin
    clock_in = 0;
    
    forever #10 clock_in = ~clock_in;
    
    end
endmodule
