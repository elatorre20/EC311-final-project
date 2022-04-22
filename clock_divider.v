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



module CntDwn(input clock_out, input[4:0]seconds, output[4:0]countdown);
    input pause, start, restart;
    reg[4:0]dif=0;//Difference

    case (pause_start)
        (pause == 1): state = 1;
        (start == 1): state = 2;
        (restart == 1): state = 3;
        default: state = 1;
    endcase

    always@(posedge clock_out)
    if (state == 1)
        assign countdown = countdown;

    else if (state == 2)
    begin
        if(dif==seconds)
            dif<=0;
        else
            dif<=dif+1;
        assign countdown=cd-dif;
    end

    else if (state == 3)
        assign countdown = seconds;
endmodule



// the 'reset' button should start the system from the initial state
// I guess the inputs should be initialized too
