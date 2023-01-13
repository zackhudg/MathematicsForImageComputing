function [G]=apply_gaussian(I,sigma)
    %purpose: apply gaussian
    %input:
    % I: input image
    % sigma: gaussian sigma
    
    %Output: 
    % G: After applying gaussian with sigma to I
    
    %get DFT of I
    [ mag_out, phase_out ] = AmpPhaseDFT( I );
    Gmag_out=zeros(size(mag_out));
    
    %apply gaussian, note how frequencies are stored
    for j=1:65
        for k=1:65
            Gmag_out(j,k) = mag_out(j,k)*exp(-0.5*sigma^2*(((j-1)/128)^2+((k-1)/128)^2));
        end
    end
    for j=1:65
        for k=66:128
            Gmag_out(j,k) = mag_out(j,k)*exp(-0.5*sigma^2*(((j-1)/128)^2+(((k-1)-128)/128)^2));
        end
    end
    %get recon
    G=ReconfromAmpPhase(Gmag_out,phase_out);
end
