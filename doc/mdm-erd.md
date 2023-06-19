## 版號相關規則

1. 版號只會存在 "組織主檔 aka Org"
   - 在下方的 ERD 叫 `OrganizationRevision`
2. 任何異動都會新增一個新一筆 "組織主檔 aka Org" 資料 with 新的版號
3. 新一筆的 "組織主檔 aka Org" 的 FK 會指向異動資料的 PK
4. relation_id 第一個版本建立時產生的 relation_id，後面的版本都是從前一個 relation_id 帶入
   - 用來識別不同版本但是是更新同一筆的相關資料

## Customer

- 客戶基本資料 (Customer) > 共用品牌，忽略
- 服務品牌啟用設定，忽略
- 客戶產品設定，忽略
- 代理商設定 (CustomerAgency) > 代理商服務的客戶 group，忽略
- **Customer 要 isActive boolean 嗎？**

## Vendor

- 工具設定 (VendorTool) > 媒體工具，由 enum 改為 string
- 工具設定 (VendorTool) > 露出平台，由 enum 改為 string
- **媒體別/服務別選單設定 (ServiceLine) > 狀態？**

```mermaid
erDiagram
    %%{`shortName 為整個系統裡的公司簡稱，同公司只會有一個`}%%
    Organization {
        id string PK
        name string
        isForeign boolean
        systemNumber string
        wanpieNumber string
        individualIdentity string
        legalPersonIdentity string
        shortName string
    }

    %%{`relation_id 用來識別不同版本但是是更新同一筆的相關資料`}%%
    %%{`status 命名待討論`}%%
    OrganizationRevision {
        id string PK
        organizationId string FK
        organizationProfileId string FK
        version string
        relationId string
        status enum
    }

    %%{`organizationKind: customer / vendor`}%%
    OrganizationProfile {
        id string PK
        serviceLineId string FK
        organizationKind enum
    }

    %%{`alias 為 service line 對 customer 的別名`}%%
    %%{`commissionNote == 收款條件`}%%
    %%{`isTransparent 此客戶是否要算業績`}%%
    %% parentGroupCustomerId 還需確認
    %%{`conditionRemark: red / yellow / none , it's for campaign to do something`}%%
    Customer {
        id string PK
        organizationProfileId string FK
        alias string
        parentGroupCustomerId string
        productKind enum
        isAgency boolean
        isTransparent boolean
        poNumberRequired boolean
        address string
        receiptDays enum
        receiptDaysNote string
        isIntercompany boolean
        commissionNote string
        conditionRemark enum
    }

    %%{`kind: media / service`}%%
    %%{`conditionRemark: red / yellow / none , it's for campaign to do something`}%%
    Vendor {
        id string PK
        kind enum
        organizationProfileId string FK
        alias string
        isActive boolean
        conditionRemark enum
    }

    %% platform 是選取欄位，欄位來自 mdm 人員設定的 platform 那張表
    VendorTool {
        id string PK
        vendorId string PK
        mediaTool string
        platform string
    }

    VendorReceiptTarget {
        id string PK
        vendorId string FK
        name string
        legalPersonIdentity string
        invoiceTitle string
        englishName string
        hasForeignParentCompany boolean
        foreignParentCompanyName string
        foreignParentCompanyAddress string
    }

    VendorFinanceContact {
        id string PK
        vendorId string FK
        name string
        phone string
        fax string
        email string
    }

    VendorInvoiceTarget {
        id string PK
        vendorId string FK
        condition string
        bankName string
        accountName string
        accountNumber string
        invoiceTitle string
    }


    EnterpriseGroup {
        id string PK
        name string
    }

    %%{`kind: media / service`}%%
    ServiceLine {
        id string PK
        cueTemplateId string FK
        enterpriseGroupId string FK
        name string
        kind enum
        systemNumber string
        mediaServiceKind enum
        creator string
        createdAt date
        updater string
        updateAt date
    }

    CustomerReceiptTarget {
        id string PK
        customerId string FK
        name string
        legalPersonIdentity string
        invoiceTitle string
        englishName string
        hasForeignParentCompany boolean
        foreignParentCompanyName string
        foreignParentCompanyAddress string
    }

    CustomerInvoiceTarget {
        id string PK
        customerId string FK
        condition string
        bankName string
        accountName string
        accountNumber string
        invoiceTitle string
    }

    CustomerAgency {
        id string PK
        customerId string FK
        name string
        legalPersonIdentity string
    }

    CustomerFinanceContact {
        id string PK
        customerId string FK
        name string
        fax string
        phone string
        email string
    }

    CustomerProduct {
        id string PK
        customerId string FK
        name string
        brand string
        kind string
        industryCategory enum
    }

    CustomerContact {
        id string PK
        customerId string FK
        name string
        fax string
        phone string
        email string
    }

    %% kind: media / servie
    %% channel: mediaChannel / serviceChannel
    CueTemplate {
        id string
        kind enum
        channel enum
        platform enum
        program enum
        title enum
        adCategory enum
        adStartAt date
        adEndAt date
        totalCost number
        accountsReceivable number
        customerSignAmount number
        customColumn jsonb
    }

    %% 目前沒有 software 只是舉例
    %% 以下三張表都是只會有一個欄位 name
    ServiceChannel {
        name software
    }

    MediaChannel {
        name TV
	    name Digital
	    name OOH
	    name DOOH
	    name MG
	    name NP
	    name RD
    }

    IndustryCategory {
        name food
    }

    Organization ||--|{ OrganizationRevision: ""
    OrganizationProfile ||--|{ OrganizationRevision: ""
    OrganizationProfile ||--|| Customer : "if organiztion_kind is customer"
    OrganizationProfile ||--|| Vendor : "if organiztion_kind is vendor"
    Vendor ||--|{ VendorReceiptTarget : ""
    Vendor ||--|{ VendorInvoiceTarget : ""
    Vendor ||--|{ VendorFinanceContact : ""
    Vendor ||--|{ VendorTool : ""
    OrganizationProfile ||--|| ServiceLine : ""
    EnterpriseGroup ||--|{ ServiceLine: ""
    CueTemplate ||--|| ServiceLine : ""
    Customer ||--|{ Customer : "parent group customer"
    Customer ||--|{ CustomerReceiptTarget : ""
    Customer ||--|{ CustomerInvoiceTarget : ""
    Customer ||--|{ CustomerAgency : ""
    Customer ||--|{ CustomerFinanceContact : ""
    Customer ||--|{ CustomerContact : ""
```
