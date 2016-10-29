function matchCountries(file, lookupTable)
    [~, ~, data] = xlsread(file); 
    [~, ~, lookup] = xlsread(lookupTable);
    [rData, ~] = size(data);
    [rLookup, ~] = size(lookup);
    
    for i = 1:rData
        countryName = data{i, 1};
        for j = 1:rLookup
            lookupName = lookup{j, 4};
            if strcmp(countryName, lookupName)
                data(i, 4) = lookup(j, 2);
                data(i, 5) = lookup(j, 3);
            end
        end
    end
    
    for i = rData:-1:1
        if(isempty(data{i, 4}))
            data(i,:) = [];
        end
    end
    
    xlswrite([file(1:end-5), 'LL2.xlsx'], data);
    
end
    
        