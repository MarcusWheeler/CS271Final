module sorter #(parameter N = 5, M = 32)
                     (input logic [N-1:0] counter,
							 input logic fate,
							 input logic clock,
							 output logic [M-1:0] properBit);
  always @(posedge clock)
  properBit[counter] <= fate;
endmodule