// Koch snowflake
// by John Costello 29/07/2020
//
int t=0;
float recursionLimitLength;

void setup()
{
   background(212);
   size(800,800);
   frameRate(2);
}  

void draw()
{
   background(212);
   if(t==0){recursionLimitLength=729;}
   else if(t==1){recursionLimitLength=243;}
   else if(t==2){recursionLimitLength=81;}
   else if(t==3){recursionLimitLength=27;}
   else if(t==4){recursionLimitLength=9;}
   kochFractal(100,570,700,570);
   kochFractal(700,570,400,50);
   kochFractal(400,50,100,570);
   if(++t==5){t=0;}   
}  

void kochFractal(float xa, float ya, float xd, float yd)
{
   float len=sqrt((xd-xa)*(xd-xa)+(yd-ya)*(yd-ya));
   if(len<recursionLimitLength)
   {
      line(xa,ya,xd,yd);
   }
   else
   {
      float xb=xa+(xd-xa)/3.;
      float yb=ya+(yd-ya)/3.;
      float xc=xa+(xd-xa)*2./3.;
      float yc=ya+(yd-ya)*2./3.;
      float xm=xa+(xd-xa)/2.;
      float ym=ya+(yd-ya)/2.;
      float sineTheta=(yd-ya)/len;
      float cosineTheta=(xd-xa)/len;
      float xk=xm-(len/3.)*(sqrt(3)/2.)*sineTheta;
      float yk=ym+(len/3.)*(sqrt(3)/2.)*cosineTheta;
      
      kochFractal(xa,ya,xb,yb);
      kochFractal(xb,yb,xk,yk);
      kochFractal(xk,yk,xc,yc);
      kochFractal(xc,yc,xd,yd);
   }  
}   
