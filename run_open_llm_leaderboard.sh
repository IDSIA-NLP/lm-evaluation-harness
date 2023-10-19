#!/bin/bash

#SBATCH --time=10-12:00:00  # 10 days 12 hour of wall time
#SBATCH --nodes=1        # 1 GPU node
#SBATCH --partition=gpu # GPU partition
#SBATCH --ntasks=1       # 1 CPU core to drive GPU
#SBATCH --gres=gpu:1     # Request 1 GPU
#SBATCH --output=./log.out # output log file
#SBATCH --error=./error.err  # error file


echo "Job started at "`date`
module purge

# Activate conda env
source ~/miniconda3/etc/profile.d/conda.sh
conda activate llm

echo $CONDA_DEFAULT_ENV


echo "Starting..."

python main.py \
    --model hf-causal-experimental \
    --model_args #[PATH_TO_MODEL_CHECKPOINT] \
    --tasks arc_challenge,hellaswag,truthfulqa_mc,hendrycksTest-abstract_algebra,hendrycksTest-anatomy,hendrycksTest-astronomy,hendrycksTest-business_ethics,hendrycksTest-clinical_knowledge,hendrycksTest-college_biology,hendrycksTest-college_chemistry,hendrycksTest-college_computer_science,hendrycksTest-college_mathematics,hendrycksTest-college_medicine,hendrycksTest-college_physics,hendrycksTest-computer_security,hendrycksTest-conceptual_physics,hendrycksTest-econometrics,hendrycksTest-electrical_engineering,hendrycksTest-elementary_mathematics,hendrycksTest-formal_logic,hendrycksTest-global_facts,hendrycksTest-high_school_biology,hendrycksTest-high_school_chemistry,hendrycksTest-high_school_computer_science,hendrycksTest-high_school_european_history,hendrycksTest-high_school_geography,hendrycksTest-high_school_government_and_politics,hendrycksTest-high_school_macroeconomics,hendrycksTest-high_school_mathematics,hendrycksTest-high_school_microeconomics,hendrycksTest-high_school_physics,hendrycksTest-high_school_psychology,hendrycksTest-high_school_statistics,hendrycksTest-high_school_us_history,hendrycksTest-high_school_world_history,hendrycksTest-human_aging,hendrycksTest-human_sexuality,hendrycksTest-international_law,hendrycksTest-jurisprudence,hendrycksTest-logical_fallacies,hendrycksTest-machine_learning,hendrycksTest-management,hendrycksTest-marketing,hendrycksTest-medical_genetics,hendrycksTest-miscellaneous,hendrycksTest-moral_disputes,hendrycksTest-moral_scenarios,hendrycksTest-nutrition,hendrycksTest-philosophy,hendrycksTest-prehistory,hendrycksTest-professional_accounting,hendrycksTest-professional_law,hendrycksTest-professional_medicine,hendrycksTest-professional_psychology,hendrycksTest-public_relations,hendrycksTest-security_studies,hendrycksTest-sociology,hendrycksTest-us_foreign_policy,hendrycksTest-virology,hendrycksTest-world_religions \
    --device cuda:0

echo "DONE!"

