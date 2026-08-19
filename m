Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013020.outbound.protection.outlook.com [40.93.201.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A4A62EC56E;
	Wed, 19 Aug 2026 20:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787172576; cv=fail; b=pkI90FNRUzVHv2eICI3HFLidjC7cKHHRJG1GxV7f+Zs50IMcnsuAoqZPi31qxFxyNCEEKYcBK3oM8KN88xFIyiylTz3pRrH3JlXZ1VnUvefH+jh2gkdos7/1Qo6t1tScINWPf/tXg3aYRvwikfZTGGWzGXgU8wpiw5M3PpS2OhQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787172576; c=relaxed/simple;
	bh=mju3LldaiICv24Eo/DAcnvSgG08uvaUaeYxWUJNY+KY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=NIyPUOSbu7QijmEnqTmIpOKlawByB1XQA+/oh6NHR2odJE6MtUsckSMl6ex4XhbfnDy9CvyVZpWNWPJNpGPLOnQJo3MrRgQpZigFYviBJbFC7GNnU0ldSzOy0+2n0F+zoaP3eJm/D2n2wxSM2MkJil7tHZwLecjWF0/1sJMxVNo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ztuNCecD; arc=fail smtp.client-ip=40.93.201.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ztuNCecD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OkqAsLo0Kt5qRfZoE62Povr7UlXc3iRY8cMBmW4UCFbSkWXKgfgfJxSH+yTY4nHUVw3B86C+5i3UoQLmCiElBd1DOlAi8w8m0X6JkKmWV1KGD0uUMUccWZUclmXl+sv7K9a0RZOc1joX6NnrO8u7ot0/a1L0qlOn06icaPwiGWlTGFFBp1kdQTYTOdja5ho4jtUWy10oe8vb8RUNEbpbdv/uNYtfuiSAvgG7ztnI1EEYjEYti7oSfgdxDlxvpL2Q0LAPamhZzASkenOmpeJkw0PlE8f88JpwgVqahtwMEhKhESlXrKAxXsDGp1AVpJgEMV+yombWMF6Ke0+bAq1kng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fBtcVNjLv0FWKeWou6Fho2KW3trDX01Z6df12H0Xsdw=;
 b=OyDeqnNLBVnRZ9sz8TmAh1QoOMXMM3oo1SDtJx7m3R9uRGWLtIn+zh3WHU0+vZrRE++q1JR1h3vAYxyF/A/KtRhzV72WZX//URlST5vhQ1tIY0UZU4xf0WdegmFULSfZGTD3lZNAaTfpGw7gonQB4EPXnamOOh+t+bDgUdQUinq0DKY2i+zLHhG47hCo91ujrfJUHGGCEx6QfFsR5uLcqPKQifwZRseXDpkUu5TuEd9Y2Z8rYqgLi+9fVq55rOVniLnLwpoSFCAIbrl3qDpqF06TSqFmeYaDYztvYzPVJGPNWOe7eDAgMRYpm89xz8H0YpPA54LWnNY4HrDECry9ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kaitmazov.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fBtcVNjLv0FWKeWou6Fho2KW3trDX01Z6df12H0Xsdw=;
 b=ztuNCecD6CWEUFHDF5H7QoOz50jSx6+EudwC4qFrIHYm4uRaOtIxzoKNuoY39+wm7IBF7+sT+4Pa7PkhnViGsb/xT08/PUgDTQEUxBDJOOOAPZQ6ckbj8+W5CzRJEgwub+D5bUC0Kc9CAhHr1CbkVico7KxQoI+khTLCyTOx9AY=
Received: from SA1PR02CA0009.namprd02.prod.outlook.com (2603:10b6:806:2cf::14)
 by MW6PR12MB8952.namprd12.prod.outlook.com (2603:10b6:303:246::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Wed, 19 Aug
 2026 20:49:30 +0000
Received: from SA2PEPF00001507.namprd04.prod.outlook.com
 (2603:10b6:806:2cf:cafe::30) by SA1PR02CA0009.outlook.office365.com
 (2603:10b6:806:2cf::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.8 via Frontend Transport; Wed, 19
 Aug 2026 20:49:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF00001507.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Wed, 19 Aug 2026 20:49:25 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 19 Aug
 2026 15:49:25 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 19 Aug
 2026 15:49:25 -0500
Received: from [172.19.71.207] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Wed, 19 Aug 2026 15:49:24 -0500
Message-ID: <65774c6e-ec7e-8e5b-bbd4-a25c6ab1299e@amd.com>
Date: Wed, 19 Aug 2026 13:49:23 -0700
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v4 2/5] accel/amdxdna: check the sync range for overflow
 on a device BO
Content-Language: en-US
To: Taimuraz Kaitmazov <taimuraz@kaitmazov.com>, <mamin506@gmail.com>,
	<ogabbay@kernel.org>
CC: <christian.koenig@amd.com>, <sumit.semwal@linaro.org>,
	<alexdeucher@gmail.com>, <max.zhen@amd.com>, <sonal.santan@amd.com>,
	<dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
	<linux-media@vger.kernel.org>, <linaro-mm-sig@lists.linaro.org>
References: <20260817230707.356828-1-taimuraz@kaitmazov.com>
 <20260817230707.356828-3-taimuraz@kaitmazov.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <20260817230707.356828-3-taimuraz@kaitmazov.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001507:EE_|MW6PR12MB8952:EE_
X-MS-Office365-Filtering-Correlation-Id: dd42d62f-5112-4620-b2d8-08defe335b09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|376014|23010399003|82310400026|5023799004|10067099003|11063799006|4143699003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	00FxWyn3iArTLET9RZ9Wk7/AscM1BiOy90AFJXO4kHjZ9M/ohv23susZVCgCWPsG/FmwaEUp6F54+qn8bRhToMH79+vGdN68QPMU757TBCkK3/a5rGFWLoorhkyYKPdintuqAM8sVuzvtqVQTrqaIUWv5PrF3eyYHLIOtugmeFx5vKONmpPB5sB2QJlUPKQ/8BMc7rR1rtznGUgdrksYEUBtSEUtR4DwFQkh/TVFfg+zDsljT9Oy54/zZiyNlPdRDi5dykSGbJ5GYb7/6Sd4Q+GfezLRz9Pk18xhyapxkxACC/HkhZpVWp8C3KLRzRvPfvdhDma6PmGHDj/TCu6qa+EAeK9y0QRLnKtyPdjao9WFQd+h9G15HPDpavq/FTpYeIWIi6T+z2xcyZmYgg6outQtnOlflhhIGDaYbv1a2I/ZMaNXGJu+0HpbMajJC2mDLCnnJ/dmuCIzj9XafNCUHP7z7dCCDz/0Di77ERuuEVAz00egnNqzyHa5mWzdF8I2+6pPRf2hY3eh236kYZy39HPy31DkVPWlJlEt7dFmo3ymvfyC41k6OsYGKybLiKZzLGq6S3GZ3GIKAuQ/T/NGmHcIMKoeyx6u4vAPmWfXRzo6o7r0o5aQ0Vr429+gHOsdqnW+MoZNDL5iaJWziN+GkUNxsb9ZQ6PV+d+mXwmWCJ52PAk1AL7hFvukoh372c6wu6nVvYxpZFlZuXuQUSIoFg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(23010399003)(82310400026)(5023799004)(10067099003)(11063799006)(4143699003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	wcQq0jmZtskTJwHvYiRy7axjihZt+3IrayF8pF9LrhGUKpk7U6kJgqJDf5D8jkXxEKD259xHwws4TT23ZnvwmzUtFlLnWk6pssabYgDP7QzJNyrwkdtHny0f+1zIPqRlEyET8JwEkNdemN7RrZEnAqlBpSUq1mnxlvPCzGbFeFyedo54nAkWQ6nBCGXpXYjVWDfJDZXOCtBdyqeqkID9tYlCNhivCKUGypEEgNuFmLBvwflHba314I0KK+fTNY1aOuw+Lm7cF/VfURDcj5VrsBzcAJP6uLkFKHmhrCi4P3yGXjdRjcqoRvCUBpD6uRzC+Y3efLlWirIGNC+8ih9SEr07qsVOHgcPVeqTlHKYyYr1U2emlG0JBOJ9ZomUnYXtdiI5hpYtew4CRtxnTjz5gfq97maHH1vabfJmx9uK+8+fLLkiIaxyL8cGnbJ+gMng
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 20:49:25.6675
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dd42d62f-5112-4620-b2d8-08defe335b09
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00001507.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8952


On 8/17/26 16:07, Taimuraz Kaitmazov wrote:
> amdxdna_drm_sync_bo_ioctl() forms the range for a device BO by adding the
> caller's offset and size to the BO address without checking either, while
> amdxdna_flush_bo() one call down guards the same arithmetic with
> check_add_overflow().
>
> A size that wraps flush_end leaves it below the heap it is clamped
> against, so every heap fails the start >= end test, and a sync that asked
> for more than the address space holds reports success having flushed
> nothing. Reject it instead.
>
> Signed-off-by: Taimuraz Kaitmazov <taimuraz@kaitmazov.com>
> ---
>   drivers/accel/amdxdna/amdxdna_gem.c | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/accel/amdxdna/amdxdna_gem.c b/drivers/accel/amdxdna/amdxdna_gem.c
> index f88b5349cd4b..77a9493cd7ba 100644
> --- a/drivers/accel/amdxdna/amdxdna_gem.c
> +++ b/drivers/accel/amdxdna/amdxdna_gem.c
> @@ -1274,8 +1274,13 @@ int amdxdna_drm_sync_bo_ioctl(struct drm_device *dev,
>   		struct amdxdna_gem_obj *heap;
>   		unsigned long heap_id;
>   		u64 bo_start = amdxdna_gem_dev_addr(abo);
> -		u64 flush_start = bo_start + args->offset;
> -		u64 flush_end = flush_start + args->size;
> +		u64 flush_start, flush_end;
> +
> +		if (check_add_overflow(bo_start, args->offset, &flush_start) ||
> +		    check_add_overflow(flush_start, args->size, &flush_end)) {
> +			ret = -EINVAL;
> +			goto put_obj;
> +		}
Reviewed-by: Lizhi Hou <lizhi.hou@amd.com>
>   
>   		xa_for_each_range(&client->dev_heap_xa, heap_id, heap,
>   				  abo->heap_start_id, abo->heap_end_id) {
