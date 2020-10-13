-- ----------------------------
-- Table structure for addressobjects
-- ----------------------------
DROP TABLE IF EXISTS "public"."addressobjects";
CREATE TABLE "public"."addressobjects" (
  "aoid" uuid NOT NULL,
  "previd" uuid,
  "nextid" uuid,
  "aoguid" uuid,
  "parentguid" uuid,
  "formalname" varchar(120) COLLATE "pg_catalog"."default",
  "shortname" varchar(10) COLLATE "pg_catalog"."default",
  "offname" varchar(120) COLLATE "pg_catalog"."default",
  "postalcode" varchar(6) COLLATE "pg_catalog"."default",
  "okato" varchar(11) COLLATE "pg_catalog"."default",
  "oktmo" varchar(11) COLLATE "pg_catalog"."default",
  "aolevel" int4,
  "regioncode" varchar(2) COLLATE "pg_catalog"."default",
  "autocode" varchar(1) COLLATE "pg_catalog"."default",
  "areacode" varchar(3) COLLATE "pg_catalog"."default",
  "citycode" varchar(3) COLLATE "pg_catalog"."default",
  "ctarcode" varchar(3) COLLATE "pg_catalog"."default",
  "placecode" varchar(3) COLLATE "pg_catalog"."default",
  "streetcode" varchar(4) COLLATE "pg_catalog"."default",
  "extrcode" varchar(4) COLLATE "pg_catalog"."default",
  "sextcode" varchar(3) COLLATE "pg_catalog"."default",
  "code" varchar(17) COLLATE "pg_catalog"."default",
  "plaincode" varchar(15) COLLATE "pg_catalog"."default",
  "currstatus" int4,
  "ifnsfl" varchar(4) COLLATE "pg_catalog"."default",
  "terrifnsfl" varchar(4) COLLATE "pg_catalog"."default",
  "ifnsul" varchar(4) COLLATE "pg_catalog"."default",
  "terrifnsul" varchar(4) COLLATE "pg_catalog"."default",
  "actstatus" int4,
  "centstatus" int4,
  "startdate" timestamp(6),
  "enddate" timestamp(6),
  "updatedate" timestamp(6),
  "operstatus" int4,
  "livestatus" int4,
  "normdoc" uuid,
  "plancode" varchar(10) COLLATE "pg_catalog"."default",
  "cadnum" varchar(30) COLLATE "pg_catalog"."default",
  "divtype" varchar(10) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."addressobjects"."aoid" IS 'Уникальный идентификатор записи. Ключевое поле';
COMMENT ON COLUMN "public"."addressobjects"."previd" IS 'Идентификатор записи связывания с предыдушей исторической записью';
COMMENT ON COLUMN "public"."addressobjects"."nextid" IS 'Идентификатор записи  связывания с последующей исторической записью';
COMMENT ON COLUMN "public"."addressobjects"."aoguid" IS 'Глобальный уникальный идентификатор адресообразующего элемента';
COMMENT ON COLUMN "public"."addressobjects"."parentguid" IS 'Идентификатор элемента родительского элемента';
COMMENT ON COLUMN "public"."addressobjects"."formalname" IS 'Формализованное наименование';
COMMENT ON COLUMN "public"."addressobjects"."shortname" IS 'Краткое наименование типа элемента';
COMMENT ON COLUMN "public"."addressobjects"."offname" IS 'Официальное наименование';
COMMENT ON COLUMN "public"."addressobjects"."postalcode" IS 'Почтовый индекс';
COMMENT ON COLUMN "public"."addressobjects"."okato" IS 'ОКАТО';
COMMENT ON COLUMN "public"."addressobjects"."oktmo" IS 'ОКТМО';
COMMENT ON COLUMN "public"."addressobjects"."aolevel" IS 'Уровень адресообразующего элемента ';
COMMENT ON COLUMN "public"."addressobjects"."regioncode" IS 'Код региона';
COMMENT ON COLUMN "public"."addressobjects"."autocode" IS 'Код автономии';
COMMENT ON COLUMN "public"."addressobjects"."areacode" IS 'Код района';
COMMENT ON COLUMN "public"."addressobjects"."citycode" IS 'Код города';
COMMENT ON COLUMN "public"."addressobjects"."ctarcode" IS 'Код внутригородского района';
COMMENT ON COLUMN "public"."addressobjects"."placecode" IS 'Код населенного пункта';
COMMENT ON COLUMN "public"."addressobjects"."streetcode" IS 'Код улицы';
COMMENT ON COLUMN "public"."addressobjects"."extrcode" IS 'Код дополнительного адресообразующего элемента';
COMMENT ON COLUMN "public"."addressobjects"."sextcode" IS 'Код подчиненного дополнительного адресообразующего элемента';
COMMENT ON COLUMN "public"."addressobjects"."code" IS 'Код адресообразующего элемента одной строкой с признаком актуальности из КЛАДР 4.0.';
COMMENT ON COLUMN "public"."addressobjects"."plaincode" IS 'Код адресообразующего элемента из КЛАДР 4.0 одной строкой без признака актуальности (последних двух цифр)';
COMMENT ON COLUMN "public"."addressobjects"."currstatus" IS 'Статус актуальности КЛАДР 4 (последние две цифры в коде)';
COMMENT ON COLUMN "public"."addressobjects"."ifnsfl" IS 'Код ИФНС ФЛ';
COMMENT ON COLUMN "public"."addressobjects"."terrifnsfl" IS 'Код территориального участка ИФНС ФЛ';
COMMENT ON COLUMN "public"."addressobjects"."ifnsul" IS 'Код ИФНС ЮЛ';
COMMENT ON COLUMN "public"."addressobjects"."terrifnsul" IS 'Код территориального участка ИФНС ЮЛ';
COMMENT ON COLUMN "public"."addressobjects"."actstatus" IS 'Статус актуальности адресообразующего элемента ФИАС. Актуальный адрес на текущую дату. Обычно последняя запись об адресообразующем элементе. 0 – Не актуальный, 1 - Актуальный';
COMMENT ON COLUMN "public"."addressobjects"."centstatus" IS 'Статус центра';
COMMENT ON COLUMN "public"."addressobjects"."startdate" IS 'Начало действия записи';
COMMENT ON COLUMN "public"."addressobjects"."enddate" IS 'Окончание действия записи';
COMMENT ON COLUMN "public"."addressobjects"."updatedate" IS 'Дата  внесения (обновления) записи';
COMMENT ON COLUMN "public"."addressobjects"."operstatus" IS 'Статус действия над записью – причина появления записи (см. описание таблицы OperationStatus)';
COMMENT ON COLUMN "public"."addressobjects"."livestatus" IS 'Признак действующего адресообразующего элемента: 0 – недействующий адресный элемент, 1 - действующий';
COMMENT ON COLUMN "public"."addressobjects"."normdoc" IS 'Внешний ключ на нормативный документ';
COMMENT ON TABLE "public"."addressobjects" IS 'ADDROBJ (Object) содержит коды, наименования и типы адресообразующих элементов.';

-- ----------------------------
-- Table structure for estatestatus
-- ----------------------------
DROP TABLE IF EXISTS "public"."estatestatus";
CREATE TABLE "public"."estatestatus" (
  "estatestatusid" int4 NOT NULL,
  "estatestatusname" varchar(60) COLLATE "pg_catalog"."default",
  "estatestatusshortname" varchar(20) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."estatestatus"."estatestatusid" IS 'Признак владения. Принимает значение:0 – Не определено,1 – Владение,2 – Дом,3 – Домовладение';
COMMENT ON COLUMN "public"."estatestatus"."estatestatusname" IS 'Наименование';
COMMENT ON COLUMN "public"."estatestatus"."estatestatusshortname" IS 'Краткое наименование';
COMMENT ON TABLE "public"."estatestatus" IS 'Справочник (перечень) видов владений';

-- ----------------------------
-- Table structure for houses
-- ----------------------------
DROP TABLE IF EXISTS "public"."houses";
CREATE TABLE "public"."houses" (
  "houseid" uuid NOT NULL,
  "aoguid" uuid,
  "houseguid" uuid,
  "housenum" varchar(20) COLLATE "pg_catalog"."default",
  "buildnum" varchar(20) COLLATE "pg_catalog"."default",
  "strucnum" varchar(20) COLLATE "pg_catalog"."default",
  "postalcode" varchar(6) COLLATE "pg_catalog"."default",
  "okato" varchar(11) COLLATE "pg_catalog"."default",
  "oktmo" varchar(11) COLLATE "pg_catalog"."default",
  "ifnsfl" varchar(4) COLLATE "pg_catalog"."default",
  "terrifnsfl" varchar(4) COLLATE "pg_catalog"."default",
  "ifnsul" varchar(4) COLLATE "pg_catalog"."default",
  "terrifnsul" varchar(4) COLLATE "pg_catalog"."default",
  "eststatus" int4,
  "statstatus" int4,
  "strstatus" int4,
  "startdate" timestamp(6),
  "enddate" timestamp(6),
  "updatedate" timestamp(6),
  "normdoc" uuid,
  "counter" int4,
  "cadnum" varchar(50) COLLATE "pg_catalog"."default",
  "divtype" int4
)
;
COMMENT ON COLUMN "public"."houses"."houseid" IS 'Уникальный идентификатор записи дома';
COMMENT ON COLUMN "public"."houses"."aoguid" IS 'Глобальный уникальный идентификатор записи родительского объекта (улицы, города, населенного пункта и т.п.)';
COMMENT ON COLUMN "public"."houses"."houseguid" IS 'Глобальный уникальный идентификатор дома';
COMMENT ON COLUMN "public"."houses"."housenum" IS 'Номер дома';
COMMENT ON COLUMN "public"."houses"."buildnum" IS 'Номер корпуса';
COMMENT ON COLUMN "public"."houses"."strucnum" IS 'Номер строения';
COMMENT ON COLUMN "public"."houses"."postalcode" IS 'Почтовый индекс';
COMMENT ON COLUMN "public"."houses"."okato" IS 'ОКАТО';
COMMENT ON COLUMN "public"."houses"."oktmo" IS 'ОКТМО';
COMMENT ON COLUMN "public"."houses"."ifnsfl" IS 'Код ИФНС ФЛ';
COMMENT ON COLUMN "public"."houses"."terrifnsfl" IS 'Код территориального участка ИФНС ФЛ';
COMMENT ON COLUMN "public"."houses"."ifnsul" IS 'Код ИФНС ЮЛ';
COMMENT ON COLUMN "public"."houses"."terrifnsul" IS 'Код территориального участка ИФНС ЮЛ';
COMMENT ON COLUMN "public"."houses"."eststatus" IS 'Признак владения';
COMMENT ON COLUMN "public"."houses"."statstatus" IS 'Состояние дома';
COMMENT ON COLUMN "public"."houses"."strstatus" IS 'Признак строения';
COMMENT ON COLUMN "public"."houses"."startdate" IS 'Начало действия записи';
COMMENT ON COLUMN "public"."houses"."enddate" IS 'Окончание действия записи';
COMMENT ON COLUMN "public"."houses"."updatedate" IS 'Дата  внесения (обновления) записи';
COMMENT ON COLUMN "public"."houses"."normdoc" IS 'Внешний ключ на нормативный документ';
COMMENT ON COLUMN "public"."houses"."counter" IS 'Счетчик записей домов для КЛАДР 4';
COMMENT ON COLUMN "public"."houses"."cadnum" IS 'Кадастровый номер здания';
COMMENT ON COLUMN "public"."houses"."divtype" IS 'Тип деления: 0 – не определено 1 – муниципальное 2 – административное';
COMMENT ON TABLE "public"."houses" IS 'HOUSE  Сведения по номерам домов улиц городов и населенных пунктов, номера земельных участков и т.п';

-- ----------------------------
-- Table structure for regions
-- ----------------------------
DROP TABLE IF EXISTS "public"."regions";
CREATE TABLE "public"."regions" (
  "code" varchar(5) COLLATE "pg_catalog"."default" NOT NULL,
  "name" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for room
-- ----------------------------
DROP TABLE IF EXISTS "public"."room";
CREATE TABLE "public"."room" (
  "roomguid" uuid NOT NULL,
  "houseguid" uuid,
  "regioncode" varchar(2) COLLATE "pg_catalog"."default",
  "flatnumber" varchar(50) COLLATE "pg_catalog"."default",
  "flattype" int4,
  "roomnumber" varchar(50) COLLATE "pg_catalog"."default",
  "roomtype" int4,
  "cadnum" varchar(100) COLLATE "pg_catalog"."default",
  "roomcadnum" varchar(100) COLLATE "pg_catalog"."default",
  "postalcode" varchar(6) COLLATE "pg_catalog"."default",
  "updatedate" date,
  "previd" uuid,
  "nextid" uuid,
  "operstatus" int4,
  "startdate" date,
  "enddate" date,
  "livestatus" int4,
  "normdoc" uuid,
  "roomid" uuid NOT NULL
)
;

-- ----------------------------
-- Table structure for roomtype
-- ----------------------------
DROP TABLE IF EXISTS "public"."roomtype";
CREATE TABLE "public"."roomtype" (
  "rmtypeid" int4 NOT NULL,
  "name" varchar(20) COLLATE "pg_catalog"."default",
  "shortname" varchar(20) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for structurestatus
-- ----------------------------
DROP TABLE IF EXISTS "public"."structurestatus";
CREATE TABLE "public"."structurestatus" (
  "structurestatusid" int4 NOT NULL,
  "structurestatusname" varchar(60) COLLATE "pg_catalog"."default",
  "structurestatusshortname" varchar(20) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."structurestatus"."structurestatusid" IS 'Признак строения. Принимает значение:0 – Не определено,1 – Строение,2 – Сооружение,3 – Литер';
COMMENT ON COLUMN "public"."structurestatus"."structurestatusname" IS 'Наименование';
COMMENT ON COLUMN "public"."structurestatus"."structurestatusshortname" IS 'Краткое наименование';
COMMENT ON TABLE "public"."structurestatus" IS 'Справочник (перечень) видов строений';

-- ----------------------------
-- Table structure for version
-- ----------------------------
DROP TABLE IF EXISTS "public"."version";
CREATE TABLE "public"."version" (
  "version" int4,
  "region" varchar(255) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Function structure for addressobjectgroup
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."addressobjectgroup"("a_aoguid" uuid, "a_currstatus" int4=NULL::integer);
CREATE OR REPLACE FUNCTION "public"."addressobjectgroup"("a_aoguid" uuid, "a_currstatus" int4=NULL::integer)
  RETURNS "pg_catalog"."varchar" AS $BODY$
DECLARE
  c_CountryGroupValue   CONSTANT VARCHAR(50):='Country';
  c_RegionGroupValue      CONSTANT VARCHAR(50):='Region';
  c_CityGroupValue          CONSTANT VARCHAR(50):='City';
  c_TerritoryGroupValue  CONSTANT VARCHAR(50):='Territory';
  c_LocalityGroupValue   CONSTANT VARCHAR(50):='Locality';
  c_MotorRoadValue        CONSTANT VARCHAR(50):='MotorRoad';
  c_RailWayObjectValue  CONSTANT VARCHAR(50):='RailWayObject';
  c_VillageCouncilValue  CONSTANT VARCHAR(50):='VillageCouncil';
  c_StreetGroupValue       CONSTANT VARCHAR(50):='Street';
  c_AddlTerritoryValue    CONSTANT VARCHAR(50):='AddlTerritory';
  c_PartAddlTerritoryValue CONSTANT VARCHAR(50):='PartAddlTerritory';
  v_ShortTypeName         VARCHAR(10);   /* Тип адресообразующего элемента */ 
  v_AddressObjectName  VARCHAR(100); /* Название адресообразующего элемента */ 
  v_AOLevel                     INTEGER;    /* Уровень адресообразующего элемента*/ 
  v_CurrStatus                  INTEGER;    /* Текущий статус адресообразующего элемента*/
  v_ObjectGroup              VARCHAR(50);   /* Группа адресообразующего элемента  */
  v_Return_Error    Integer :=0;  /* Код возврата */
--**************************************************************************       
--**************************************************************************
 BEGIN
     SELECT INTO v_CurrStatus COALESCE(a_CurrStatus,MIN(addrobj.currstatus)) 
                     FROM AddressObjects addrobj WHERE addrobj.AOGUID=a_AOGUID;
     SELECT INTO v_ShortTypeName,v_AddressObjectName,v_AOLevel
                                 ShortName,FormalName,AOLevel 
                     FROM AddressObjects addrobj   
                     WHERE addrobj.AOGUID=a_AOGUID AND addrobj.currstatus = v_CurrStatus  
                     LIMIT 1;
     IF v_AOLevel = 1 AND UPPER(v_ShortTypeName) <> 'Г' THEN /*  уровень региона */ 
          v_ObjectGroup:=c_RegionGroupValue;
     ELSIF v_AOLevel = 1 AND UPPER(v_ShortTypeName) =  'Г' THEN /*  уровень города */
                                                     /* как региона  */ 
          v_ObjectGroup:=c_CityGroupValue;
     ELSIF v_AOLevel = 3 THEN /* уровень района */
          v_ObjectGroup:=c_TerritoryGroupValue;
      ELSIF (v_AOLevel = 4 AND UPPER(v_ShortTypeName) NOT IN ('С/С','С/А','С/О','С/МО')) 
                OR (v_AOLevel = 1 AND UPPER(v_ShortTypeName) <> 'Г')  THEN /* уровень города */ 
          v_ObjectGroup:=c_CityGroupValue;
      ELSIF v_AOLevel IN (4,6)  AND UPPER(v_ShortTypeName) IN ('С/С','С/А','С/О','С/МО') 
               AND UPPER(v_ShortTypeName) NOT LIKE ('Ж/Д%') THEN /* уровень сельсовета */ 
          v_ObjectGroup:=c_VillageCouncilValue; 
      ELSIF v_AOLevel = 6 AND UPPER(v_ShortTypeName) NOT IN ('С/С','С/А','С/О','С/МО',
                                                      'САД','СНТ','ТЕР',
                                                      'АВТОДОРОГА',
                                                      'ПРОМЗОНА',
                                                     'ДП','МКР')
               AND UPPER(v_ShortTypeName) NOT LIKE ('Ж/Д%') THEN   /* уровень населенного */
                                                      /* пункта */ 
           v_ObjectGroup:=c_LocalityGroupValue;
       ELSIF  UPPER(v_ShortTypeName) IN ('АВТОДОРОГА') THEN /* уровень */
                                                     /* автомобильной дороги */ 
           v_ObjectGroup:=c_MotorRoadValue;
       ELSIF  v_AOLevel IN (6,7) AND UPPER(v_ShortTypeName) LIKE ('Ж/Д%') THEN 
                                                     /* уровень элемент */
                                                     /* на железной дороге */ 
           v_ObjectGroup:=c_RailWayObjectValue; 
       ELSIF v_AOLevel = 7 AND UPPER(v_ShortTypeName) NOT LIKE ('Ж/Д%') 
                    AND UPPER(v_ShortTypeName) NOT IN ('УЧ-К','ГСК','ПЛ-КА','СНТ','ТЕР') 
                    OR (v_AOLevel = 6 AND UPPER(v_ShortTypeName) IN ('МКР') )  THEN 
                                                      /* уровень улицы */
          v_ObjectGroup:=c_StreetGroupValue;
      ELSIF v_AOLevel = 90 OR v_AOLevel = 6 AND UPPER(v_ShortTypeName) IN ('САД',
                                                      'СНТ','ТЕР','ПРОМЗОНА','ДП')
                  OR v_AOLevel = 7 
                 AND UPPER(v_ShortTypeName) IN ('УЧ-К','ГСК','ПЛ-КА','СНТ','ТЕР')  THEN
                                                      /*  уровень дополнительных */
                                                      /* территорий */
           v_ObjectGroup:=c_AddlTerritoryValue;
      ELSIF v_AOLevel = 91 THEN  /* уровень подчиненных дополнительным территориям */
                                                 /* объектов */ 
           v_ObjectGroup:=c_PartAddlTerritoryValue;
     END IF;  
     RETURN v_ObjectGroup;
  END;
  $BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

-- ----------------------------
-- Function structure for addressobjectstreeactualname
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."addressobjectstreeactualname"("a_aoguid" uuid=LP, "a_maskarray" _varchar=ST'::character varying[]);
CREATE OR REPLACE FUNCTION "public"."addressobjectstreeactualname"("a_aoguid" uuid=LP, "a_maskarray" _varchar=ST'::character varying[])
  RETURNS "pg_catalog"."varchar" AS $BODY$
DECLARE
  c_CountryGroupValue  CONSTANT VARCHAR(50):='Country'; /* Признак группы - Страна*/  
  c_RegionGroupValue   CONSTANT VARCHAR(50):='Region'; /* Признак группы - Регион*/ 
  c_CityGroupValue   CONSTANT VARCHAR(50):='City';  /* Признак группы - Основной */
                                                                /* населенный пункт*/ 
  c_TerritoryGroupValue CONSTANT VARCHAR(50):='Territory';/* Признак группы - район */  
  c_LocalityGroupValue   CONSTANT VARCHAR(50):='Locality';/* Признак группы - */
                                                                /* населенный  пункт, */
                                                                /* подчиненный основному */ 
  c_MotorRoadValue      CONSTANT VARCHAR(50):='MotorRoad';/* Признак группы - */
                                                                /* автомобильная дорога */  
  c_RailWayObjectValue   CONSTANT VARCHAR(50):='RailWayObject';/* Признак группы - */
                                                                /* железная дорога */ 
  c_VillageCouncilValue  CONSTANT VARCHAR(50):='VillageCouncil';
                                                                /* Признак группы - сельсовет */
  c_StreetGroupValue    CONSTANT VARCHAR(50):='Street';
                                                                 /* Признак группы - */
                                                                /* улица в населенном пункте */ 
  c_AddlTerritoryValue   CONSTANT VARCHAR(50):='AddlTerritory';/* Признак группы - */
                                                                /* дополнительная территория*/  
  c_PartAddlTerritoryValue CONSTANT VARCHAR(50):='PartAddlTerritory';/* Признак группы */
                                                      /* - часть дополнительной территории*/  
  c_StreetMask    CONSTANT  VARCHAR(2)[1] :='{ST}';/* Маска улица */
  c_PostIndexMask CONSTANT  VARCHAR(2)[1] :='{ZC}';/* Маска почтовый индекс */
  c_DistrictMask    CONSTANT  VARCHAR(2)[1] :='{DT}';/* Маска городской район*/
  c_PartLocalityMask  CONSTANT  VARCHAR(2)[1] :='{LP}';/* Маска подчиненный */
                                                                /* населенный пункт*/
  c_MainLocalityMask  CONSTANT  VARCHAR(2)[1] :='{LM}';/* Маска основной */
                                                                /* населенный пункт*/
  c_PartTerritoryMask CONSTANT  VARCHAR(2)[1] :='{TP}';/* Маска района */
                                                                /* субъекта федерации*/
  c_MainTerritoryMask CONSTANT  VARCHAR(2)[1] :='{TM}';/* Маска субъект федерации */
                                                                /* (регион)*/
  c_CountryMask   CONSTANT  VARCHAR(2)[1] :='{CY}';/* Маска страна*/
  v_ShortTypeName VARCHAR(10);  /* Тип адресообразующего элемента */ 
  v_AddressObjectName VARCHAR(100); /* Название адресообразующего элемента */
  v_AOLevel                INTEGER;         /* Уровень адресообразующего элемента*/ 
  v_MinCurrStatus       INTEGER;    /* Минимальное значение текущего статуса */
                                                                 /* адресообразующего элемента*/  
  v_TreeAddressObjectName VARCHAR(1000); /* Полное в иерархии название элемента*/ 
  v_ObjectGroup         VARCHAR(50); /* Группа адресообразующего элемента */
  v_TreeLeverCount    INTEGER;    /* Счетчик цикла*/
  v_Return_Error_i     Integer := 0;     /* Код возврата*/
  cursor_AddressObjectTree RefCURSOR;  /* курсор по иерархии адреса*/
  v_Return_Error       Integer :=0; /* Код возврата */
--******************************************************************************  
--******************************************************************************
 BEGIN
  SELECT INTO v_MinCurrStatus MIN(addrobj.currstatus) 
          FROM AddressObjects addrobj
          WHERE aoguid=a_AOGUID;
  OPEN cursor_AddressObjectTree FOR SELECT ShortTypeName,
                        REPLACE(AddressObjectName,'  ',' '),
                       AOLevel,AddressObjectGroup(AOGUID )
          FROM AddressObjectTree(a_AOGUID) 
          ORDER BY AOLevel;
  v_TreeLeverCount:=0;
  v_TreeAddressObjectName:='';
  FETCH FIRST FROM cursor_AddressObjectTree INTO v_ShortTypeName,v_AddressObjectName,
                        v_AOLevel,v_ObjectGroup;
  WHILE FOUND
  LOOP
    v_TreeLeverCount:=v_TreeLeverCount+1; 
    IF v_ObjectGroup=c_CountryGroupValue AND c_CountryMask <@ a_MaskArray 
                                     AND v_AOLevel =0 THEN
      v_TreeAddressObjectName:=v_TreeAddressObjectName||
                               CASE WHEN v_TreeAddressObjectName='' THEN ''  
                                  ELSE ', ' END ||
                               v_AddressObjectName||' '||v_ShortTypeName;
    ELSIF v_ObjectGroup=c_RegionGroupValue 
                                     AND c_MainTerritoryMask <@ a_MaskArray
                                     AND v_AOLevel <=2 THEN
      v_TreeAddressObjectName:=v_TreeAddressObjectName||
                                CASE WHEN v_TreeAddressObjectName='' THEN ''
                                         ELSE ', ' END ||
                                CASE WHEN UPPER(v_ShortTypeName) LIKE 
                                               UPPER('%Респ%') THEN 'Республика ' ||
                               v_AddressObjectName ELSE v_AddressObjectName||
                                              ' '||v_ShortTypeName END;
    ELSIF v_ObjectGroup=c_TerritoryGroupValue 
                                     AND c_PartTerritoryMask <@ a_MaskArray 
                                     AND v_AOLevel =3 THEN
      v_TreeAddressObjectName:=v_TreeAddressObjectName||
                                CASE WHEN v_TreeAddressObjectName='' THEN ''
                                         ELSE ', ' END ||
                                v_AddressObjectName||' '||v_ShortTypeName;
    ELSIF v_ObjectGroup=c_CityGroupValue
                                     AND c_MainLocalityMask <@ a_MaskArray AND v_AOLevel =4 THEN
      v_TreeAddressObjectName:=v_TreeAddressObjectName||
                                    CASE WHEN v_TreeAddressObjectName='' THEN ''
                                          ELSE ', ' END ||
                                     CASE WHEN UPPER(LEFT(v_AddressObjectName,6+
                                         LENGTH(v_ShortTypeName)))='ЗАТО '||
                                         UPPER(TRIM(v_ShortTypeName))||'.'  THEN
                                             v_AddressObjectName
                                       ELSE v_ShortTypeName ||' '|| v_AddressObjectName END;
    ELSIF v_ObjectGroup=c_LocalityGroupValue 
                                     AND c_DistrictMask <@ a_MaskArray AND v_AOLevel =5 THEN
      v_TreeAddressObjectName:=v_TreeAddressObjectName||
                                    CASE WHEN v_TreeAddressObjectName='' THEN '' 
                                        ELSE ', ' END ||
                                    v_AddressObjectName||' '||v_ShortTypeName ;
    ELSIF v_ObjectGroup=c_LocalityGroupValue 
                                    AND c_PartLocalityMask <@ a_MaskArray 
                                    AND v_AOLevel =6 THEN
      v_TreeAddressObjectName:=v_TreeAddressObjectName||
                                   CASE WHEN v_TreeAddressObjectName='' THEN ''
                                        ELSE ', ' END ||
                                   v_ShortTypeName ||' '|| v_AddressObjectName;
    ELSIF v_ObjectGroup=c_StreetGroupValue 
                                   AND c_StreetMask <@ a_MaskArray 
                                   AND v_AOLevel =7  THEN
      v_TreeAddressObjectName:=v_TreeAddressObjectName||
                                   CASE WHEN v_TreeAddressObjectName='' THEN '' 
                                        ELSE ', ' END ||
                                   v_ShortTypeName ||' '|| v_AddressObjectName;
    END IF;
    FETCH NEXT  FROM cursor_AddressObjectTree INTO v_ShortTypeName,
                                                                                            v_AddressObjectName,
                                                                                            v_AOLevel,v_ObjectGroup;
  END LOOP;
  CLOSE cursor_AddressObjectTree;
  RETURN  v_TreeAddressObjectName;
  END;
  $BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

-- ----------------------------
-- Function structure for addressobjecttree
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."addressobjecttree"("a_aoguid" uuid, "a_currstatus" int4=NULL::integer);
CREATE OR REPLACE FUNCTION "public"."addressobjecttree"("a_aoguid" uuid, "a_currstatus" int4=NULL::integer)
  RETURNS TABLE("aoguid" uuid, "currstatus" int4, "actstatus" int4, "aolevel" int4, "shorttypename" varchar, "addressobjectname" varchar) AS $BODY$
DECLARE
 c_ActualStatusCode CONSTANT INTEGER :=1; /* Признак актуальной записи  */
                                    /* адресообразующего элемента */
 c_NotActualStatusCode CONSTANT INTEGER :=0;	/* Значение кода актуальной записи */
 v_AOGUID     UUID;	 /* ИД адресообразующего элемента */
 v_ParentGUID UUID; /* Идентификатор родительского элемента */
 v_CurrStatus    INTEGER; /* Статус актуальности КЛАДР 4*/
 v_ActStatus     INTEGER; /* Статус актуальности */
                                    /* адресообразующего элемента ФИАС. */
 v_AOLevel      INTEGER; /*Уровень адресообразующего элемента  */
 v_ShortName  VARCHAR(10); /* Краткое наименование типа элемента */
 v_FormalName VARCHAR(120); /* Формализованное наименование элемента */
 v_Return_Error INTEGER;  /* Код возврата */
--***********************************************************************
--***********************************************************************
 BEGIN
 IF a_CurrStatus IS NOT NULL THEN
    SELECT INTO  v_AOGUID,v_ParentGUID,v_CurrStatus,v_ActStatus,v_AOLevel,
                              v_ShortName, v_FormalName
                               ao.AOGUID,ao.ParentGUID,ao.CurrStatus,ao.ActStatus,ao.AOLevel,
                              ao.ShortName, ao.FormalName
                  FROM AddressObjects ao
	WHERE ao.AOGUID=a_AOGUID AND ao.CurrStatus=a_CurrStatus;
 ELSE
    SELECT INTO v_AOGUID,v_ParentGUID,v_CurrStatus,v_ActStatus,v_AOLevel,
                              v_ShortName, v_FormalName
                              ao.AOGUID,ao.ParentGUID,ao.CurrStatus,ao.ActStatus,ao.AOLevel,
                              ao.ShortName, ao.FormalName
                   FROM AddressObjects ao
	WHERE ao.AOGUID=a_AOGUID AND ao.ActStatus=c_ActualStatusCode;
   IF NOT FOUND THEN
      SELECT INTO v_AOGUID,v_ParentGUID,v_CurrStatus,v_ActStatus,v_AOLevel,
                               v_ShortName, v_FormalName
                                  ao.AOGUID,ao.ParentGUID,ao.CurrStatus,ao.ActStatus,ao.AOLevel,
                                ao.ShortName, ao.FormalName
              FROM AddressObjects ao
              WHERE ao.AOGUID=a_AOGUID 
                       AND ao.ActStatus=c_NotActualStatusCode
                      AND ao.currstatus = (SELECT MAX(iao.currstatus) 
                                                                 FROM AddressObjects iao 
                                                                 WHERE ao.aoguid = iao.aoguid);
    END IF;
 END IF;
 RETURN QUERY SELECT v_AOGUID,v_CurrStatus,v_ActStatus,v_AOLevel,
                                                v_ShortName,v_FormalName;
 WHILE  v_ParentGUID IS NOT NULL LOOP
     SELECT INTO v_AOGUID,v_ParentGUID,v_CurrStatus,v_ActStatus,v_AOLevel,
                              v_ShortName, v_FormalName
                           ao.AOGUID,ao.ParentGUID,ao.CurrStatus,ao.ActStatus,ao.AOLevel,
                             ao.ShortName,ao.FormalName
         FROM AddressObjects ao
         WHERE ao.AOGUID=v_ParentGUID AND ao.ActStatus=c_ActualStatusCode;
          IF NOT FOUND THEN   
             SELECT INTO v_AOGUID,v_ParentGUID,v_CurrStatus,v_ActStatus,v_AOLevel,
                                        v_ShortName,v_FormalName
                             ao.AOGUID,ao.ParentGUID,ao.CurrStatus,ao.ActStatus,ao.AOLevel,
                                        ao.ShortName, ao.FormalName
                 FROM AddressObjects ao
                 WHERE ao.AOGUID=v_ParentGUID 
                               AND ao.ActStatus=c_NotActualStatusCode
                              AND ao.currstatus = (SELECT MAX(iao.currstatus) 
                                                               FROM AddressObjects iao 
                                                               WHERE ao.aoguid = iao.aoguid);
          END IF;	
          RETURN QUERY SELECT v_AOGUID,v_CurrStatus,v_ActStatus,v_AOLevel,v_ShortName,
                                                   v_FormalName;
 END LOOP;
END;
  $BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100
  ROWS 1000;

-- ----------------------------
-- Function structure for houses_addressobjecttree
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."houses_addressobjecttree"("a_houseguid" uuid, "a_enddate" timestamp='2079-06-06 00:00:00'::timestamp without time zone);
CREATE OR REPLACE FUNCTION "public"."houses_addressobjecttree"("a_houseguid" uuid, "a_enddate" timestamp='2079-06-06 00:00:00'::timestamp without time zone)
  RETURNS TABLE("guid" uuid, "currstatus" int4, "actstatus" int4, "aolevel" int4, "shorttypename" varchar, "addressobjectname" varchar) AS $BODY$
DECLARE
    c_MaxEndDate CONSTANT TIMESTAMP:=TO_TIMESTAMP('2079-06-06','YYYY-MM-DD');
    c_ActualStatusCode CONSTANT INTEGER :=1;  
                              /* Признак актуальной записи адресного объекта */
    c_NotActualStatusCode CONSTANT INTEGER :=0; 
                              /* Значени кода актуальной записи */
    v_AOGUID UUID; /* Глобальный уникальный */
                             /* идентификатор адресного объекта*/
    v_CurrStatus INTEGER; /* Статус актуальности КЛАДР 4: */
                             /* 0 - актуальный, */
                            /*  1-50 - исторический, */
                           /* т.е. объект был переименован, */
                           /* в данной записи приведено */
                           /* одно из прежних его наименований, */
                           /* 51 - переподчиненный*/
    v_Return_Error Integer :=0; /* Код возврата */
--*******************************************************************       
--*******************************************************************
 BEGIN
    SELECT INTO v_AOGUID,v_CurrStatus h.AOGUID,
                CASE WHEN 0 < ALL(SELECT iao.currstatus 
                                        FROM AddressObjects iao 
                                        WHERE ao.aoguid = iao.aoguid)
                    THEN (SELECT MAX(iao.currstatus) 
                                        FROM AddressObjects iao 
                                        WHERE ao.aoguid = iao.aoguid)
                    ELSE 0 END
        FROM Houses h INNER JOIN AddressObjects ao ON h.AOGUID=ao.AOGUID 
        WHERE h.HOUSEGUID=a_HOUSEGUID 
            AND h.ENDDATE=COALESCE(a_ENDDATE,c_MaxEndDate)
        ORDER BY h.ENDDATE DESC;
    RETURN QUERY SELECT * FROM Houses_AddressObjectTree(
                                                        v_AOGUID,a_HOUSEGUID,
                                                        v_CurrStatus,a_ENDDATE);
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100
  ROWS 1000;

-- ----------------------------
-- Function structure for houses_addressobjecttree
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."houses_addressobjecttree"("a_aoguid" uuid, "a_houseguid" uuid, "a_currstatus" int4=0, "a_enddate" timestamp='2079-06-06 00:00:00'::timestamp without time zone);
CREATE OR REPLACE FUNCTION "public"."houses_addressobjecttree"("a_aoguid" uuid, "a_houseguid" uuid, "a_currstatus" int4=0, "a_enddate" timestamp='2079-06-06 00:00:00'::timestamp without time zone)
  RETURNS TABLE("guid" uuid, "currstatus" int4, "actstatus" int4, "aolevel" int4, "shorttypename" varchar, "addressobjectname" varchar) AS $BODY$
DECLARE
    c_HouseAOLevel CONSTANT INTEGER:=8;
    c_HouseShortTypeName CONSTANT VARCHAR(10):='д.';
    c_BuildShortTypeName CONSTANT VARCHAR(10):='корп.';
    c_StructShortTypeName CONSTANT VARCHAR(10):='стр.';
    c_StatusActual CONSTANT INTEGER:=1; /* Признак актуальности записи */
    c_StatusNotActual CONSTANT INTEGER:=0; /* Признак неактальной записи записи */
    c_MAXENDDATE CONSTANT TIMESTAMP:=to_timestamp('2079-06-06 00:00:00', 
                                                                                      'YYYY-MM-DD');
    v_HouseActStatus  INTEGER;  /* Признак актуальности для здания*/
    v_HouseCurrStatus INTEGER;  /* Признак актуальности для здания */
    v_ENDDATE TIMESTAMP;  /* Окончание действия записи */
    v_HOUSEGUID UUID;  /* Глобальный уникальный идентификатор дома */
    v_HOUSENUM VARCHAR(10); /* Номер дома */
    v_BUILDNUM VARCHAR(10); /* Номер корпуса */
    v_STRUCNUM VARCHAR(10); /* Номер строения */
    v_Return_Error Integer :=0; /* Код возврата */
--************************************************************       
--************************************************************
 BEGIN
    RETURN QUERY SELECT * FROM AddressObjectTree
                                                        (a_AOGUID,a_CurrStatus);
    IF a_ENDDATE IS NULL THEN 
        SELECT INTO v_ENDDATE MAX(ENDDATE) 
                FROM Houses WHERE AOGUID=a_AOGUID AND HOUSEGUID=a_HOUSEGUID;
    ELSE
        v_ENDDATE:=a_ENDDATE;
    END IF;
    SELECT INTO v_HOUSENUM,v_BUILDNUM,v_STRUCNUM,
                            v_ENDDATE,v_HouseCurrStatus
                    h.HOUSENUM,h.BUILDNUM,h.STRUCNUM,
                            h.ENDDATE,ah.HouseCurrStatus
        FROM Houses h
            INNER JOIN (SELECT AOGUID,HOUSEGUID,ENDDATE, 
                           RANK() OVER (PARTITION BY AOGUID,
                           HOUSEGUID ORDER BY ENDDATE ASC) AS HouseCurrStatus
                        FROM Houses insh  WHERE insh.AOGUID=a_AOGUID AND
                                                insh.HOUSEGUID=a_HOUSEGUID) as ah
        ON h.AOGUID=ah.AOGUID AND h.HOUSEGUID=ah.HOUSEGUID 
                                    AND h.ENDDATE=ah.ENDDATE
        WHERE h.ENDDATE=v_ENDDATE;          
    v_HouseActStatus:=CASE WHEN COALESCE(v_ENDDATE,c_MAXENDDATE)=
                    c_MAXENDDATE THEN c_StatusActual ELSE c_StatusNotActual END;
    v_HouseCurrStatus:=CASE WHEN COALESCE(v_ENDDATE,c_MAXENDDATE)=
                    c_MAXENDDATE THEN 0 ELSE v_HouseCurrStatus END;
    IF v_HOUSENUM IS NOT NULL THEN
        RETURN QUERY SELECT a_HOUSEGUID,v_HouseCurrStatus,v_HouseActStatus,
                    c_HouseAOLevel,c_HouseShortTypeName,v_HOUSENUM;
    END IF;
    IF v_BUILDNUM IS NOT NULL THEN
        RETURN QUERY SELECT a_HOUSEGUID,v_HouseCurrStatus,v_HouseActStatus,
                                    c_HouseAOLevel,c_BuildShortTypeName,v_BUILDNUM;
    END IF;
    IF v_STRUCNUM IS NOT NULL THEN
        RETURN QUERY SELECT a_HOUSEGUID,v_HouseCurrStatus,v_HouseActStatus,
                                 c_HouseAOLevel,c_StructShortTypeName,v_STRUCNUM;
    END IF;
  END;
  $BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100
  ROWS 1000;

-- ----------------------------
-- Function structure for houses_searchbyname
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."houses_searchbyname"("a_housenum" varchar, "a_buildnum" varchar=NULL::character varying, "a_strucnum" varchar=NULL::character varying, "a_formalname" varchar=NULL::character varying, "a_shortname" varchar=NULL::character varying, "a_parentformalname" varchar=NULL::character varying, "a_parentshortname" varchar=NULL::character varying, "a_grandparentformalname" varchar=NULL::character varying, "a_grandparentshortname" varchar=NULL::character varying);
CREATE OR REPLACE FUNCTION "public"."houses_searchbyname"("a_housenum" varchar, "a_buildnum" varchar=NULL::character varying, "a_strucnum" varchar=NULL::character varying, "a_formalname" varchar=NULL::character varying, "a_shortname" varchar=NULL::character varying, "a_parentformalname" varchar=NULL::character varying, "a_parentshortname" varchar=NULL::character varying, "a_grandparentformalname" varchar=NULL::character varying, "a_grandparentshortname" varchar=NULL::character varying)
  RETURNS TABLE("aoguid" uuid, "houseguid" uuid, "aolevel" int4, "housesfullname" varchar, "housenum" varchar, "buildnum" varchar, "strucnum" varchar, "enddate" timestamp, "shortname" varchar, "formalname" varchar, "currstatus" int4, "actstatus" int4, "parentshortname" varchar, "parentformalname" varchar, "grandparentshortname" varchar, "grandparentformalname" varchar) AS $BODY$
DECLARE
    c_WildChar CONSTANT VARCHAR(2)='%';
    c_BlankChar CONSTANT VARCHAR(2)=' ';
    v_HouseNumTemplate VARCHAR(150); /* Шаблон для поиска номера дома*/
    v_BuildNumTemplate VARCHAR(150); /* Шаблон для поиска номера корпуса*/
    v_StrucNumTemplate VARCHAR(150); /* Шаблон для поиска номера Строения*/
    v_FormalNameTemplate VARCHAR(150); /* Шаблон для поиска */
                                 /* наименования адресного объекта*/
    v_ShortNameTemplate VARCHAR(20); /* Шаблон для поиска */
                                /* типа адресного объекта */
    v_ParentFormalNameTemplate VARCHAR(150); /* Шаблон для поиска */
                               /* наименования родительского адресного объекта*/
    v_ParentShortNameTemplate VARCHAR(20); /* Шаблон для поиска */
                               /* типа родительского адресного объекта */
    v_GrandParentFormalNameTemplate VARCHAR(150); /* Шаблон для поиска */
                              /* наименования родительского адресного объекта*/
    v_GrandParentShortNameTemplate VARCHAR(20); /* Шаблон для поиска*/
                             /* типа родительского адресного объекта */
--***************************************************************
--***************************************************************
BEGIN
v_ShortNameTemplate:=UPPER(COALESCE(c_WildChar
                     ||REPLACE(TRIM(a_ShortName),c_BlankChar,c_WildChar)
                     ||c_WildChar,c_WildChar));
v_FormalNameTemplate:=UPPER(COALESCE(c_WildChar
                     ||REPLACE(TRIM(a_FormalName),c_BlankChar,c_WildChar)
                     ||c_WildChar,c_WildChar));
v_HouseNumTemplate:=
                     CASE WHEN TRIM(COALESCE(a_HouseNum,''))='' THEN ''
                            ELSE LOWER(c_WildChar
                              ||REPLACE(TRIM(a_HouseNum),c_BlankChar,c_WildChar)) 
                       END 
                    ||CASE WHEN TRIM(COALESCE(a_BuildNum,''))='' THEN ''
                             ELSE LOWER(c_WildChar
                               ||REPLACE(TRIM(a_BuildNum),c_BlankChar,c_WildChar)) 
                        END 
                     || CASE WHEN TRIM(COALESCE(a_StrucNum,''))='' THEN ''
                              ELSE LOWER(c_WildChar
                                ||REPLACE(TRIM(a_StrucNum),c_BlankChar,c_WildChar)) 
                          END;
v_HouseNumTemplate:=v_HouseNumTemplate||c_WildChar;
v_HouseNumTemplate:=CASE WHEN TRIM(COALESCE(a_HouseNum,''))='' THEN ''
                          ELSE LOWER(c_WildChar
                            ||REPLACE(TRIM(a_HouseNum),c_BlankChar,c_WildChar)) 
                           END 
                           ||c_WildChar;
v_BuildNumTemplate:=CASE WHEN TRIM(COALESCE(a_BuildNum,''))='' THEN '' 
                            ELSE LOWER(c_WildChar
                              ||REPLACE(TRIM(a_BuildNum),c_BlankChar,c_WildChar)) 
                             END ||c_WildChar;
v_StrucNumTemplate:=CASE WHEN TRIM(COALESCE(a_StrucNum,''))='' THEN ''
                              ELSE LOWER(c_WildChar
                                  ||REPLACE(TRIM(a_StrucNum),c_BlankChar,c_WildChar)) 
                              END||c_WildChar;
IF a_FormalName IS NOT NULL
        AND a_ParentFormalName IS NULL AND a_ParentShortName IS NULL
        AND a_GrandParentFormalName IS NULL AND a_GrandParentShortName IS NULL 
THEN
    IF a_HouseNum IS NOT NULL OR a_BuildNum IS NOT NULL  
         OR a_StrucNum IS NOT NULL 
    THEN
        RETURN QUERY SELECT cfa.AOGUID,h.HouseGUID,cfa.AOLevel,
                       Houses_TreeActualName(h.AOGUID,h.HouseGUID),
                       h.HouseNum,h.BuildNum,h.StrucNum,
                       h.EndDate,cfa.ShortName,cfa.FORMALNAME,
                       cfa.currstatus,cfa.Actstatus,
                       NULL::VARCHAR,NULL::VARCHAR,NULL::VARCHAR,NULL::VARCHAR
            FROM AddressObjects cfa
                INNER JOIN Houses h ON cfa.aoguid = h.aoguid
            WHERE cfa.actstatus=1 AND cfa.currstatus=
                   CASE WHEN 0 < 
                        ALL(SELECT iao.currstatus 
                                 FROM AddressObjects iao 
                                 WHERE cfa.aoguid = iao.aoguid)
                          THEN (SELECT MAX(iao.currstatus) 
                                  FROM AddressObjects iao 
                                  WHERE cfa.aoguid = iao.aoguid)
                           ELSE 0 END
                     AND h.EndDate=(SELECT MAX(ih.EndDate) 
                                 FROM Houses ih 
                                 WHERE cfa.aoguid = ih.aoguid 
                                     AND h.HouseGUID = ih.HouseGUID)
                                     AND UPPER(cfa.FORMALNAME) 
                                         LIKE v_FormalNameTemplate 
                                     AND UPPER(cfa.ShortName) 
                                         LIKE v_ShortNameTemplate
                                     AND TRIM(LOWER(COALESCE(h.HouseNum,''))) 
                                         LIKE v_HouseNumTemplate
                                     AND TRIM(LOWER(COALESCE(h.BuildNum,''))) 
                                         LIKE v_BuildNumTemplate
                                     AND TRIM(LOWER(COALESCE(h.StrucNum,''))) 
                                         LIKE v_StrucNumTemplate
            ORDER BY cfa.AOLevel,cfa.ShortName,cfa.FORMALNAME,
                TO_NUMBER(SUBSTRING(h.HouseNum,E'\\d+'),'9999'),h.HouseNum,
                TO_NUMBER(SUBSTRING(h.BuildNum,E'\\d+'),'9999'),h.BuildNum,
                TO_NUMBER(SUBSTRING(h.StrucNum,E'\\d+'),'9999'),h.StrucNum;
    ELSE
        RETURN QUERY SELECT cfa.AOGUID,h.HouseGUID,cfa.AOLevel,
                    Houses_TreeActualName(h.AOGUID,h.HouseGUID),
                    h.HouseNum,h.BuildNum,h.StrucNum,h.EndDate,
                    cfa.ShortName,cfa.FORMALNAME,cfa.currstatus,cfa.Actstatus,
                    NULL::VARCHAR,NULL::VARCHAR,NULL::VARCHAR,NULL::VARCHAR
        FROM AddressObjects cfa
            INNER JOIN Houses h ON cfa.aoguid = h.aoguid
        WHERE cfa.actstatus=1 AND cfa.currstatus=
                CASE WHEN 0 < ALL(SELECT iao.currstatus 
                                FROM AddressObjects iao 
                                WHERE cfa.aoguid = iao.aoguid)
                    THEN (SELECT MAX(iao.currstatus) 
                                FROM AddressObjects iao 
                                WHERE cfa.aoguid = iao.aoguid)
                    ELSE 0 END
                AND h.EndDate=(SELECT MAX(ih.EndDate) 
                                FROM Houses ih 
                                WHERE cfa.aoguid = ih.aoguid 
                                    AND h.HouseGUID = ih.HouseGUID)
                                    AND UPPER(cfa.FORMALNAME) 
                                        LIKE v_FormalNameTemplate 
                                    AND UPPER(cfa.ShortName) 
                                        LIKE v_ShortNameTemplate
        ORDER BY cfa.AOLevel,cfa.ShortName,cfa.FORMALNAME,
            TO_NUMBER(SUBSTRING(h.HouseNum,E'\\d+'),'9999'),h.HouseNum,
            TO_NUMBER(SUBSTRING(h.BuildNum,E'\\d+'),'9999'),h.BuildNum,
            TO_NUMBER(SUBSTRING(h.StrucNum,E'\\d+'),'9999'),h.StrucNum;
    END IF;
ELSIF a_FormalName IS NOT NULL AND a_ParentFormalName IS NOT NULL 
    AND a_GrandParentFormalName IS NULL AND a_GrandParentShortName IS NULL 
THEN      
     v_ParentShortNameTemplate:=UPPER(COALESCE(c_WildChar
                     ||REPLACE(TRIM(a_ParentShortName),c_BlankChar,c_WildChar)
                     ||c_WildChar,c_WildChar));
    v_ParentFormalNameTemplate:=UPPER(c_WildChar
                     ||REPLACE(TRIM(a_ParentFormalName),c_BlankChar,c_WildChar)
                     ||c_WildChar);
     v_FormalNameTemplate:=COALESCE(v_FormalNameTemplate,c_WildChar);
     IF a_HouseNum IS NOT NULL OR a_BuildNum IS NOT NULL  OR a_StrucNum IS NOT NULL
     THEN
          RETURN QUERY SELECT cfa.AOGUID,h.HouseGUID,cfa.AOLevel,
                   Houses_TreeActualName(h.AOGUID,h.HouseGUID),
                   h.HouseNum,h.BuildNum,h.StrucNum,h.EndDate,
                   cfa.ShortName,cfa.FORMALNAME,cfa.currstatus,
                   cfa.Actstatus,pfa.ShortName,pfa.FORMALNAME,
                   NULL::VARCHAR,NULL::VARCHAR
          FROM AddressObjects pfa
              INNER JOIN AddressObjects cfa ON pfa.AOGUID=cfa.ParentGUID
              INNER JOIN Houses h ON cfa.aoguid = h.aoguid
          WHERE cfa.actstatus=1 AND cfa.currstatus=
              CASE WHEN 0 < ALL(SELECT iao.currstatus 
                               FROM AddressObjects iao 
                               WHERE cfa.aoguid = iao.aoguid)
                         THEN (SELECT MAX(iao.currstatus) 
                               FROM AddressObjects iao 
                               WHERE cfa.aoguid = iao.aoguid)
                          ELSE 0 END
               AND h.EndDate=(SELECT MAX(ih.EndDate)
                                FROM Houses ih 
                               WHERE cfa.aoguid = ih.aoguid 
                                   AND h.HouseGUID = ih.HouseGUID)
							  AND pfa.actstatus=1
                AND pfa.currstatus=
                        CASE WHEN 0 < ALL(SELECT iao.currstatus 
                               FROM AddressObjects iao 
                               WHERE cfa.aoguid = iao.aoguid)
                         THEN (SELECT MAX(iao.currstatus) 
                               FROM AddressObjects iao 
                               WHERE pfa.aoguid = iao.aoguid)
                           ELSE 0 END
                AND UPPER(pfa.FORMALNAME) 
                    LIKE v_ParentFormalNameTemplate 
                AND UPPER(pfa.ShortName) 
                    LIKE v_ParentShortNameTemplate
                AND UPPER(cfa.FORMALNAME) 
                    LIKE v_FormalNameTemplate 
                AND UPPER(cfa.ShortName) 
                    LIKE v_ShortNameTemplate
                AND TRIM(LOWER(COALESCE(h.HouseNum,''))) 
                    LIKE v_HouseNumTemplate
                AND TRIM(LOWER(COALESCE(h.BuildNum,''))) 
                    LIKE v_BuildNumTemplate
                AND TRIM(LOWER(COALESCE(h.StrucNum,''))) 
                    LIKE v_StrucNumTemplate
          ORDER BY pfa.ShortName,pfa.FORMALNAME,cfa.AOLevel,
                    cfa.ShortName,cfa.FORMALNAME,
                    TO_NUMBER(SUBSTRING(h.HouseNum,E'\\d+'),'9999'),
                    h.HouseNum,TO_NUMBER(SUBSTRING(h.BuildNum,E'\\d+'),'9999'),
                    h.BuildNum,TO_NUMBER(SUBSTRING(h.StrucNum,E'\\d+'),'9999'),
                    h.StrucNum;
     ELSE
          RETURN QUERY SELECT cfa.AOGUID,h.HouseGUID,cfa.AOLevel,
                   Houses_TreeActualName(h.AOGUID,h.HouseGUID),
                   h.HouseNum,h.BuildNum,h.StrucNum,
                   h.EndDate,cfa.ShortName,cfa.FORMALNAME,
                   cfa.currstatus,cfa.Actstatus,pfa.ShortName,
                   pfa.FORMALNAME,NULL::VARCHAR,NULL::VARCHAR
         FROM AddressObjects pfa
             INNER JOIN AddressObjects cfa ON pfa.AOGUID=cfa.ParentGUID
             INNER JOIN Houses h ON cfa.aoguid = h.aoguid
         WHERE cfa.actstatus=1 AND cfa.currstatus=
              CASE WHEN 0 < ALL(SELECT iao.currstatus 
                               FROM AddressObjects iao 
                               WHERE cfa.aoguid = iao.aoguid)
                        THEN (SELECT MAX(iao.currstatus) 
                               FROM AddressObjects iao 
                               WHERE cfa.aoguid = iao.aoguid)
                         ELSE 0 END
                   AND h.EndDate=(SELECT MAX(ih.EndDate) 
                              FROM Houses ih 
                              WHERE cfa.aoguid = ih.aoguid 
                                  AND h.HouseGUID = ih.HouseGUID)
																	AND pfa.actstatus=1
                                  AND pfa.currstatus=
                                  CASE WHEN 0 < ALL(SELECT iao.currstatus 
                                        FROM AddressObjects iao 
                                        WHERE cfa.aoguid = iao.aoguid)
                                   THEN (SELECT MAX(iao.currstatus) 
                                        FROM AddressObjects iao 
                                        WHERE pfa.aoguid = iao.aoguid)
                                    ELSE 0 END
                  AND UPPER(pfa.FORMALNAME) 
                      LIKE v_ParentFormalNameTemplate 
                  AND UPPER(pfa.ShortName) 
                      LIKE v_ParentShortNameTemplate
                  AND UPPER(cfa.FORMALNAME) 
                      LIKE v_FormalNameTemplate 
                  AND UPPER(cfa.ShortName) 
                      LIKE v_ShortNameTemplate
         ORDER BY pfa.ShortName,pfa.FORMALNAME,cfa.AOLevel,
                 cfa.ShortName,cfa.FORMALNAME,
                 TO_NUMBER(SUBSTRING(h.HouseNum,E'\\d+'),'9999'),
                 h.HouseNum,
                 TO_NUMBER(SUBSTRING(h.BuildNum,E'\\d+'),'9999'),
                 h.BuildNum,
                 TO_NUMBER(SUBSTRING(h.StrucNum,E'\\d+'),'9999'),h.StrucNum;
     END IF;
ELSE 
     v_GrandParentShortNameTemplate:=COALESCE(UPPER(
             COALESCE(c_WildChar
              ||REPLACE(TRIM(a_GrandParentShortName),c_BlankChar,c_WildChar)
              ||c_WildChar,c_WildChar)),c_WildChar);
     v_GrandParentFormalNameTemplate:=COALESCE(UPPER(
               c_WildChar
               ||REPLACE(TRIM(a_GrandParentFormalName),c_BlankChar,c_WildChar)
             ||c_WildChar),c_WildChar);
     v_ParentShortNameTemplate:=COALESCE(UPPER(
                     COALESCE(c_WildChar
                     ||REPLACE(TRIM(a_ParentShortName),c_BlankChar,c_WildChar)
                     ||c_WildChar,c_WildChar)),c_WildChar);
     v_ParentFormalNameTemplate:=COALESCE(UPPER(
                     c_WildChar||REPLACE(TRIM(a_ParentFormalName),c_BlankChar,c_WildChar)
                     ||c_WildChar),c_WildChar);
     v_FormalNameTemplate:=COALESCE(v_FormalNameTemplate,c_WildChar);
     IF a_HouseNum IS NOT NULL OR a_BuildNum IS NOT NULL  
          OR a_StrucNum IS NOT NULL 
     THEN
          RETURN QUERY SELECT cfa.AOGUID,h.HouseGUID,cfa.AOLevel,
                   Houses_TreeActualName(h.AOGUID,h.HouseGUID),
                   h.HouseNum,h.BuildNum,h.StrucNum,
                   h.EndDate,cfa.ShortName,cfa.FORMALNAME,
                   cfa.currstatus,cfa.Actstatus,pfa.ShortName,
                   pfa.FORMALNAME,gpfa.ShortName,gpfa.FORMALNAME
          FROM AddressObjects gpfa
              INNER JOIN AddressObjects pfa ON gpfa.AOGUID=pfa.ParentGUID
              INNER JOIN AddressObjects cfa ON pfa.AOGUID=cfa.ParentGUID
              INNER JOIN Houses h ON cfa.aoguid = h.aoguid
          WHERE cfa.actstatus=1 AND cfa.currstatus=
              CASE WHEN 0 < ALL(SELECT iao.currstatus 
                              FROM AddressObjects iao 
                              WHERE cfa.aoguid = iao.aoguid)
               THEN (SELECT MAX(iao.currstatus) 
                              FROM AddressObjects iao 
                              WHERE cfa.aoguid = iao.aoguid)
                ELSE 0 END
							 AND pfa.actstatus=1
               AND pfa.currstatus=
              CASE WHEN 0 < ALL(SELECT iao.currstatus 
                              FROM AddressObjects iao 
                              WHERE cfa.aoguid = iao.aoguid)
               THEN (SELECT MAX(iao.currstatus) 
                              FROM AddressObjects iao 
                              WHERE pfa.aoguid = iao.aoguid)
                ELSE 0 END
								 AND pfa.actstatus=1
                 AND gpfa.currstatus=
                 CASE WHEN 0 < ALL(SELECT iao.currstatus 
                              FROM AddressObjects iao 
                              WHERE cfa.aoguid = iao.aoguid)
                  THEN (SELECT MAX(iao.currstatus) 
                              FROM AddressObjects iao 
                              WHERE gpfa.aoguid = iao.aoguid)
                   ELSE 0 END
                   AND h.EndDate=(SELECT MAX(ih.EndDate) 
                              FROM Houses ih 
                              WHERE cfa.aoguid = ih.aoguid 
                                  AND h.HouseGUID = ih.HouseGUID)
                                  AND UPPER(gpfa.FORMALNAME) 
                                      LIKE v_GrandParentFormalNameTemplate 
                                  AND UPPER(gpfa.ShortName) 
                                      LIKE v_GrandParentShortNameTemplate
                                  AND UPPER(pfa.FORMALNAME) 
                                      LIKE v_ParentFormalNameTemplate 
                                  AND UPPER(pfa.ShortName) 
                                      LIKE v_ParentShortNameTemplate
                                  AND UPPER(cfa.FORMALNAME) 
                                      LIKE v_FormalNameTemplate 
                                  AND UPPER(cfa.ShortName) 
                                      LIKE v_ShortNameTemplate
                                  AND TRIM(LOWER(COALESCE(h.HouseNum,''))) 
                                      LIKE v_HouseNumTemplate
                                  AND TRIM(LOWER(COALESCE(h.BuildNum,''))) 
                                      LIKE v_BuildNumTemplate
                                  AND TRIM(LOWER(COALESCE(h.StrucNum,''))) 
                                      LIKE v_StrucNumTemplate
          ORDER BY gpfa.ShortName,gpfa.FORMALNAME,pfa.ShortName,
              pfa.FORMALNAME,cfa.AOLevel,cfa.ShortName,
              cfa.FORMALNAME,
              TO_NUMBER(SUBSTRING(h.HouseNum,E'\\d+'),'9999'),
              h.HouseNum,
              TO_NUMBER(SUBSTRING(h.BuildNum,E'\\d+'),'9999'),
              h.BuildNum,
              TO_NUMBER(SUBSTRING(h.StrucNum,E'\\d+'),'9999'),h.StrucNum;
     ELSE
          RETURN QUERY SELECT cfa.AOGUID,h.HouseGUID,cfa.AOLevel,
                   Houses_TreeActualName(h.AOGUID,h.HouseGUID),
                   h.HouseNum,h.BuildNum,h.StrucNum,
                   h.EndDate,cfa.ShortName,cfa.FORMALNAME,
                   cfa.currstatus,cfa.Actstatus,pfa.ShortName,
                   pfa.FORMALNAME,gpfa.ShortName,gpfa.FORMALNAME
          FROM AddressObjects gpfa
              INNER JOIN AddressObjects pfa ON gpfa.AOGUID=pfa.ParentGUID
              INNER JOIN AddressObjects cfa ON pfa.AOGUID=cfa.ParentGUID
              INNER JOIN Houses h ON cfa.aoguid = h.aoguid
          WHERE cfa.actstatus=1 AND cfa.currstatus=
              CASE WHEN 0 < ALL(SELECT iao.currstatus 
                              FROM AddressObjects iao 
                              WHERE cfa.aoguid = iao.aoguid)
                THEN (SELECT MAX(iao.currstatus) 
                              FROM AddressObjects iao 
                              WHERE cfa.aoguid = iao.aoguid)
                  ELSE 0 END
							AND pfa.actstatus=1
              AND pfa.currstatus=
               CASE WHEN 0 < ALL(SELECT iao.currstatus 
                              FROM AddressObjects iao 
                              WHERE cfa.aoguid = iao.aoguid)
                 THEN (SELECT MAX(iao.currstatus) 
                              FROM AddressObjects iao 
                              WHERE pfa.aoguid = iao.aoguid)
                  ELSE 0 END
							AND gpfa.actstatus=1
              AND gpfa.currstatus=
               CASE WHEN 0 < ALL(SELECT iao.currstatus 
                              FROM AddressObjects iao 
                              WHERE cfa.aoguid = iao.aoguid)
                 THEN (SELECT MAX(iao.currstatus) 
                              FROM AddressObjects iao 
                              WHERE gpfa.aoguid = iao.aoguid)
                 ELSE 0 END
              AND h.EndDate=(SELECT MAX(ih.EndDate) 
                              FROM Houses ih 
                              WHERE cfa.aoguid = ih.aoguid 
                                  AND h.HouseGUID = ih.HouseGUID)
                                  AND UPPER(gpfa.FORMALNAME) 
                                      LIKE v_GrandParentFormalNameTemplate 
                                  AND UPPER(gpfa.ShortName) 
                                      LIKE v_GrandParentShortNameTemplate
                                  AND UPPER(pfa.FORMALNAME) 
                                      LIKE v_ParentFormalNameTemplate 
                                  AND UPPER(pfa.ShortName) 
                                      LIKE v_ParentShortNameTemplate
                                  AND UPPER(cfa.FORMALNAME) 
                                      LIKE v_FormalNameTemplate 
                                  AND UPPER(cfa.ShortName) 
                                      LIKE v_ShortNameTemplate
          ORDER BY gpfa.ShortName,gpfa.FORMALNAME,pfa.ShortName,
                  pfa.FORMALNAME,cfa.AOLevel,cfa.ShortName,
                  cfa.FORMALNAME,
                  TO_NUMBER(SUBSTRING(h.HouseNum,E'\\d+'),'9999'),
                  h.HouseNum,
                  TO_NUMBER(SUBSTRING(h.BuildNum,E'\\d+'),'9999'),
                  h.BuildNum,
                  TO_NUMBER(SUBSTRING(h.StrucNum,E'\\d+'),'9999'),
                  h.StrucNum;
     END IF;
END IF;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100
  ROWS 1000;

-- ----------------------------
-- Function structure for houses_treeactualname
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."houses_treeactualname"("a_aoguid" uuid=HS, "a_houseguid" uuid=BY, "a_maskarray" _varchar=BG'::character varying[]);
CREATE OR REPLACE FUNCTION "public"."houses_treeactualname"("a_aoguid" uuid=HS, "a_houseguid" uuid=BY, "a_maskarray" _varchar=BG'::character varying[])
  RETURNS "pg_catalog"."varchar" AS $BODY$
DECLARE
    c_HouseMaskArray	CONSTANT VARCHAR(2)[3]:='{HS,BY,BG}';
                                            /* Массив масок по умолчанию*/
    c_HouseNoMask CONSTANT  VARCHAR(2)[1] :='{HS}';
    c_BodyNoMask CONSTANT  VARCHAR(2)[1] :='{BY}';/* Маска корпуса*/
    c_BuildingNoMask	CONSTANT  VARCHAR(2)[1] :='{BG}';/* Маска строения*/
    c_HouseShortTypeName CONSTANT VARCHAR(10):='д.';
    c_BuildShortTypeName CONSTANT VARCHAR(10):='корп.';
    c_StructShortTypeName CONSTANT VARCHAR(10):='стр.';
    v_ENDDATE TIMESTAMP; /* Окончание действия записи */
    v_HOUSENUM VARCHAR(10);	/* Номер дома */
    v_BUILDNUM VARCHAR(10);	/* Номер корпуса */
    v_STRUCNUM	 VARCHAR(10);	/* Номер строения */
    v_TreeAddressObjectName VARCHAR(1000); 
                                     /* Полное в иерархии название объекта*/ 
    v_Return_Error Integer :=0; /* Код возврата */
--*******************************************************       
--*******************************************************
BEGIN
    v_TreeAddressObjectName:=AddressObjectsTreeActualName
                                   (a_AOGUID,a_MaskArray);
    SELECT INTO v_ENDDATE MAX(ENDDATE) 
        FROM Houses 
        WHERE AOGUID=a_AOGUID AND HOUSEGUID=a_HOUSEGUID;
    SELECT INTO v_HOUSENUM,v_BUILDNUM,v_STRUCNUM HOUSENUM,
                    BUILDNUM,STRUCNUM  
        FROM Houses 
        WHERE AOGUID=a_AOGUID AND HOUSEGUID=a_HOUSEGUID
                    AND ENDDATE=v_ENDDATE;
    IF  c_HouseNoMask <@ a_MaskArray 
            AND COALESCE(TRIM(v_HOUSENUM),'')<>'' THEN
        v_TreeAddressObjectName:=v_TreeAddressObjectName||
                    CASE WHEN v_TreeAddressObjectName='' THEN '' 
                                ELSE ', ' ||c_HouseShortTypeName||' '||v_HOUSENUM 
                    END;
    END IF;			
    IF  c_BodyNoMask <@ a_MaskArray 
            AND COALESCE(TRIM(v_BUILDNUM),'')<>'' THEN
        v_TreeAddressObjectName:=v_TreeAddressObjectName||
                CASE WHEN v_TreeAddressObjectName='' THEN '' 
                        ELSE ', ' ||	c_BuildShortTypeName||' '||v_BUILDNUM 
                END;
    END IF;							
    IF  c_BuildingNoMask <@ a_MaskArray 
            AND COALESCE(TRIM(v_STRUCNUM),'')<>'' THEN
        v_TreeAddressObjectName:=v_TreeAddressObjectName||
                CASE WHEN v_TreeAddressObjectName='' THEN '' 
                        ELSE ', ' ||	c_StructShortTypeName||' '||v_STRUCNUM 
                 END;
    END IF;							
    RETURN 	v_TreeAddressObjectName;
 END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

-- ----------------------------
-- Function structure for houses_treeactualname
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."houses_treeactualname"("a_houseguid" uuid=BY, "a_maskarray" _varchar=BG'::character varying[]);
CREATE OR REPLACE FUNCTION "public"."houses_treeactualname"("a_houseguid" uuid=BY, "a_maskarray" _varchar=BG'::character varying[])
  RETURNS "pg_catalog"."varchar" AS $BODY$
DECLARE
    c_MaxEndDate CONSTANT TIMESTAMP:=TO_TIMESTAMP('2079-06-06','YYYY-MM-DD');
    v_AOGUID UUID; /* Идентификтор адресного объекта */
    v_TreeAddressObjectName VARCHAR(1000); /* Полное в иерархии название объекта*/ 
    v_Return_Error Integer :=0; /* Код возврата */
--**********************************************************       
--**********************************************************
BEGIN
    SELECT INTO v_AOGUID h.AOGUID	
        FROM Houses h 
            INNER JOIN AddressObjects ao ON h.AOGUID=ao.AOGUID 
        WHERE h.HOUSEGUID=a_HOUSEGUID AND h.ENDDATE=c_MaxEndDate
        ORDER BY h.ENDDATE DESC;
    v_TreeAddressObjectName:=Houses_TreeActualName
                                        (v_AOGUID,a_HOUSEGUID,a_MaskArray);
    RETURN 	v_TreeAddressObjectName;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
  
-- ----------------------------
-- Indexes structure for table addressobjects
-- ----------------------------
CREATE INDEX "formalname_idx" ON "public"."addressobjects" USING btree (
  "formalname" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "shortname_idx" ON "public"."addressobjects" USING btree (
  "shortname" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "xak22addressobjects" ON "public"."addressobjects" USING btree (
  "code" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "xie1addressobjects" ON "public"."addressobjects" USING btree (
  "aoguid" "pg_catalog"."uuid_ops" ASC NULLS LAST
);
CREATE INDEX "xie2addressobjects" ON "public"."addressobjects" USING btree (
  "parentguid" "pg_catalog"."uuid_ops" ASC NULLS LAST
);
CREATE INDEX "xie3addressobjects" ON "public"."addressobjects" USING btree (
  "regioncode" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "autocode" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "areacode" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "citycode" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "ctarcode" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "placecode" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "streetcode" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "extrcode" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "sextcode" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table addressobjects
-- ----------------------------
ALTER TABLE "public"."addressobjects" ADD CONSTRAINT "addressobjects_pkey" PRIMARY KEY ("aoid");

-- ----------------------------
-- Primary Key structure for table estatestatus
-- ----------------------------
ALTER TABLE "public"."estatestatus" ADD CONSTRAINT "xpkestatestatus" PRIMARY KEY ("estatestatusid");

-- ----------------------------
-- Indexes structure for table houses
-- ----------------------------
CREATE INDEX "xie1houses" ON "public"."houses" USING btree (
  "aoguid" "pg_catalog"."uuid_ops" ASC NULLS LAST
);
CREATE INDEX "xie2houses" ON "public"."houses" USING btree (
  "houseguid" "pg_catalog"."uuid_ops" ASC NULLS LAST
);
CREATE INDEX "xie3houses" ON "public"."houses" USING btree (
  "aoguid" "pg_catalog"."uuid_ops" ASC NULLS LAST,
  "houseguid" "pg_catalog"."uuid_ops" ASC NULLS LAST
);
CREATE INDEX "xie4houses" ON "public"."houses" USING btree (
  "housenum" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "buildnum" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "strucnum" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "xie5houses" ON "public"."houses" USING btree (
  "housenum" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "xie6houses" ON "public"."houses" USING btree (
  "buildnum" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "xie7houses" ON "public"."houses" USING btree (
  "strucnum" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table houses
-- ----------------------------
ALTER TABLE "public"."houses" ADD CONSTRAINT "xpkhouses" PRIMARY KEY ("houseid");

-- ----------------------------
-- Primary Key structure for table regions
-- ----------------------------
ALTER TABLE "public"."regions" ADD CONSTRAINT "regions_pkey" PRIMARY KEY ("code");

-- ----------------------------
-- Indexes structure for table room
-- ----------------------------
CREATE INDEX "cadnum_idx" ON "public"."room" USING btree (
  "cadnum" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "flatnumber_idx" ON "public"."room" USING btree (
  "flatnumber" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "houseguid_idx" ON "public"."room" USING btree (
  "houseguid" "pg_catalog"."uuid_ops" ASC NULLS LAST
);
CREATE INDEX "postalcoderoom_idx" ON "public"."room" USING btree (
  "postalcode" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "regioncode_r_idx" ON "public"."room" USING btree (
  "regioncode" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "roomcadnum_idx" ON "public"."room" USING btree (
  "roomcadnum" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "roomguid_idx" ON "public"."room" USING btree (
  "houseguid" "pg_catalog"."uuid_ops" ASC NULLS LAST
);
CREATE INDEX "roomnumber_idx" ON "public"."room" USING btree (
  "roomnumber" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "roomnumberfull_idx" ON "public"."room" USING btree (
  "flatnumber" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "roomnumber" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table room
-- ----------------------------
ALTER TABLE "public"."room" ADD CONSTRAINT "room_pkey" PRIMARY KEY ("roomid");

-- ----------------------------
-- Primary Key structure for table roomtype
-- ----------------------------
ALTER TABLE "public"."roomtype" ADD CONSTRAINT "roomtype_pkey" PRIMARY KEY ("rmtypeid");

-- ----------------------------
-- Primary Key structure for table structurestatus
-- ----------------------------
ALTER TABLE "public"."structurestatus" ADD CONSTRAINT "xpkstructurestatus" PRIMARY KEY ("structurestatusid");

-- ----------------------------
-- Primary Key structure for table version
-- ----------------------------
ALTER TABLE "public"."version" ADD CONSTRAINT "version_pkey" PRIMARY KEY ("region");

-- ----------------------------
-- Foreign Keys structure for table room
-- ----------------------------
ALTER TABLE "public"."room" ADD CONSTRAINT "roomtype_fkey" FOREIGN KEY ("roomtype") REFERENCES "public"."roomtype" ("rmtypeid") ON DELETE SET NULL ON UPDATE SET NULL;
