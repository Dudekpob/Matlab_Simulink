function [xx] = Read_OPC_Func(y)
% variables
persistent init_Nodes;
persistent uaClient;
persistent Var_Node_In;
persistent Var_Node_Out;
persistent testVal;
persistent velocity;
persistent aptitute;
persistent temp;
persistent setpoint;
persistent pitch;

% initialize variables
%if (isempty(init_Server))
   testVal = 0;
   init_Nodes  = 0;
%end
% OPC UA server (PLC) address and connecting client (Simulink) to the
% server

    uaClient = opcua('localhost',4840);                
    connect(uaClient);                                    

% define variable nodes in the server
if uaClient.isConnected == 1 
    init_Nodes  = 1;
    Var_Node_Out = opcuanode(4,'|var|CODESYS Control Win V3 x64.Application.GVL',uaClient);
    % read out the variables of the OPC UA server
    Var_Node_In = opcuanode(4,'|var|CODESYS Control Win V3 x64.Application.GVL',uaClient);
end
% read and write variables of the server
if uaClient.isConnected == 1 && init_Nodes == 1
    % read "fanForce" value from server and store in "val"
    aptitute =  readValue(uaClient, Var_Node_In.Children(1,1));
    velocity =  readValue(uaClient, Var_Node_In.Children(1,6));
    setpoint =  readValue(uaClient, Var_Node_In.Children(1,4));
    pitch =  readValue(uaClient, Var_Node_In.Children(1,2));
    %val = readValue(uaClient, velocity);
    % assign input y of the function to "currentAngle" variable
    writeValue(uaClient, Var_Node_Out.Children(1,1), y(2));   
     writeValue(uaClient, Var_Node_Out.Children(1,2), y(4)); 
    % assign "val" to variable "testVal"

    
end
% assign "fanForce" ("testVal") value to the output x of the function
vel = double(velocity);
apt = double(aptitute);
setp = double(setpoint);
pit = double(pitch);
xx = [vel,apt,setp,pit];
end