# C5-2008-BC
Tool to convert C5 2008 to Business Central

Extended and stabilized compared to Microsofts C5 2012 tool. 

Pre installment conditions:

1.) Enabling of Sales Price Experience in Feature Management (styring af funktioner)







// diverse rettelser:

Codeunit "C5 2008 Helper Functions"
Mindre restriktiv håndtering af Postnr. og By - tjek hvor kombinationen skal eksistere er fjernet.
søg efter PostCodeOrCityNotFoundErr i codeunit for at aktivere funktionen. 

Codeunit "C5 2008 Item Migrator"
den alternative varenummer er ikke nødvendigvis brugt som en erstattningsvare men mere som en leverandørvare 
så det er ikke nødvendigvis en fejl at den ikke findes
Søg efter C5InvenTable.AltItemNumber for at aktivere funktionaliteten

Hvis der er angivet flere E-mailadresser til både kreditorer og debitorer og disse er adskilt med koma, så tjekker systemet og adskiller dem med semikolon. 

Korrigeret indlæsning af datoer og udviklet understøttelse for Ultimo-datoer

Funktion til oprettelse af regnskabsperioder fra skæringsdatoen og frem

Funktion til oprettelse af momsbogføringsopsætning og momsbogføringsgrupper, som herefter opdaterer varer, debitorer og kreditorer. 
 