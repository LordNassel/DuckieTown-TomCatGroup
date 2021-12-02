#! /bin/bash
set -e

conda remove --name dtaido5 --all -y
echo ""
echo "################################################"
echo "Creating new conda environment: dtaido5"
echo "################################################"
conda env create -f environment_aido5.yml

echo "################################################"
echo "Clone gym-duckietown"
echo "################################################"
rm -rf gym-duckietown
#git clone --branch daffy --single-branch https://github.com/duckietown/gym-duckietown.git ./gym-duckietown
git clone --branch v6.0.25 --single-branch --depth 1 https://github.com/duckietown/gym-duckietown.git ./gym-duckietown

echo ""
echo "################################################"
echo "Install gym-duckietown"
echo "################################################"
conda run -vn dtaido5 pip install -e gym-duckietown 
#conda run -vn dtaido5 pip install duckietown-gym-daffy==5.0.16

echo "################################################"
echo "Copy custom maps to the installed pacages"
echo "################################################"
conda run -vn dtaido5 python -m maps.copy_custom_maps_to_duckietown_libs

echo "################################################"
echo "
# To activate this environment, use
#
#     $ conda activate dtaido5
#
# To deactivate an active environment, use
#
#     $ conda deactivate
"
echo "################################################"
echo "Setup successful"
echo "################################################"

