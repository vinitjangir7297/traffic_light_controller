module traffic_light_modified(
input clk,
input rst,
output reg red,
output reg green,
output reg yellow
);
parameter S0=2'b00,S1=2'b01,S2=2'b10;
reg [1:0]state;
reg [1:0]next_state;
reg [2:0]count;
always@(posedge clk) begin
if(rst) begin 
count<=0;
state<=S0;
end
else begin
if(state==S0 && count==4 || state==S1 && count==4 || state==S2 && count==1)
count<=0;
else
count<=count+1;
state<=next_state;
end
end
always@(*) begin
next_state=state;
case(state)
S0: begin
if(count==4) begin
next_state=S1;
end
end
S1:begin
if(count==4) begin
next_state=S2;
end
end
S2:begin
if(count==1) begin
next_state=S0;
end
end
endcase
end
always@(*)begin
red=0;
yellow=0;
green=0;
case(state)
S0: red=1;
S1: green=1;
S2: yellow=1;
endcase
end
endmodule
