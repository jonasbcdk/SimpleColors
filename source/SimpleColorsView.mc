using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
//using Toybox.System as Sys;
//using Toybox.Lang as Lang;
//using Toybox.Application as App;
using Toybox.Time.Gregorian as Greg;
using Toybox.Time as Time;

class SimpleColorsView extends Ui.WatchFace {

    function initialize() {
        WatchFace.initialize();
    }

    // Load your resources here
    function onLayout(dc) {
        setLayout(Rez.Layouts.WatchFace(dc));
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() {
    }

    // Update the view
    function onUpdate(dc) {
    	var colors = [Gfx.COLOR_GREEN, Gfx.COLOR_BLUE, Gfx.COLOR_PINK, Gfx.COLOR_YELLOW, Gfx.COLOR_ORANGE, Gfx.COLOR_LT_GRAY, Gfx.COLOR_RED];
        
    	var dateinfo = Greg.info(Time.now(), Time.FORMAT_SHORT);
				
		var color = colors[dateinfo.day_of_week-1];

		var time = Util.getCurrentTime();

        // Update the view
        var view = View.findDrawableById("TimeHourLabel");
        view.setColor(color);        
        view.setText(time.hours);
        
        view = View.findDrawableById("TimeMinuteLabel");
        view.setColor(Gfx.COLOR_WHITE);        
        view.setText(time.minutes);

        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() {
    }

    // The user has just looked at their watch. Timers and animations may be started here.
    function onExitSleep() {
    }

    // Terminate any active timers and prepare for slow updates.
    function onEnterSleep() {
    }

}
