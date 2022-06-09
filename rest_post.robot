*** Settings ***
Library    REST

*** Variables ***
${json}    {"id": 11,"name": "Kachen","username":"Learning3Thai", "company":{"name" : "KPW","code" : 2020}}

*** Test Cases ***
POST json body and write to file
    POST    https://jsonplaceholder.typicode.com/users    ${json}      #มีทั้งหมด id=10 เพิ่ม id 11 เข้าไป
    Integer    response status    201                                  #ต้อง return 201 (created)
    Output    response body                                        
    Output    response body    ${OUTPUTDIR}/response.json                # เขียนลงไฟล์ response.json
    Output Schema    response body    ${OUTPUTDIR}/schema_response.json    # 
    REST Instances    ${OUTPUTDIR}/rest.json    sort_keys=true            # rest.json จะมี request , response body , response schema เขียนรวมไว้ในไฟล์เดียวกัน และเรียงตาม key
