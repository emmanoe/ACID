function [ Y ] = createY( C1, C2 )
    sizeC1 = size(C1,2);
    sizeC2 = size(C2,2);
    
    firstLine = [repmat(1,1,sizeC1) repmat(-1,1,sizeC2)];
    C1C2 = [C1 -C2];
    Y = [firstLine ; C1C2];
    
end

