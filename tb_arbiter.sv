`timescale 1ns/10ps

module tb_arbiter();
   reg [15:0] req,i;
   reg [15:0] gnt;
   reg clk,rst;
 
   default clocking @(posedge clk);
            
   endclocking 

   RR_arbiter arb(clk,rst,req,gnt);
   
   initial begin
    clk = 0;
    forever clk = #5 ~clk;
   end

   initial begin
    rst = 0; req = 0;i=1; ##1;
    rst = 1;
    ##10; #4;
    rst = 0;
    ##10;
    repeat(100) begin
      @(negedge clk);
       i   = {i[14:0],i[15]};
       req = i++;
      //req = $urandom()%16;
    end

    $finish;
   end 

   initial begin 
     $dumpfile("verilog.vcd");
     $dumpvars(3,tb_arbiter); 
   end

endmodule 
