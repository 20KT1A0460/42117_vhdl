module clk;

reg sclk=1;
reg rclk=0;
always #5 sclk=~sclk;
always #277 rclk=~rclk;
integer c=0;
reg bclk=0;
reg data=0;
reg [10:0] frame= 11'b1111_1011_101;
integer tdiviser=100*10**6/(115200*16);
integer rdiviser=150*10**6/(115200*16);
integer tboudfq;
integer rboudfq;
reg updown=1;
always @(posedge sclk)begin
   tboudfq=100*10**6/tdiviser;
   rboudfq=150*10**6/rdiviser;
   
  if(c==tdiviser/2)begin
      bclk=~bclk;
      c=0;
  end

  else 
      c=c+1;

end

always @(posedge bclk)begin
  data=frame[0];
  frame=frame>>1;
end
initial #100000 $finish;
endmodule
