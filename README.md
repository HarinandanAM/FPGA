# FPGA

## SwitchToLED
    LIBRARY ieee ;
		USE ieee.std_logic_1164.all ;
		ENTITY lab1_1 IS
		PORT(mySW : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
			  myLEDR : OUT STD_LOGIC_VECTOR(9 DOWNTO 0)
			 );
		END lab1_1;
		ARCHITECTURE Behavior OF lab1_1 IS
		BEGIN
			myLEDR <= mySW;
		END Behavior; 
# FSM SEQUENCE DETECTOR
## SEQUENCE : 00 01 11 10

    library IEEE;
    use IEEE.STD_LOGIC_1164.ALL;

    entity fsmlock is
    Port (
      clk  : in  STD_LOGIC;
      din1 : in  STD_LOGIC;
      din2 : in  STD_LOGIC;
      rst  : in  STD_LOGIC;
      dout : out STD_LOGIC
      );
    end fsmlock;

    architecture Behavioral of fsmlock is
      type state is (strst, st1, st2, st3, st4);
      signal present_state, next_state : state;
    begin
    synchronous_process: process (clk, rst)
    begin
        if rising_edge(clk) then
            if (rst = '1') then
                present_state <= strst;
            else
                present_state <= next_state;
            end if;
        end if;
    end process;

    output_decoder : process(present_state, din1, din2)
    begin
        case (present_state) is
            when strst =>
                if (din1 = '0' and din2 = '0') then
                    next_state <= st1;
                else
                    next_state <= strst;
                end if;
            when st1 =>
                if (din1 = '0' and din2 = '1') then
                    next_state <= st2;
                else
                    next_state <= st1;
                end if;
            when st2 =>
                if (din1 = '1' and din2 = '1') then
                    next_state <= st3;
                else
                    next_state <= st2;
                end if;
            when st3 =>
                if (din1 = '1' and din2 = '0') then
                    next_state <= st4;
                else
                    next_state <= st3;
                end if;
            when st4 =>
                if (din1 = '1' and din2 = '0') then
                    next_state <= st4;
                else
                    next_state <= strst;
                end if;
            when others =>
                next_state <= strst;
        end case;
    end process;

    next_state_decoder : process(present_state)
    begin
        case present_state is
            when strst =>
                dout <= '0';
            when st1 =>
                dout <= '0';
            when st2 =>
                dout <= '0';
            when st3 =>
                dout <= '0';
            when st4 =>
                dout <= '1';
            when others =>
                dout <= '0';
        end case;
    end process;

    end Behavioral;
