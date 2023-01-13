function out = sample128(img)
    [imY, imX, ~] = size(img);
    x = imX/128;
    y = imY/128;
    
    
    xDivisors = [0,x:x:imX];
    yDivisors = [0,y:y:imY];
    
    out = zeros(128,128);
    
    for xIdx = 1:128
        currentX = floor((xDivisors(xIdx)+xDivisors(1+xIdx))/2);
        for yIdx = 1:128
            currentY = floor((yDivisors(yIdx)+yDivisors(1+yIdx))/2);
            out(yIdx, xIdx) = img(currentY, currentX);
        end
    end
end