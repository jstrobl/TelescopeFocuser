use <configuration/bocnice.scad>

use <configuration/otvory.scad>
use <configuration/plbase.scad>
include <configuration/manufactury_conf.scad>
include <configuration.scad>
include <configuration/otvory_conf.scad>

upravena_bocnice();

//Slouzi pro vytvoreni vlastnich celicek dle potreby

//Vytvoreni predniho celicka krabicky
//--------------------------------------------------------
module upravena_bocnice()
{
difference() {
    union() {
    bocnice(pocet_der1-1,pocet_der2-1,radidus_hrany,vzdalenost_der,vzdalenost_od_okraje,prumer_sroubu,vyska_bocnice,prekryti_der,tloustka_bocnice);

translate([-((pocet_der2-1)*vzdalenost_der+2*vzdalenost_od_okraje)/2-tloustka_bocnice,-vzdalenost_od_okraje-tloustka_bocnice,-(vyska_bocnice/2)])
rotate(a=[180,0,90])


plbase(pocet_der1,pocet_der2,radidus_hrany,vzdalenost_der,vzdalenost_od_okraje,prumer_sroubu,tloustka_plbase,prekryti_der,tloustka_bocnice);
        
           }
            union() {
//Vytvoreni otvorů v přední stěně
//--------------------------------------------------------
                
                translate([-((pocet_der2-1)*vzdalenost_der)/2,-vzdalenost_od_okraje-tloustka_bocnice/2,-(vyska_bocnice/2)])
                {
                //složí k posunu otvoru v násobku děr
                  
                    posun_p2=6.5;    
                    translate([posun_p2*vzdalenost_der,0,0])   
                      MIC338(tloustka_bocnice,vzdalenost_der,vyska_bocnice);
                    
                    posun_p3=3.5;    
                    translate([posun_p3*vzdalenost_der,0,0])   
                      MIC338(tloustka_bocnice,vzdalenost_der,vyska_bocnice);
                    
                }
}



//Vytvoreni zadniho celicka krabicky
//--------------------------------------------------------


                translate([((pocet_der2-1)*vzdalenost_der)/2,(pocet_der1-1)*vzdalenost_der+vzdalenost_od_okraje+tloustka_bocnice/2,-(vyska_bocnice/2)])
                {
               
                      
    
                    posun_z2=0;    
                    
                    translate([-posun_z2*vzdalenost_der,0,0])  
                   rotate(a=[0,0,180])  
                        I2CDIFF01A(tloustka_bocnice,vzdalenost_der);
                    
                   
                    
                    
                }
}



//Vytvoreni leveho celicka krabicky
//--------------------------------------------------------



//Vytvoreni praveho celicka krabicky
//--------------------------------------------------------


}
