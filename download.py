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



if __name__ == "__main__":
    download_file_dict = {
        "molecules.dat": ["http://kurucz.harvard.edu/programs/synthe/molecules.dat", "./atmos_files_jon/Lines_AT9"],
        "continua.dat": ["http://kurucz.harvard.edu/programs/synthe/continua.dat", "./atmos_files_jon/Lines_SYNTHE"],
        "fchighlines.bin": ["http://kurucz.harvard.edu/linelists/linescd/fchighlines.bin", "./atmos_files_jon/Lines_SYNTHE"],
        "fclowlines.bin": ["http://kurucz.harvard.edu/linelists/linescd/fclowlines.bin", "./atmos_files_jon/Lines_SYNTHE"],
        "he1tables.dat": ["http://wwwuser.oats.inaf.it/castelli/sources/synthe/he1tables.dat", "./atmos_files_jon/Lines_SYNTHE"],
            }

    for key in download_file_dict.keys():
        download_and_save_file(key, download_file_dict[key][0], download_file_dict[key][1])
