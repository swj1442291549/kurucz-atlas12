from pathlib import Path
import sys
import requests


def download_and_save_file(file_name, url, folder='.'):
    if not Path(folder, file_name).is_file():
        p = Path(folder)
        if not p.is_dir():
            p.mkdir(parents=True)

        with open(Path(folder, file_name), "wb") as f:
            print("Downloading {0} ...".format(file_name))
            response = requests.get(url, stream=True)
            total_length = response.headers.get('content-length')

            if total_length is None: # no content length header
                f.write(response.content)
            else:
                dl = 0
                total_length = int(total_length)
                for data in response.iter_content(chunk_size=4096):
                    dl += len(data)
                    f.write(data)
                    done = int(50 * dl / total_length)
                    sys.stdout.write("\r[%s%s]" % ('=' * done, ' ' * (50-done)) )    
                    sys.stdout.flush()
                print()



if __name__ == "__main__":
    download_file_list = [
        ["molecules.dat", "http://kurucz.harvard.edu/programs/atlas9/molecules.dat", "./data/atmos_files_jon/Lines_AT9"],
        ["molecules.dat", "http://kurucz.harvard.edu/programs/atlas12/molecules.dat", "./data/atmos_files_jon/Lines_AT12"],
        ["continua.dat", "http://wwwuser.oats.inaf.it/castelli/sources/syntheg/continua.dat", "./data/atmos_files_jon/Lines_SYNTHE"],
        ["fchighlines.bin", "http://kurucz.harvard.edu/linelists/linescd/fchighlines.bin", "./data/atmos_files_jon/Lines_SYNTHE"],
        ["fclowlines.bin", "http://kurucz.harvard.edu/linelists/linescd/fclowlines.bin", "./data/atmos_files_jon/Lines_SYNTHE"],
        ["he1tables.dat", "http://wwwuser.oats.inaf.it/castelli/sources/synthe/he1tables.dat", "./data/atmos_files_jon/Lines_SYNTHE"],
        ["molecules.dat", "http://kurucz.harvard.edu/programs/synthe/molecules.dat", "./data/atmos_files_jon/Lines_SYNTHE"],
        ["pfiron.dat", "http://wwwuser.oats.inaf.it/castelli/sources/dfsynthe/pfiron.dat", "./data/dfsynthe_files"],
        ["continua.dat", "http://wwwuser.oats.inaf.it/castelli/sources/dfsynthe/continua.dat", "./data/dfsynthe_files"],
        ["molecules.dat", "http://wwwuser.oats.inaf.it/castelli/sources/dfsynthe/molecules.dat", "./data/dfsynthe_files"],
        ["diatomicsdf.bin", "http://wwwuser.oats.inaf.it/castelli/linelists/diatomicsiwl.bin", "./data/dfsynthe_files/repacked_lines"],
        ["h2olinesdf.bin", "http://kurucz.harvard.edu/molecules/h2o/h2ofastfix.bin", "./data/dfsynthe_files/repacked_lines"],
        ["lowlinesdf.bin", "http://kurucz.harvard.edu/linelists/linescd/fclowlines.bin", "./data/dfsynthe_files/repacked_lines"],
        ["highlinesdf.bin", "http://kurucz.harvard.edu/linelists/linescd/fchighlines.bin", "./data/dfsynthe_files/repacked_lines"],
        ["tiolinesdf.bin", "http://kurucz.harvard.edu/molecules/tio/tioschwenke.bin", "./data/dfsynthe_files/repacked_lines"],
        ["nltelinesdf.bin", "http://kurucz.harvard.edu/linelists/linescd/nltelines.bin", "./data/dfsynthe_files/repacked_lines"],
        ["c2ax.asc", "http://kurucz.harvard.edu/linelists/linesmol/c2ax.asc", "./data/atmos_files_jon/Molecules_SYNTHE"],
        ["c2ba.asc", "http://kurucz.harvard.edu/linelists/linesmol/c2ba.asc", "./data/atmos_files_jon/Molecules_SYNTHE"],
        ["c2ea.asc", "http://kurucz.harvard.edu/linelists/linesmol/c2ea.asc", "./data/atmos_files_jon/Molecules_SYNTHE"],
        ["coax.asc", "http://kurucz.harvard.edu/linelists/linesmol/coax.asc", "./data/atmos_files_jon/Molecules_SYNTHE"],
        ["coxx.asc", "http://kurucz.harvard.edu/linelists/linesmol/coxx.asc", "./data/atmos_files_jon/Molecules_SYNTHE"],
        ["h2xx.asc", "http://kurucz.harvard.edu/linelists/linesmol/h2xx.asc", "./data/atmos_files_jon/Molecules_SYNTHE"],
        ["hdxx.asc", "http://kurucz.harvard.edu/linelists/linesmol/hdxx.asc", "./data/atmos_files_jon/Molecules_SYNTHE"],
        ["sioxx.asc", "http://kurucz.harvard.edu/linelists/linesmol/sioxx.asc", "./data/atmos_files_jon/Molecules_SYNTHE"],
        ["sioax.asc", "http://kurucz.harvard.edu/linelists/linesmol/sioax.asc", "./data/atmos_files_jon/Molecules_SYNTHE"],
        ["sioex.asc", "http://kurucz.harvard.edu/linelists/linesmol/sioex.asc", "./data/atmos_files_jon/Molecules_SYNTHE"],
        ["chmasseron.asc", "http://kurucz.harvard.edu/molecules/ch/chmasseron.asc", "./data/atmos_files_jon/Molecules_SYNTHE"],
        ["sihax.asc", "http://kurucz.harvard.edu/molecules/sih/sihax.asc", "./data/atmos_files_jon/Molecules_SYNTHE"],
        ["vo.readme", "http://kurucz.harvard.edu/molecules/vo/vo.readme", "./data/atmos_files_jon/Molecules_SYNTHE"],
        ["vo.asc", "http://kurucz.harvard.edu/molecules/vo/vo.asc", "./data/atmos_files_jon/Molecules_SYNTHE"],
        ["vomyt.asc", "http://kurucz.harvard.edu/molecules/vo/vomyt.asc", "./data/atmos_files_jon/Molecules_SYNTHE"],
        ["tioschwenke.bin", "http://kurucz.harvard.edu/molecules/tio/tioschwenke.bin", "./data/atmos_files_jon/Molecules_SYNTHE"],
        ["ohupdate.asc", "http://kurucz.harvard.edu/molecules/oh/ohupdate.asc", "./data/atmos_files_jon/Molecules_SYNTHE"],
        ["h2ofastfix.bin", "http://kurucz.harvard.edu/molecules/h2o/h2ofastfix.bin", "./data/atmos_files_jon/Molecules_SYNTHE"],
        ["cnxx12brooke.asc", "http://kurucz.harvard.edu/molecules/cn/cnxx12brooke.asc", "./data/atmos_files_jon/Molecules_SYNTHE"],
        ["cnbxbrookek.asc", "http://kurucz.harvard.edu/molecules/cn/cnbxbrookek.asc", "./data/atmos_files_jon/Molecules_SYNTHE"],
        ["mgh.asc", "http://kurucz.harvard.edu/molecules/mgh/mgh.asc", "./data/atmos_files_jon/Molecules_SYNTHE"],
        ["c2dabrookek.asc", "http://kurucz.harvard.edu/molecules/c2/c2dabrookek.asc", "./data/atmos_files_jon/Molecules_SYNTHE"],
        ["cnaxbrookek.asc", "http://kurucz.harvard.edu/molecules/cn/cnaxbrookek.asc", "./data/atmos_files_jon/Molecules_SYNTHE"],
    ]

    for item in download_file_list:
        download_and_save_file(item[0], item[1], item[2])
