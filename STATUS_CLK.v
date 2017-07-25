module STATUS_CLK(FI,SRC,DST,EXC,FI0,SRC0,DST0,EXC0,CLK);
input FI0,SRC0,DST0,EXC0,CLK;
output FI,SRC,DST,EXC;
reg FI=1,SRC=0,DST=0,EXC=0;
always@(negedge CLK)
begin
if(FI0==1)
begin
FI=1;
DST=0;
EXC=0;
SRC=0;
end
else if(DST0==1)
begin
FI=0;
DST=1;
EXC=0;
SRC=0;
end
else if(SRC0==1)
begin
FI=0;
DST=0;
EXC=0;
SRC=1;
end
else if(EXC0==1)
begin
FI=0;
DST=0;
EXC=1;
SRC=0;
end
else 
begin
FI=FI;
DST=DST;
EXC=EXC;
SRC=SRC;
end
end
endmodule 