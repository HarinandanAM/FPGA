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