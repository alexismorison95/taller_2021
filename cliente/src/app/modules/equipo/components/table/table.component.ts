import { Component, EventEmitter, Input, OnChanges, OnInit, Output, SimpleChanges } from '@angular/core';
import { MatTableDataSource } from '@angular/material/table';
import { Column } from "src/app/shared/models/column";
import { EquipoPeriodoUtilizable } from '../../models/equipo';

@Component({
  selector: 'equipo-table',
  templateUrl: './table.component.html',
  styleUrls: ['./table.component.css']
})
export class TableComponent implements OnInit, OnChanges {

  @Input() pData?: EquipoPeriodoUtilizable[];
  @Input() pColumns?: Column[];

  @Output() nuevoEquipoEvent: EventEmitter<any> = new EventEmitter();
  @Output() editarEquipoEvent: EventEmitter<EquipoPeriodoUtilizable> = new EventEmitter();
  @Output() eliminarEquipoEvent: EventEmitter<EquipoPeriodoUtilizable> = new EventEmitter();

  dataSource: MatTableDataSource<EquipoPeriodoUtilizable>;
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

  editarEquipo(pRow: EquipoPeriodoUtilizable) {
    this.editarEquipoEvent.emit(pRow);
  }

  eliminarEquipo(pRow: EquipoPeriodoUtilizable) {
    this.eliminarEquipoEvent.emit(pRow);
  }
}
