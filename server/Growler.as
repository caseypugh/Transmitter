﻿// Toast/Growl like notifications thanks to: http://www.adobe.com/devnet/air/flash/quickstart/articles/creating_toast-style_windows.htmlpackage{  import display.*;  import flash.display.Sprite;  import flash.desktop.DockIcon;  import flash.desktop.NativeApplication;  import flash.desktop.SystemTrayIcon;  import flash.display.NativeMenu;  import flash.display.NativeMenuItem;  import flash.display.Sprite;  import flash.events.Event;  import flash.filesystem.File;  import flash.html.HTMLLoader;  import flash.net.LocalConnection;  public class Growler extends Sprite  {    private var displayManager:DisplayManager;    private var lc:LocalConnection = new LocalConnection();    public function Growler()    {      displayManager = new DisplayManager();      NativeApplication.nativeApplication.autoExit = false;      stage.nativeWindow.close();      lc.client = this;      lc.allowDomain("*");      lc.connect("magical_connection");      message("Loaded!");    }    public function message(msg:String):void    {      trace('Displaying message: ' + msg);      displayManager.displayMessage(msg);    }  }}