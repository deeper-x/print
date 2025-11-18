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
    // var w = wstdout.Writer.init(1024);

    // try w.interface.print("test library\n", .{});
    // try w.interface.flush();

    // OUTPUT
    // test library

    var w = wstdout.Writer.create(1024);
    try w.print("test library again\n", .{});
    try w.flush();

    // OUTPUT
    // test library again

}
