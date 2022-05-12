module irComparator #(N = 15, M = 28125)
                   (input logic [N-1:0] lowCount,
						  output logic equalToM);
  assign equalToM = !(lowCount == M);
endmodule
