//
//  ViewController.m
//  ListaTarefas
//
//  Created by MD10 on 5/14/15.
//  Copyright (c) 2015 Infnet. All rights reserved.
//

#import "ViewController.h"
#import "Tarefa.h"

@interface ViewController ()

@property (strong, nonatomic) NSMutableArray *tarefas;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    Tarefa *t1 = [[Tarefa alloc] init];
    t1.texto = @"Comprar leite";
    t1.completada = NO;
    
    [self.tarefas addObject:t1];
    
    Tarefa *t2 = [[Tarefa alloc] init];
    t2.texto = @"Ensinar iOS";
    t2.completada = NO;
    
    [self.tarefas addObject:t2];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSMutableArray *) tarefas {
    if (_tarefas == nil) _tarefas = [[NSMutableArray alloc] init];
    return _tarefas;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.tarefas count];
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *reuseCell = [tableView dequeueReusableCellWithIdentifier:@"cellReuse" forIndexPath:indexPath];
    
    Tarefa *tarefa = self.tarefas[indexPath.row];
    
    reuseCell.textLabel.text = tarefa.texto;
    
    
    reuseCell.accessoryType = tarefa.completada ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
    
    
    return reuseCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    Tarefa *tarefaSelecionada = self.tarefas[indexPath.row];
    
    tarefaSelecionada.completada = !tarefaSelecionada.completada;
    
    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:NO];
    

}

@end
