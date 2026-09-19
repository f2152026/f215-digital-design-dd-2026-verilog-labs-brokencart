module tb;
  reg [1:0] t_A; reg [1:0] t_B;
  wire t_GT; wire t_LT; wire t_EQ;

  comp2 DUT (
    .A (t_A),
    .B (t_B),
    .GT (t_GT),
    .LT (t_LT),
    .EQ (t_EQ)
  );

  // Waveform dump configuration (DO NOT CHANGE)
  string vcd_file;
  initial begin
    if ($value$plusargs("vcd=%s", vcd_file)) begin
      $dumpfile(vcd_file);
      $dumpvars(0, DUT);
    end
  end

  initial begin
    t_A = 2'd0; t_B = 2'd1;
    #5 t_A = 2'd3; t_B = 2'd2;
    #5 t_A = 2'd1; t_B = 2'd1;
  end

  initial
    $monitor($time, " A=%b B=%b | GT=%b LT=%b EQ=%b", t_A, t_B, t_GT, t_LT, t_EQ); // change as required

endmodule
