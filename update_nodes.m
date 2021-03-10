function [ cell_out ] = update_nodes(cell_in, n1, n2)

n = length(cell_in);

cell_out = cell_in;
cell_out{n1,:} = [cell_in{n1}; cell_in{n2}]; % merge super-nodes n1 and n2
cell_out(n2,:) = [];                         % "kill" super-node n2

end

