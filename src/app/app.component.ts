import { Component, OnDestroy, OnInit } from '@angular/core';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent implements OnInit , OnDestroy {
  title = 'my-clock';
  currentTime : Date = new Date();
  private timer : any ;

  ngOnInit(): void {
      this.timer = setInterval(() => {
        this.currentTime = new Date();
      } , 1000)
  }

  ngOnDestroy() {
    if (this.timer) {
      clearInterval(this.timer); // Cleanup when component is destroyed
    }
  }
}
