module syncCount #(parameter horizontalLow = 96, horizontalEnd = 800, verticalLow = 2, verticalEnd = 525)
          (input logic clk,
           input logic en,
			  input logic reset,
           output logic [6:0] currentPixel,
			  output logic [6:0] currentRow,
			  output logic horizontalPulseResult,
			  output logic verticalPulseResult);
  always_ff @(posedge clk)
    begin
      if(reset) 
		begin
		  currentPixel <=0;
		  currentRow <=0;
		end
		
	   else if(en)
	   begin
		  currentPixel <= currentPixel + 1;
		  currentRow <= currentRow + 1;
		end
		
		else if(currentPixel >= horizontalEnd)
		  begin
		    if(currentRow >= verticalEnd)
		      begin
				 currentRow <= 0;
				end
		    currentPixel <=0;
		  end
	 end
  assign horizontalPulseResult = !(currentPixel <= horizontalLow);
  assign verticalPulseResult = !(currentRow <= verticalLow);
endmodule