module RR_arbiter(input clk,rst,input [15:0] req,output [15:0] gnt);
 reg [15:0] gnt_d,gnt_nxt;
 reg [3:0]  RR_0 ;
 reg [3:0]  RR_1 ;
 reg [3:0]  RR_2 ;
 reg [3:0]  RR_3 ;
 reg [3:0]  RR_4 ;
 reg [3:0]  RR_5 ;
 reg [3:0]  RR_6 ;
 reg [3:0]  RR_7 ;
 reg [3:0]  RR_8 ;
 reg [3:0]  RR_9 ;
 reg [3:0]  RR_10;
 reg [3:0]  RR_11;
 reg [3:0]  RR_12;
 reg [3:0]  RR_13;
 reg [3:0]  RR_14;
 reg [3:0]  RR_15;
assign gnt = gnt_d;
 reg [3:0] req_vec_rr[0:15],req_vec_rr_d[0:15],gnt_won,gnt_last; 

 always@(posedge clk or posedge rst) begin 
   if(rst) begin
     gnt_d <= #0 0; 
     gnt_last <= #0 0;
   end else begin 
              gnt_d <= #1 gnt_nxt;
              gnt_last <= #1 (gnt_nxt==0) ? gnt_last : gnt_nxt;
            end
 end

// calculate nxt grant vector
always @(*) begin 
 // gnt_nxt = 15'h0000;
 // gnt_won = 4'b0000;

  gnt_nxt = 16'h0000;
  gnt_won = 4'b0000;
  case(1) 
   req[req_vec_rr[0]] : begin 
                          gnt_nxt[req_vec_rr[0]]=1'b1;
                          gnt_won = req_vec_rr[0];
                        end
   req[req_vec_rr[1]] : begin 
                          gnt_nxt[req_vec_rr[1]]=1'b1;
                          gnt_won = req_vec_rr[1];
                        end
   req[req_vec_rr[2]] : begin 
                          gnt_nxt[req_vec_rr[2]]=1'b1;
                          gnt_won = req_vec_rr[2];
                        end
   req[req_vec_rr[3]] : begin 
                          gnt_nxt[req_vec_rr[3]]=1'b1;
                          gnt_won = req_vec_rr[3];
                        end
   req[req_vec_rr[4]] : begin 
                          gnt_nxt[req_vec_rr[4]]=1'b1;
                          gnt_won = req_vec_rr[4];
                        end
   req[req_vec_rr[5]] : begin 
                        gnt_nxt[req_vec_rr[5]]=1'b1;
                          gnt_won = req_vec_rr[5];
                        end
   req[req_vec_rr[6]] : begin 
                        gnt_nxt[req_vec_rr[6]]=1'b1;
                          gnt_won = req_vec_rr[6];
                        end
   req[req_vec_rr[7]] : begin 
                        gnt_nxt[req_vec_rr[7]]=1'b1;
                          gnt_won = req_vec_rr[7];
                        end
   req[req_vec_rr[8]] : begin 
                        gnt_nxt[req_vec_rr[8]]=1'b1;
                          gnt_won = req_vec_rr[8];
                        end
   req[req_vec_rr[9]] : begin 
                        gnt_nxt[req_vec_rr[9]]=1'b1;
                          gnt_won = req_vec_rr[9];
                        end
   req[req_vec_rr[10]] : begin 
                        gnt_nxt[req_vec_rr[10]]=1'b1;
                          gnt_won = req_vec_rr[10];
                        end
   req[req_vec_rr[11]] : begin 
                        gnt_nxt[req_vec_rr[11]]=1'b1;
                          gnt_won = req_vec_rr[11];
                         end
   req[req_vec_rr[12]] : begin 
                         gnt_nxt[req_vec_rr[12]]=1'b1;
                          gnt_won = req_vec_rr[12];
                         end
   req[req_vec_rr[13]] : begin 
                         gnt_nxt[req_vec_rr[13]]=1'b1;
                          gnt_won = req_vec_rr[13];
                         end
   req[req_vec_rr[14]] : begin 
                         gnt_nxt[req_vec_rr[14]]=1'b1;
                          gnt_won = req_vec_rr[14];
                         end 
   req[req_vec_rr[15]] : begin 
                         gnt_nxt[req_vec_rr[15]]=1'b1;
                          gnt_won = req_vec_rr[15];
                         end
 endcase

/* gnt_nxt[req_vec_rr[0]] = req[req_vec_rr[0]]; 
for (integer i=1;i<16;i++) begin 
   gnt_nxt[req_vec_rr[i]] = req[req_vec_rr[i]] & ~req[req_vec_rr[i-1]];
     
end */

end

/*always @(*) begin 
   //$display(" time: %t thread executed %0h",$realtime,req);
   for(integer i=0;i<16;i++) begin 
   req_vec_rr_d[i] = req_vec_rr[i];
   end
    
   if(gnt_nxt!=0) begin 
   req_vec_rr_d[0] = (gnt_won==15)?0:gnt_won+1;
   for(integer i=1;i<16;i++) begin 
    //req_vec_rr_d[i]=req_vec_rr[(i+1)%16];
   req_vec_rr_d[i] = (req_vec_rr_d[i-1]==15)?0:(req_vec_rr_d[i-1]+1);
   //$write("req_vec_rr_d[%0d] %0h ",i,req_vec_rr_d[i]);
   end
   end
end*/

always @(*) begin 
   for(integer i=0;i<16;i++) begin 
   req_vec_rr_d[i] = req_vec_rr[i];
   end
    
   if(gnt_nxt!=0) begin 
   //req_vec_rr_d[0] = (gnt_won==15)?0:gnt_won+1;
   //for(integer i=1;i<16;i++) begin 
   //req_vec_rr_d[i] = (req_vec_rr_d[i-1]==15)?0:(req_vec_rr_d[i-1]+1);
   //end
     case(gnt_won)
       0: req_vec_rr_d = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,0};
       1: req_vec_rr_d = {2,3,4,5,6,7,8,9,10,11,12,13,14,15,0,1};
       2: req_vec_rr_d = {3,4,5,6,7,8,9,10,11,12,13,14,15,0,1,2};
       3: req_vec_rr_d = {5,6,7,8,9,10,11,12,13,14,15,0,1,2,3,4};
       4: req_vec_rr_d = {6,7,8,9,10,11,12,13,14,15,0,1,2,3,4,5};
       5: req_vec_rr_d = {7,8,9,10,11,12,13,14,15,0,1,2,3,4,5,6};
       6: req_vec_rr_d = {8,9,10,11,12,13,14,15,0,1,2,3,4,5,6,7};
       7: req_vec_rr_d = {9,10,11,12,13,14,15,0,1,2,3,4,5,6,7,8};
       8: req_vec_rr_d = {10,11,12,13,14,15,0,1,2,3,4,5,6,7,8,9};
       9: req_vec_rr_d = {11,12,13,14,15,0,1,2,3,4,5,6,7,8,9,10};
      10: req_vec_rr_d = {12,13,14,15,0,1,2,3,4,5,6,7,8,9,10,11};
      11: req_vec_rr_d = {13,14,15,0,1,2,3,4,5,6,7,8,9,10,11,12};
      12: req_vec_rr_d = {14,15,0,1,2,3,4,5,6,7,8,9,10,11,12,13};
      13: req_vec_rr_d = {15,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14};
      14: req_vec_rr_d = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15};
     endcase
   end
end

// RR  maintain req vector
 always @(posedge clk or posedge rst) begin
   if(rst) begin 
        for(integer i=0;i<16;i++) begin 
          req_vec_rr[i]=i;   
        end
   end else begin 
        for(integer i=0;i<16;i++) begin 
             req_vec_rr[i] = req_vec_rr_d[i]; 
        end
            end
    
 end

always @(*) begin 
 RR_0 =req_vec_rr[0];
 RR_1 =req_vec_rr[1];
 RR_2 =req_vec_rr[2];
 RR_3 =req_vec_rr[3];
 RR_4 =req_vec_rr[4];
 RR_5 =req_vec_rr[5];
 RR_6 =req_vec_rr[6];
 RR_7 =req_vec_rr[7];
 RR_8 =req_vec_rr[8];
 RR_9 =req_vec_rr[9];
 RR_10=req_vec_rr[10];
 RR_11=req_vec_rr[11];
 RR_12=req_vec_rr[12];
 RR_13=req_vec_rr[13];
 RR_14=req_vec_rr[14];
 RR_15=req_vec_rr[15];
 end

endmodule 
