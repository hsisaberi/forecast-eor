# Artificial Neural Network to Forecast Enhanced Oil Recovery Using Hydrolyzed Polyacrylamide in Sandstone and Carbonate Reservoirs

This repository contains the MATLAB implementation of the model discussed in the research paper [Artificial Neural Network to Forecast Enhanced Oil Recovery Using Hydrolyzed Polyacrylamide in Sandstone and Carbonate Reservoirs](https://www.mdpi.com/2073-4360/13/16/2606). The model utilizes Artificial Neural Networks (ANN) to predict Enhanced Oil Recovery (EOR) performance in sandstone and carbonate reservoirs using Hydrolyzed Polyacrylamide.

## 📚 **Overview**
Enhanced Oil Recovery (EOR) using polymers such as Hydrolyzed Polyacrylamide (HPAM) is a widely studied method to improve oil extraction from reservoirs. This MATLAB-based ANN model forecasts EOR efficiency based on key reservoir and operational parameters, including polymer concentration, salt concentration, rock type, initial oil saturation, porosity, permeability, pore volume flooding, temperature, API gravity, molecular weight of the polymer, and salinity.

## ⚙️ **Requirements**
- MATLAB 2016a (or later versions)

## 🚀 **Usage**
1. Clone the repository:
   ```bash
   git clone https://github.com/your-repo-url.git
   ```
2. Open MATLAB and navigate to the project folder.
3. For running the **MLP model**, run the following script in the **MLP folder**:
   ```matlab
   MLP.m
   ```
4. For running the **RBF model**, run the following script in the **RBF folder**:
   ```matlab
   RBF.m
   ```
5. For running the **ANFIS models**, run the following scripts in the **ANFIS folder**:
   ```matlab
   GENFIS1.m
   GENFIS2.m
   GENFIS3.m
   ```
6. Follow the instructions in each script to input dataset parameters and train/test the ANN models.

## 📊 **Features**
- Predict EOR performance using Hydrolyzed Polyacrylamide.
- Analyze key reservoir parameters influencing EOR.
- Train and validate ANN models with reservoir-specific data.
- Includes **MLP (Multilayer Perceptron)**, **RBF (Radial Basis Function Neural Network)**, and **ANFIS (Adaptive Neuro-Fuzzy Inference System)** architectures for model experimentation.

## 🧠 **Model Details**
### **1. Multilayer Perceptron (MLP)**
- Utilizes multiple hidden layers to model complex relationships between inputs and outputs.
- Optimized using the Levenberg–Marquardt backpropagation algorithm.
- Achieves high accuracy in predicting EOR with R² = 0.9990 and RMSE = 0.0002.

### **2. Radial Basis Function Neural Network (RBF)**
- Suitable for nonlinear data modeling.
- Features a single hidden layer with radial basis functions as activation functions.
- Provides good performance with R² = 0.9973 and RMSE = 0.0008.

### **3. Adaptive Neuro-Fuzzy Inference System (ANFIS)**
- Combines neural networks and fuzzy logic principles.
- Optimized using subtractive clustering and trial-and-error tuning.
- Achieves R² = 0.9729 and RMSE = 0.0150.

- **Input Parameters:** Polymer concentration, salt concentration, rock type, initial oil saturation, porosity, permeability, pore volume flooding, temperature, API gravity, molecular weight of the polymer, and salinity.
- **Output:** Predicted Enhanced Oil Recovery (EOR).

## 📖 **Citation**
If you use this code in your research or project, please cite the following paper:

```bibtex
@ARTICLE{Saberi2021EOR,
  author={H. Saberi and E. Esmaeilnezhad and H.J. Choi},
  journal={Polymers},
  title={Artificial Neural Network to Forecast Enhanced Oil Recovery Using Hydrolyzed Polyacrylamide in Sandstone and Carbonate Reservoirs},
  year={2021},
  volume={13},
  pages={2606},
  keywords={polymer; enhanced oil recovery; artificial neural network; fuzzy logic},
  doi={https://doi.org/10.3390/polym13162606}
}
```

## 🤝 **Contributing**
Contributions are welcome! Please submit a pull request or open an issue to discuss your proposed changes.

## 📝 **License**
This project is licensed under the MIT License.

## 📬 **Contact**
- **Author:** Hossein Saberi
- **Email:** hossein.saberi1998@gmail.com
- **LinkedIn:** [Your LinkedIn URL]
- **ResearchGate:** [Your ResearchGate URL]

---

Thank you for using this repository. Happy coding! 🚀

