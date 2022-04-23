module fpga_timer(
    input[5:0] seconds,
    input clock, pause, start, restart,
    output [6:0] digit0, digit1
);

    wire div_clock;
    wire [5:0] count;
    clock_divider div0 (.clock_in(clock), .clock_out(div_clock));
    SSD_decoder s0 = (.secs(count), .clk(div_clock), .rst(restart), .sec0(digit0), .sec1(digit1));
    countdown c0 (.clock(div_clock), .seconds(seconds), .countdown(count), .pause(pause), .start(start), .restart(restart));


endmodule