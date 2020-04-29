for year in `seq 2000 2018`; do
    for month in `seq 1 9`; do
        gdal_translate -of netCDF GOSIF_GPP_$year'.'M0$month'.'tif \
        GOSIF_GPP_$year'.'M0$month'.'nc
        cdo -L -settaxis,$year'-'$month'-'15,00:00,1month \
        -sellonlatbox,-180,180,-55.25,83.25 -remapcon,grid.txt \
        GOSIF_GPP_$year'.'M0$month'.'nc GOSIF_GPP_$year'.'M0$month'_'grid.nc
    done
    for month in `seq 10 12`; do
        gdal_translate -of netCDF GOSIF_GPP_$year'.'M0$month'.'tif \
        GOSIF_GPP_$year'.'M$month'.'nc
        cdo -L -settaxis,$year'-'$month'-'15,00:00,1month \
        -sellonlatbox,-180,180,-55.25,83.25 -remapcon,grid.txt \
        GOSIF_GPP_$year'.'M$month'.'nc GOSIF_GPP_$year'.'M$month'_'grid.nc
    done
