function out = gradient(image, scale)
    % Produces 128x128 vertical + horizontal gradient images for various spatial scaling values.
    imagex = partial_1d(image, 'x', scale);
    imagex = imagex .* imagex;
    imagey = partial_1d(image, 'y', scale);
    imagey = imagey .* imagey;
    
    out = imagex + imagey;
end