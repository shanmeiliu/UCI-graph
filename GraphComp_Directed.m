%M=dlmread('n10.txt')%Import Delimited Numeric Data
%M=dlmread('n100.txt');
%M=dlmread('n1000.txt');
M=dlmread('n10000.txt');

N=M(1,1); % number of nodes
Edge=M(2:end,:);%  Create Edge table
NumOfEdge=length(Edge(:,1)) % Number of edge

B=Edge+1; % Since the indice start from 0

%Adjacency matrix
A=zeros(N);
for i=1:NumOfEdge
    ii=B(i,1);
    jj=B(i,2);
    A(ii,jj)=1;
end
% diagonal Degree matrix
D=zeros(N);
for i=1:N
    D(i,i)=sum(A(i,:));
end
% Bioinformatics Toolbox
% http://www.mathworks.com/help/bioinfo/examples/working-with-graph-theory-functions.html?prodcode=BI&language=en#zmw57dd0e10785
gObj = biograph(A);
%gObj = view(gObj);

%Finding Connected Components in the Graph
[S,C] = conncomp(gObj);
% Mark the nodes for each component with different color
colors = flipud(jet(S));
for i = 1:numel(gObj.nodes)
    gObj.Nodes(i).Color = colors(C(i),:);
end
S % Number of Connected Components 