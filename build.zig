const std = @import("std");
const debug = std.debug;

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{ .default_target = .{ .abi = .none, .os_tag = .freestanding } });
    const optimization = b.standardOptimizeOption(.{});

    // debug.print("target {}\n", .{target});

    const exe = b.addExecutable(.{
        .name = "zig-kernel",
        .root_module = b.createModule(.{
            .root_source_file = b.path("./src/main.zig"),
            .target = target,
            .optimize = optimization,
        }),
    });

    const arch = target.query.cpu_arch.?;
    const linker_script_path = switch (arch) {
        .x86_64 => "linker/x86_64.ld",
        .riscv64 => "linker/riscv64.ld",
        else => {
            @panic("Unsupported architecture for linker script");
        },
    };
    std.debug.print("linker used: {s}\n", .{linker_script_path});

    exe.setLinkerScript(.{ .src_path = .{ .owner = b, .sub_path = linker_script_path } });
    // exe.strip = true;

    b.installArtifact(exe);
}
