function [ W ] = Perceptron( W, C1, C2 )
    epsilon = 0.01;
    nu = 0.1;
    W0 = W;
    
    Y = createY(C1,C2);
    Ym = malPlaces(Y,W);
    
    % Affichage du perceptron
    figure ('Name', 'Perceptron');
    axis equal
    grid on
    hold on
    
    scatter(C1(1,:), C1(2,:),'r');
    scatter(C2(1,:), C2(2,:),'b');
    
    %Calcul du xMin et xMax
    X = xMinMax(C1,C2);
    
    Wprec = W0;
    Wcurrent = Wprec + nu*sum(Ym,2);
    
    nbIter = 1;

    while(norm(Wcurrent - Wprec) > epsilon)
        %separatorLine = plot(X, -(Wcurrent(1,1)+Wcurrent(2,1)*X)/Wcurrent(3,1), 'k');
        
        %pause(0.0002);
        
        Wprec = Wcurrent;
        
        Ym = malPlaces(Y,Wprec);
        
        Wcurrent = Wprec + nu/nbIter*sum(Ym,2);
        
        nbIter = nbIter + 1
        
        %delete(separatorLine);

    end

    plot(X, -(Wcurrent(1,1)+Wcurrent(2,1)*X)/Wcurrent(3,1), 'm');
    
    hold off
    
    W = Wcurrent;
end

