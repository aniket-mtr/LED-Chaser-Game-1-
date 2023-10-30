module testbench_LED_Game;

  // Inputs
  reg clk;
  reg reset;
  reg start_game;
  reg [2:0] button;

  // Outputs
  wire [3:0] led;
  wire game_over;

  // Instantiate the LED_Game module
  LED_Game uut (
    .clk(clk),
    .reset(reset),
    .start_game(start_game),
    .button(button),
    .led(led),
    .game_over(game_over)
  );

  // Clock generation
  always begin
    #10 clk = ~clk; // Toggle the clock every 5 time units (adjust as needed)
  end

  // Initializations
  initial begin

  // Specify the VCD file
  $dumpfile("project.vcd");

  // Dump the signals you want to monitor
  $dumpvars(0, testbench_LED_Game); 

    // Initialize inputs
    clk = 0;
    reset = 1;
    start_game = 0;
    button = 0;
    
    // Reset the module
    reset = 0;
    #10 reset = 1;

    // Start the game
    start_game = 1;
    #10 start_game = 0;

    // Simulate game
    button = 0;
    #100 button = 1;
    #50 button = 2;
    #60 button = 2;
    #30 button = 3;
    #40 button = 3;

    // Finish the simulation
    $finish;
  end

  // Monitor game_over
  always @(game_over) begin
    if (game_over)
      $display("Game over!");
    else
      $display("Game in progress...");
  end

  // Dump VCD output
  initial begin
    $dumpfile("simulation_results.vcd");
    $dumpvars(0, testbench_LED_Game);
  end

endmodule
