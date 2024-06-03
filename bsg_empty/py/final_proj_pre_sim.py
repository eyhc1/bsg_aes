
import yaml # Not installed by default
import os
import shutil
from argparse import ArgumentParser

# Default values:
trace_data_width = 64 # Data traces should be this many bits wide
output_dir = 'out' # GIFs are written here
default_trace_fout = 'v/bsg_trace_master_0.tr' # Default output file

def main():
  parser = ArgumentParser()
  parser.add_argument('-cfg', required=True, 
                      help='The input config file (in yaml format)')
  parser.add_argument('-out', required=False, default=default_trace_fout, 
                      help=f'Output trace file, defaults to "{default_trace_fout}"')
  args = parser.parse_args()
  
  print(f'Clearing any previous output in "{output_dir}"...')
  # Create output directory for testbench .data files
  try: shutil.rmtree(output_dir)
  except(FileNotFoundError): pass
  os.mkdir(output_dir)
  
  cfg = yaml.safe_load(open(args.cfg, 'r'))
  empty_param = cfg["empty"]["empty_param"]
  with open(args.out, 'w') as fout:

    # Write trace header
    fout.write('')
    fout.write(f'# This trace file was generated by "final_project_pre_sim.py" with the config file "{args.cfg}", do not directly modify!\n')
    fout.write('\n')
    
    # After simulation finished...
    fout.write(f'########## SIMULATION FINISHED ##########\n')
    fout.write(f'0011____0_00000000000_{64*"0"}\n')
  
  # After output file closed...
  print('Done.')
  print()

if __name__ == '__main__':
  main()
