# Siobhan Reilly, Ivan Olier, Claire Planner, Tim Doran, David Reeves, Darren M Ashcroft, Linda Gask, Evangelos Kontopantelis, 2024.

import sys, csv, re

codes = [{"code":"Eu25111","system":"readv2"},{"code":"Eu25112","system":"readv2"},{"code":"Eu32312","system":"readv2"},{"code":"E11..12","system":"readv2"},{"code":"E115z00","system":"readv2"},{"code":"Eu33311","system":"readv2"},{"code":"E11y000","system":"readv2"},{"code":"E115600","system":"readv2"},{"code":"Eu33213","system":"readv2"},{"code":"E11y300","system":"readv2"},{"code":"E130.00","system":"readv2"},{"code":"Eu25100","system":"readv2"},{"code":"Eu32800","system":"readv2"},{"code":"E115500","system":"readv2"},{"code":"Eu32314","system":"readv2"},{"code":"E11y.00","system":"readv2"},{"code":"E112400","system":"readv2"},{"code":"E115.11","system":"readv2"},{"code":"E130.11","system":"readv2"},{"code":"E11yz00","system":"readv2"},{"code":"E115200","system":"readv2"},{"code":"Eu33312","system":"readv2"},{"code":"Eu32311","system":"readv2"},{"code":"Eu32300","system":"readv2"},{"code":"E115000","system":"readv2"},{"code":"E115100","system":"readv2"},{"code":"Eu31.13","system":"readv2"},{"code":"Eu31.11","system":"readv2"},{"code":"E115400","system":"readv2"},{"code":"E115.00","system":"readv2"},{"code":"E115300","system":"readv2"},{"code":"Eu31.12","system":"readv2"},{"code":"Eu32313","system":"readv2"},{"code":"Eu20400","system":"readv2"}];
REQUIRED_CODES = 1;
with open(sys.argv[1], 'r') as file_in, open('serious-mental-illness-potential-cases.csv', 'w', newline='') as file_out:
    csv_reader = csv.DictReader(file_in)
    csv_writer = csv.DictWriter(file_out, csv_reader.fieldnames + ["serious-mental-illness-smi-depress---primary-identified"])
    csv_writer.writeheader();
    codes_identified = 0;
    for row in csv_reader:
        newRow = row.copy();
        for cell in row:
            # Iterate cell lists (e.g. codes)
            for item in re.findall(r'\(([^,]*)\,', row[cell]):
                if(item in list(map(lambda code: code['code'], codes))): codes_identified+=1;
                if(codes_identified>=REQUIRED_CODES):
                    newRow["serious-mental-illness-smi-depress---primary-identified"] = "CASE";
                    break;
            if(codes_identified>=REQUIRED_CODES): break;
        if(codes_identified<REQUIRED_CODES):
            newRow["serious-mental-illness-smi-depress---primary-identified"] = "UNK";
        codes_identified=0;
        csv_writer.writerow(newRow)
