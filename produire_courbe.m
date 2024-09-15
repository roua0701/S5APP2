function produire_courbe(x, y, x_nom, y_nom, titre)
    nexttile
    plot(x, y);
    title(titre);
    xlabel(x_nom)
    ylabel(y_nom);
    grid on;
end