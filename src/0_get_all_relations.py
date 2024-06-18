import os
import json

if __name__ == '__main__':
    raw_data_folder_path = "../data/PARAREL/raw_data/patterns"
    filenames = os.listdir(raw_data_folder_path)

    all_relations = []
    all_relations_output_file = "./0_all_relations.json"

    for filename in filenames:
        file_root, _ = os.path.splitext(filename)
        all_relations.append(file_root)

    with open(all_relations_output_file, 'w') as outfile:
        json.dump(all_relations, outfile)