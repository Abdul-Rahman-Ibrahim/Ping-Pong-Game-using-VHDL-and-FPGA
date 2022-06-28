----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:22:13 05/23/2022 
-- Design Name: 
-- Module Name:    Lab4 - Behavioral 
-- Project Name: Ping Pong Game with LEDs
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;
entity Ping_Pong is
    Port ( User1 : in  STD_LOGIC;
           User2 : in  STD_LOGIC;
          MCLK : in STD_LOGIC;
          RST: in STD_LOGIC;
           L : out  STD_LOGIC_VECTOR(9 DOWNTO 0);
           Left_player_score : out std_logic_vector(3 downto 0);
          Right_player_score : out std_logic_vector(3 downto 0));
end Ping_Pong;
architecture Behavioral of Ping_Pong is
signal User1_score: std_logic_vector(3 downto 0) := "0000"; 
	signal User2_score: std_logic_vector(3 downto 0) := "0000";
	signal LEDS: std_logic_vector(9 downto 0) := "1000000000";
	signal Right_flag: std_logic := '1';
begin
		process(MCLK,RST,User1,User2)
		begin
		if RST = '1' then
			LEDS <= "1000000000";
			Right_flag <= '1';
		elsif rising_edge(MCLK) then
			LEDS(9) <= (not Right_flag) and LEDS(8);
			LEDS(8) <= (Right_flag and LEDS(9)) or (not Right_flag and LEDS(7));
			LEDS(7) <= (Right_flag and LEDS(8)) or (not Right_flag and LEDS(6));
			LEDS(6) <= (Right_flag and LEDS(7)) or (not Right_flag and LEDS(5));
			LEDS(5) <= (Right_flag and LEDS(6)) or (not Right_flag and LEDS(4));
			LEDS(4) <= (Right_flag and LEDS(5)) or (not Right_flag and LEDS(3));
			LEDS(3) <= (Right_flag and LEDS(4)) or (not Right_flag and LEDS(2));
			LEDS(2) <= (Right_flag and LEDS(3)) or (not Right_flag and LEDS(1));
			LEDS(1) <= (Right_flag and LEDS(2)) or (not Right_flag and LEDS(0));
			LEDS(0) <= (Right_flag and LEDS(1));
			Right_flag <= (Right_flag and (LEDS(9) or LEDS(8) or LEDS(7) or LEDS(6) or LEDS(5) or LEDS(4) or LEDS(3) or LEDS(2))) or (not Right_flag and LEDS(8));
			if(User1 = '1' and LEDS = "1000000000") then
				User1_score <= User1_score + 1;
			end if;
			
			if(User2 = '1' and LEDS = "0000000001") then
				User2_score <= User2_score + 1;
			end if;
			
		--end if;
		L <= LEDS;
		Left_player_score <= User1_score;
		Right_player_score <= User2_score;
		end if;	
	   end process;	
end Behavioral;

