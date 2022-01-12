import { Component, EventEmitter, Input, OnChanges, OnInit, Output, SimpleChanges } from '@angular/core';
import { MatTableDataSource } from '@angular/material/table';
import { Column } from "src/app/shared/models/column";

@Component({
  selector: 'equipo-table',
  templateUrl: './table.component.html',
  styleUrls: ['./table.component.css']
})
export class TableComponent implements OnInit, OnChanges {

  @Input() pData?: any[];
  @Input() pColumns?: Column[];
  @Input() pNuevoText?: string = '';

  @Output() nuevoEvent: EventEmitter<any> = new EventEmitter();
  @Output() editarEvent: EventEmitter<any> = new EventEmitter();
  @Output() bajaEvent: EventEmitter<any> = new EventEmitter();

  dataSource: MatTableDataSource<any>;
  displayedColumns: string[] = [];

  constructor() { }

  ngOnChanges(changes: SimpleChanges): void {

    this.dataSource = new MatTableDataSource(this.pData);
  }

  ngOnInit(): void {

    this.displayedColumns = this.pColumns.map((column: Column) => {
      return column.field;
    });
  }

  nuevo() {
    this.nuevoEvent.emit();
  }

  editar(pRow: any) {
    this.editarEvent.emit(pRow);
  }

  baja(pRow: any) {
    this.bajaEvent.emit(pRow);
  }
}
