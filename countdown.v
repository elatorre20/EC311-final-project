module CntDwn(input clock, input[5:0]seconds, output[5:0]countdown);
    input pause, start, restart;
    reg[5:0]dif=0;//Difference

    case (pause_start)
        (pause == 1): state = 1;
        (start == 1): state = 2;
        (restart == 1): state = 3;
        default: state = 1;
    endcase

    always@(posedge clock)
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