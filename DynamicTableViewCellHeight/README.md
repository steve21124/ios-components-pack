DynamicTableViewCellHeight-Tests
==

###Dynamic Table View

1. Create Controller:UIViewController.

2. Add UITableView object to Controller, outlet to datasource and delegate.

3. Property.

```objc
@property (weak, nonatomic) IBOutlet UITableView *tableView;
```

4. Add UITableViewCell object to UITableView .Add Identifier to Cell - kCustomCell.

5. UITableViewDataSource

```objc
//Snippet: tableview-datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"kCustomCell"];

    return cell;
}
```

Для быстрого прототипирование Таблиц с Ячейками используется UITableViewController.

* Можем создавать ячейки внутри Storyboards и делать ссылки контролов из ячеек на контроллер. (ТОЛЬКО если контроллер наследован от TableViewController).

* Ограничение - мы не можем использовать uiimageview или uiview для создания кастомного бэкграунда.

Возможность добавить картинку на задний фон UITableViewController. через self.navigationController.

```objc
self.navigationController.view.backgroundColor =
[UIColor colorWithPatternImage:[UIImage imageNamed:@"bg3.png"]];
self.tableView.backgroundColor = [UIColor clearColor];
```

Если контроллер наследован от UIViewController то нужно создавать отдельные ячейки с ссылками (outlet-aми).

###Automatic Cell Height

* Если добавить свойство rowHeight, то выстота ячейки будет подсчитываться исходя из autolayout-ов на ячейке.

```objc
- (void)viewDidLoad {
    [super viewDidLoad];

    [self configureTableView];
}

- (void)configureTableView
{
    self.tableView.rowHeight = UITableViewAutomaticDimension;
}
```

* Table View DataSource
#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
KZMMuzeumCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MuzeumCell" forIndexPath:indexPath];

[self configureCell:cell atIndexPath:indexPath];
return cell;
}

- (void)configureCell:(KZMMuzeumCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
cell.muzeumNameLabel.text = [_tableData objectAtIndex:indexPath.row];
}



