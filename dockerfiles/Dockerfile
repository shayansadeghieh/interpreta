# Use the base notebook image from Jupyter
FROM jupyter/base-notebook:latest

# Install additional packages using pip
RUN pip install --no-cache-dir \
    "torch==2.5.1" \
    "einops==0.8.0" \
    "jaxtyping==0.2.36" \
    "tqdm==4.67.1" \
    "numpy==1.26.4" \
    "transformer-lens==2.9.1" \
    "sae-lens==5.2.0" \
    "plotly==5.24.0" \
    "transformers==4.47.0" \
    "huggingface_hub==0.27.0"

# Expose Jupyter Notebook port
EXPOSE 8888


