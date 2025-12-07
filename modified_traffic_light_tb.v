`timescale 1ns / 1ps
module modified_traffic_light_tb;
reg clk;
reg rst;
wire red;
wire green;
wire yellow;
traffic_light_modified uut(.clk(clk),.rst(rst),.red(red),.green(green),.yellow(yellow));
always #5 clk=~clk;
initial begin
clk=0;
rst=0;
rst=1; #20;
rst=0; #20;
rst=1; #10;
rst=0; #20;
#200;
$finish;
end
endmodule
