`timescale 1ns / 1ps
//------------------------------------------------------------------------------
// Maintainance:    HITwh NSCSCC TEAM
// Engineer:        RickyTino
// 
// Create Date:     2019/03/28
// Manager Name:    RickyTino
// Module Name:     simu
// Project Name:    miniMIPS
//
// Revision:
// Revision 0.01 - File Created
//
// Additional Comments:
// - Comments:      SPC
// - Shout 666:     Ar
//
// - USED AS SIMULATION
//------------------------------------------------------------------------------
module simu();

    reg          clk;
    reg          reset;
    reg  [15: 0] switch;
    reg  [ 3: 0] keys;
    wire [15: 0] led;
    wire [ 7: 0] ca;
    wire [ 3: 0] an;

    Basys3_Top test
    (
        .clk    ( clk       ),
        .reset  ( reset     ),
        .switch ( switch    ),
        .keys   ( keys      ),
        .led    ( led       ),
        .ca     ( ca        ),
        .an     ( an        )
    );

    initial begin
        clk    = 0;
        reset  = 1;
        switch = 0;
        keys   = 0;

        #100
        reset  = 0;
        switch = 16'd2; //2*4+3=b
        #100
        switch = 16'd3; //3*4+3=f
    end

    always #5 clk = ~clk;

endmodule
