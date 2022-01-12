import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { MatDialogRef } from '@angular/material/dialog';

@Component({
  selector: 'app-nuevo-equipo',
  templateUrl: './nuevo-equipo.component.html',
  styleUrls: ['./nuevo-equipo.component.css']
})
export class NuevoEquipoComponent implements OnInit {

  form: FormGroup;
  
  constructor(
    private formBuilder: FormBuilder,
    private dialogRef: MatDialogRef<NuevoEquipoComponent>
    ) { }

  ngOnInit(): void {

    this.buildForm();
  }

  buildForm(): void {

    this.form = this.formBuilder.group({
      nombre: ['', Validators.required]
    });
  }

  nuevoEquipo() {

    this.dialogRef.close(this.form.value);
  }

}
