function matchVector=multiMatch(Value,Items)
%Value: selected options
%Items: available options
%matchVector: index of selected option
nValue = numel(Value);
matchVector = NaN(1, nValue);
if iscell(Value)
    for i = 1:nValue
        matchVector(i)=find(strcmp(Value{i}, Items));
    end
else
    matchVector=find(strcmp(Value, Items));
end
end