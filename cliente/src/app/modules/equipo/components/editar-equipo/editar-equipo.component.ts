import { Component, Inject, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { Equipo, EquipoPeriodoUtilizable } from '../../models/equipo';

@Component({
  selector: 'app-editar-equipo',
  templateUrl: './editar-equipo.component.html',
  styleUrls: ['./editar-equipo.component.css']
})
export class EditarEquipoComponent implements OnInit {

  form: FormGroup;
  
  constructor(
    private formBuilder: FormBuilder,
    private dialogRef: MatDialogRef<EditarEquipoComponent>,
    @Inject(MAT_DIALOG_DATA) public data: EquipoPeriodoUtilizable
  ) { 
    this.buildForm();
  }

  ngOnInit(): void {

    
  }

  buildForm(): void {

    this.form = this.formBuilder.group({
      id: [this.data.id],
      nombre: [this.data.nombre, Validators.required],
    });
  }

  editarEquipo() {

    this.dialogRef.close(this.form.value);
  }
}
