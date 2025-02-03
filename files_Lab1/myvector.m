function out=myvector(v,forsta,steg,sista)

% Funktionen myvector tar in fyra parametrar v, forsta, steg och sista,
% där v är en vektor och de tre andra är heltal. Funktionen ska returnera
% alla element i vektorn v från position forsta till position sista med steget
% steg. Till exempel myvector(v, 2, 3, 13) ska rturnera en vektor som innehåller 
% v(2), v(5), v(8), v(11).
% Dessutom ska funktionen fungera om forsta är ett icke positivt heltal 
% genom att sätta den till 1. Om sista är större än vektorns längd ska
% den sättas till vektorns längd.
%
% out är den returnerade vektorn.

% if-satsen nedan testar om forsta är icke positivt, om så sätts den till
% 1, enligt uppgiften, annars görs det ingenting.
if forsta<=0
    forsta = 1;
end



l=length(v); % denna funktion returnerar vektorns längd.

% if-satsen nedan testar om sista är större än vektorns längd, 
% om så sätts den till vektorns längd, enligt uppgiften, annars görs det 
% ingenting.

if sista > l
    sista=l;
end
    
    
k=1; % vi skapar en räknare
% I for-satsen nedan blir i en variabel som börjar på forsta, och ökas till
% sista med steget steg.

for i=forsta:steg:sista
    out(k)=v(i); %element k i out sätts till element i i v
    k=k+1; % räknaren uppdateras
end;

% Observera att allt detta ovan kan skrivas på ett smidigare sätt i MATLAB.
% Målet här var att skriva den funktionen på ett sätt att det är enklare att förstå.

