`timescale 1ns / 1ps

module clock_divider(clock_high_hz, clock_1hz, sec_in);
    input clock_high_hz, sec_in;
    output reg clock_1hz;

    reg [27:0] counter = 28'd0;
    parameter DIVISOR = 28'd50000000; // the DIVISOR should be 50,000,000
    
    always @ (posedge clock_high_hz)
    begin
    counter <= counter + 28'd1;
    
    if (counter >= (DIVISOR - 1))
        counter <= 28'd0;
        clock_1hz <= (counter < DIVISOR / 2) ? 1'b1 : 1'b0;
    end
endmodule

