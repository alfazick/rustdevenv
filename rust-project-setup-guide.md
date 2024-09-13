# Rust Project Setup Guide

This guide will walk you through setting up a Rust project with a Makefile and associated scripts for formatting, linting, and testing.

## 1. Project Structure

First, create your project directory and navigate into it:

```bash
mkdir my_rust_project
cd my_rust_project
```

## 2. Create the Makefile

Create a file named `Makefile` (no extension) in the project root and add the following content:

```makefile
# Makefile for Rust project

# Phony targets
.PHONY: all format lint test run release clean help

# Default target
all: format lint test

# Format code
format:
	@echo "Formatting all projects with cargo"
	./format.sh

# Lint code
lint:
	@echo "Linting all projects with cargo"
	@rustup component add clippy 2> /dev/null
	./lint.sh

# Run tests
test:
	@echo "Testing all projects with cargo"
	./test.sh

# Run the project
run:
	@echo "Running the project"
	cargo run

# Build release version
release:
	@echo "Building release version"
	cargo build --release

# Clean build artifacts
clean:
	@echo "Cleaning all projects"
	@find . -type d -name "target" -exec rm -rf {} +
	@echo "Clean complete."

# Help target
help:
	@echo "Available targets:"
	@echo "  all     - Run format, lint, and test (default)"
	@echo "  format  - Format all projects with cargo"
	@echo "  lint    - Lint all projects with cargo"
	@echo "  test    - Test all projects with cargo"
	@echo "  run     - Run the project"
	@echo "  release - Build release version"
	@echo "  clean   - Remove build artifacts"
	@echo "  help    - Show this help message"
```

## 3. Create Script Files

Create the following script files in the project root:

### format.sh

```bash
#!/usr/bin/env bash
# Format all code directories in the repository using cargo fmt.
for DIR in */; do
    DIRNAME=$(basename "$DIR")
    echo "==> $DIRNAME <=="
    (cd $DIR && cargo fmt)
done
echo "Format complete."
```

### lint.sh

```bash
#!/usr/bin/env bash
# Lint all code directories in the repository using cargo clippy.
for DIR in */; do
    DIRNAME=$(basename "$DIR")
    echo "==> $DIRNAME <=="
    (cd $DIR && cargo clippy -- -D warnings)
done
echo "Lint complete."
```

### test.sh

```bash
#!/usr/bin/env bash
# Run tests for all code directories in the repository using cargo test.
for DIR in */; do
    DIRNAME=$(basename "$DIR")
    echo "==> $DIRNAME <=="
    (cd $DIR && cargo test)
done
echo "Tests complete."
```

## 4. Make Scripts Executable

Run the following command to make the scripts executable:

```bash
chmod +x format.sh lint.sh test.sh
```

## 5. Initialize Rust Project(s)

If you haven't already, initialize your Rust project(s). For a single project:

```bash
cargo init
```

For multiple sub-projects, create directories and initialize each:

```bash
mkdir project1 project2
cd project1 && cargo init && cd ..
cd project2 && cargo init && cd ..
```

## 6. Using the Makefile

Now you can use the Makefile commands:

- `make`: Run format, lint, and test
- `make format`: Format code
- `make lint`: Lint code
- `make test`: Run tests
- `make run`: Run the project
- `make release`: Build release version
- `make clean`: Clean build artifacts
- `make help`: Show available commands

## 7. Customization

- Modify the `.sh` scripts to change how formatting, linting, and testing are performed.
- Edit the Makefile to add or modify targets as your project grows.

## 8. Version Control

If using Git, create a `.gitignore` file:

```bash
echo "/target/" > .gitignore
```

Initialize the Git repository:

```bash
git init
git add .
git commit -m "Initial project setup with Makefile and scripts"
```

Remember to keep your Makefile and scripts updated as your project evolves. Happy coding!
