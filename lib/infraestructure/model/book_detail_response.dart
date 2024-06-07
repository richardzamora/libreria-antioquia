// To parse this JSON data, do
//
//     final bookDetailResponse = bookDetailResponseFromJson(jsonString);

import 'dart:convert';

BookDetailResponse bookDetailResponseFromJson(String str) =>
    BookDetailResponse.fromJson(json.decode(str));

String bookDetailResponseToJson(BookDetailResponse data) =>
    json.encode(data.toJson());

class BookDetailResponse {
  String? error;
  String? title;
  String? subtitle;
  String? authors;
  String? publisher;
  String? language;
  String? isbn10;
  String? isbn13;
  String? pages;
  String? year;
  String? rating;
  String? desc;
  String? price;
  String? image;
  String? url;
  Pdf? pdf;

  BookDetailResponse({
    this.error,
    this.title,
    this.subtitle,
    this.authors,
    this.publisher,
    this.language,
    this.isbn10,
    this.isbn13,
    this.pages,
    this.year,
    this.rating,
    this.desc,
    this.price,
    this.image,
    this.url,
    this.pdf,
  });

  factory BookDetailResponse.fromJson(Map<String, dynamic> json) =>
      BookDetailResponse(
        error: json["error"],
        title: json["title"],
        subtitle: json["subtitle"],
        authors: json["authors"],
        publisher: json["publisher"],
        language: json["language"],
        isbn10: json["isbn10"],
        isbn13: json["isbn13"],
        pages: json["pages"],
        year: json["year"],
        rating: json["rating"],
        desc: json["desc"],
        price: json["price"],
        image: json["image"],
        url: json["url"],
        pdf: json["pdf"] == null ? null : Pdf.fromJson(json["pdf"]),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "title": title,
        "subtitle": subtitle,
        "authors": authors,
        "publisher": publisher,
        "language": language,
        "isbn10": isbn10,
        "isbn13": isbn13,
        "pages": pages,
        "year": year,
        "rating": rating,
        "desc": desc,
        "price": price,
        "image": image,
        "url": url,
        "pdf": pdf?.toJson(),
      };
}

class Pdf {
  String? chapter1;
  String? chapter4;

  Pdf({
    this.chapter1,
    this.chapter4,
  });

  factory Pdf.fromJson(Map<String, dynamic> json) => Pdf(
        chapter1: json["Chapter 1"],
        chapter4: json["Chapter 4"],
      );

  Map<String, dynamic> toJson() => {
        "Chapter 1": chapter1,
        "Chapter 4": chapter4,
      };
}
