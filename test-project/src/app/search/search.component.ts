import { withFetch } from '@angular/common/http';
import { Component } from '@angular/core';

@Component({
  selector: 'app-search',
  templateUrl: './search.component.html',
  styleUrl: './search.component.css'
})
export class SearchComponent {
  searchedText = " "

  searchFunction(word: string): string{
    console.log(word)

    return word
  }




}
