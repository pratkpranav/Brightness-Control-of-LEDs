----------------------------------------------------------------------------------
-- Company:
-- Engineer:
-- 
-- Create Date:    18:51:10 09/04/2019
-- Design Name:
-- Module Name:    pract - Behavioral
-- Project Name:
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity pract is
port(
clk : in STD_LOGIC;
button : in STD_LOGIC;
vec: in STD_LOGIC_vector(3 downto 0);
outpwm : out STD_LOGIC_vector(15 downto 0);
A : out STD_LOGIC;
B : out STD_LOGIC;
C : out STD_LOGIC;
D: out STD_LOGIC;
E : out STD_LOGIC;
F : out STD_LOGIC;
G : out STD_LOGIC;
A0 : out STD_LOGIC;
A1 : out STD_LOGIC;
A2 : out STD_LOGIC;
A3 : out STD_LOGIC

);
end pract;

architecture Behavioral of pract is


Signal t : STD_LOGIC_vector(25 downto 0);
signal twentyfiveHzclock : STD_LOGIC ;
signal fourhundredHzclock : STD_LOGIC ;
signal s : STD_LOGIC_vector(12 downto 0);
signal countertwentyfive : STD_LOGIC_vector(4 downto 0);
signal counterfourhundred : STD_LOGIC_vector(4 downto 0);
signal counterinput : STD_LOGIC_vector(4 downto 0);
signal checkforinvert : STD_LOGIC ;
signal temp : STD_LOGIC_vector(4 downto 0);
signal i : STD_LOGIC_vector(3 downto 0);
signal d_tmp : std_logic_vector(15 downto 0);
signal              D0  : std_logic; 
signal             D1  :  std_logic; 
signal       D10 :    std_logic; 
signal             D11 :    std_logic; 
signal             D12 :    std_logic; 
signal             D13 :    std_logic; 
signal             D14 :    std_logic; 
signal             D15 :    std_logic; 
signal             D2  :    std_logic; 
signal             D3  :    std_logic; 
signal             D4  :    std_logic; 
signal             D5  :    std_logic; 
signal             D6  :    std_logic; 
signal             D7  :    std_logic; 
signal             D8  :    std_logic; 
 signal            D9  :    std_logic;
signal     P_tmp : std_logic_vector(15 downto 0);
signal              P0  : std_logic; 
signal             P1  :  std_logic; 
signal       P10 :    std_logic; 
signal             P11 :    std_logic; 
signal             P12 :    std_logic; 
signal             P13 :    std_logic; 
signal             P14 :    std_logic; 
signal             P15 :    std_logic; 
signal             P2  :    std_logic; 
signal             P3  :    std_logic; 
signal             P4  :    std_logic; 
signal             P5  :    std_logic; 
signal             P6  :    std_logic; 
signal             P7  :    std_logic; 
signal             P8  :    std_logic; 
 signal            P9  :    std_logic;
begin

Process(button,clk,t,twentyfiveHzclock)
begin
if(button = '1') then

    if(clk'event and clk='1' ) then
        t <= t+1 ; 
        if(t = "10111110101111000010000000") then
            twentyfiveHzclock <= not twentyfiveHzclock;
            t<="00000000000000000000000000";
        end if;

    end if;
end if;
end process;


Process(button,clk,s,fourhundredHzclock)
begin
if(button = '1') then

    if(clk'event and clk='1' ) then
        s <= s+1 ;
        if(s =      "1100001101010") then
            fourhundredHzclock <= not fourhundredHzclock;
            s <=    "0000000000000";
        end if;

    end if;
end if;
end process;
Process(button,twentyfiveHzclock,checkforinvert,countertwentyfive)
begin
    if(button='1' ) then
        if(twentyfiveHzclock'event and twentyfiveHzclock='1') then
                
                    if(countertwentyfive = "01110") then
                        checkforinvert <= '1';
								end if;
							if(countertwentyfive = "00001") then
								checkforinvert <= '0';
								end if;
							if (checkforinvert = '0') then
								countertwentyfive <= countertwentyfive +1;
                    elsif(checkforinvert = '1') then
								countertwentyfive <= countertwentyfive -1;
						  end if;
        end if;
    end if;
end process;

Process(button,fourhundredHzclock,counterfourhundred,clk,counterinput,vec)
begin
    if(button='1') then
        if(fourhundredHzclock'event and fourhundredHzclock='1') then
                counterfourhundred <= counterfourhundred + 1;
                    if(counterfourhundred = "10001") then
                        counterfourhundred <= "00000";

                    end if;
                    if(counterfourhundred < countertwentyfive) then
                        outpwm <= "1111111111111111";
                    else
                        outpwm <= "0000000000000000";
                    end if;
        end if;
    end if;
    if(button = '0') then
        if(clk'event and clk='1') then
            counterinput <= counterinput + 1 ;
            if(counterinput = "10000") then
                counterinput <= "00000";
            end if;
        if(counterinput< vec ) then
            outpwm <= "1111111111111111";
        else
            outpwm <= "0000000000000000";
        end if;
    end if;
    end if;
end process;

Process(button,countertwentyfive,clk,temp,i)
begin
 if (button = '1') then
 
	temp <= countertwentyfive ;
	

	i(0) <= temp(0);
	i(1) <= temp(1);
	i(2) <= temp(2);
	i(3) <= temp(3);
	
	end if;
end process;

Process(button , i ,vec, clk,d_tmp,D0,D1,D2,D3,D4,D5,D6,D7,D8,D9,D10,D11,D12,D13,D14,D15,P_tmp,P0,P1,P2,P3,P4,P5,P6,P7,P8,P9,P10,P11,P12,P13,P14,P15)
begin

if(button ='1') then

if(clk'event and clk='1') then
case i is 
      when "0000" => d_tmp <= "0000000000000001";
      when "0001" => d_tmp <= "0000000000000010";
      when "0010" => d_tmp <= "0000000000000100";
      when "0011" => d_tmp <= "0000000000001000";
      when "0100" => d_tmp <= "0000000000010000";
      when "0101" => d_tmp <= "0000000000100000";
      when "0110" => d_tmp <= "0000000001000000";
      when "0111" => d_tmp <= "0000000010000000";
      when "1000" => d_tmp <= "0000000100000000";
      when "1001" => d_tmp <= "0000001000000000";
      when "1010" => d_tmp <= "0000010000000000";
      when "1011" => d_tmp <= "0000100000000000";
      when "1100" => d_tmp <= "0001000000000000";
      when "1101" => d_tmp <= "0010000000000000";
      when "1110" => d_tmp <= "0100000000000000";
      when "1111" => d_tmp <= "1000000000000000";
      when others => NULL;
      end case;
		
    D15 <= d_tmp(15);
    D14 <= d_tmp(14);
    D13 <= d_tmp(13);
    D12 <= d_tmp(12);
    D11 <= d_tmp(11);
    D10 <= d_tmp(10);
    D9  <= d_tmp(9);
    D8  <= d_tmp(8);
    D7  <= d_tmp(7);
    D6  <= d_tmp(6);
    D5  <= d_tmp(5);
    D4  <= d_tmp(4);
    D3  <= d_tmp(3);
    D2  <= d_tmp(2);
    D1  <= d_tmp(1);
    D0  <= d_tmp(0);
	 
	 A <= D1 OR D4 OR D11 OR D13;
	 B <= D5 OR D6 OR D11 OR D12 OR D14 OR D15;
	 C <= D2 OR D12 OR D14 OR D15;
	 D <= D1 OR D4 OR D7 OR D10 OR D15;
	 E <= D1 OR D3 OR D4 OR D5 OR D7 OR D9 ;
	 F <= D1 OR D2 OR D3 OR D7 OR D13 ;
	 G <= D0 OR D1 OR D7 OR D12 ;
	 A0 <= D0 AND NOT D0;
	 A1 <= D1 OR NOT D1;
	 A2 <= D2 OR NOT D2;
	 A3 <= D3 OR NOT D3;
	 end if;
	 end if;


if(button = '0') then
case vec is 

      when "0000" => P_tmp <= "0000000000000001";
      when "0001" => P_tmp <= "0000000000000010";
      when "0010" => P_tmp <= "0000000000000100";
      when "0011" => P_tmp <= "0000000000001000";
      when "0100" => P_tmp <= "0000000000010000";
      when "0101" => P_tmp <= "0000000000100000";
      when "0110" => P_tmp <= "0000000001000000";
      when "0111" => P_tmp <= "0000000010000000";
      when "1000" => P_tmp <= "0000000100000000";
      when "1001" => P_tmp <= "0000001000000000";
      when "1010" => P_tmp <= "0000010000000000";
      when "1011" => P_tmp <= "0000100000000000";
      when "1100" => P_tmp <= "0001000000000000";
      when "1101" => P_tmp <= "0010000000000000";
      when "1110" => P_tmp <= "0100000000000000";
      when "1111" => P_tmp <= "1000000000000000";
      when others => NULL;
      end case;
		
    P15 <= P_tmp(15);
    P14 <= P_tmp(14);
    P13 <= P_tmp(13);
    P12 <= P_tmp(12);
    P11 <= P_tmp(11);
    P10 <= P_tmp(10);
    P9  <= P_tmp(9);
    P8  <= P_tmp(8);
    P7  <= P_tmp(7);
    P6  <= P_tmp(6);
    P5  <= P_tmp(5);
    P4  <= P_tmp(4);
    P3  <= P_tmp(3);
    P2  <= P_tmp(2);
    P1  <= P_tmp(1);
    P0  <= P_tmp(0);
	 
	 A <= P1 OR P4 OR P11 OR P13;
	 B <= P5 OR P6 OR P11 OR P12 OR P14 OR P15;
	 C <= P2 OR P12 OR P14 OR P15;
	 D <= P1 OR P4 OR P7 OR P10 OR P15;
	 E <= P1 OR P3 OR P4 OR P5 OR P7 OR P9 ;
	 F <= P1 OR P2 OR P3 OR P7 OR P13;
	 G <= P0 OR P1 OR P7 OR P12 ;
	 A0 <= P10 AND NOT P10;
	 A1 <= P10 OR NOT P10;
	 A2 <= P10 OR NOT P10;
	 A3 <= P10 OR NOT P10;

	 end if;
end process;

end Behavioral;

