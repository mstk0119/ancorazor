import { Component, OnInit } from "@angular/core";
import ArticleModel from "../../models/article-model";
import { environment } from "src/environments/environment";

@Component({
  selector: "app-about",
  templateUrl: "./about.component.html",
  styleUrls: ["./about.component.scss"]
})
export class AboutComponent implements OnInit {
  headerModel: ArticleModel = new ArticleModel({
    title: "About me",
    cover: environment.homeCoverUrl
  });
  constructor() {}

  ngOnInit() {}
}
