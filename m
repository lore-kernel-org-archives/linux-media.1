Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0479D49251F;
	Thu, 23 Jul 2026 14:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784817232; cv=fail; b=VprPd2IepTFiLKVuOnfkcZI3ioN1gtfk2qgHtZwSzQnE+p+vXiTbgvOEBvDyqYXMQDGCBnYk3fyqZBo18wCdoPqmgZX+0Hw27guE2L9cSSNc+H+fp6ZT1MO6Mslzw37zrEAbqKlkCWD/ey9FmdlWK4VoctPNeIetKrCkCH++ZYY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784817232; c=relaxed/simple;
	bh=p/xrf/n8UUptri6mfGV9fKUiJ4R9VqOlHMsCl/OCljg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=IH9/GCLT/ksJ1ujTMzTzT6nWZUURqszCgG1N6QK7yP2F7bSe1zT0Q/6g/CYyCLNPJNodCjq1yWuLUFwKNaqWCur6uk4LaTg5eQ1x1w7CuVaDKHHJmMcUEdVD6U52vysS8I/xvyVTjllEUDKZjNOyicKfAn467yJfD6NtY9AaoL4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=UbN50R+N; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=JWoVtQCr; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="UbN50R+N";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="JWoVtQCr"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NCtogW2449165;
	Thu, 23 Jul 2026 09:33:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=EhNupmgc5WAioq/TFsN+WrI2sZTFjWt9bROPqC0xI
	nM=; b=UbN50R+NwXvw+bwqINodncwZtOQeV0lRqt9XlCVJaP3DBB+BbqPBIzf8F
	kCvODblFj3LOKUENtav+ZxF9MLAFWN71vuSF2PKe/xw0opsdHnT2qcYVvVIGwNkt
	N7H0roxffkbcgM8DDVzoI7hTYEtVLOTBzoMNGvgkygjBcvGfEmhSHZaD0bqsWPlW
	Te5kztLvMfI4IB0g7ZFIQ3hVosZY/CddH2Nh1oXAgA/4iK6f1GTYRJQ/8X6d2qAz
	GMMq+8nODNSsVNsm5xvZWv76gMtHL6a6HiUpJi2xuGMqZkiogHJmCjElSc1BEMSS
	l5uCY/vKfAYrYpPcvVPjt3Ks6Afmg==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010030.outbound.protection.outlook.com [52.101.56.30])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fkhux13rp-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 23 Jul 2026 09:33:33 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EA0cW02ScQQBgQWs+F+PPQG4THhSX2mT6SQ2kyRAkQI2cEHg93gx47dkXk/HPoqkxr1nKg7FkJ/50uniOcMwlL2ia7cMs3nlD+bgGxvjhkj5GND33XdUdZiSwYfrMbgBSmfQ0CySh8MijgLX9QpWawOng8EQiuKBGxxVTD6HP0lQxeAdHBp5h2GFoRonVOoqvyMJBY+Grm+KFUrTq/Xj1j8ioWtWJPEemDa3Ryy7VsthwJ4afRShAm8PcWbNV6Kk7RtwV48/VOUXu5Nba72EhFt8dGS/7QWSp7vVMPZxk0d/L02/4y0BmvvWWofAnHlPt5fcfgX5MvteH8mV0UZAcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EhNupmgc5WAioq/TFsN+WrI2sZTFjWt9bROPqC0xInM=;
 b=SRjkAAcxAsqRcahfYqV+gyy9/3JpD4zMCceiBMO7ZvAyEIUmmldXENnfaV+5DCczPC9Qa+pk6vHpMs1xSwvxQLZgXNUiqTqji2U8vLAutg2pRAo7jp/dhNjMroDndGZ/ctJxEj7BHpCUTfgwWWOPnlcWVokwqhE6g+8R3LKxb0H+074VcsMle/tccVyqh30Sut2IaoJhqpi/p0LrCpvgziXk3f9I/A5PxVHYctbC+M4ct3uU/e9h9SXg81Wba1zHOg7V18x77Fsl9U6/ZeWIwyCk/JSHinDdpIhtmmva78S9scWWvbTq8qx9ROiBfzNogYCiALcXk/qARCDQqPmAkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EhNupmgc5WAioq/TFsN+WrI2sZTFjWt9bROPqC0xInM=;
 b=JWoVtQCrMWVbU+vZ+5RmUxrbOfGPrO98gD33svzfmTkwm9LK5Fxm/acgfOUy4KNbn4hPI+pUVOxyr5SjDksWrnaxkZZC6wkVNeHKvP/3utqsvQXw034wlsg1cnIOjWwhhxqCjzJeuICxrr3Nkzoj1t4rZxSrxEcfnu9b0YhAPnY=
Received: from BN9PR03CA0207.namprd03.prod.outlook.com (2603:10b6:408:f9::32)
 by CY8PR10MB6586.namprd10.prod.outlook.com (2603:10b6:930:59::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Thu, 23 Jul
 2026 14:33:27 +0000
Received: from BN1PEPF00004687.namprd05.prod.outlook.com
 (2603:10b6:408:f9:cafe::71) by BN9PR03CA0207.outlook.office365.com
 (2603:10b6:408:f9::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.11 via Frontend Transport; Thu,
 23 Jul 2026 14:33:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN1PEPF00004687.mail.protection.outlook.com (10.167.243.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Thu, 23 Jul 2026 14:33:25 +0000
Received: from DFLE204.ent.ti.com (10.64.6.62) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 23 Jul
 2026 09:33:13 -0500
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 23 Jul
 2026 09:33:13 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 23 Jul 2026 09:33:13 -0500
Received: from [128.247.75.1] (b-brnich.dhcp.ti.com [128.247.75.1])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66NEXD0D1269832;
	Thu, 23 Jul 2026 09:33:13 -0500
Message-ID: <99e375e2-e075-4f22-bd3f-cfc362fc020c@ti.com>
Date: Thu, 23 Jul 2026 09:33:13 -0500
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: imagination: e5010: Enable autosuspend for runtime
 PM
To: Jai Luthra <jai.luthra@ideasonboard.com>,
        <benjamin.gaignard@collabora.com>, <devarsht@ti.com>,
        <hverkuil@kernel.org>, <mchehab@kernel.org>,
        <sebastian.fricke@collabora.com>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <k-willis@ti.com>
References: <20260722210845.723864-1-b-brnich@ti.com>
 <178480614614.3238585.14838665134431310375@freya>
Content-Language: en-US
From: Brandon Brnich <b-brnich@ti.com>
In-Reply-To: <178480614614.3238585.14838665134431310375@freya>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004687:EE_|CY8PR10MB6586:EE_
X-MS-Office365-Filtering-Correlation-Id: ba9d37bb-1a1c-4ddb-4b86-08dee8c75b1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|82310400026|376014|1800799024|10067099003|4143699003|22082099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	X95JN3CJWtdZ5RJG6QZSwltwpo6qybZUNkTNiFmAx7wGl4jtPC7uhpBxGlgO9psZg1+n+YSG6qsrQMP335UqyHViEeyMXnEv9SinjxPaw4pM1i/KbtdjAcarpTuIJBNSWUasnkp2Uam5vKkfEuf1ixRvNmdYo5p9GAx6TugBF2+3DisMIOd/3bPbCjFT0f2Z8PAoNC1bBA9qRkSA8Y9EvNMbhS4wBZ6LB2dr3jqul1ExG06eroBc0LXpAvbbQ3qA6pVd9+UZG17Wlk8VPY5RG6UFO8nGMne6+mw0Ab/4LIyCvDoWDvjHjjONeiROKekAPTg8QRjovYC3TjU91R2m78ilvfymTbnXUWDQXuusGhyQ9P4qCTobFJ22JQFcE2nLRbA39qsR7KhQQv//v+8VNd3flHJUoTYh87Yy6LcH7CwBMe96/PnsiSrCKiAB1260bqo8oi+xlWnny+x5MRe0YHmoFDU+fn7BmVoy7BlmaAjew2tWTxm/vE6Tvxy45/hdj6/wPnSXEh627JF8Wqu5kmIH/YK/TqbJ0Y8qV7dLuZ84XRGxjgsPmSQ+nmiiUbZYABvNUiB59gJzHJ2FpZUX60J6OtEPveTVmpxcu5M/Cof7lpsgXEjtFleSBpiBWXy97DJKtIk1LjisgvBWIX/aT1uf1LO5etjOoB7/LHlaeNynO3KGvnVpuIIO1Lu2op/aXkZcxFfNRuWQNn25IdkXQw==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(82310400026)(376014)(1800799024)(10067099003)(4143699003)(22082099003)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	WFuxkMdqHdkfmZHlfEgC2KneFXZ8yt5T31FoAzEYlRLf1JZB6o5Xu8hjh7C8lwx/0KWpp4ffubx8DY22HgY8FI9F9bKfvdVe3+7mR0eql7N1/6WmUkxNK+bTNplCCueKhTWJopoeyr88VdCSKsUaAslFROuh3FvqpZq4N21Wm/aRHgXF/Tn5liylhzZSZKRBcinpuyrtxgx7UXb+L6+ThDalSn63gTLMFbjuvA12GMxFebELl41Ykio+enWWqOuOBDZsl5Sa5p1HntIYfj5JzWlGq9BUgr2gN6jBKiGrso7au2f/ZKKfNnuGLEMpEdbeeLba//iiPw19RKFp3GBriz1nTHJ+uoUWFGv/y0go5RTJbO8CCzAilr0DifGRKhnR5F0G1RsAtXuFj1K/BOMgoo+7tkQ/zDfaUwFNssAjoOYs387Bkn4zrcn2dO4zTooB
X-Exchange-RoutingPolicyChecked:
	BGGqhUKiSzmw7hub21NuJB4TWA4jplKCFQkeEU0BqjXdv3PRic2d0LfWhCOkOeUBKqGF4i1QoV56MWOw/XNJ5+HettOJsh8Kw2+HB1wOZTUwSJd3mq9d6aQereaS2qFQY4/Yk6Ckuz0sYWk50mmDYYx2ZR6f1dOiaN3RqyZFt441OJA0fqeTnSirqNwL6q8/j7/mX7GbYLJNlFuEl+ASa6VZI+JRkalFWRbYCzVEXasQ+TQrPV1JmGmEcSojEl7Z7wH++fpSXKxGIzQ4nhj0TN9evBxzND8hBjHEWs1N1Bvq9IMx2NFBxdlfCM/BcFEBRJ8sJ2BjwgSBunPeGHgQ0g==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 14:33:25.6633
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ba9d37bb-1a1c-4ddb-4b86-08dee8c75b1b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004687.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6586
X-Authority-Analysis: v=2.4 cv=c+abhx9l c=1 sm=1 tr=0 ts=6a62263d cx=c_pps
 a=lJB3plHzOIAfJWf+6KWQLg==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=KzFJJN2anygaYD5txYkA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDE0MyBTYWx0ZWRfX+9OJauH6keLx
 69/TlmYLJwfLK8/zBkK8Ugz4g4FubE1t33FJQIeCSkutf1yUcSnrqGsG2iOcvaP+W6ubv3ITqwx
 GcDMz3cDbiXSMzBtp0mGB5DdpX7PqoA=
X-Proofpoint-ORIG-GUID: F_PCXWI2EABrnrn6a9d6aYGU9OyJpa_s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDE0MyBTYWx0ZWRfX87mGjXz/eaHl
 qGDP8Dev7+uIUkAKjOzIgkAJCJ21sI7ZtY/ArQevzfI2y/wfcKG0jh+yplkyCErkqHjUvFHVXoK
 9GzFBw2vOK6tR+29UyLpZzuPyS59d1wR5JYUDHmN1rw4MSRG8GcHup7KsRbY0Rni4UxHKxzscYv
 Emv+2F8ZQiAWK57zXW1eVw6uIu6XudUy//AfDy3zDzQ8Ecisp5eO1BKKfOaNTpITQsdIbyuZsZl
 RfN6DZD7xRkaxd0QMdjqXJy/1pKWZqXkGXxbFn3cJXOrPH/S2UWKtD8v52IvA4UC5boz4tTdqlT
 SxzAj5/gVKtxlGezsy/VDM6xPvPJg/tSMuBvQas3lh/5DlVVILvGAKIEt1VQL94y2YO4r5lK9Hl
 mUIbHaW3dYKWb5aUAIfQh63yvB1trjaVscMM0/cPSweT44eaZPbGdCTWwzQMvX+QRZXXQKjJfPt
 9kIgc++O0NalEmorrsg==
X-Proofpoint-GUID: F_PCXWI2EABrnrn6a9d6aYGU9OyJpa_s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_04,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0
 spamscore=0 malwarescore=0 bulkscore=0 clxscore=1011 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230143

Hi Jai,

Thanks for the review.

On 7/23/26 06:29, Jai Luthra wrote:
> Hi Brandon,
> 
> Thank you for the patch.
> 
> Quoting Brandon Brnich (2026-07-23 02:38:45)
>> Current implementation only has one call to turn the device on -
>> start_streaming. This can waste power of device as the device can be in
>> STREAM_ON state, but no buffers are actually being submitted.
>>
>> e5010_init_device needs to be moved to the resume hook to ensure
>> register state is correct during any power on. This also fixes an issue
>> when device was never powered on, but system resumes from deep sleep.
>> The PM framework skips the runtime resume hook since device was never on
>> in the first place. This causes e5010_init_device to be called for a
>> powered off device leading to invalid write and system crash.
> 
> There are two separate things be solved by this patch, one is the bug fix
> and the other is the good-to-have feature for autosuspending the device
> between buffers.
> 
> It would make it much easier to review the logic if v2 splits the two, and
> only keeps the Fixes tag (+cc stable) for the bug fix.

Understood, I will split in 2 patches for v2.

> 
>>
>> Fixes: a1e2940458853 ("media: imagination: Add E5010 JPEG Encoder driver")
>> Signed-off-by: Brandon Brnich <b-brnich@ti.com>
>> ---
>>   .../platform/imagination/e5010-jpeg-enc.c     | 47 +++++++++----------
>>   1 file changed, 21 insertions(+), 26 deletions(-)
>>
>> diff --git a/drivers/media/platform/imagination/e5010-jpeg-enc.c b/drivers/media/platform/imagination/e5010-jpeg-enc.c
>> index 42ad9ee3993b4..189c147cb9705 100644
>> --- a/drivers/media/platform/imagination/e5010-jpeg-enc.c
>> +++ b/drivers/media/platform/imagination/e5010-jpeg-enc.c
>> @@ -976,6 +976,8 @@ static irqreturn_t e5010_irq(int irq, void *data)
>>   
>>          v4l2_m2m_job_finish(e5010->m2m_dev, ctx->fh.m2m_ctx);
>>          dprintk(e5010, 3, "ctx: 0x%p Finish job\n", ctx);
>> +       pm_runtime_mark_last_busy(e5010->dev);
>> +       pm_runtime_put_autosuspend(e5010->dev);
> 
> The implementation of put_autosuspend() already handles mark_last_busy()
> since b3db492e8335 ("PM: runtime: Mark last busy stamp in
>                      pm_runtime_put_autosuspend()")

Good to know! I will remove these calls in v2.

Best,
Brandon

> 
>>   
>>   job_unlock:
>>          spin_unlock(&e5010->hw_lock);
>> @@ -1099,6 +1101,8 @@ static int e5010_probe(struct platform_device *pdev)
>>                  goto fail_after_v4l2_register;
>>          }
>>   
>> +       pm_runtime_set_autosuspend_delay(dev, 100);
>> +       pm_runtime_use_autosuspend(dev);
>>          pm_runtime_enable(dev);
>>   
>>          ret = video_register_device(e5010->vdev, VFL_TYPE_VIDEO, 0);
>> @@ -1289,31 +1293,13 @@ static int e5010_encoder_cmd(struct file *file, void *priv,
>>   static int e5010_start_streaming(struct vb2_queue *q, unsigned int count)
>>   {
>>          struct e5010_context *ctx = vb2_get_drv_priv(q);
>> -       int ret;
>>   
>>          struct e5010_q_data *queue = get_queue(ctx, q->type);
>>   
>>          v4l2_m2m_update_start_streaming_state(ctx->fh.m2m_ctx, q);
>>          queue->sequence = 0;
>>   
>> -       ret = pm_runtime_resume_and_get(ctx->e5010->dev);
>> -       if (ret < 0) {
>> -               v4l2_err(&ctx->e5010->v4l2_dev, "failed to power up jpeg\n");
>> -               goto fail;
>> -       }
>> -
>> -       ret = e5010_init_device(ctx->e5010);
>> -       if (ret) {
>> -               v4l2_err(&ctx->e5010->v4l2_dev, "failed to Enable e5010 device\n");
>> -               goto fail;
>> -       }
>> -
>>          return 0;
>> -
>> -fail:
>> -       e5010_vb2_buffers_return(q, VB2_BUF_STATE_QUEUED);
>> -
>> -       return ret;
>>   }
>>   
>>   static void e5010_stop_streaming(struct vb2_queue *q)
>> @@ -1329,8 +1315,6 @@ static void e5010_stop_streaming(struct vb2_queue *q)
>>              v4l2_m2m_has_stopped(ctx->fh.m2m_ctx)) {
>>                  v4l2_event_queue_fh(&ctx->fh, &e5010_eos_event);
>>          }
>> -
>> -       pm_runtime_put_sync(ctx->e5010->dev);
>>   }
>>   
>>   static void e5010_device_run(void *priv)
>> @@ -1343,7 +1327,15 @@ static void e5010_device_run(void *priv)
>>          unsigned long flags;
>>          int num_planes = ctx->out_queue.fmt->num_planes;
>>   
>> +       ret = pm_runtime_resume_and_get(e5010->dev);
>> +       if (ret < 0) {
>> +               dev_err(e5010->dev, "Device failed to turn on\n");
>> +               v4l2_m2m_job_finish(e5010->m2m_dev, ctx->fh.m2m_ctx);
>> +               return;
>> +       }
>> +
>>          spin_lock_irqsave(&e5010->hw_lock, flags);
>> +
>>          s_vb = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
>>          WARN_ON(!s_vb);
>>          d_vb = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
>> @@ -1474,6 +1466,8 @@ static void e5010_device_run(void *priv)
>>          e5010_reset(e5010->dev, e5010->core_base, e5010->mmu_base);
>>   
>>   no_ready_buf_err:
>> +       pm_runtime_mark_last_busy(e5010->dev);
>> +       pm_runtime_put_autosuspend(e5010->dev);
> 
> Same here.
> 
> Thanks,
>      Jai
> 
>>          if (s_vb) {
>>                  v4l2_m2m_src_buf_remove_by_buf(ctx->fh.m2m_ctx, s_vb);
>>                  v4l2_m2m_buf_done(s_vb, VB2_BUF_STATE_ERROR);
>> @@ -1501,6 +1495,13 @@ static int e5010_runtime_resume(struct device *dev)
>>                  return ret;
>>          }
>>   
>> +       ret = e5010_init_device(e5010);
>> +       if (ret) {
>> +               dev_err(dev, "Failed to re-enable e5010 device\n");
>> +               clk_disable_unprepare(e5010->clk);
>> +               return ret;
>> +       }
>> +
>>          return 0;
>>   }
>>   
>> @@ -1533,12 +1534,6 @@ static int e5010_resume(struct device *dev)
>>          if (ret < 0)
>>                  return ret;
>>   
>> -       ret = e5010_init_device(e5010);
>> -       if (ret) {
>> -               dev_err(dev, "Failed to re-enable e5010 device\n");
>> -               return ret;
>> -       }
>> -
>>          v4l2_m2m_resume(e5010->m2m_dev);
>>   
>>          return ret;
>> -- 
>> 2.43.0
>>
>>

