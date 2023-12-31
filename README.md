# LED Chaser Game
*This repository contains everything related to our project on the LED Chaser Game , ranging from Verilog Code and Logisim to theoretical descriptions.*
<br><br>
<h2><b>Team Details</b></h3>
<details>
  <summary>Detail</summary>
  <br> <b>Semester: </b>3rd Sem B.Tech CSE<br><br>
  <b>Section: </b>1<br><br>
  <b>Member-1: </b>ANIKET MAITRA, 221CS109, am.221cs109@nitk.edu.in <br><br>
  <b>Member-2: </b>DIVYANSHU MANOJBHAI SURTI, 221CS157, surtidivanshumanojbhai.221cs17@nitk.edu.in <br><br>
  <b>Member-3: </b>HARSHITHA GOLLAPALLI, 221CS124, gollpalliharshitha.221cs124@nitk.edu.in <br>
</details>
<h2><b>Abstract</b></h1>
<details>
  <summary>Detail</summary><br>
  <b>IDEA</b><br><br>
In this project we aim to design a circuit in which we set up 3 columns of 
LED’s, then we generate light signals in those LED’s in a random manner 
and keep three special LEDs marked in the bottom. 
The game is all about when any of those special LED’s light up then we must 
press a corresponding push-button switch. This switch must be pressed within a 
very short period of time after the LED lights up. 
If it is pressed within the limited period of time then the game continues, else it 
stops.<br><br>

  *COMPONENTS*

1. JK flip flop 
2. Clock 
3. AND gates 
4. Hex display decoder 
5. Two bit counter 
6. Two bit Splitter 
7. Push Button 
8. LEDs

*INSTRUCTIONS/RULES FOR THE GAME*

First enable the simulation in Logism by pressing ctrl+E. 
Second set the reset button high to start the game. 
Now according to the convenience of the user select that tick frequency. 
The rules of the game are that whenever the last LED in any column blinks we 
must press the button corresponding to that column. If we do so in a specific 
correct time limit then the counter increases our score otherwise the counter 
does not increase our score. To stop the game press ctrl+R. This stops the 
simulation. 
To play again start from the beginning of instructions/rules.

*MOTIVATION AND BACKGROUND*

The basic idea of the game is to keep the player continuously engaged 
and test his/her reflex action till he/she makes a mistake. 
This game can really help to sharpen the reflex action of a person. 
Another motivation for creating this game is keeping Formula-1 
drivers and table tennis players in mind. They need to have extremely 
sharp reflexes to excel in their respective sport.

*CONTRIBUTION*

1.Aniket Maitra
Came up with the idea of the game using LEDs and 
the idea of setting a time frame within which the 
user must press the button and overall design of the 
hardware model.

2. Surti Divyanshu
Came up with the idea of terminating the game 
by lighting up all LEDs when the game gets over 
and hardware requirments for the project.

3.Harshitha Gollapalli
Helped to fix errors in the brainstorming session 
and recommended better set of hardware 
components
</details>
<h2><b>Working</b></h2>
<details>
  <summary>Detail</summary>
  <br>
<h2 align="center"><b>FUNCTIONAL TABLE</b></h2>
<br>
<table align="center">
  <tr>
    <td align="center"><b>COMPONENTS</b></td>
    <td align="center"><b>WORKING/ROLE</b></td>
  </tr>
  <tr>
    <td align="center">Generation of signals to light up LEDs using JK flip flops</td>
    <td align="center">
        The triggering of JK flip flops leads to toggling outputs which further leads to the sequential glowing of LEDs in a pattern. One JK flip flop 
        influences the input of the other JK flip flops in the same sequence for a 
        particular column with synchronized clock pulse. So we have repeated the same 
        combination of JK flip flops for all three columns, but in a random manner which is 
         dependent on the reset button of the JK flip flop. Whenever we want to 
        start the game, we have to toggle the reset button at different clock time to 
        randomize the pattern. </td>
  </tr>
  <tr>
    <td align="center">Usage of 4 input AND gates</td>
    <td align="center">One 4 input AND gate is used as an input to the clear pins of the JK flip flops to reset them to zero.
        The other 4 input AND gates help to transfer randomized signals from the flip flops to the LEDS as they are connected from the flip flop
        outputs to the LEDs.</td>
        
  </tr>
  <tr>
    <td align="center">Usage of 2 input AND gates</td>
    <td align="center">2 input AND gates take the input from the 4 input AND gates and the push-button switches. If the push-button and the LED (coming from
        4 input AND gate) is high at the same time, the counter is increased since the output of the 2 input AND gate is high. But we make sure that counter is increased 
        only in case of the special LED buttons being pressed.</td>
        
  </tr>
  <tr>
    <td align="center">Usage of Bit Counter</td>
    <td align="center"> Whenever the user enters the correct 
        combination for the correct led the output of the particular column AND gate 
        becomes high. 
        Whenever the output of AND gate is high the input of counter will increase by 
        one according to the clock which is applied on it. 
        To display the output of that counter we use another hex display decoder and a 
        reset button to reset the counter whenever we want to stop the game.</td>
  </tr>
  <tr>
    <td align="center">Usage of Bit Splitter</td>
    <td align="center">The counter data output is 8 bit and the hex display decoder input is 
        4 bit so we use bit splitter to display the number. We have used bit splitter 
        to fan in 8 bit input and fan out into 2 bit output for input of each decoder.</td>
  </tr>
  <tr>
    <td align="center">Simple push button switches</td>
    <td align="center">A Push button switch is used to take the input from the user while the LEDs are lighting up.</td>
  </tr>
  <tr>
    <td align="center">Clock for Flip Flops and Counter</td>
    <td align="center">Clock controls the basic sequence changing from 0 to 1 and vice versa on a 
        particular tick frequency given by a user. A 555 timer IC can be used to generate clock pulses</td>
  </tr>
</table>
<br><br>
<h2 align="center"><b>Flowchart</b></h2><br>

 <br>![Flowchart](https://github.com/aniket-mtr/LED-Chaser-Game-1-/assets/119874419/a2f6bcb2-516e-4fc5-aca2-2d0c6c1d0cc3) <br>
 
</details>
<h2><b>Logisim Circuit Diagram</b></h2>
<details>
  <summary>Detail</summary><br>
  
  ![Logisim](https://github.com/aniket-mtr/LED-Chaser-Game-1-/assets/119874419/0d383d18-6a68-4d9e-b95f-9c00f8ec9ce0)


</details>
<h2><b>Verilog Code</b></h2>
<details>
  <summary>Detail</summary><br>
  <b>Testbench</b> <br><br>

```
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
```


<b>Module File</b>

```
module LED_Game (
    input wire clk,              // Clock input
    input wire reset,            // Reset input
    input wire start_game,       // Start game signal
    input wire [2:0] button,     // Push-button inputs (3 buttons)
    output wire [3:0] led,       // LED outputs (4 columns)
    output wire game_over        // Game over signal
);

// Parameters
parameter MAX_COUNT = 25000000; // Set this to control the time limit (e.g., 1 second at 25 MHz)

// Internal registers
reg [3:0] special_led;  // Stores the index of the currently lit special LED (last row)
reg [3:0] led_pattern;  // Stores the LED pattern for each column
reg [31:0] count;        // Counter for timing

// Game state
reg game_started;  // Indicates whether the game is in progress
reg game_active;   // Indicates whether the game is active
reg game_won;      // Indicates if the player won the game

// State machine states
localparam IDLE = 2'b00;
localparam PLAYING = 2'b01;
localparam GAME_OVER = 2'b10;

// State register
reg [1:0] state;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        // Initialize the game
        game_started <= 0;
        game_active <= 0;
        game_won <= 0;
        special_led <= 4'b0000;
        led_pattern <= 4'b0000;
        count <= 0;
        state <= IDLE;
    end else begin
        case(state)
            IDLE: begin
                if (start_game) begin
                    // Start the game
                    game_started <= 1;
                    game_active <= 1;
                    state <= PLAYING;
                end
            end
            PLAYING: begin
                if (game_active) begin
                    if (count >= MAX_COUNT) begin
                        // Time's up - game over
                        game_active <= 0;
                        game_won <= 0;
                        state <= GAME_OVER;
                    end else if (button == special_led) begin
                        // Correct button pressed - move to the next LED
                        special_led <= special_led + 1;
                        count <= 0;
                        if (special_led == 4'b1111) begin
                            // Player won the game
                            game_active <= 0;
                            game_won <= 1;
                            state <= GAME_OVER;
                        end
                    end else begin
                        // Incorrect button pressed - game over
                        game_active <= 0;
                        game_won <= 0;
                        state <= GAME_OVER;
                    end
                end
            end
            GAME_OVER: begin
                if (!game_started || start_game) begin
                    // Reset the game
                    game_started <= 0;
                    game_active <= 0;
                    special_led <= 4'b0000;
                    led_pattern <= 4'b0000;
                    count <= 0;
                    state <= IDLE;
                end
            end
        endcase
    end
end

// LED and Button Logic
assign led = led_pattern;
assign game_over = (state == GAME_OVER);

always @(posedge clk) begin
    if (game_active) begin
        // Generate random LED pattern for columns
        led_pattern <= $random;
    end
end

always @(posedge clk) begin
    if (game_active) begin
        // Increment the count for timing
        count <= count + 1;
    end
end

endmodule

```
</details>
<br><br>
