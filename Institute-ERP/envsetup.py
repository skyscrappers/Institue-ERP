from pyspark.sql import SparkSession
from pyspark.sql import functions as F
import time
my_spark = SparkSession \
    .builder \
    .appName("myApp") \
    .config("spark.mongodb.write.connection.uri", "mongodb://127.0.0.1") \
    .config("spark.jars.packages", "org.mongodb.spark:mongo-spark-connector:10.4.0") \
    .getOrCreate()

courses_df = my_spark.read.format("mongodb") \
    .option("database", "mongo_institute") \
    .option("collection", "courses") \
    .load()

students_df = my_spark.read.format("mongodb") \
    .option("database", "mongo_institute") \
    .option("collection", "students") \
    .load()

departments_df = my_spark.read.format("mongodb") \
    .option("database", "mongo_institute") \
    .option("collection", "departments") \
    .load()

instructors_df = my_spark.read.format("mongodb") \
    .option("database", "mongo_institute") \
    .option("collection", "instructors") \
    .load()

"""Query 1: Fetching All Students Enrolled in a Specific Course"""
def query1():
    start_time = time.time()
    machine_learning_students = courses_df \
        .filter(courses_df.course_name == "Machine Learning") \
        .select("enrollments.name")
    end_time = time.time()
    diff = end_time-start_time
    machine_learning_students.show(truncate=False)
    return diff

"""Query 2: Average number of students in courses taught by an instructor with ID 31"""
def query2():
    start_time = time.time()
    instructor_id = 31
    instructor_courses = courses_df.filter(courses_df.instructor == instructor_id)

    avg_students = instructor_courses \
        .withColumn("num_students", F.size("enrollments")) \
        .agg(F.avg("num_students").alias("avg_students"))
    end_time = time.time()
    diff = end_time-start_time
    avg_students.show()
    return diff

"""Query 3: All courses offered by the department with ID 1 (e.g., CSE department)"""
def query3():
    start_time = time.time()
    cse_courses = courses_df.filter(courses_df.department == 1).select("course_name")
    end_time = time.time()
    diff = end_time-start_time
    cse_courses.show(truncate=False)
    return diff

"""Query 4: Total number of students per department"""
def query4():
    start_time = time.time()
    total_students_per_dept = departments_df \
        .withColumn("number_of_students", F.size("students")) \
        .select(F.col("department_name").alias("department"), "number_of_students")
    end_time = time.time()
    diff = end_time-start_time
    total_students_per_dept.show(truncate=False)
    return diff

"""Query 5: Finding instructors who have taught all the BTech CSE core courses sometime during their tenure at the university."""
def query5():
    start_time = time.time()
    cse_core_courses = courses_df.filter(
        (courses_df.department == 1) & (courses_df.is_core == True)
    ).select("_id")
    core_course_ids = [row['_id'] for row in cse_core_courses.collect()]
    instructors_taught_all = instructors_df.filter(
        F.array_contains(F.col("courses._id"), core_course_ids[0])
    )
    for course_id in core_course_ids[1:]:
        instructors_taught_all = instructors_taught_all.filter(
            F.array_contains(F.col("courses._id"), course_id)
        )
    end_time = time.time()
    diff = end_time-start_time
    instructors_taught_all.select("name", "courses").show(truncate=False)
    return diff


"""Query 6: Finding top-10 courses with the highest enrollments."""
def query6():
    start_time = time.time()
    courses_with_enrollments = courses_df.withColumn(
        "num_enrollments", F.size("enrollments")
    )

    top_10_courses = courses_with_enrollments.orderBy(F.desc("num_enrollments")).limit(10)
    end_time = time.time()
    diff = end_time-start_time
    top_10_courses.select("course_name", "num_enrollments").show(truncate=False)
    return diff

if True:
    students_df = students_df.repartition(8, "department")
    courses_df = courses_df.repartition(10, "department", "_id")
    departments_df = departments_df.repartition(5,"_id")
    instructors_df = instructors_df.repartition(7,"_id")

t1 = query1()
t2 = query2()
t3 = query3()
t4 = query4()
t5 = query5()
t6 = query6()

with open('partition_time.txt', 'w') as f:
    f.write(f"Query 1 execution time: {t1} seconds\n")
    f.write(f"Query 2 execution time: {t2} seconds\n")
    f.write(f"Query 3 execution time: {t3} seconds\n")
    f.write(f"Query 4 execution time: {t4} seconds\n")
    f.write(f"Query 5 execution time: {t5} seconds\n")
    f.write(f"Query 6 execution time: {t6} seconds\n")
