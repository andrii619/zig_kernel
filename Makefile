
.PHONY: build

build:
	zig build -Dtarget=x86_64-freestanding -Doptimize=Debug

build_risc:
	zig build -Dtarget=riscv64-freestanding -Doptimize=Debug


clean:
	rm -rf zig-out