`timescale 1ns / 1ps

module clock_divider(clock_in, clock_out, sec_in);
    input clock_in, sec_in;
    output reg clock_out;

    reg [27:0] counter = 28'd0;
    parameter DIVISOR = 28'd50000000; // the DIVISOR should be 50,000,000
    
    always @ (posedge clock_in)
    begin
    counter <= counter + 28'd1;
    
    if (counter >= (DIVISOR - 1))
        counter <= 28'd0;
        clock_out <= (counter < DIVISOR / 2) ? 1'b1 : 1'b0;
    end
endmodule




module remaining_seconds(clock_out, sec_in, sec_out);
    input clock_out;
    input [5:0] sec_in;
    output [5:0] sec_out;
    wire [5:0] remaining_sec;

    assign remaining_sec = sec_in;

    always @ (posedge clock_out)
        remaining_sec <= remaining_sec - 1;
        sec_out <= remaining_sec;
endmodule

