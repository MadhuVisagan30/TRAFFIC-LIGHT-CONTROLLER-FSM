`timescale 1ns / 1ps


module traffic_light_controller(input clk,reset,output reg red,green,yellow,output wire [1:0]state_out);

parameter RED=2'b00,GREEN=2'b01,YELLOW=2'b10;

reg [1:0] state,next_state;

always @(posedge clk or posedge reset)
    begin
        if(reset)
            state<=RED;
        else state<=next_state;
        end
        
always @(*)begin
    case(state)
        RED:next_state=GREEN;
        GREEN:next_state=YELLOW;
        YELLOW:next_state=RED;
        default:next_state=RED;endcase
        end
        
always @(*)begin
    red=0;
    green=0;
    yellow=0;
    
    case(state)
    RED: red=1;
    GREEN:green=1;
    YELLOW:yellow=1;
    default:red=1;endcase
end

assign state_out=state;
              
endmodule
