import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { MatToolbarModule } from '@angular/material/toolbar';
import { MatMenuModule } from '@angular/material/menu';
import { MatDividerModule } from '@angular/material/divider';
import { MatGridListModule } from '@angular/material/grid-list'; 
import { MatSnackBarModule } from '@angular/material/snack-bar'; 
import { MatTableModule } from '@angular/material/table';
import { MatIconModule } from '@angular/material/icon';
import { MatButtonModule } from '@angular/material/button';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatInputModule } from '@angular/material/input';
import { MatPaginatorModule } from '@angular/material/paginator';
import { MatDialogModule } from '@angular/material/dialog';
import { MatStepperModule } from '@angular/material/stepper';
import { MatAutocompleteModule } from '@angular/material/autocomplete';
import { MatDatepickerModule } from '@angular/material/datepicker';


@NgModule({

    imports: [ 
        CommonModule, 
        MatToolbarModule, 
        MatIconModule, 
        MatButtonModule, 
        MatMenuModule, 
        MatDividerModule, 
        MatGridListModule, 
        MatSnackBarModule, 
        MatFormFieldModule, 
        MatInputModule, 
        MatTableModule, 
        MatPaginatorModule, 
        MatDialogModule, 
        MatStepperModule, 
        MatAutocompleteModule, 
        MatDatepickerModule 
    ],
    exports: [ 
        CommonModule, 
        MatToolbarModule, 
        MatIconModule, 
        MatButtonModule, 
        MatMenuModule, 
        MatDividerModule, 
        MatGridListModule, 
        MatSnackBarModule, 
        MatFormFieldModule, 
        MatInputModule, 
        MatTableModule, 
        MatPaginatorModule, 
        MatDialogModule, 
        MatStepperModule, 
        MatAutocompleteModule, 
        MatDatepickerModule 
    ]
})
export class MaterialModule {}