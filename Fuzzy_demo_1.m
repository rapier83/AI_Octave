a=newfis('tipper');


a=addvar(a,'input','service',[0 10]);
a=addvar(a,'input','food',[0 10]);
a=addvar(a,'output','tip',[0 30]);

a=addmf(a,'input',1,'poor','gaussmf',[1.5 0]);
a=addmf(a,'input',1,'good','gaussmf',[1.5 5]);
a=addmf(a,'input',1,'excellent','gaussmf',[1.5 10]);
a=addmf(a,'input',2,'rancid','trapmf',[-2 0 1 3]);
a=addmf(a,'input',2,'delicious','trapmf',[7 9 10 12]);
a=addmf(a,'output',1,'cheap','trimf',[0 5 10]);
a=addmf(a,'output',1,'average','trimf',[10 15 20]);
a=addmf(a,'output',1,'generous','trimf',[20 25 30]);

ruleList=[ ...
  1 1 1 1 2
  2 0 2 1 1
  3 2 3 1 2 ];
a=addrule(a,ruleList);

showfis(a);
showrule(a);
evalfis([1 2], a);
evalfis([3 5; 2 7], a);
gensurf(a);