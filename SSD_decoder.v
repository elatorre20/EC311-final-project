module SSD_decoder(
);
    input [5:0] hrs,mins,secs;
    input ampm, clk, rst;
    output [6:0] hr0, hr1, min0, min1, sec0, sec1; //connected to the SSD decoders
    output pmlight;

    //digit outputs and registers
    reg [6:0] h0, h1, m0, m1, s0, s1; 
    assign hr0 = h0;
    assign hr1 = h1;
    assign min0 = m0;
    assign min1 = m1;
    assign sec0 = s0;
    assign sec1 = s1;
    assign pmlight = ampm; //am/pm indicator

    //digit bitmask constant definitions, assuming top A numbering
    reg [6:0] digits [0:9];
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

    always @ (posedge clk) begin
        if (rst == 1) begin //reset
            {h0, h1, m0, m1, s0, s1} = 0;
        end
        else begin //cases for each digit
            case (hrs-(hrs%10))//hours digit 0
                10      : h0 = digits[1];
                default : h0 = digits[0];
            endcase
            case (hrs%10)//hours digit 1
                0 : h1 = digits[0];
                1 : h1 = digits[1];
                2 : h1 = digits[2];
                3 : h1 = digits[3];
                4 : h1 = digits[4];
                5 : h1 = digits[5];
                6 : h1 = digits[6];
                7 : h1 = digits[7];
                8 : h1 = digits[8];
                9 : h1 = digits[9];
            endcase
        end
    end

endmodule