# FPGA

## SwitchToLED

  
# FSM SEQUENCE DETECTOR
## SEQUENCE : 00 01 11 10

    library IEEE; -- This line tells the compiler where to find standard functions and definitions.

    use IEEE.STD_LOGIC_1164.ALL; -- This line includes standard logic types and operations.

    entity fsmlock is -- This declares the entity 'fsmlock' with its ports.
    Port (
         clk  : in  STD_LOGIC; -- Input port for clock signal.
        din1 : in  STD_LOGIC; -- Input port for din1 signal.
        din2 : in  STD_LOGIC; -- Input port for din2 signal.
        rst  : in  STD_LOGIC; -- Input port for reset signal.
        dout : out STD_LOGIC  -- Output port for dout signal.
    );
    end fsmlock;

    architecture Behavioral of fsmlock is -- This begins the    architecture block for the entity 'fsmlock'.
    type state is (strst, st1, st2, st3, st4); -- This defines a custom type 'state' with possible values.

    signal present_state, next_state : state; -- These signals hold the current and next state values.

    begin
    -- Synchronous process for state transition
    synchronous_process: process (clk, rst) -- This is a process sensitive to clk and rst signals.
    begin
        if rising_edge(clk) then -- If it's a rising edge of the clock...
            if (rst = '1') then -- If reset is active...
                present_state <= strst; -- Set present_state to starting state.
            else		 
                present_state <= next_state; -- Update present_state with next_state.
            end if;                
        end if;
    end process;

    -- Combinational process for state transition logic
    output_decoder : process(present_state, din1, din2) -- This process updates next_state based on present_state and inputs.
    begin
        case (present_state) is  -- Based on the current state...
            when strst => -- If in starting state...
                if (din1 = '0'and din2= '0') then -- If both inputs are low...
                    next_state <= st1; -- Move to state 1.
                else
                    next_state <= strst; -- Stay in starting state.
                end if;
            when st1 => -- If in state 1...
                if (din1 = '0'and din2= '1') then -- If din1 is low and din2 is high...
                    next_state <= st2; -- Move to state 2.
                else
                    next_state <= st1; -- Stay in state 1.
                end if;
            when st2 => -- If in state 2...
                if (din1 = '1'and din2= '1') then -- If both inputs are high...
                    next_state <= st3; -- Move to state 3.
                else
                    next_state <= st2; -- Stay in state 2.
                end if;
            when st3 => -- If in state 3...
                if (din1 = '1'and din2= '0') then -- If din1 is high and din2 is low...
                    next_state <= st4; -- Move to state 4.
                else
                    next_state <= st3; -- Stay in state 3.
                end if; 
            when st4 => -- If in state 4...
                if (din1 = '1'and din2= '0') then -- If din1 is high and din2 is low...
                    next_state <= st4; -- Stay in state 4.
                else
                    next_state <= strst; -- Go back to starting state.
                end if;
            when others => -- For any other state...
                next_state <= strst; -- Go back to starting state.
        end case;
    end process; 

    -- Combinational process for output logic
    next_state_decoder : process(present_state) -- This process sets the output based on the current state.
    begin
        case present_state is  -- Based on the current state...
            when strst => -- If in starting state...
                dout <= '0'; -- Output low.
            when st1 => -- If in state 1...
                dout <= '0'; -- Output low.
            when st2 => -- If in state 2...
                dout <= '0'; -- Output low.
            when st3 => -- If in state 3...
                dout <= '0'; -- Output low.
            when st4 => -- If in state 4...
                dout <= '1'; -- Output high.
            when others => -- For any other state...
                dout <= '0'; -- Output low.
        end case;
    end process;

    end Behavioral;



