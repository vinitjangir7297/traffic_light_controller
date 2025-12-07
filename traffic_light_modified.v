module traffic_light_modified(
input clk,
input rst,
output reg red,
output reg green,
output reg yellow
);
parameter S0=2'b00,S1=2'b01,S2=2'b10;
reg [1:0]state; // present state register
reg [1:0]next_state; //next state register
reg [2:0]count; //register for my count
always@(posedge clk) begin
if(rst) begin //on rst red light will glow and count becomes zero
count<=0;
state<=S0;
end
else begin
if((state==S0 && count==4) || (state==S1 && count==4) || (state==S2 && count==1)) begin  // condition for count to become 0 and when state will change
count<=0;
state<=next_state;
end
else 
count<=count+1;
end
end
always@(*) begin // always block for my combinational part that which will be my next state on count condition
next_state=state;
case(state)
S0: begin
if(count==4) // as given for red light after 5 cycle it gets off if rst is not there
next_state=S1;
else
next_state=S0;
end
S1:begin
if(count==4) // as given for green light after 5 cycle it gets off
next_state=S2;
else
next_state=S1;
end
S2:begin
if(count==1) // as given for yellow light after 2 cycle it gets off 
next_state=S0;
else
next_state=S2;
end
endcase
end
always@(*)begin // always block for my ouput part when & which light will be ON
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
