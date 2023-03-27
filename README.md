# UnderwaterMeta2302
This repo stores the data for the project `Enhancing underwater power transmission using metamaterials`.

## File trees
```
├─manuscript    // For manuscripts
├─matlab        // MATLAB files
└─rep           // Other reports
    ├─ExpNotes  // Experimental notes
```

## MATLAB files
Run `UnderwaterMeta2302.m` at first to include the paths.

## Important figures

### Measurements
Power transmission coefficients with and without the AMM. See `matlab/exp/CalPowTransCoef_230302C_Res.m`.

![Power transmission coefficient](matlab/exp/fig/CalPowTransCoef_230302C_Res.jpg)

Pressure distribution without AMM and plate at 445 kHz.
Generated by `CalPowTransCoef_230302C_PrsVoid.m`.

![](matlab/exp/fig/CalPowTransCoef_230302C_PrsVoid.jpg)

Pressure distribution **with AMM** at 445 kHz.
Generated by `CalPowTransCoef_230302C_PrsAMM.m`.

![](matlab/exp/fig/CalPowTransCoef_230302C_PrsAMM.jpg)

Pressure distribution **with plate** at 445 kHz.
Generated by `CalPowTransCoef_230302C_PrsPlate.m`.

![](matlab/exp/fig/CalPowTransCoef_230302C_PrsPlate.jpg)

### PCB
Schematic diagram of the PCB. 
See `Schematic_EnergyHarverster2302223A.pdf`.

![](fig/Schematic_EnergyHarverster2302223A.jpg)

Top layer of the PCB.

![](fig/PCB_TopLayer_20230327154958.png)

Bottom layer of the PCB.

![](fig/PCB_BottomLayer_20230327155106.png)

3D rendering of the PCB.

![](fig/PCB_3D_20230327155336.png)

Photo of the PCB

![](photo/PCB_20230327170556.jpg)

Circuit for the charging.
Raw file is `fig/FullBridgeRectifier/FullBridgeRectifier.pdf`.
![](fig/FullBridgeRectifier/FullBridgeRectifier.jpg)