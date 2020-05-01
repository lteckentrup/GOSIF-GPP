for var in GPP GPP_SD; do
    cdo mergetime $var'/'*grid*nc TRENDY_comparison/GOSIF_$var'_'2000-2017.nc
    cdo selyear,2001/2017 TRENDY_comparison/GOSIF_$var'_'2000-2017.nc \
        TRENDY_comparison/GOSIF_$var'_'2001-2017.nc
    cdo -L -sellonlatbox,112.25,153.75,-43.75,-10.25 \
        TRENDY_comparison/GOSIF_$var'_'2001-2017.nc \
        TRENDY_comparison/GOSIF_$var'_'australia.nc
    cdo -b F64 -L -divc,1e+15 -yearsum -settaxis,2000-01-01,00:00,1month \
        -seldate,2000-07-15,2017-06-16 -sellonlatbox,112.25,153.75,-43.75,-10.25 \
        -mul TRENDY_comparison/GOSIF_$var'_'2000-2017.nc -gridarea \
        TRENDY_comparison/GOSIF_$var'_'2000-2017.nc \
        TRENDY_comparison/GOSIF_$var'_'australia_area_weighted.nc
    cdo -L -divc,1e+15 -ymonmean -mul \
        TRENDY_comparison/GOSIF_$var'_'australia.nc -gridarea \
        TRENDY_comparison/GOSIF_$var'_'australia.nc \
        TRENDY_comparison/GOSIF_$var'_'australia_climatology_area_weighted.nc
done
