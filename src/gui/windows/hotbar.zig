const std = @import("std");

const main = @import("root");
const Vec2f = main.vec.Vec2f;

const gui = @import("../gui.zig");
const GuiComponent = gui.GuiComponent;
const GuiWindow = gui.GuiWindow;

var hotbarWindow: GuiWindow = undefined;
var components: [1]GuiComponent = undefined;
var hotbarWindow2: GuiWindow = undefined;
var hotbarWindow3: GuiWindow = undefined;
pub fn init() !void {
	components[0] = GuiComponent{.pos = .{64, 16}, .size = .{64, 32}, .impl = .{.button = .{.onAction = &buttonCallbackTest}}};
	hotbarWindow = GuiWindow{
		.contentSize = Vec2f{64*8, 64},
		.title = "Hotbar",
		.id = "cubyz:hotbar",
		.renderFn = &render,
		.updateFn = &update,
		.components = &components,
	};
	try gui.addWindow(&hotbarWindow, true);
	hotbarWindow2 = GuiWindow{
		.contentSize = Vec2f{64*8, 64},
		.title = "Hotbar2",
		.id = "cubyz:hotbar2",
		.renderFn = &render,
		.updateFn = &update,
		.components = &[_]GuiComponent{},
	};
	try gui.addWindow(&hotbarWindow2, true);
	hotbarWindow3 = GuiWindow{
		.contentSize = Vec2f{64*8, 64},
		.title = "Hotbar3",
		.id = "cubyz:hotbar3",
		.renderFn = &render,
		.updateFn = &update,
		.components = &[_]GuiComponent{},
	};
	try gui.addWindow(&hotbarWindow3, true);
}

pub fn buttonCallbackTest() void {
	std.log.info("Clicked!", .{});
}

pub fn render() void {

}

pub fn update() void {

}