`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.06.2026 00:10:31
// Design Name: 
// Module Name: tb_traffic_controller
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_traffic_controller(

    );
    reg clk,reset;
    wire red,green,yellow;
    wire [1:0] state_out;
    
    traffic_light_controller dut(clk,reset,red,green,yellow,state_out);
    
    initial begin
        clk=0;
        reset=1;
        end
        
        always #10 clk=~clk;
        
    initial begin
        #15 reset=0;
        #150;
        $finish;
        end
        
        initial $monitor("t=%0t clk=%b reset=%b red=%b green=&b yellow=%b state_out=%b",$time,clk,reset,red,green,yellow,state_out);
endmodule
