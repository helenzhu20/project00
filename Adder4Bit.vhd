Library ieee;
Use ieee.std_logic_1164.all;

Entity ADDERS is
Port (
A, B: in std_logic_vector(3 downto 0);
CIN: in std_logic;
S: out std_logic_vector(3 downto 0);
CF, OVF: out std_logic
);
End ADDERS;

Architecture Adder1Bit of ADDERS is
Begin
Process(A,B,CIN)
variable c3: std_logic;
variable c4: std_logic;
variable count: integer;
Begin
c3 := '0';
c4 := '0';
for i in 0 to 3 loop
count := i;
S(i) <= A(i) XOR B(i) XOR CIN;
CF <= (A(i) and B(i)) or (A(i) and CIN) or (B(i) and CIN);
if(i = 2) then
c3 := (A(i) and B(i)) or (A(i) and CIN) or (B(i) and CIN);
elsif(i = 3) then
c4 := (A(i) and B(i)) or (A(i) and CIN) or (B(i) and CIN);
end if;
end loop;
OVF <= c3 xor c4;
End process;
End Adder1Bit;