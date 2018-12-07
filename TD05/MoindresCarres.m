function [ W ] = MoindresCarrees( W, C1, C2, b )
    epsilon = 0.01;
    nu = 0.1;
    W0 = W;
    B0 = b;
    
    Y = createY(C1,C2);
    Ym = malPlaces(Y,W);
    
    % Affichage du perceptron
    figure ('Name', 'Moindres Carrés');
    axis equal
    grid on
    hold on
    
    scatter(C1(1,:), C1(2,:),'r');
    scatter(C2(1,:), C2(2,:),'b');
    
    %Calcul du xMin et xMax
    X = xMinMax(C1,C2);
    
    Wprec = W0;
    Wcurrent = Wprec + nu*sum(Ym,2);
    
    Z = Y';
    Bprec = B0;
    Bcurrent = Bprec - nu*2*(Z*Wcurrent - Bprec);
    
    nbIterW = 1;
    nbIterB = 1;

    while(norm(Wcurrent - Wprec) > epsilon)
        %separatorLine = plot(X, -(Wcurrent(1,1)+Wcurrent(2,1)*X)/Wcurrent(3,1), 'k');
        
        %pause(1);
        
        while(norm(Bcurrent - Bprec) > epsilon)
           Bprec = Bcurrent;
           
           Bcurrent = Bprec + (nu/nbIterB)*2*(Z*Wcurrent - Bprec);
           
           nbIterB = nbIterB + 1;
        end
        
        for i = 1:size(Bcurrent,1)
           if(Bcurrent(i,1)<0)
               Bcurrent(i,1)=0;
           end
        end
        
        Wprec = Wcurrent;
        
        Ym = malPlaces(Y,Wprec);
        
        Wcurrent = Z \b;
        
        nbIterW = nbIterW + 1;
        
        %delete(separatorLine);

    end

    plot(X, -(Wcurrent(1,1)+Wcurrent(2,1)*X)/Wcurrent(3,1), 'm');
    
    hold off
    
    W = Wcurrent;
end

