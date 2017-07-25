module PulseTimer(INCLK,HALTN,CLK,PCLK);
input INCLK,HALTN;
output CLK,PCLK;
reg[3:0] count;
always@(posedge INCLK)
begin
begin
case(count[3:0])
4'b0001:begin count=4'b0011; end
4'b0011:begin count=4'b0101; end
4'b0101:begin count=4'b1000; end
4'b1000:begin count=4'b1100; end
4'b1100:begin count=4'b0000; end
4'b0000:begin count=4'b0001; end
default:count=4'b0001;
endcase
end
end
assign CLK=count[0]&HALTN;
assign PCLK=count[1]&HALTN;

endmodule 