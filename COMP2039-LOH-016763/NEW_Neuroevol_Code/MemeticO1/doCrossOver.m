% Basic cross-over operatorr
function coSols = doCrossOver(sols,memParams)

if memParams.crossOverType == 1
    coSols = doCrossOver1(sols,memParams);
elseif memParams.crossOverType == 2
    coSols = doCrossOver2(sols,memParams);
else
    coSols = doCrossOver2(sols,memParams);
end
    

end

