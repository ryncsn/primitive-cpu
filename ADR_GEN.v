module ADR_GEN(REG,MOD,RAD,IR,RA,RB,WA,WB,W_B_R,H_L_R);
input [15:0]IR;
//input 
input REG,MOD,RAD;
output RA,RB,WA,WB,W_B_R,H_L_R;
reg RA,RB,WA,WB,W_B_R,H_L_R;
always@(posedge REG, posedge MOD, posedge RAD)
begin
case({REG,MOD,RAD})
3'b100:
begin
if(IR[15:12]==4'b1011)
begin
W_B_R=IR[11];
H_L_R=IR[10];
RA<=IR[9];
WA=IR[9];
RB<=IR[8];
WB=IR[8];
end
else
begin
W_B_R=IR[8];
H_L_R=IR[5];
RA<=IR[4];
WA=IR[4];
RB<=IR[3];
WB=IR[3];
end
end
3'b010:
begin
W_B_R=IR[8];
H_L_R=IR[2];
RA<=IR[1];
WA=IR[1];
RB<=IR[0];
WB=IR[0];
end
3'b001:
begin
W_B_R=IR[8];
//TODO
end
default:
begin
W_B_R=W_B_R;
H_L_R=H_L_R;
RA=RA;
WA=WA;
RB=RB;
WB=WB;
end
endcase
end
endmodule
