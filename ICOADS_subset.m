% [P,var_list] = ICOADS_subset(P,l_use)

function [P,var_list] = ICOADS_subset(P,l_use)

    var_list = fieldnames(P);
    
    for var = 1:numel(var_list)
        eval(['P.',var_list{var},' = P.',var_list{var},'(l_use,:);']);
    end
    
end