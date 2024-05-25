# Siobhan Reilly, Ivan Olier, Claire Planner, Tim Doran, David Reeves, Darren M Ashcroft, Linda Gask, Evangelos Kontopantelis, 2024.

import sys, csv, re

codes = [{"code":"Eu20y13","system":"readv2"},{"code":"Eu21.15","system":"readv2"},{"code":"E100200","system":"readv2"},{"code":"E102.00","system":"readv2"},{"code":"E105z00","system":"readv2"},{"code":"E100.11","system":"readv2"},{"code":"E101z00","system":"readv2"},{"code":"Eu23211","system":"readv2"},{"code":"Eu21.16","system":"readv2"},{"code":"Eu21.11","system":"readv2"},{"code":"Eu20111","system":"readv2"},{"code":"E101.00","system":"readv2"},{"code":"E10y.00","system":"readv2"},{"code":"E10y000","system":"readv2"},{"code":"E101400","system":"readv2"},{"code":"E107200","system":"readv2"},{"code":"Eu20600","system":"readv2"},{"code":"E102z00","system":"readv2"},{"code":"E107.00","system":"readv2"},{"code":"E107300","system":"readv2"},{"code":"E105200","system":"readv2"},{"code":"E100300","system":"readv2"},{"code":"E102000","system":"readv2"},{"code":"Eu20y00","system":"readv2"},{"code":"Eu20100","system":"readv2"},{"code":"E103500","system":"readv2"},{"code":"E10z.00","system":"readv2"},{"code":"E103.00","system":"readv2"},{"code":"Eu20.00","system":"readv2"},{"code":"E100500","system":"readv2"},{"code":"E107500","system":"readv2"},{"code":"E105000","system":"readv2"},{"code":"Eu21.14","system":"readv2"},{"code":"E101500","system":"readv2"},{"code":"E107400","system":"readv2"},{"code":"Eu20200","system":"readv2"},{"code":"E10y100","system":"readv2"},{"code":"Eu25212","system":"readv2"},{"code":"E10yz00","system":"readv2"},{"code":"Eu20y12","system":"readv2"},{"code":"Eu21.12","system":"readv2"},{"code":"E10y.11","system":"readv2"},{"code":"E102500","system":"readv2"},{"code":"E107z00","system":"readv2"},{"code":"E107000","system":"readv2"},{"code":"E100100","system":"readv2"},{"code":"E103200","system":"readv2"},{"code":"Eu21.13","system":"readv2"},{"code":"E105.00","system":"readv2"},{"code":"E100z00","system":"readv2"},{"code":"Eu20213","system":"readv2"},{"code":"Eu23214","system":"readv2"},{"code":"E105500","system":"readv2"},{"code":"E100.00","system":"readv2"},{"code":"E107.11","system":"readv2"},{"code":"E101000","system":"readv2"},{"code":"E107100","system":"readv2"},{"code":"Eu21.17","system":"readv2"},{"code":"Eu20000","system":"readv2"},{"code":"E103300","system":"readv2"},{"code":"E103400","system":"readv2"},{"code":"Eu20z00","system":"readv2"},{"code":"E100000","system":"readv2"},{"code":"E100400","system":"readv2"},{"code":"E102100","system":"readv2"},{"code":"Eu20311","system":"readv2"},{"code":"Eu23212","system":"readv2"},{"code":"Eu20212","system":"readv2"},{"code":"Eu20214","system":"readv2"},{"code":"E103z00","system":"readv2"},{"code":"E104.00","system":"readv2"},{"code":"E103000","system":"readv2"}];
REQUIRED_CODES = 1;
with open(sys.argv[1], 'r') as file_in, open('serious-mental-illness-potential-cases.csv', 'w', newline='') as file_out:
    csv_reader = csv.DictReader(file_in)
    csv_writer = csv.DictWriter(file_out, csv_reader.fieldnames + ["serious-mental-illness-smi-schizophrenifrm---primary-identified"])
    csv_writer.writeheader();
    codes_identified = 0;
    for row in csv_reader:
        newRow = row.copy();
        for cell in row:
            # Iterate cell lists (e.g. codes)
            for item in re.findall(r'\(([^,]*)\,', row[cell]):
                if(item in list(map(lambda code: code['code'], codes))): codes_identified+=1;
                if(codes_identified>=REQUIRED_CODES):
                    newRow["serious-mental-illness-smi-schizophrenifrm---primary-identified"] = "CASE";
                    break;
            if(codes_identified>=REQUIRED_CODES): break;
        if(codes_identified<REQUIRED_CODES):
            newRow["serious-mental-illness-smi-schizophrenifrm---primary-identified"] = "UNK";
        codes_identified=0;
        csv_writer.writerow(newRow)
