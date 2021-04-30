[top]
components : pedestrian

[pedestrian]
type : cell
width : 12
height : 10
delay : transport
defaultDelayTime : 100
border : nowrapped 
neighbors : pedestrian(-1,-1) pedestrian(-1,0) pedestrian(-1,1) 
neighbors : pedestrian(0,-2) pedestrian(0,-1) pedestrian(0,0)  pedestrian(0,1) pedestrian(0,2)
neighbors : pedestrian(1,-1)  pedestrian(1,0)  pedestrian(1,1)
initialvalue : 0
initialrowvalue :  0	011000110010
initialrowvalue :  3	020202020202
initialrowvalue :  5	202020202020
initialrowvalue :  7	020202020202
localtransition : pedestrian-rule


[pedestrian-rule]
%cells moving down (right)

%If cell is occupied and cell in front is not, then "move" (vacate cell) 
rule : 0 100 { (0,0) = 1 and (1,0) = 0 }	
%If cell is empty and cell behind is occupied, then "move" into (occupy cell)			
rule : 1 100 { (-1,0) = 1 and (0,0) = 0 }				


%cell has an obstacle, pedestrian must move right or left:

%If cell to bottom left is obstacle, and adjacent cell is occupied, move into 'this' cell
rule : 1 100 { (0,0) = 0 and (0,-1) = 1 and (1,-1) = 2}	
%If cell to bottom right is obstacle, and adjacent cell is occupied or an obstacle, move into 'this' cell
rule : 1 100 { (0,0) = 0 and (0,1) = 1 and (0,2) >= 1 and (1,1) = 2} 


%Default rules:

%If completely blocked, stay put
rule : 1 100 { (0,0) = 1 and (0,-1) = 2 and (1,0) = 2 and (0,1) = 2}
%If cell is an obstacle, stay an obstacle
rule : 2 100 {(0,0) = 2}								
rule : 0 100 { t }

