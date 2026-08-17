Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010056.outbound.protection.outlook.com [52.101.85.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01FAE374A17;
	Mon, 17 Aug 2026 17:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786989216; cv=fail; b=O+5PqhmNTJdhRHbTK3JJ1s3ijH4yt5cWONGrjFTJFW7saYvjFwukcSkzuC9q2axT6MjgxgtOPa5u3KycPb5tIsQqB+d6u4qiSL5gMIKjKiZ1TFhmfhhoSX15KfehCkBpUOAg8XTxs4l47E1Qmup/Zl0iHnpnje1WU9gGSQHPmGg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786989216; c=relaxed/simple;
	bh=ZxlEXdDYoErOR41ctczk94SDWkyq6x/ARwb13L6kAuU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=bSnhEVN+WFQhn2Ya1WLXkWV7o75MjZwSeAFrZLqEshesY39jy3PokPQu7Xhoxd1GZIGrhFRs6PyyQSVdFJOJIFFKH6nXOCa7Pkv6+zAcg9MxrsUG4eMN3xF5nlPUMib5LimyROl0FktgsFTAbXQt9GzU9PaqDKY+5mzjNkRko0k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=VBk9PLRf; arc=fail smtp.client-ip=52.101.85.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="VBk9PLRf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ou1VGElvGPwtTvf/qNbQfzLV7gCIGX0cHh8a4DHznbPTuSDy3JZ/3tWezgNvUMoSLFIL/g1EhhQFMQwJDqx3E0jL8yXsQRGoidwF7pO9Z3H2cGRIXXIFFTN4Grr31Ddkq0JPd4i6ebMOy9+S9IYXJYo2d2FUHR04xi4nXbW4eTVQhxdwnW4YtAAzys5pCHs0lKupjrft4/yX3i2lwPzPF7d2S5VMr0f62WA82CDdKC4sh7ZtPLKJC8qSgJ3PBlRHkMS1ynLvir6jPX6N2vnT8hZrjs6mcSNWyr86gTsRLsuwv6Sjnmlj5nAbMk4x+AZP57dlSFN5jGw7xeNyu/4sbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Esh/6vRVtouHIfYwW8gq7HrkvmwxerKE2dK94H/Yr4k=;
 b=OJxfJLTJId4hhN7CUtVRmDB5taUtbea5WYr+9cNgQjpRwCdcfpeOLVTI/t9B6oeFxxRgdhciKoK+FWTweCHrAq/6aoeYmwnE+yxM4X4wWJPeXwZmYgu97iJ0vIej3U21ObXC+guwx2D0EfpM2sEpjfiZo20uj7xAJ6rmD6KzHqbeehWdd1csWS4L7pHzp6fW2xZARHs7ChmhtlOn7Lurk0vAPcQtr7ExtZAkkM8+wI3wBDmMDw6Fc3PQeRcLKl/XL7bkPtbcWQ3zn5VuPnHG+ANjhv/ZWfvrz1/yYWTgzK4EOIXzTpF1DRjAlCZlEde+tnytc65GBktVtUHMsQqC1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kaitmazov.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Esh/6vRVtouHIfYwW8gq7HrkvmwxerKE2dK94H/Yr4k=;
 b=VBk9PLRfEAIHVc71JO+QJsiRp9X8+jE4YOaeJBqySFnD/+7Y4uvGcdovfiFnSFn3jddaPXN1BdzkC2jqvlg5gLPKxHYTb5898toX4btsFkRu7BokaGQdWX+UyLApCwl2YbFwtet3Vac+Rq4r2RNCY52cosGsZIPr/6LYC3KsY4E=
Received: from DS3P221CA0008.NAMP221.PROD.OUTLOOK.COM (2603:10b6:8:45e::19) by
 SJ0PR12MB7458.namprd12.prod.outlook.com (2603:10b6:a03:48d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Mon, 17 Aug
 2026 17:53:27 +0000
Received: from DS1PEPF00017090.namprd03.prod.outlook.com
 (2603:10b6:8:45e:cafe::1d) by DS3P221CA0008.outlook.office365.com
 (2603:10b6:8:45e::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.17 via Frontend Transport; Mon,
 17 Aug 2026 17:53:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS1PEPF00017090.mail.protection.outlook.com (10.167.17.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Mon, 17 Aug 2026 17:53:27 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 17 Aug
 2026 12:53:26 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 17 Aug
 2026 12:53:26 -0500
Received: from [172.19.71.207] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Mon, 17 Aug 2026 12:53:25 -0500
Message-ID: <5933effe-ef28-9838-1dd5-dc904be0a3bd@amd.com>
Date: Mon, 17 Aug 2026 10:53:20 -0700
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 1/3] accel/amdxdna: refuse an I/O memory mapping of an
 imported BO
Content-Language: en-US
To: Taimuraz Kaitmazov <taimuraz@kaitmazov.com>, Min Ma <mamin506@gmail.com>,
	Oded Gabbay <ogabbay@kernel.org>
CC: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>, Sumit Semwal
	<sumit.semwal@linaro.org>, Max Zhen <max.zhen@amd.com>, Sonal Santan
	<sonal.santan@amd.com>, <dri-devel@lists.freedesktop.org>,
	<linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
	<linaro-mm-sig@lists.linaro.org>
References: <20260813164700.43960-1-taimuraz@kaitmazov.com>
 <20260813164700.43960-2-taimuraz@kaitmazov.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <20260813164700.43960-2-taimuraz@kaitmazov.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017090:EE_|SJ0PR12MB7458:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b009e3f-64fb-438e-e00f-08defc8870de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700016|1800799024|23010399003|22082099003|18002099003|11063799006|56012099006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info:
	uh9KtNTfIc7qdZ5mNW94nRKMBCw/KSZ5cV1Rps+b0guNtohLLw1YYLO7NEoa7SSucegE6XrQ3aRxWDDi6CwX0Y6h1wGQVP+odWp3xTUtYCTkKNOBraLiYM7U5yqQyI6y/a3iViYJ3+VZydB4NakHIw9gD+BZucP4555UWKt4luvb4ryiyNkDnH0TVqOZ97EyfMyngXtyapOEjxMsc9bwCdPSM4GGhzHhv5qxk4KMAOLXVhdgRvVQGnLLx+7IyC8TYCHEZoTnDOI7e/a+idK7G9wqthcn/tcYEj0DjBrSALoAaKqFqRxTw9K6/NYHwYyLABHzKsa4a8IPt9AOGqJCiZzAswXr16X2Ba+58CsRKo28432bMN8X3ZLXIs73TiXStGfB4BMvH/0ci+w54IhnJZuycIt2s2B7oYfDTMPGe+2+Dk23D2joK0YVSoVSG/3xJ1SnXVTUz5GQle5zDENHzK2vHatIvB5QZkixDFOLvRrq7TgrlN1zqaPFipoSmBuHrt/opIIElIQj6O+5M9Wcq0M2+yUc7HTTzyQyOmvWduYMhJmigjT+onRS/nOkWxO7/8yLCet9jTTs5i+nusC40cdI1YjzA662tprWzn2S3VIlyFwjRxZ+wTEiHRuXapgEZkHZEfixtIOeCfYEKIO9xYF4h8ZO5YGOnnfxsl8IP5F2H4oeKfJ2+Mg/l+a+y4mu3eTaaYFN1Lz4BBe7jWcnFA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(23010399003)(22082099003)(18002099003)(11063799006)(56012099006)(4143699003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	fV3rBjnQ4p0sf6VCZJpkXQW1eNIrWiZ+VfSZYbgRtsTGI7+2vIDslec/ma4a3otmrj1s73on+VsiKUf42EVOi8XNOs6OOiyDMh0lyz95hmrGsD2kep4EHZt/QAG0NxBdtyJd31iheBOEO3YKGQT1Ya2S6i36ec8heiGx74QIdNVDdzlTwnS7YAd5WLfnR9cDtjCfPqQt+nwIDqJkce8nekBIro1gz+XufsSIFnuiPQFjr9YFSocKX+GNrWPASpWFnSLyRKVbfNThNm1SzBZVG6tzMqgyvd2kVcP45azGthvNqr9MLukjNU5J6UfvQJslI44r+4XOZWjCiBo6GJVj7peX/iERPHx2bEtWePXExMu5Rr6Lp2ne4AseZ6eX+pYN6U87r/i/7gFycZm+fd4kPsEzG4TERsupc/DUVE1tAsVFp2KoBnUaC3C3WJ5/h/60
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2026 17:53:27.1816
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b009e3f-64fb-438e-e00f-08defc8870de
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017090.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7458


On 8/13/26 09:46, Taimuraz Kaitmazov wrote:
> amdxdna_gem_obj_vmap() takes whatever dma_buf_vmap() returns and only
> rejects a NULL vaddr. iosys_map is discriminated by is_iomem, so an
> exporter answering with an I/O mapping leaves a void __iomem pointer in
> abo->mem.kva, which amdxdna_cmd_set_error() memsets and memcpys through.
>
> amdxdna_drm_va_tbl takes a dmabuf_fd, so such a BO can be any exporter's
> buffer. amdgpu cannot reach this: its .pin forces GTT for a non peer to
> peer attachment like ours. An exporter on drm_gem_prime_dmabuf_ops has
> no .pin, and drm_gem_ttm_vmap() answers iomem for a VRAM resident
> object, so an NPU paired with nouveau or radeon does.
>
> Refuse the mapping. vmw_gem_vmap() does the same; unlike that one this
> path is reachable from an unprivileged ioctl, so it does not warn.
>
> Signed-off-by: Taimuraz Kaitmazov <taimuraz@kaitmazov.com>
> ---
>   drivers/accel/amdxdna/amdxdna_gem.c | 10 ++++++++--
>   1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/accel/amdxdna/amdxdna_gem.c b/drivers/accel/amdxdna/amdxdna_gem.c
> index 1f190b319bb..b66ec9e4828 100644
> --- a/drivers/accel/amdxdna/amdxdna_gem.c
> +++ b/drivers/accel/amdxdna/amdxdna_gem.c
> @@ -683,10 +683,16 @@ static int amdxdna_gem_obj_vmap(struct drm_gem_object *obj, struct iosys_map *ma
>   
>   	dma_resv_assert_held(obj->resv);
>   
> -	if (is_import_bo(abo))
> +	if (is_import_bo(abo)) {
>   		ret = dma_buf_vmap(abo->dma_buf, map);
> -	else
> +		/* Callers use mem.kva as an ordinary kernel address. */
> +		if (!ret && map->is_iomem) {
> +			dma_buf_vunmap(abo->dma_buf, map);
> +			return -EOPNOTSUPP;
> +		}

Thanks for the fix. The 'is_iomem' check should be moved to 
amdxdna_gem_vmap() to cover all the cases.

Lizhi

> +	} else {
>   		ret = drm_gem_shmem_object_vmap(obj, map);
> +	}
>   	if (ret)
>   		return ret;
>   	if (!map->vaddr)
