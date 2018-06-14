# Terminator

Have you wasted countless clicks on this popup too?

![](images/popup.png)

No more! Terminator allows you to run tasks without any mercy for any potentially still running predecessor. Just add something like this to your `keybindings.json`:

```json
{
	"key": "ctrl+shift+b",
	"command": "terminator.run",
	"args": ["test*"]
}
```

`args` is a regex that matches against the task name, in this case the `test neko -debug` task (extension prefixes like `lime:` are _not_ part of the string that is matched against).

![](images/tasks.png)

______

>John Connor: You just can't go around killing tasks.
>
>The Terminator: Why?
>
>John Connor: What do you mean why? 'Cause you can't.
>
>The Terminator: Why?
>
>John Connor: Because you just can't, okay? Trust me on this.