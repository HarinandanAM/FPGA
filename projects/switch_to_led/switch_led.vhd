LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY switch_led IS  
  PORT(mySW : IN STD_LOGIC_VECTOR(9 DOWNTO 0);         -- Input: Switches (10-bit)
       myLEDR : OUT STD_LOGIC_VECTOR(9 DOWNTO 0)       -- Output: LEDs (10-bit)
  );
END switch_led;

ARCHITECTURE Behavior OF switch_led IS
 BEGIN
  myLEDR <= mySW;
END Behavior;
