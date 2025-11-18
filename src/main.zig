const std = @import("std");
const wstdout = @import("wstdout");

const Person = struct {
    id: i64,
    name: []const u8,
    email: []const u8,

    pub fn init(id: i64, name: []const u8, email: []const u8) Person {
        return .{
            .id = id,
            .name = name,
            .email = email,
        };
    }
};

pub fn get_writer() *std.Io.Writer {
    var buffer: [1024]u8 = undefined;

    var writer = std.fs.File.stdout().writer(&buffer);

    return &writer.interface;
}

pub fn main() !void {
    var w: *std.Io.Writer = wstdout.get_writer();

    try w.print("test library\n", .{});
    try w.flush();
}
