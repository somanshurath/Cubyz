const std = @import("std");
const Allocator = std.mem.Allocator;

const main = @import("root");
const Vec2f = main.vec.Vec2f;

const gui = @import("../gui.zig");
const GuiComponent = gui.GuiComponent;
const GuiWindow = gui.GuiWindow;
const Button = @import("../components/Button.zig");
const VerticalList = @import("../components/VerticalList.zig");

pub var window = GuiWindow {
	.contentSize = Vec2f{128, 256},
	.id = "cubyz:main",
};

pub fn buttonCallbackTest() void {
	std.log.info("Clicked!", .{});
}

const padding: f32 = 8;

pub fn onOpen() Allocator.Error!void {
	var list = try VerticalList.init(.{padding, 16 + padding}, 300, 16);
	try list.add(try Button.initText(.{0, 0}, 128, "Singleplayer TODO", &buttonCallbackTest));
	try list.add(try Button.initText(.{0, 0}, 128, "Multiplayer", gui.openWindowFunction("cubyz:multiplayer")));
	try list.add(try Button.initText(.{0, 0}, 128, "Settings", gui.openWindowFunction("cubyz:settings")));
	try list.add(try Button.initText(.{0, 0}, 128, "Exit TODO", &buttonCallbackTest));
	list.finish(.center);
	window.rootComponent = list.toComponent();
	window.contentSize = window.rootComponent.?.pos() + window.rootComponent.?.size() + @splat(2, @as(f32, padding));
	gui.updateWindowPositions();
}

pub fn onClose() void {
	if(window.rootComponent) |*comp| {
		comp.deinit();
	}
}