Split Controllers
==

На большом `сториборде` HomeController размещены разделенные контроллеры: ObjectionsController, QuestionsController, TypeController, ListController.

Тестироваля на iPad Air (8.1)


## Controllers with Xib.

1. Создаем `ObjectionsView.xib` и присваиваем Owner-a: ObjectionsController.

2. Создаем ссылку на `tableview` из ObjectionsView.xib в ObjectionsController.

```objc

//From XIB
- (IBAction)objectionsPressed:(id)sender
{
    self.ovc = [[ObjectionsController alloc] initWithNibName:@"ObjectionsView" bundle:nil];
    [self.view addSubview:_ovc.view];

    [_ovc.view setFrame:CGRectMake(1024-250, 70, 250, 768)];
}

```

## Controllers with Storyboard.

1. Создаем `storyboard` для контроллер QuestionsController

2. Создаем ссылку на `tableView` из storyboard-a в QuestionsController класс

```objc

//From STORYBOARD
- (IBAction)questionsPressed:(id)sender
{
    self.qvc = [self.storyboard instantiateViewControllerWithIdentifier:@"QuestionsController"];
    [self.view addSubview:_qvc.view];

    [_qvc.view setFrame:CGRectMake(1024-250-250-50, 70, 250, 768)];
}

```

## Controllers with Object Controller inside IB.