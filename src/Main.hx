import vscode.*;
import Vscode.*;
using Lambda;

class Main {
    final context:ExtensionContext;
    var runningTasks:Array<TaskExecution> = [];

    function new(context) {
        this.context = context;
        
        tasks.onDidStartTask(event -> {
            runningTasks.push(event.execution);
        });
        tasks.onDidEndTask(event -> {
            runningTasks = runningTasks.filter(execution -> execution.task.name != event.execution.task.name);
        });

        commands.registerCommand("terminator.run", taskName -> {
            if (taskName == null || taskName == "") {
                window.showErrorMessage('Keybinding is missing a task name regex to match against in `args`.');
                return;
            }
            var taskNameRegex = new EReg(taskName, "");
            tasks.fetchTasks().then(fetchedTasks -> {
                var task = fetchedTasks.find(task -> taskNameRegex.match(task.name));
                if (task == null) {
                    window.showErrorMessage('Could not find a task whose name matches \'$taskName\'.');
                } else {
                    var runningTask = runningTasks.find(execution -> taskNameRegex.match(execution.task.name));
                    if (runningTask != null) {
                        runningTask.terminate();
                    }
                    tasks.executeTask(task);
                }
            });
        });
    }

    @:expose("activate")
    static function activate(context:ExtensionContext) {
        new Main(context);
    }
}
