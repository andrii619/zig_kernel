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

    exe.setLinkerScript(.{ .src_path = .{ .owner = b, .sub_path = "./linker.ld" } });
    // exe.strip = true;

    b.installArtifact(exe);
}
