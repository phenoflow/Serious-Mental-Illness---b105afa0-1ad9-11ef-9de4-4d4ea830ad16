# Siobhan Reilly, Ivan Olier, Claire Planner, Tim Doran, David Reeves, Darren M Ashcroft, Linda Gask, Evangelos Kontopantelis, 2024.

import sys, csv, re

codes = [{"code":"E117100","system":"readv2"},{"code":"E117.00","system":"readv2"},{"code":"E117000","system":"readv2"},{"code":"Eu31z00","system":"readv2"},{"code":"E117400","system":"readv2"},{"code":"Eu25z00","system":"readv2"},{"code":"E116000","system":"readv2"},{"code":"E117200","system":"readv2"},{"code":"E11z000","system":"readv2"},{"code":"E117600","system":"readv2"},{"code":"E117300","system":"readv2"},{"code":"Eu2z.00","system":"readv2"},{"code":"E11z.00","system":"readv2"},{"code":"E117z00","system":"readv2"}];
REQUIRED_CODES = 1;
with open(sys.argv[1], 'r') as file_in, open('serious-mental-illness-potential-cases.csv', 'w', newline='') as file_out:
    csv_reader = csv.DictReader(file_in)
    csv_writer = csv.DictWriter(file_out, csv_reader.fieldnames + ["serious-mental-illness-smi-unspec---primary-identified"])
    csv_writer.writeheader();
    codes_identified = 0;
    for row in csv_reader:
        newRow = row.copy();
        for cell in row:
            # Iterate cell lists (e.g. codes)
            for item in re.findall(r'\(([^,]*)\,', row[cell]):
                if(item in list(map(lambda code: code['code'], codes))): codes_identified+=1;
                if(codes_identified>=REQUIRED_CODES):
                    newRow["serious-mental-illness-smi-unspec---primary-identified"] = "CASE";
                    break;
            if(codes_identified>=REQUIRED_CODES): break;
        if(codes_identified<REQUIRED_CODES):
            newRow["serious-mental-illness-smi-unspec---primary-identified"] = "UNK";
        codes_identified=0;
        csv_writer.writerow(newRow)
