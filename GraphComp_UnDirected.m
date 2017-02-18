%M=dlmread('n10.txt')%Import Delimited Numeric Data
%M=dlmread('n100.txt');
%M=dlmread('n1000.txt');
%M=dlmread('n10000.txt');  %s=12 plot error
%M=dlmread('s1');

N=M(1,1); % number of nodes
Edge=M(2:end,:);%  Create Edge table
NumOfEdge=length(Edge(:,1)) % Number of edge

B=Edge+1; % Since the indice start from 0, we assume all start from 1 here,  v1, v2, v3 ...

%Create Adjacency matrix from Edge table B
A=zeros(N);
for i=1:NumOfEdge
    ii=B(i,1);
    jj=B(i,2);
    A(ii,jj)=1;
end

%convert it to the symmetric matrix for undirected graph
 AA=adj2simple(A+A');
 
 
 % plot
 % Draw a circular graph with links and nodes in order of degree
figure(1)
draw_circ_graph(AA)


 % Calculate the number of connected components 
 s=num_conn_comp(AA)
 
 %Find the connected components
 C=find_conn_comp(AA)
 
 %Radial Plot
%If a center node is not specified, the nodes are ordered by
% sum of neighbor degrees, and the node with highest sum is plotted
% in the center.
figure(3)
radial_plot(AA)
 
 

 
 % Degree of each node
 deg = sum(AA);
 % Histogram
 figure(4)
 h = histogram(deg)
 xlabel('Degree');
 ylabel('Number of nodes');
 