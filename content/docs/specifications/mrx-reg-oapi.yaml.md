---
title:       mrx-register api yaml
linkTitle:   mrx-reg-api.yaml
date:        2025-02-19
description: metarex register api specification
---
```yaml
info:
  description: |
    # mrx-reg-svr

    The OpenAPI Schema for [the MetaRex register](https://metarex.media/ui/reg/)
    To find out more about MetaRex and our mission, visit the [website](https://metarex.media).

    This handles creating and getting of simple register entries, as well as admin areas
    and finding out whats currently in the register.


    ## Developer Design Choices

    Here is the list of choices we have made in the design of the register, that may not be noticeable from reading the specification.

    ### 1. Handling a Trailing /

    The trailing / is not explicitly declared in the path OpenAPI specification,
    mainly to reduce bloating the schema with duplicated fields and to reduce errors for autogenerating server code based on the specification.
    For the ease of integration into different proxies such as NGINX
    then a design decision has been taken to allow the register to handle them.

    For example `/reg` and `/reg/` are expected to give the same response, as are
    `/reg?limit=20` and `/reg/?limit=20`. In the [demo server](https://github.com/metarex-media/), this is achieved by stripping the trailing / from
    the URL of any requests.




  version: 1.0.0-oas3.1
  title: mrx-register api
  contact:
    email: info@metarex.media
  license:
    name: BSD 3 Clause
    url:  https://opensource.org/license/bsd-3-clause/
tags:
  - name: admins
    description: Secured Admin-only calls for maintenance
  - name: owners
    description: Secured Register entry owners who authenticate for access
  - name: public
    description: Public access operations - unsecured



paths:
  /test:
    get:
      responses:
        '200':
          description: self test pass
          content:
            text/plain:
              schema:
                type: string
        '400':
          description: test failed
  /reg:
    get:
      tags:
        - public
      summary: search local register
      operationId: searchRegisterEntries
      description: >
        ## Query the local MetaRex register

        Defaults to returning the most recently added entries based on the
        configuration of `limit`.

        **Query parameter summary** (see definitions for defaults):

        * 'skip=N' skips the first N entries of the returned results
        * 'limit=L' return only `L` results.
        * 'sort=ASC|DESC,CREATE|MODIFIED|ALPHABETICAL' sorting.
        * 'format=MrxIds|EntriesList'

      parameters:
        - $ref: '#/components/parameters/skipParam'
        - $ref: '#/components/parameters/limitParam'
        - $ref: '#/components/parameters/sortParam'
      responses:
        '200':
          description: search results matching criteria
          content:
            application/json:
              schema:
                type: array
                items:
                  $ref: '#/components/schemas/EntriesResponseSchema'
        '400':
          description: bad input parameter
    post:
      security:
        - OAuth2: [write,admin]
      tags:
        - owner
      summary: adds an inventory item
      operationId: addRegisterEntryGenID
      description: gets a new entry to the MetaRex register
      requestBody:
        content:
          application/json:
            schema:
              $ref: '#/components/schemas/MRXDefinition'
        description: The Metarex register definition
      responses:
        '201':
          description: item uploaded
          content:
            text/plain:
              schema:
                type: string
        '400':
          description: error posting the entry
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/ErrorMessage'
        '401':
          description: No post permissions
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/ErrorMessage'
        '409':
          description: invalid id, register entry already exists
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/ErrorMessage'
  /reg/{id}:

    get:
      parameters:
        - in: path
          name: id
          schema:
            $ref: '#/components/schemas/MrxIdSchema'
          required: true
      tags:
        - owner
      summary: gets an inventory item
      operationId: getRegisterEntry
      description: gets a new entry to the MetaRex register
      responses:
        '200':
          description: item found
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/MRXDefinition'
        '400':
          description: 'invalid id, no register entry found'
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/ErrorMessage'
    post:
      parameters:
        - in: path
          name: id
          schema:
            $ref: '#/components/schemas/MrxIdPostSchema'
          required: true
      security:
        - OAuth2: [write,admin]
      tags:
        - owner
      summary: adds an inventory item
      operationId: addRegisterEntry
      description: gets a new entry to the MetaRex register
      requestBody:
        content:
          application/json:
            schema:
              $ref: '#/components/schemas/MRXDefinition'
        description: The Metarex register definition
      responses:
        '201':
          description: item uploaded
          content:
            text/plain:
              schema:
                type: string
        '400':
          description: error posting the entry
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/ErrorMessage'
        '401':
          description: No post permissions
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/ErrorMessage'
        '409':
          description: invalid id, register entry already exists
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/ErrorMessage'


  /regadmin/reg/{id}:
    get:
      security:
        - OAuth2: [admin]
      parameters:
        - in: path
          name: id
          schema:
            $ref: '#/components/schemas/MrxIdSchema'
          required: true
      tags:
        - owner
      summary: gets an inventory item
      operationId: getRegisterEntryAdmin
      description: gets a new entry to the MetaRex register
      responses:
        '200':
          description: item found
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/MRXDefinition'
        '400':
          description: 'invalid id, no register entry found'
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/ErrorMessage'
        '401':
          description: 'No admin permissions'
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/ErrorMessage'
  /regadmin/reg/{id}/help:
    get:
      security:
        - OAuth2: [admin]
      parameters:
        - in: path
          name: id
          schema:
            $ref: '#/components/schemas/MrxIdSchema'
          required: true
      tags:
        - owner
      summary: gets an inventory item
      operationId: getHelpRegisterEntryAdmin
      description: gets a new entry to the MetaRex register
      responses:
        '200':
          description: item found
          content:
            text/markdown:
              schema:
                $ref: '#/components/schemas/Message'
        '400':
          description: 'invalid id, no register entry found'
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/ErrorMessage'
        '401':
          description: 'No admin permissions'
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/ErrorMessage'





# === components ==============================================================

components:
  ## security:
  securitySchemes:
    OAuth2:
      type: oauth2
      flows:
        authorizationCode:
          authorizationUrl: https://example.com/oauth/authorize
          tokenUrl: https://example.com/oauth/token
          scopes:
            read: Grants read access
            write: Grants write access
            admin: Grants access to admin operations
  #          query parameters used across different endpoints
  #          ------------------------------------------------------------------
  parameters:
    limitParam:
      name: limit
      description: Maxiumum number of records to return.
      in: query
      schema:
        $ref: '#/components/schemas/limitSchema'
    skipParam:
      name: skip
      description: Number of records to skip before returning list.
      in: query
      schema:
        $ref: '#/components/schemas/skipParamSchema'
    sortParam:
      name: sort
      description: Sorting of returned records.
      in: query
      schema:
        $ref: '#/components/schemas/sortParamSchema'

# === schemas=== ==============================================================

  schemas:

    ErrorMessage:
       type: object
       properties:
        ErrorMessage:
          type: string
    Message:
       type: object
       properties:
        Message:
          type: string
        MrxId:
          type: string
    MRXDefinition:
      type: object
      required:
        - metarexId
        - name
        - description
        - mediaType
      properties:
        metarexId:
          $ref: '#/components/schemas/MrxIdSchema'
          description: an MRX generated ID matching the pattern or a uuid type 1 | type 4
        replacedBy:
          $ref: '#/components/schemas/MrxIdSchema'
          description: a Metarex ID superseding this entry
        name:
          type: string
          maxLength: 128
          description: A short human readable UTF-8 name for the metadata payload in the language of its intended use.
        description:
          type: string
          description: A short human readable UTF-8 description of the type of metadata with this is ID in the language of its intended use.
        mediaType:
          type: string
          description: a valid media type for the unwrapped metadata payload when sent using a POST request to a web service (https://www.iana.org/assignments/media-types/)
        timingIs:
          type: string
          pattern: clocked|embedded
          description: clocked when there is one document per frame (MXF frame wrapping). embedded when the timing is inside the metadata document | blob
        treatAs:
          type: string
          pattern: text|binary
          description: text when the metadata is treated like text (JSON, YAML, XML etc), binary when the document is treated as a blob by some application (machine data, word docs, pdf docs and the like)
        expires:
          type: string
          pattern: ^(?:[1-9]\d{3}-(?:(?:0[1-9]|1[0-2])-(?:0[1-9]|1\d|2[0-8])|(?:0[13-9]|1[0-2])-(?:29|30)|(?:0[13578]|1[02])-31)|(?:[1-9]\d(?:0[48]|[2468][048]|[13579][26])|(?:[2468][048]|[13579][26])00)-02-29)T(?:[01]\d|2[0-3]):[0-5]\d:[0-5]\d(?:Z|[+-][01]\d:[0-5]\d)$
          description: The UTC date+time when this entry may be removed from the register. If the property is missing then the entry never expires.

        mrx:
          type: object

          description: mrx controlled properties that enhance the metadata definition
          properties:
            specification:
              type: string
            services:
              type: array
              items:
                type: object
                properties:
                  API:
                    type: string
                  method:
                    type: string
                  metarexId:
                    type: string
                  APISchema:
                    type: string
                  output:
                    type: string
                  description:
                    type: string
                  serviceID:
                    type: string
            mapping:
              type: object
              properties:
                convertTypes:
                  type: boolean
                MissedFieldsKey:
                  type: string
                mappingDefinitions:
                  type: object
                  additionalProperties:
                    type: array
                    items:
                      type: string
        extra:
          type: object
          description: registrant controlled properties that enhance the metadata definition


    EntriesArraySchema:
      oneOf:
        - $ref: '#/components/schemas/MrxIdsArraySchema'
        - $ref: '#/components/schemas/EntryArraySchema'

    EntryArraySchema:
      type: array
      items:
        type: object
        required:
          - mrxId
          - name
        properties:
          mrxId:
            type: string
          name:
            type: string

    MrxIdsArraySchema:
      type: array
      items:
        type: string

    MrxIdSchema:
      type: string
      pattern: MRX(\.([0-9abcdefghjkmnpqrstuvwxyz]{3})){4,6}|[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}
    MrxIdPostSchema:
      type: string
      pattern: MRX(\.([0-9abcdefghjkmnpqrstuvwxyz]{3})){4,6}

    EntriesResponseSchema:
      description: A list of Entry objects for presentation on a UI
      type: object
      required:
        - apiVersion
        - format
        - limit
        - queryId
        - start
        - entries
      properties:
        apiVersion:
          $ref: '#/components/schemas/semVerSchema'
        entries:
          $ref: '#/components/schemas/EntriesArraySchema'
        format:
          type: string
          enum:
            - MrxIds
            - EntriesList
          description: The format of the elements of the list
          example: MrxIds
        limit:
          type: integer
          description: >
            The value of the limit query param (if specified) or the default
            value of limit (if unspecified in the query) or the maximum value
            that can be used in this system if the specified value was too big.
          example: 20
        queryId:
          type: string
          format: uuid
          description: The id of the query that generated this list
          example: d290f1ee-6c54-4b01-90e6-d701748f0851
        start:
          type: integer
          description: The number of records skipped before returning this list
          example: 7321
        serverInfo:
          $ref: '#/components/schemas/serverInfoSchema'

    MrxEntryPostSchema:
      description: >
        this API is an implementation of the document specified at
        https://metarex.media/reg/MXF.123.456.769.abc

    serverInfoSchema:
      description: information about the server providing results
      required:
        - supportUrl
        - version
      type: object
      properties:
        name:
          type: string
          description: name of the server software
          example: mrx-reg-server
        homePage:
          type: string
          format: url
          example: 'https://metarex.media'
        supportUrl:
          type: string
          format: url
          example: https://github.com/metarex-media/mrx-reg-server/issues
        version:
          type: string
          pattern: '^([0-9]|[1-9][0-9]*)\.([0-9]|[1-9][0-9]*)\.([0-9]|[1-9][0-9]*)(?:-([0-9A-Za-z-]+(?:\.[0-9A-Za-z-]+)*))?(?:\+([0-9A-Za-z-]+(?:\.[0-9A-Za-z-]+)*))?$'
          description: a valid semantic version for the running server as defined by semver.org
          example: 'v0.5.1'

    limitAllSchema:
      description: >-
        A value of ALL for limit will result in the maximum number of entries
        allowed by the system (max limit)
      type: string
      enum:
        - ALL

    limitSchema:
      $ref: '#/components/schemas/limitValueSchema'
      #oneOf:
      # - $ref: '#/components/schemas/limitValueSchema'
      #  - $ref: '#/components/schemas/limitAllSchema'

    limitValueSchema:
      description: >
        A limit can be an integer value indicating the maximum number of
        entries to return in a query. A limit value set greater than the
        system's internal max limit value will be clamped to the max limit
        value number.
      type: integer
      default: 20

    skipParamSchema:
      description: an integer of the number of items to skip in responses
      type: integer
      default: 0

    semVerSchema:
      description: a valid semantic version as defined by semver.org
      type: string
      pattern: '^([0-9]|[1-9][0-9]*)\.([0-9]|[1-9][0-9]*)\.([0-9]|[1-9][0-9]*)(?:-([0-9A-Za-z-]+(?:\.[0-9A-Za-z-]+)*))?(?:\+([0-9A-Za-z-]+(?:\.[0-9A-Za-z-]+)*))?$'
      example: 'v0.5.1'

    sortParamSchema:
      description: >
        A comma separated list of `sortParamElementSchema` values presented as
        an array to the server.
      #type: array
      #items:
      $ref: '#/components/schemas/sortParamElementSchema'

    sortParamElementSchema:
      description: >
        Valid keywords are described here - how the logic is applied is
        application specific. Recommended behaviour is that precedence is highest
        at the start of the query string and lowest at the end.

        `sort=ASC,MODIFIED,DESC,ALPHABETICAL`

        would result in sorting by `ASC` first, then `MODIFIED`. `DESC` and
        `ALPHABETICAL` are ignored because of mutual exclusivity rules.
      type: string
      enum:
        - ASC
        - DESC
        - CREATE
        - MODIFIED
        - ALPHABETICAL
```
