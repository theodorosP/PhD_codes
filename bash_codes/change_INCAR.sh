#! /bin/bash

for i in -2.5 -2.0 -1.0 -0.5 0.0
do

cd /home/theodoros/PROJ_ElectroCat/theodoros/NH4_Bi111/NH4_Bi111_O_not_constrained/more_sites/right_left_4_symmetric/FindChg_U_$i/target_potential/more_accurate 

NELECT_INCAR=`grep "NELECT =" INCAR|awk '{print $3}'`
echo NELECT_INCAR = $NELECT_INCAR

NELECT_OUTCAR=`grep "NELECT" ../OUTCAR|head -1|awk '{print $3}'`
echo NELECT_OUTCAR = $NELECT_OUTCAR


sed -i "s/NELECT = $NELECT_INCAR/NELECT = $NELECT_OUTCAR/g" INCAR

NELECT_INCAR=`grep "NELECT =" INCAR|awk '{print $3}'`
echo The NELECT changed to NELECT_INCAR = $NELECT_INCAR


TPOTVTARGET=`grep "TPOTVTARGET" INCAR|awk '{print $3}'`
echo TPOTVTARGET = $TPOTVTARGET

TPOTVTARGET_UPDATED=$(echo "4.43 + $i"|bc)
echo TPOTVTARGET_UPDATED= $TPOTVTARGET_UPDATED

sed -i "s/TPOTVTARGET = $TPOTVTARGET/TPOTVTARGET = $TPOTVTARGET_UPDATED/g" INCAR

TPOTVTARGET=`grep "TPOTVTARGET" INCAR|awk '{print $3}'`
echo TPOTVTARGET has changed to  $TPOTVTARGET


echo -------------------
done
