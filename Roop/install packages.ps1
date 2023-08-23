# Create a new virtual environment
python -m venv myenv

# Activate the virtual environment
$activateScript = "myenv\Scripts\Activate"
if (-Not (Test-Path $activateScript)) {
    Write-Host "Error: Unable to find the Activate script. Make sure the virtual environment was created successfully."
    Exit 1
}

# Activate the virtual environment
& $activateScript

# Modify requirements.txt with the correct package versions
@'
numpy>=1.24.2
opencv-python==4.8.0.74
onnx==1.14.0
insightface==0.7.3
torchvision==0.15.2+cu118
onnxruntime-gpu==1.15.1
torch
'@ | Set-Content -Path requirements.txt -Force

# Install the packages from requirements.txt
pip install -r requirements.txt

# Verify Torch Installation
python -c "import torch"
if ($LASTEXITCODE -eq 0) {
    Write-Host "Torch is installed successfully."
} else {
    Write-Host "Error: Failed to import torch. Please check the installation."
}
