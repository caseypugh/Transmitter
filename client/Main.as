package
{
  import flash.display.Sprite;
  import flash.display.StageAlign;
  import flash.display.StageScaleMode;
  import flash.events.Event;
  import flash.events.StatusEvent;
  import flash.events.MouseEvent;
  import flash.system.Capabilities;

  import flash.net.LocalConnection;
  import flash.external.ExternalInterface;

  public class Main extends Sprite
  {
    private var lc:LocalConnection = new LocalConnection();

    public function Main()
    {
      this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
    }

    public function message(msg:String):void
    {
      debug("Sending message: " + msg);

      // Send message to AIR app
      lc.send("app#Growler:magical_connection", "message", msg);
    }

    private function onAddedToStage(e:Event):void
    {
      stage.align = StageAlign.TOP_LEFT;
      stage.scaleMode = StageScaleMode.NO_SCALE;

      this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
      lc.addEventListener(StatusEvent.STATUS, onStatus);
      stage.addEventListener(MouseEvent.CLICK, onClick);

      // Add the callback so the webpage can access
      ExternalInterface.addCallback("message", message);

      debug("Loaded 1.0");

      // DEV debug area
      if (Capabilities.playerType == 'External') {

      }
    }

    private function onStatus(e:StatusEvent):void
    {
      switch (e.level) {
        case "status":
          debug("LocalConnection.send() succeeded");
          break;
        case "error":
          debug("LocalConnection.send() failed");
          break;
      }
    }

    private function onClick(e:MouseEvent):void
    {
      message("TESTING")
    }

    private function debug(msg:String):void
    {
      trace("[Transmit]\t" + msg);
      ExternalInterface.call("debug", "[Transmit]", msg);
    }
  }
}