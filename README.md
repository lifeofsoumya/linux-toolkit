

# Bash Functions Script

This script contains useful Bash functions for development, such as running Go apps with `nodemon`, serving Python HTTP servers, cleaning `node_modules`, managing Docker containers, and more.

## Setup Instructions

Follow these steps to set up the script on your machine:

### 1. **Clone the Repository (or Copy the Script)**

If you're using a repository, clone it to your local machine. Otherwise, copy the entire script and place it in a file named `toolkit.sh`.

```bash
git clone git@github.com/lifeofsoumya/linux-toolkit
```

Or, create a new file and paste the script contents:

```bash
touch toolkit.sh
```

### 2. **Make the Script Executable (Optional)**

You can make the script executable if you want to run it directly:

```bash
chmod +x toolkit.sh
```

### 3. **Source the Script in Your `.bashrc` (or `.zshrc` if using Zsh)**

To make these functions available in every terminal session, add the following line to your `.bashrc` (or `.zshrc` for Zsh users):

```bash
echo "source /path/to/toolkit.sh" >> ~/.bashrc
```

Replace `/path/to/toolkit.sh` with the full path to the `toolkit.sh` file.

### 4. **Reload Your Terminal Configuration**

After modifying `.bashrc` or `.zshrc`, either restart your terminal or run the following command to apply the changes:

```bash
source ~/.bashrc
```

### 5. **Using the Functions**

Once set up, you can use the following functions directly from your terminal:

- **Run Go programs with `nodemon`:**
  ```bash
  rungo            # Runs main.go with nodemon
  rungo <file.go>   # Runs a specific Go file with nodemon
  ```

- **Start a simple Python HTTP server:**
  ```bash
  pyserve <port>   # Starts a Python HTTP server on the specified port (default: 8000)
  ```

- **Build and run a Docker container:**
  ```bash
  docker_run <image_name>  # Builds and runs a Docker container with the specified image name
  ```

- **Clean up unused Docker containers and images:**
  ```bash
  docker_cleanup   # Removes unused containers and images
  ```

- **Show system information:**
  ```bash
  sys_info         # Displays CPU and memory information
  ```

- **Clean up `node_modules` directories with `npkill`:**
  ```bash
  npkill           # Opens an interactive UI to remove `node_modules` directories
  ```

- **Remove `node_modules` and reinstall dependencies:**
  ```bash
  clean_node_modules   # Removes `node_modules` and lock files, then reinstalls dependencies
  ```

- **Clear npm cache:**
  ```bash
  clear_npm_cache  # Clears the npm cache (useful if you're having npm issues)
  ```

- **Open the current directory in VS Code:**
  ```bash
  code_here        # Opens the current directory in VS Code (make sure `code` is in your PATH)
  ```

- **Check disk usage:**
  ```bash
  disk_usage       # Shows disk usage in a human-readable format
  ```

- **Show the largest files and directories:**
  ```bash
  largest_files    # Lists the top 10 largest files and directories in the current directory
  ```
