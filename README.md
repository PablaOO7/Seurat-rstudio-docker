# Seurat-rstudio-docker
Docker container with Seurat + RStudio Server for single-cell RNA-seq analysis. Browser-based, Windows-compatible, workshop-ready. No local R installation needed.

# Seurat-RStudio Docker for scRNA-seq Analysis

[![Docker Image](https://img.shields.io/badge/docker-ajaxoo7%2Fseurat--rstudio-blue)](https://hub.docker.com/r/ajaxoo7/seurat-rstudio)
[![Docker Pulls](https://img.shields.io/docker/pulls/ajaxoo7/seurat-rstudio)](https://hub.docker.com/r/ajaxoo7/seurat-rstudio)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE)

A ready-to-use Docker container combining [Seurat](https://satijalab.org/seurat/) and [RStudio Server](https://posit.co/products/open-source/rstudio/) for seamless single-cell RNA-seq analysis with browser-based access.

## 🎯 Overview

This Docker image provides a complete environment for single-cell RNA-seq analysis, perfect for:
- **Workshops & Training** - Standardized setup for all participants
- **Reproducible Research** - Share exact computational environment
- **Quick Analysis** - No local R/RStudio installation needed
- **Windows Users** - Easy access to your data files through volume mounting

**Key Features:**
- Pre-configured Seurat (based on official Satijalab image)
- RStudio Server accessible via web browser
- Direct access to Windows files
- Most of the required dependencies pre-installed

## 📚 Documentation

- **[Workshop Guide (PDF)](seurat_workflow.pdf)** - Complete step-by-step tutorial for hands-on sessions
- **[Dockerfile](Dockerfile)** - View the container configuration

## 🚀 Quick Start

### Prerequisites
- Windows 10/11 with WSL2
- Docker Desktop
- 8GB+ RAM (16GB recommended)

### Pull and Run

```bash
# Pull the image
docker pull ajaxoo7/seurat-rstudio:v2

# Run with your data folder
docker run -d \
  --name seurat-workshop \
  -p 8787:8787 \
  -v "C:/Users/YourUsername/Desktop/scRNAseq_data:/home/rstudio/data" \
  ajaxoo7/seurat-rstudio:v2
```

### Access RStudio

1. Open browser: **http://localhost:8787**
2. Login: `rstudio` / `rstudio`
3. Your data is at `/home/rstudio/data`

**That's it! Start analyzing your single-cell data. 🧬**

## 📦 What's Inside

- **Base**: [satijalab/seurat:latest](https://hub.docker.com/r/satijalab/seurat)
- **RStudio Server**: 2022.07.2-576
- **Seurat**: Latest from Satijalab
- **R**: Version from Seurat base image
- All Seurat dependencies pre-installed

## 💾 Working with Your Data

### Mount Your Data Folder

```bash
docker run -d \
  --name seurat-workshop \
  -p 8787:8787 \
  -v "C:/path/to/your/data:/home/rstudio/data" \
  -v "C:/path/to/scripts:/home/rstudio/scripts" \
  ajaxoo7/seurat-rstudio:v2
```

### Save Your Results

Files saved to `/home/rstudio/data/` persist on your Windows drive:

```r
# Save Seurat object
saveRDS(seurat_obj, "/home/rstudio/data/results/analysis.rds")

# Save plots
ggsave("/home/rstudio/data/figures/umap.pdf", width = 8, height = 6)
```

## 🔧 Container Management

```bash
# Check status
docker ps

# Stop container
docker stop seurat-workshop

# Start again
docker start seurat-workshop

# Remove container
docker rm seurat-workshop
```
## 🐛 Troubleshooting

**Can't access localhost:8787?**
- Check Docker Desktop is running
- Verify container: `docker ps`
- Restart: `docker restart seurat-workshop`

**Data folder empty?**
- Use forward slashes: `C:/Users/...`
- Check path exists in Windows
- Verify Docker file sharing in settings

**Port in use?**
```bash
docker run -d --name seurat-workshop -p 8888:8787 ajaxoo7/seurat-rstudio:v2
```
Access at: http://localhost:8888

## 📖 Resources

- [Seurat Documentation](https://satijalab.org/seurat/)
- [Seurat Tutorials](https://satijalab.org/seurat/articles/get_started.html)
- [RStudio Server Guide](https://posit.co/products/open-source/rstudio-server/)
- [Docker Hub Repository](https://hub.docker.com/r/ajaxoo7/seurat-rstudio)

## 🙏 Acknowledgments

Built upon excellent work by:

**Satija Lab** - For [Seurat](https://satijalab.org/seurat/) and the [official Docker image](https://hub.docker.com/r/satijalab/seurat)
> Hao et al., (2021). Integrated analysis of multimodal single-cell data. *Cell*. [doi:10.1016/j.cell.2021.04.048](https://doi.org/10.1016/j.cell.2021.04.048)

**Posit (RStudio)** - For [RStudio Server](https://posit.co/products/open-source/rstudio-server/)

## 📝 Citation

If using this in research or workshops, please cite:

**Seurat:**
```bibtex
@article{hao2021integrated,
  title={Integrated analysis of multimodal single-cell data},
  author={Hao, Yuhan and Hao, Stephanie and Andersen-Nissen, Erica and Mauck, William M and Zheng, Shiwei and Butler, Andrew and Lee, Maddie J and Wilk, Aaron J and Darby, Charlotte and Zager, Michael and others},
  journal={Cell},
  volume={184},
  number={13},
  pages={3573--3587},
  year={2021},
  publisher={Elsevier}
}
```

## 📄 License

MIT License - see [LICENSE](LICENSE) file.

**Note**: Seurat and RStudio Server have their own licenses:
- [Seurat License](https://github.com/satijalab/seurat/blob/master/LICENSE)
- [RStudio Server License](https://github.com/rstudio/rstudio/blob/main/COPYING)

## 🤝 Contributing

Contributions welcome! Open an issue or submit a pull request.

---

**⭐ Star this repo if you find it helpful!**
