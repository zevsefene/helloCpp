CXX = g++
CXXFLAGS = -Wall -Wextra -std=c++17

# Directorios
SRC_DIR = src
BUILD_DIR = build

TARGET = $(BUILD_DIR)/app.zevs
SRCS = $(wildcard $(SRC_DIR)/*.cpp)

# Convierte la ruta "src/archivo.cpp" a "build/archivo.o"
OBJS = $(patsubst $(SRC_DIR)/%.cpp, $(BUILD_DIR)/%.o, $(SRCS))

all: $(TARGET)

# Enlazado (crea el ejecutable en build/)
# $@ representa el objetivo (el ejecutable)
# $^ todas las dependencias (los .o)
$(TARGET): $(OBJS)
	$(CXX) $(CXXFLAGS) -o $@ $^

# Compilación (crea los .o en build/)
$(BUILD_DIR)/%.o: $(SRC_DIR)/%.cpp
	@mkdir -p $(BUILD_DIR)
	$(CXX) $(CXXFLAGS) -c $< -o $@

.PHONY: clean run
clean:
	rm -rf $(BUILD_DIR)

run:
	./$(TARGET)
