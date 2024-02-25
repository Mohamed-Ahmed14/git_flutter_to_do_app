
abstract class TaskState{}

class TaskInitState extends TaskState{}

//class AddTaskSuccessState extends TaskState{}

class ChangeTaskTypeState extends TaskState{}

class GetAllTasksLoadingState extends TaskState{}
class GetAllTasksSuccessState extends TaskState{}
class GetAllTasksErrorState extends TaskState{}

class AddTasksLoadingState extends TaskState{}
class AddTasksSuccessState extends TaskState{}
class AddTasksErrorState extends TaskState{}


class DeleteTasksLoadingState extends TaskState{}
class DeleteTasksSuccessState extends TaskState{}
class DeleteTasksErrorState extends TaskState{}

class EditTasksLoadingState extends TaskState{}
class EditTasksSuccessState extends TaskState{}
class EditTasksErrorState extends TaskState{}

class ResetControllersSuccessState extends TaskState{}

class ChangeTaskStatus extends TaskState{}



