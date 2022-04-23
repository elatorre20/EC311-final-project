module SSD_decoder(
    input [5:0] secs,
    input clk, rst,
    output [6:0]sec0, sec1, //connected to the SSD decoders
);
    

    //digit outputs and registers
    reg [6:0] s0, s1; 
    assign sec0 = s0;
    assign sec1 = s1;

    //digit bitmask constant definitions, assuming top A numbering
    reg [6:0] digits [9:0];

    always @ (posedge clk) begin
        digits[0] = 7'b1111110;
        digits[1] = 7'b0110000;
        digits[2] = 7'b1101101;
        digits[3] = 7'b1111001;
        digits[4] = 7'b0110011;
        digits[5] = 7'b1011011;
        digits[6] = 7'b1011111;
        digits[7] = 7'b1110000;
        digits[8] = 7'b1111111;
        digits[9] = 7'b1111011;
        if (rst == 1) begin //reset
            {s0, s1} = 0;
        end
        else begin //cases for each digit
            case (secs-(secs%10))//seconds digit 0
                10      : s0 = digits[1];
                20      : s0 = digits[2];
                30      : s0 = digits[3];
                40      : s0 = digits[4];
                50      : s0 = digits[5];
                60      : s0 = digits[5];
                default : s0 = digits[0];
            endcase
            case (secs%10)//seconds digit 1
                0 : s1 = digits[0];
                1 : s1 = digits[1];
                2 : s1 = digits[2];
                3 : s1 = digits[3];
                4 : s1 = digits[4];
                5 : s1 = digits[5];
                6 : s1 = digits[6];
                7 : s1 = digits[7];
                8 : s1 = digits[8];
                9 : s1 = digits[9];
            endcase
        end
    end

endmodule
