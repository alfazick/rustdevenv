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