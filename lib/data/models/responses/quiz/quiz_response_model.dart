import 'dart:convert';

class QuizResponseModel {
  final String message;
  final Test? test;
  final List<Question>? questions;

  QuizResponseModel({
    required this.message,
    this.test,
    this.questions,
  });

  factory QuizResponseModel.fromJson(String str) =>
      QuizResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory QuizResponseModel.fromMap(Map<String, dynamic> json) =>
      QuizResponseModel(
        message: json["message"],
        test: json["test"] != null ? Test.fromMap(json["test"]) : null,
        questions: json["questions"].isNotEmpty
            ? List<Question>.from(
                json["questions"].map((x) => Question.fromMap(x)))
            : [],
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "test": test!.toMap(),
        "questions": List<dynamic>.from(questions!.map((x) => x.toMap())),
      };
}

class Question {
  final int id;
  final String question;
  final String category;
  final Choices choices;

  Question({
    required this.id,
    required this.question,
    required this.category,
    required this.choices,
  });

  factory Question.fromJson(String str) => Question.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Question.fromMap(Map<String, dynamic> json) => Question(
        id: json["id"],
        question: json["question"],
        category: json["category"],
        choices: Choices.fromMap(json["choices"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "question": question,
        "category": category,
        "choices": choices.toMap(),
      };
}

class Choices {
  final String a;
  final String b;
  final String c;
  final String d;

  Choices({
    required this.a,
    required this.b,
    required this.c,
    required this.d,
  });

  factory Choices.fromJson(String str) => Choices.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Choices.fromMap(Map<String, dynamic> json) => Choices(
        a: json["a"],
        b: json["b"],
        c: json["c"],
        d: json["d"],
      );

  Map<String, dynamic> toMap() => {
        "a": a,
        "b": b,
        "c": c,
        "d": d,
      };
}

class Test {
  final int id;
  final int userId;
  final int logicScore;
  final int numericScore;
  final int verbalScore;
  final String numericStatus;
  final String verbalStatus;
  final String logicStatus;
  final dynamic numericTimer;
  final dynamic verbalTimer;
  final dynamic logicTimer;
  final dynamic result;
  final DateTime createdAt;
  final DateTime updatedAt;

  Test({
    required this.id,
    required this.userId,
    required this.logicScore,
    required this.numericScore,
    required this.verbalScore,
    required this.numericStatus,
    required this.verbalStatus,
    required this.logicStatus,
    required this.numericTimer,
    required this.verbalTimer,
    required this.logicTimer,
    required this.result,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Test.fromJson(String str) => Test.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Test.fromMap(Map<String, dynamic> json) => Test(
        id: json["id"],
        userId: json["user_id"],
        logicScore: json["logic_score"],
        numericScore: json["numeric_score"],
        verbalScore: json["verbal_score"],
        numericStatus: json["numeric_status"],
        verbalStatus: json["verbal_status"],
        logicStatus: json["logic_status"],
        numericTimer: json["numeric_timer"],
        verbalTimer: json["verbal_timer"],
        logicTimer: json["logic_timer"],
        result: json["result"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "user_id": userId,
        "logic_score": logicScore,
        "numeric_score": numericScore,
        "verbal_score": verbalScore,
        "numeric_status": numericStatus,
        "verbal_status": verbalStatus,
        "logic_status": logicStatus,
        "numeric_timer": numericTimer,
        "verbal_timer": verbalTimer,
        "logic_timer": logicTimer,
        "result": result,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
