clc 
clear all
load exampleMaps.mat
% Create the reference binary occupancy map using simpleMap with a resolution of 1. Show the figure
% and save the handle of the figure.
refMap = binaryOccupancyMap(simpleMap,1);
refFigure = figure('Name','SimpleMap');
show(refMap);
[mapdimx,mapdimy] = size(simpleMap);
map = binaryOccupancyMap(mapdimy,mapdimx,10);
mapFigure = figure('Name','Unknown Map');
show(map);
diffDrive = differentialDriveKinematics("VehicleInputs","VehicleSpeedHeadingRate");
controller = controllerPurePursuit('DesiredLinearVelocity',2,'MaxAngularVelocity',3);
sensor = rangeSensor;
sensor.Range = [0,10];
path = [4 6; 6.5 12.5; 4 22; 12 14; 22 22; 16 12; 20 10; 14 6; 22 3];
figure(refFigure);
hold on
plot(path(:,1),path(:,2), 'o-');
hold off
controller.Waypoints = path;
initPose = [path(1,1) path(1,2), pi/2];
goal = [path(end,1) path(end,2)]';
poses(:,1) = initPose';
exampleHelperDiffDriveCtrl(diffDrive,controller,initPose,goal,refMap,map,refFigure,mapFigure,sensor)

