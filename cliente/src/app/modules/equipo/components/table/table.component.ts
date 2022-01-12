import { Component, EventEmitter, Input, OnChanges, OnInit, Output, SimpleChanges } from '@angular/core';
import { MatTableDataSource } from '@angular/material/table';
import { Column } from "src/app/shared/models/column";
import { Equipo } from '../../models/equipo';

@Component({
  selector: 'equipo-table',
  templateUrl: './table.component.html',
  styleUrls: ['./table.component.css']
})
export class TableComponent implements OnInit, OnChanges {

  @Input() pData?: Equipo[];
  @Input() pColumns?: Column[];

  @Output() nuevoEquipoEvent: EventEmitter<any> = new EventEmitter();
  @Output() editarEquipoEvent: EventEmitter<Equipo> = new EventEmitter();
  @Output() eliminarEquipoEvent: EventEmitter<Equipo> = new EventEmitter();

  dataSource: MatTableDataSource<Equipo> = new MatTableDataSource<Equipo>();
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

  nuevoEquipo() {
    this.nuevoEquipoEvent.emit();
  }

  editarEquipo(pRow: Equipo) {
    this.editarEquipoEvent.emit(pRow);
  }

  eliminarEquipo(pRow: Equipo) {
    this.eliminarEquipoEvent.emit(pRow);
  }
}
