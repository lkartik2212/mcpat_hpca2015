
make -C ../mr2
mkdir -p l1d_sweep

for size in 32 64 128 256;do
    l1d_size=$((size*1024))
    #echo "$l1d_size"
    #sed -i "s/\(<param name=\"dcache_config\" value=\"\)[0-9]\+/\1$l1d_size/" ../models/MR2.xml
    #../mr2/mcpat -infile ../models/MR2.xml -print_level 5 &> l1d_sweep/area_l1d_${size}KB.txt
    area_value=$(awk 'NR==211 {print $3}' l1d_sweep/area_l1d_${size}KB.txt)
    echo "L1-D $size KB  -->  $area_value mm^2"
done

#Sample output
#L1-D 32 KB  -->  0.132376 mm^2
#L1-D 64 KB  -->  0.156513 mm^2
#L1-D 128 KB  -->  0.227764 mm^2
#L1-D 256 KB  -->  0.327458 mm^2



