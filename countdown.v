module CntDwn(clock_1hz, seconds, countdown, pause, start, restart, reset);
    input clock_1hz;

    input [5:0] seconds
    output reg [5:0] countdown // 6 bit input/output
    countdown <= seconds;

    input pause, start, restart, reset; // buttons

    reg [5:0] dif = 0; // difference
    reg state;
    state <= 1; // default state is pause

    always@(posedge clock_1hz)
    begin
        if (pause == 1) // when 'pause' button pressed
            state <= 1;
        else if (start == 1) // when 'start' button pressed
            state <= 2;
        else if (restart == 1) // when 'restart' button pressed
            state <= 3;
        else if (reset == 1) // when 'reset' button pressed
            state <= 4;



        if (seconds == 0)
            assign countdown = 0; // when timer 0, remain 0

        else if (state == 1)
            assign countdown = countdown; // timer paused

        else if (state == 2)
        begin
            if (dif == seconds)
                dif <= 0;
            else
                dif <= dif + 1;
            assign countdown = seconds - dif; // timer -1 every seconds
        end

        else if (state == 3)
            assign countdown = seconds; // timer to initial input

        else if (state == 4)
            assign countdown = 0; // clear output
    end
endmodule


