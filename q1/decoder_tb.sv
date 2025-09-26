module decoder_tb;

  // Testbench signals
  logic [3:0] binary;
  logic [15:0] one_hot;

  // Instantiate the decoder module
  decoder uut (
    .binary(binary),
    .one_hot(one_hot)
  );

  initial begin
        $display("=== Testing 4-bit One-Hot Decoder ===");
        $display("Time\tBinary\tOne-Hot");
        $display("-----------------------------------");
        
        // Test all possible input combinations
        for (int i = 0; i < 16; i++) begin
            binary = i;
            #10;
            $display("%0t\t%b\t%b", $time, binary, one_hot);
            
            // Verify output correctness
            if (one_hot != (1 << i)) begin
                $error("Error: binary=%b, expected one_hot=%b, got one_hot=%b", 
                       binary, (1 << i), one_hot);
            end
        end
        
        // Boundary tests
        $display("\n=== Boundary Tests ===");
        binary = 4'b0000; #10;
        $display("Min: binary=%b, one_hot=%b", binary, one_hot);
        
        binary = 4'b1111; #10;
        $display("Max: binary=%b, one_hot=%b", binary, one_hot);
        
        $display("\n=== Test Complete ===");
        $finish;
    end
endmodule
