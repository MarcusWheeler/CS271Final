module counter #(parameter N = 19, M = 450000)
          (input logic clk,
           input logic en,
			  input logic reset,
           output logic [N-1:0] q,
			  output logic result);
  always_ff @(posedge clk)
    begin
      if(reset) q <=0;
	   else if(en) q <= q + 1;
		result = (q == (M-1));
	 end
endmodule