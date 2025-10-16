module tb();
reg w0,w1,clk,reset;
wire L;
FSM DUT(w0,w1,clk,reset,L);

initial begin   //getting output plus setting up gtkwave
$dumpfile("wave.vcd");
$dumpvars(0,tb);
end

initial begin//setting up the clock
clk=1'b0;
forever #5 clk=~clk;
end


initial begin//actual testing

$monitor($time,"  w0=%b,w1=%b.state=%b,L=%b   ",w0,w1,DUT.state,L);

reset=0;//FOr setting initial state to S0
w0=0;w1=0;//making sure that all buttons are not pressed
#10;
reset=1;

//trying to get L=1/state=S3
w0=1;#10;w0 =0;#10; //trying to simulate a button press
w1=1;#10;w1=0;#10;
w1=1;#10;w1=0;#10;//i am adding #10 delays so that the change can be caught on the clock cycle
//now trying random cases
w0=1;#10;w0 =0;#10;
w1=1;#10;w1=0;#10;
w1=0;#10;w1=0;#10;

w1=1;#10;w0 =0;#10; 
w1=1;#10;w1=0;#10;
w1=1;#10;w1=0;#10;


#20 $finish;
end

endmodule
