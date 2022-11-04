import 'package:flutter/material.dart';

class Course {
  String name, description, lastChapter;
  IconData iconData;

  Course(this.name, this.iconData, this.description, this.lastChapter);

  static List<Course> categoryList() {
    List<Course> list = [];

    list.add(Course(
        'Biology',
        Icons.category_outlined,
        'Business English communication skills are essential for getting ahead at work. Improving your career of professional business vocabulary and knowledge will help you work more effectively and open up the new career opportunities.',
        'Respiration in Human'));
    list.add(Course(
        'Science',
        Icons.calendar_today_outlined,
        'Business English communication skills are essential for getting ahead at work. Improving your career of professional business vocabulary and knowledge will help you work more effectively and open up the new career opportunities.',
        'Lens Theory'));
    list.add(Course(
        'Design',
        Icons.school_outlined,
        'Business English communication skills are essential for getting ahead at work. Improving your career of professional business vocabulary and knowledge will help you work more effectively and open up the new career opportunities.',
        'Basic of UI/UX'));
    list.add(Course(
        'Cooking',
        Icons.outdoor_grill_outlined,
        'Business English communication skills are essential for getting ahead at work. Improving your career of professional business vocabulary and knowledge will help you work more effectively and open up the new career opportunities.',
        'Mexican Soup'));
    list.add(Course(
        'Maths',
        Icons.calculate_outlined,
        'Business English communication skills are essential for getting ahead at work. Improving your career of professional business vocabulary and knowledge will help you work more effectively and open up the new career opportunities.',
        'Integration'));

    return list;
  }
}
