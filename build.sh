#!/bin/bash
rm -rf sources/ttf
rm -rf fonts
rm -rf build

mkdir -p sources/ttf/0 sources/ttf/R sources/ttf/S sources/ttf/F
cd sources/sfdir
./generate.pe *.sfdir
cd ../..
cp sources/sfdir/rangeen0.ttf sources/ttf/0/
cp sources/sfdir/rangeen.ttf sources/ttf/R/
cp sources/sfdir/rangeen1.ttf sources/ttf/R/
cp sources/sfdir/rangeen2.ttf sources/ttf/R/
cp sources/sfdir/rangeen3.ttf sources/ttf/R/
cp sources/sfdir/rangeens.ttf sources/ttf/S/
cp sources/sfdir/rangeen1.ttf sources/ttf/S/
cp sources/sfdir/rangeen2.ttf sources/ttf/S/
cp sources/sfdir/rangeen3s.ttf sources/ttf/S/
cp sources/sfdir/rangeenf.ttf sources/ttf/F/
cp sources/sfdir/rangeen1f.ttf sources/ttf/F/
cp sources/sfdir/rangeen2.ttf sources/ttf/F/
cp sources/sfdir/rangeen3.ttf sources/ttf/F/
rm sources/sfdir/*.ttf

source ot-svg/bin/activate
fonts2svg -c 000088,800080,daa520 sources/ttf/R/rangeen3.ttf sources/ttf/R/rangeen2.ttf sources/ttf/R/rangeen1.ttf 
addsvg sources/ttf/R/SVGs sources/ttf/R/rangeen.ttf 
maximum_color --colr_version 0 --bitmaps sources/ttf/R/rangeen.ttf
mkdir -p fonts/otsvg fonts/colr fonts/woff2 fonts/cbdt 
cp  ttf/R/rangeen.ttf fonts/otsvg/
ttx -x SVG -o RangeenColr0.ttx -v build/rangeen.keep_glyph_names.added_glyf_colr_0.ttf
ttx -x SVG -o RangeenCBDT.ttx -v build/rangeen.added_cbdt.ttf
ttx -d fonts/colr/ RangeenColr0.ttx
ttx -d fonts/woff2/ --flavor woff2 RangeenColr0.ttx
ttx -d fonts/cbdt/ RangeenCBDT.ttx
mv RangeenColr0.ttx sources/ttx/
mv RangeenCBDT.ttx sources/ttx/
fonts2svg -c 000088,800080,daa520 sources/ttf/S/rangeen3s.ttf sources/ttf/S/rangeen2.ttf sources/ttf/S/rangeen1.ttf 
addsvg sources/ttf/S/SVGs sources/ttf/S/rangeens.ttf 
maximum_color --colr_version 0 sources/ttf/S/rangeens.ttf
ttx -x SVG -o RangeenSColr0.ttx -v build/rangeens.keep_glyph_names.added_glyf_colr_0.ttf
ttx -d fonts/colr/ RangeenSColr0.ttx
mv RangeenSColr0.ttx sources/ttx/

fonts2svg -c 000088,800080,daa520 sources/ttf/F/rangeen3.ttf sources/ttf/F/rangeen2.ttf sources/ttf/F/rangeen1f.ttf 
addsvg sources/ttf/F/SVGs sources/ttf/F/rangeenf.ttf 
maximum_color --colr_version 0 sources/ttf/F/rangeenf.ttf
ttx -x SVG -o RangeenFColr0.ttx -v build/rangeenf.keep_glyph_names.added_glyf_colr_0.ttf
ttx -d fonts/colr/ RangeenFColr0.ttx
mv RangeenFColr0.ttx sources/ttx/
cd sources/ttx/
extractufo -z *.ttx 
mv *.ufoz ../ufos/


