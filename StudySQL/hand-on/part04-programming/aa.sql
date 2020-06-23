/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2014                    */
/* Created on:     03/23/2020 2:06:40 PM                        */
/*==============================================================*/
create database DBK15_useTool
use  DBK15_useTool


/*==============================================================*/
/* Table: Major                                                 */
/*==============================================================*/
create table Major (
   MID                  char(2)              not null,
   NameMajor            varchar(50)          null,
   constraint PK_MAJOR primary key (MID)
)


/*==============================================================*/
/* Table: Student                                               */
/*==============================================================*/
create table Student (
   SID                  char(50)             not null,
   MID                  char(2)              null,
   Name                 varchar(50)          not null,
   constraint PK_STUDENT primary key (SID)
)


/*==============================================================*/
/* Index: "StudentN-1Major_FK"                                  */
/*==============================================================*/


alter table Student
   add constraint "FK_STUDENT_STUDENTN-_MAJOR" foreign key (MID)
      references Major (MID)

