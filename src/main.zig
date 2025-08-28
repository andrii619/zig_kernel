const std = @import("std");

export fn _start() void {
    // const x: i32 = @intCast(9999999999); // This may overflow in safe mode
    // _ = x;
    //
    //
    // const a = [_]u8{ 1, 2, 3 };
    var start: usize = 0;
    var end: usize = 5;
    _ = .{ &start, &end };
    // const sl = a[start..end];
    // const x = sl[10]; // Out-of-bounds access triggers a panic
    // _ = x;
    // @panic("forced");
    while (true) {}
    // unreachable;
}

pub fn panic(msg: []const u8, trace: ?*std.builtin.StackTrace, ret_addr: ?usize) noreturn {
    // In a freestanding kernel, you can't use std.debug.print or stdout
    // Write to UART, framebuffer, or halt the CPU instead
    // Example: simple UART or memory-mapped output
    //
    _ = msg;
    _ = trace;
    _ = ret_addr;

    while (true) {}
}

// pub fn panic(msg: []const u8, _: ?*std.builtin.StackTrace, _: ?usize) noreturn {
//     // Do nothing, or halt the system
//     while (true) {}
// }
