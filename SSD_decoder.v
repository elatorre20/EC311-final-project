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
            case (mins-(mins%10))//minutes digit 0
                10      : m0 = digits[1];
                20      : m0 = digits[2];
                30      : m0 = digits[3];
                40      : m0 = digits[4];
                50      : m0 = digits[5];
                default : m0 = digits[0];
            endcase
            case (mins%10)//minutes digit 1
                0 : m1 = digits[0];
                1 : m1 = digits[1];
                2 : m1 = digits[2];
                3 : m1 = digits[3];
                4 : m1 = digits[4];
                5 : m1 = digits[5];
                6 : m1 = digits[6];
                7 : m1 = digits[7];
                8 : m1 = digits[8];
                9 : m1 = digits[9];
            endcase
            case (secs-(secs%10))//seconds digit 0
                10      : s0 = digits[1];
                20      : s0 = digits[2];
                30      : s0 = digits[3];
                40      : s0 = digits[4];
                50      : s0 = digits[5];
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