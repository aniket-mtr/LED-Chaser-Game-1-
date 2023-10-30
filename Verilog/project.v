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
