# Rangeen font development
I am documenting creation of a multicolour font using open source tools only. The purpose is getting suggestions of where I am doing wrong or how I can improve it.
### step 1 

Create a skeleton font in Fontforge The font consists of strokes glyphs instead of outline ones.

Initially I have created only the upper case letters and numbers with a few punctuation marks. 

![SkeltonA](images/rangeen0-A.png)


### step 2
Create 4 outline fonts by using Expand stroke feature of Fontforge 

![Layer1-A](images/rangeen3-A.png)

The outlines are varied in thickness and bevel by modifying the stroke parameters. Three layers are created for three colours.

![Layer2-A](images/rangeen2-A.png)

 One level is shifted slightly righwards to create a shadow effect.

![Layer3-A](images/rangeen1-A.png)

The backup layer glyphs are created by applying Expand stroke twice for outline effect.

![Backup-A](images/rangeen-backup-A.png)

The fonts are exported in otf format and are in sources/otf folder

### step 3
Setup a python venv and install  svg-ot tools and nanoemoj using pip 

```
python3 -m venv venv

source venv/bin/activate

pip install ot-svg

pip install nanoemoji

```

### step 4
Create svg files
```
$ fonts2svg -c cccccc,ff22ac,11ff90 otf/rangeen3.otf otf/rangeen2.otf otf/rangeen1.otf
53 SVG files saved.
```
Check the svg files created 

![svg-A](images/svg-A)

### step 5
Add svg files to Fallback font to create OpenType-SVG font
```
$ addsvg otf/SVGs otf/Rangeen.otf
53 SVG glyphs were successfully added to Rangeen.otf
```
### step 6
Create an html file to test the font  

Color Glyphs are displayed in Firefox 
![font-color-firefox](images/font-test-firefox.png)

Fallback mechanism also works in Chrome

![font-fallback-chrome](images/font-test-monochrome.png)

### step 7

Add COLRv1 files to the font using nanoemoji (fails)

```
maximum_color Rangeen.otf 
I1126 13:10:43.411979 129499818270720 maximum_color.py:480] Generating build.ninja
I1126 13:10:43.433130 129499818270720 ninja.py:124] ninja -C /media/artim/home/@home/artim/devel/rangeen/fonts/build
ninja: Entering directory `/media/artim/home/@home/artim/devel/rangeen/fonts/build'
[112/114] /media/artim/home/@home/arti...utput_file MergeSource.glyf_colr_1.ttf
I1126 13:10:57.864236 135774422413312 baseCompiler.py:71] Pre-processing glyphs
I1126 13:10:57.888063 135774422413312 base.py:201] Running DecomposeComponentsFilter on AnEmojiFamily-Regular
I1126 13:10:57.888413 135774422413312 base.py:201] Running CubicToQuadraticFilter on AnEmojiFamily-Regular
I1126 13:10:57.941685 135774422413312 cubicToQuadratic.py:46] New spline lengths: 1: 1198, 2: 2982, 3: 249, 4: 73, 5: 15, 6: 3, 7: 2
I1126 13:10:57.941780 135774422413312 baseCompiler.py:62] Building OpenType tables
I1126 13:10:58.053977 135774422413312 write_font.py:247] Writing MergeSource.glyf_colr_1.ttf
I1126 13:10:58.089676 135774422413312 write_font.py:833] Wrote MergeSource.glyf_colr_1.ttf
[113/114] /media/artim/home/@home/arti...keep_glyph_names.added_glyf_colr_1.ttf
FAILED: Rangeen.keep_glyph_names.added_glyf_colr_1.ttf 
Traceback (most recent call last):
  File "/usr/lib/python3.10/runpy.py", line 196, in _run_module_as_main
    return _run_code(code, main_globals, None,
  File "/usr/lib/python3.10/runpy.py", line 86, in _run_code
    exec(code, run_globals)
  File "/media/artim/home/@home/artim/devel/rangeen/ot-svg/lib/python3.10/site-packages/nanoemoji/glue_together.py", line 231, in <module>
    app.run(main)
  File "/media/artim/home/@home/artim/devel/rangeen/ot-svg/lib/python3.10/site-packages/absl/app.py", line 308, in run
    _run_main(main, args)
  File "/media/artim/home/@home/artim/devel/rangeen/ot-svg/lib/python3.10/site-packages/absl/app.py", line 254, in _run_main
    sys.exit(main(argv))
  File "/media/artim/home/@home/artim/devel/rangeen/ot-svg/lib/python3.10/site-packages/nanoemoji/glue_together.py", line 214, in main
    _copy_colr(target, donor)
  File "/media/artim/home/@home/artim/devel/rangeen/ot-svg/lib/python3.10/site-packages/nanoemoji/glue_together.py", line 72, in _copy_colr
    target_glyphs = target["glyf"].glyphs
  File "/media/artim/home/@home/artim/devel/rangeen/ot-svg/lib/python3.10/site-packages/fontTools/ttLib/ttFont.py", line 461, in __getitem__
    table = self._readTable(tag)
  File "/media/artim/home/@home/artim/devel/rangeen/ot-svg/lib/python3.10/site-packages/fontTools/ttLib/ttFont.py", line 468, in _readTable
    data = self.reader[tag]
  File "/media/artim/home/@home/artim/devel/rangeen/ot-svg/lib/python3.10/site-packages/fontTools/ttLib/sfnt.py", line 109, in __getitem__
    entry = self.tables[Tag(tag)]
KeyError: 'glyf'
ninja: build stopped: subcommand failed.
Traceback (most recent call last):
  File "/media/artim/home/@home/artim/devel/rangeen/ot-svg/bin/maximum_color", line 8, in <module>
    sys.exit(main())
  File "/media/artim/home/@home/artim/devel/rangeen/ot-svg/lib/python3.10/site-packages/nanoemoji/maximum_color.py", line 510, in main
    app.run(_run)
  File "/media/artim/home/@home/artim/devel/rangeen/ot-svg/lib/python3.10/site-packages/absl/app.py", line 308, in run
    _run_main(main, args)
  File "/media/artim/home/@home/artim/devel/rangeen/ot-svg/lib/python3.10/site-packages/absl/app.py", line 254, in _run_main
    sys.exit(main(argv))
  File "/media/artim/home/@home/artim/devel/rangeen/ot-svg/lib/python3.10/site-packages/nanoemoji/maximum_color.py", line 505, in _run
    maybe_run_ninja(build_file)
  File "/media/artim/home/@home/artim/devel/rangeen/ot-svg/lib/python3.10/site-packages/nanoemoji/ninja.py", line 125, in maybe_run_ninja
    subprocess.run(ninja_cmd, check=True)
  File "/usr/lib/python3.10/subprocess.py", line 526, in run
    raise CalledProcessError(retcode, process.args,
subprocess.CalledProcessError: Command '['ninja', '-C', '/media/artim/home/@home/artim/devel/rangeen/fonts/build']' returned non-zero exit status 1.
```

### step 8 
Add CBDT tables to the font (fails)
```
maximum_color --bitmaps Rangeen.otf 
I1126 13:24:06.381427 124872750997504 maximum_color.py:480] Generating build.ninja
I1126 13:24:06.409524 124872750997504 ninja.py:124] ninja -C /media/artim/home/@home/artim/devel/rangeen/fonts/build
ninja: Entering directory `/media/artim/home/@home/artim/devel/rangeen/fonts/build'
[54/59] /media/artim/home/@home/artim/devel/rangeen/ot-svg/bin/python3 -m...yphmap_for_glyph_svgs -v 0 --output_file CBDT.glyphmap @CBDT.glyphmap.rsp
FAILED: CBDT.glyphmap 
/media/artim/home/@home/artim/devel/rangeen/ot-svg/bin/python3 -m nanoemoji.write_glyphmap_for_glyph_svgs -v 0 --output_file CBDT.glyphmap @CBDT.glyphmap.rsp
Traceback (most recent call last):
  File "/usr/lib/python3.10/runpy.py", line 196, in _run_module_as_main
    return _run_code(code, main_globals, None,
  File "/usr/lib/python3.10/runpy.py", line 86, in _run_code
    exec(code, run_globals)
  File "/media/artim/home/@home/artim/devel/rangeen/ot-svg/lib/python3.10/site-packages/nanoemoji/write_glyphmap_for_glyph_svgs.py", line 68, in <module>
    app.run(main)
  File "/media/artim/home/@home/artim/devel/rangeen/ot-svg/lib/python3.10/site-packages/absl/app.py", line 308, in run
    _run_main(main, args)
  File "/media/artim/home/@home/artim/devel/rangeen/ot-svg/lib/python3.10/site-packages/absl/app.py", line 254, in _run_main
    sys.exit(main(argv))
  File "/media/artim/home/@home/artim/devel/rangeen/ot-svg/lib/python3.10/site-packages/nanoemoji/write_glyphmap_for_glyph_svgs.py", line 34, in main
    source_font = util.only(input_files, lambda a: a.endswith(".ttf"))
  File "/media/artim/home/@home/artim/devel/rangeen/ot-svg/lib/python3.10/site-packages/nanoemoji/util.py", line 35, in only
    result = next(it)
StopIteration
[55/59] /media/artim/home/@home/artim/devel/rangeen/ot-svg/bin/python3 -m...'/media/artim/home/@home/artim/devel/rangeen/fonts/Rangeen.otf' CBDT.toml
FAILED: CBDT.toml 
/media/artim/home/@home/artim/devel/rangeen/ot-svg/bin/python3 -m nanoemoji.write_config_for_mergeable -v 0 --color_format cbdt '/media/artim/home/@home/artim/devel/rangeen/fonts/Rangeen.otf' CBDT.toml
Traceback (most recent call last):
  File "/usr/lib/python3.10/runpy.py", line 196, in _run_module_as_main
    return _run_code(code, main_globals, None,
  File "/usr/lib/python3.10/runpy.py", line 86, in _run_code
    exec(code, run_globals)
  File "/media/artim/home/@home/artim/devel/rangeen/ot-svg/lib/python3.10/site-packages/nanoemoji/write_config_for_mergeable.py", line 65, in <module>
    app.run(main)
  File "/media/artim/home/@home/artim/devel/rangeen/ot-svg/lib/python3.10/site-packages/absl/app.py", line 308, in run
    _run_main(main, args)
  File "/media/artim/home/@home/artim/devel/rangeen/ot-svg/lib/python3.10/site-packages/absl/app.py", line 254, in _run_main
    sys.exit(main(argv))
  File "/media/artim/home/@home/artim/devel/rangeen/ot-svg/lib/python3.10/site-packages/nanoemoji/write_config_for_mergeable.py", line 29, in main
    font_file = util.only(argv, lambda a: a.endswith(".ttf"))
  File "/media/artim/home/@home/artim/devel/rangeen/ot-svg/lib/python3.10/site-packages/nanoemoji/util.py", line 35, in only
    result = next(it)
StopIteration
[56/59] /media/artim/home/@home/artim/devel/rangeen/ot-svg/bin/python3 -m...f_colr_1.ttf --output_file Rangeen.keep_glyph_names.added_glyf_colr_1.ttf
FAILED: Rangeen.keep_glyph_names.added_glyf_colr_1.ttf 
/media/artim/home/@home/artim/devel/rangeen/ot-svg/bin/python3 -m nanoemoji.glue_together -v 0 --color_table COLR --target_font Rangeen.keep_glyph_names.ttf --donor_font MergeSource.glyf_colr_1.ttf --output_file Rangeen.keep_glyph_names.added_glyf_colr_1.ttf
Traceback (most recent call last):
  File "/usr/lib/python3.10/runpy.py", line 196, in _run_module_as_main
    return _run_code(code, main_globals, None,
  File "/usr/lib/python3.10/runpy.py", line 86, in _run_code
    exec(code, run_globals)
  File "/media/artim/home/@home/artim/devel/rangeen/ot-svg/lib/python3.10/site-packages/nanoemoji/glue_together.py", line 231, in <module>
    app.run(main)
  File "/media/artim/home/@home/artim/devel/rangeen/ot-svg/lib/python3.10/site-packages/absl/app.py", line 308, in run
    _run_main(main, args)
  File "/media/artim/home/@home/artim/devel/rangeen/ot-svg/lib/python3.10/site-packages/absl/app.py", line 254, in _run_main
    sys.exit(main(argv))
  File "/media/artim/home/@home/artim/devel/rangeen/ot-svg/lib/python3.10/site-packages/nanoemoji/glue_together.py", line 214, in main
    _copy_colr(target, donor)
  File "/media/artim/home/@home/artim/devel/rangeen/ot-svg/lib/python3.10/site-packages/nanoemoji/glue_together.py", line 72, in _copy_colr
    target_glyphs = target["glyf"].glyphs
  File "/media/artim/home/@home/artim/devel/rangeen/ot-svg/lib/python3.10/site-packages/fontTools/ttLib/ttFont.py", line 461, in __getitem__
    table = self._readTable(tag)
  File "/media/artim/home/@home/artim/devel/rangeen/ot-svg/lib/python3.10/site-packages/fontTools/ttLib/ttFont.py", line 468, in _readTable
    data = self.reader[tag]
  File "/media/artim/home/@home/artim/devel/rangeen/ot-svg/lib/python3.10/site-packages/fontTools/ttLib/sfnt.py", line 109, in __getitem__
    entry = self.tables[Tag(tag)]
KeyError: 'glyf'
ninja: build stopped: subcommand failed.
Traceback (most recent call last):
  File "/media/artim/home/@home/artim/devel/rangeen/ot-svg/bin/maximum_color", line 8, in <module>
    sys.exit(main())
  File "/media/artim/home/@home/artim/devel/rangeen/ot-svg/lib/python3.10/site-packages/nanoemoji/maximum_color.py", line 510, in main
    app.run(_run)
  File "/media/artim/home/@home/artim/devel/rangeen/ot-svg/lib/python3.10/site-packages/absl/app.py", line 308, in run
    _run_main(main, args)
  File "/media/artim/home/@home/artim/devel/rangeen/ot-svg/lib/python3.10/site-packages/absl/app.py", line 254, in _run_main
    sys.exit(main(argv))
  File "/media/artim/home/@home/artim/devel/rangeen/ot-svg/lib/python3.10/site-packages/nanoemoji/maximum_color.py", line 505, in _run
    maybe_run_ninja(build_file)
  File "/media/artim/home/@home/artim/devel/rangeen/ot-svg/lib/python3.10/site-packages/nanoemoji/ninja.py", line 125, in maybe_run_ninja
    subprocess.run(ninja_cmd, check=True)
  File "/usr/lib/python3.10/subprocess.py", line 526, in run
    raise CalledProcessError(retcode, process.args,
subprocess.CalledProcessError: Command '['ninja', '-C', '/media/artim/home/@home/artim/devel/rangeen/fonts/build']' returned non-zero exit status 1
```




