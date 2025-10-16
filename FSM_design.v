//                    FSM Modelling example for Checking if a door is locked or unlocked using a 3bit pin 011

module FSM(
input w0,w1,clk,reset,
output  L
);
//wire[1:0] t;

reg [1:0] state,next_state;

parameter S0=2'b00,S1=2'b01,S2=2'b10,S3=2'b11;


always@(posedge clk,negedge reset)begin
if(reset==0)  state<=S0;
else state<=next_state;
end


always @(*) begin//next state logic
    case(state)
        S0: if(w0) next_state = S1; else if(w1) next_state = S0; else next_state = S0;
        S1: if(w0) next_state = S1; else if(w1) next_state = S2; else next_state = S1;
        S2: if(w0) next_state = S1; else if(w1) next_state = S3; else next_state = S2;
        S3: if(w0) next_state = S1; else if(w1) next_state = S0; else next_state = S3;
        default: next_state = S0;
    endcase
end

//here state is just a 2 bit value
assign L=&state;          //IF L=0, it means the door is locked,if L=1 door is unlocked


endmodule
