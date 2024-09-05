LIBRARY ieee ;
USE ieee.std_logic_1164.all ;
ENTITY switch_led IS
PORT(mySW : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
     myLEDR : OUT STD_LOGIC_VECTOR(9 DOWNTO 0)
    );
END switch_led;
ARCHITECTURE Behavior OF switch_led IS
BEGIN
	myLEDR <= mySW;
END Behavior;
