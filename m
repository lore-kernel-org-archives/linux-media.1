Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE24B3ABD91;
	Mon, 20 Jul 2026 06:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784528799; cv=fail; b=NfMyR96DFJisldrt3edlawfG4XRLipGMTrKYSLKuwO0DB0uDISbUhoBRAbLAwEwkLufeV2dBD3vokby0Mx3n0PDMigH2/osINFFNhB35qdq9de7dsyAFmrzvLul23QCQ6MnXLdlsoqRbR+01GyiQJXzC01xpP02JagE0+nsjGEI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784528799; c=relaxed/simple;
	bh=wRAtlb3wqfLIR0kI/kOxH7f7u+w09bW/eOJddsbQVGw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Aabqji3EUfZE0QXxkQRUUhhWLxmnfegb6Tr2j6Ix+XhkbVn6sHgvgyEsnSAu21X65ul8JiHk+M5hGzZXhAJhk5QXPByBlyWSVk3Xjt48huEBKcNwzOkgZaLZj2cLw+4HqfoYCs1swtyMx+PpN6Qu9g66dlX+ha8IiVYF00uEzVU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=NTkGt7Mo; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=J0mO2pmJ; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="NTkGt7Mo";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="J0mO2pmJ"
X-UUID: ee79adc4840311f18dc8c9802ae25ab1-20260720
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=wRAtlb3wqfLIR0kI/kOxH7f7u+w09bW/eOJddsbQVGw=;
	b=NTkGt7Mo8ZsppKCxHjDrp/z4372LLFy3M1QjpKYpi2stSD3z+gCPLx3cPvjtAVDkn/N1erClX2FMTAaXlIT6EfCacOise1cDN14O0aqu898QordXfp/QYpb4s2C0h9J+4wRs5hVmEcaDdGsvONZ7avlBOQJhzhIVgQWfLjJc7lQ=;
X-CID-CACHE: Type:Local,Time:202607201426+08,HitQuantity:2
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.18,REQID:5e1d9f1d-69b4-495c-9527-e65b35677342,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:8a735a6,CLOUDID:3125ebf9-0305-4d99-a86d-542a7a8d2aef,B
	ulkID:nil,BulkQuantity:0,SF:80|81|82|83|102|110|111|836|865|888|898,TC:-5,
	Content:0|15|50|99,EDM:-3,IP:nil,URL:99|80|1,File:130,RT:0,Bulk:nil,QS:nil
	,BEC:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: ee79adc4840311f18dc8c9802ae25ab1-20260720
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1386456248; Mon, 20 Jul 2026 14:26:24 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 20 Jul 2026 14:26:23 +0800
Received: from SG2PR04CU009.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 20 Jul 2026 14:26:23 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aKo5W+yGpYm3JBvB3mhNCrImda6hGvEKNmSK+qcXyw7gzmeREgX6562eXxLIPi2oM7c1j9hZgmkp0MXLwM46aENRxbyJYREDaT4ulJzU7L3KhponKlemr7OidewyYKbtAv9fGhgXty5OlTqcSmyirsI1s9PQr4JuqBMjmGRxH/QymMEHSsXn6WAZuluqJu1tEhZP0oj2LkKMyZvMKKRl6T5hCJ7NwJzVuNgTz9YHJv9wbo/210oURoe+jM0kio75S0cQNbwHhiQYuDbiXkVifFU2gYaLgPVkpE4oT+9ZZqfQQTl3sEqP1k01NJgHD99e9ExQN2eqEIBidxNYfVC3Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wRAtlb3wqfLIR0kI/kOxH7f7u+w09bW/eOJddsbQVGw=;
 b=axV4M1Tk3A3XxDhvGcbWQaggjywYkpWvPI+m0cbvp4NNUGCShq6EbWTc1w5alabwl525RZxo8qATG7Jv+q0paT/aWnZZdYTkx6L109xZGXQnmz+XfTz0qG5J1mR2ZnfKyZWvtgxozQwVoTNr9yIWRyCSZNNJd8w7BCUC/ZrGqjC6j5yJFTCR0Pg1LZWn6PjQzkNaGGATXIXq2JmfIXrWPVoQ27qCiDbnj5m+UwZiDlbAPvWlwjrpgAasbJ6F4DDGyOQGzs3aiwizvM77hUtTJS0MLroHJ5ht2ykGi9FoWXUHF2md2wSopmTred0LqbImEPGEs3rnabYZeTTtSpFAOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wRAtlb3wqfLIR0kI/kOxH7f7u+w09bW/eOJddsbQVGw=;
 b=J0mO2pmJmAS3ksVKBqnOQvEBXxYhk7ruBgpx7tY/JeuLWf3vohAsnBEg3yjqPqRhhJ3IvA2ZpNks3SBiMCkx/D/AXv6wy9+YW3O2KetWwTMXhf6lwcM3G9xbXEdS4UBRpYvoD6b0uikfmLAS5Gked5of68zZZX9AzLC/eMti11Q=
Received: from SI2PR03MB6195.apcprd03.prod.outlook.com (2603:1096:4:14f::13)
 by TYZPR03MB6526.apcprd03.prod.outlook.com (2603:1096:400:1f7::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.16; Mon, 20 Jul
 2026 06:26:18 +0000
Received: from SI2PR03MB6195.apcprd03.prod.outlook.com
 ([fe80::ea95:8d21:d28a:6b2c]) by SI2PR03MB6195.apcprd03.prod.outlook.com
 ([fe80::ea95:8d21:d28a:6b2c%6]) with mapi id 15.21.0223.015; Mon, 20 Jul 2026
 06:26:18 +0000
From: =?utf-8?B?S3lyaWUgV3UgKOWQtOaZlyk=?= <Kyrie.Wu@mediatek.com>
To: "krzk@kernel.org" <krzk@kernel.org>
CC: "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "fshao@chromium.org"
	<fshao@chromium.org>, =?utf-8?B?WXVuZmVpIERvbmcgKOiRo+S6kemjnik=?=
	<Yunfei.Dong@mediatek.com>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"fanwu01@zju.edu.cn" <fanwu01@zju.edu.cn>, "jacopo.mondi@ideasonboard.com"
	<jacopo.mondi@ideasonboard.com>, "haoxiang_li2024@163.com"
	<haoxiang_li2024@163.com>, "tfiga@chromium.org" <tfiga@chromium.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?utf-8?B?QW5kcmV3LUNUIENoZW4gKOmZs+aZuui/qik=?=
	<Andrew-CT.Chen@mediatek.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "ribalda@chromium.org" <ribalda@chromium.org>,
	"wenst@chromium.org" <wenst@chromium.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "kees@kernel.org" <kees@kernel.org>,
	"rongqianfeng@vivo.com" <rongqianfeng@vivo.com>,
	=?utf-8?B?SXJ1aSBXYW5nICjnjovnkZ4p?= <Irui.Wang@mediatek.com>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	=?utf-8?B?VGlmZmFueSBMaW4gKOael+aFp+ePiik=?= <tiffany.lin@mediatek.com>,
	"sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
	"benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "sebastian.fricke@collabora.com"
	<sebastian.fricke@collabora.com>, "robh@kernel.org" <robh@kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "nicolas.dufresne@collabora.com"
	<nicolas.dufresne@collabora.com>, "hverkuil+cisco@kernel.org"
	<hverkuil+cisco@kernel.org>, "laurent.pinchart+renesas@ideasonboard.com"
	<laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH v6 08/14] dt-bindings: media: mediatek: vcodec: add
 decoder dt-bindings for mt8196
Thread-Topic: [PATCH v6 08/14] dt-bindings: media: mediatek: vcodec: add
 decoder dt-bindings for mt8196
Thread-Index: AQHdF+ZCyChClad61Eelw4Pditpo87Z15nYAgAAAywCAAAm5AA==
Date: Mon, 20 Jul 2026 06:26:17 +0000
Message-ID: <a9123dce5ae7ef184f5640b12e3e9427084ec542.camel@mediatek.com>
References: <20260720012056.1026551-1-kyrie.wu@mediatek.com>
	 <20260720012056.1026551-9-kyrie.wu@mediatek.com>
	 <20260720-gregarious-satisfied-shrew-f71cba@quoll>
	 <f499f2c3-f31d-4c2c-84fb-d1d9d95fc868@kernel.org>
In-Reply-To: <f499f2c3-f31d-4c2c-84fb-d1d9d95fc868@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PR03MB6195:EE_|TYZPR03MB6526:EE_
x-ms-office365-filtering-correlation-id: 046b04a0-53c6-4cd9-3110-08dee627cec1
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|7416014|4133799003|10067099003|56012099006|4143699003|11063799006|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: E9kv1XMxGtI5cIYnjLdxne1kbu2d2DczDHbqvvVJ/wUCuji1sB/4dOKppVtn3uK7kk8DYHZI6LAPkoPj/ksqX32GR27TvNg3jHSldnqB47dgo1IXFftS/HDwdKUdPN4899NKXUnjHFiDXpjvFtTfd/787yRNTymi+ALidjcysRmwgLWpHX1c+yt/rdIf31L7RjNlKmkMF/3SK89kKvMV1Kkb1O2HNCHQ3Y/Ow7ZVY9fEXmqTmmfryGcwpIm96GRS5MqaShb3l3xLoXEEh4JHosV0zXh3uFPUgiFq8JJYHJXuNNMGPVFfqZeyW2ev3mvKZpahthETXBu5RHJ1+DAqPJx2VnxMOjUREFZ0GNLPEIBZf+f/TCl4iQBq37vU7xDPBT56JpszzL4jeL+aCu2UOy8ppI0GHL1LHlxQwbqdpuQogDoByT5XmwB1oqDE/4kLu94e5OtaxyAsy1Apu64b4zdYWOa4MWBpPCj4FAvV3/z3H19De657/FS6/GNK+cKp5y3gNcYMWRDwakmRioBjCFA/ZqpIcmri54X5wWoXUqjcfBybCgLaNiiPBf7JuvTFl5YhEw7F/s/lqR8pgb8A39RYBuIM1m4EqZz9GlUGBhvDmwsXp3Ioiq0b+qA9yIWe0aF9WvgTLbN688n2nqaxtgpq9Gk2kldU8NVlKFLsP6c=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR03MB6195.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(7416014)(4133799003)(10067099003)(56012099006)(4143699003)(11063799006)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q3hjWCtxL0twcHZ4SE1wby9aMjZuM2kxMm1ESmVVcnZHbTQzcGJCL25UK2VS?=
 =?utf-8?B?SXZOU056ODdpcm9pZVY1RDBBRkpUdC9WOFVUY1pDU2VjeGVFdTRwdVdTbklx?=
 =?utf-8?B?OWpzWjNMNEFUbE5sUGZZUDQ4ZlJ2LzBTNDBRbXlGUVhTeWNzYnQwdjl1R1JJ?=
 =?utf-8?B?U21SVzdQTVlJUEdVbTVwd0IrdzBudFBzMlZRYUV5ZStSU3A2Nkh6d2RHVmI0?=
 =?utf-8?B?aGZVZVlSZ3liTEZ6dEJjVE1UU0dsMnNoMkVsaTcwSTQ1Z1Q5Mm40ZFA3OTc3?=
 =?utf-8?B?NzY2VGpHZDFrMERrak15WFRrUi9HNGg5UWJ3TmFJRWgvb0hXSjhoZ2hlRndM?=
 =?utf-8?B?SkFOdmxaSGozaXQ5NHZia2dBcGc5WnVOckp3MmxPa0JYOFpaOTVqWENtbmlZ?=
 =?utf-8?B?ZUVjY09LUjZPU0ZoOVZVSEVGTy9CbmdkQUk0VGZlTHV5RjhIRmw4aTlUOXdD?=
 =?utf-8?B?Sm5jdWRKQ2NETXZOUmpHU2Z5Tk9VTUk4Sk1rK0FmbFlLU0Qwc1JsUUcxYnNY?=
 =?utf-8?B?ZTFJSjByaVRzQW9xSno1TlhWYzMvdUpzSGZwUUtEdWdDS1J6TVA4SXpKeWFP?=
 =?utf-8?B?VlZ2N0IxcnpWZ0wrSDRtcEdQbUdhZzNBN1RNRnV1V2U3SEVja0M3b3JqYlBh?=
 =?utf-8?B?Z1JpYW1nRE9BUEduVkc1M2J6cEtMUTJGZ2tpVk5iSmRrdW5LNW9XSjEvM1Ns?=
 =?utf-8?B?TzhKWWtlVkVpSzZjdXJ0VUdjeUpBSEZtalBCUFBZSnJ2bi9MeXJWVGZnNFBJ?=
 =?utf-8?B?ZWRXRkNUeGpuQjUxOEtqVk5YZU4ybjdvZFNYVzhpSG5JTHR3RkNOd25tSXNM?=
 =?utf-8?B?YWZ3UkFveUl4Z0NTdm9VR0kzd2xrNXRVRWtPMFpBdm44RXJ1aDFxWWg4RUx5?=
 =?utf-8?B?eXh3SDR6VTdsNm1TdWhGZGhuZXRyWUNMREJtUzR6NTBUb09wck04bDB2bFgx?=
 =?utf-8?B?RENyenBSQmtSazNRMjRMR0gybjJXcys2U1ovWVUrT1I5NjMxck42djlVWjRp?=
 =?utf-8?B?N25ZaUtYRmtmOVZqeWtQd1dLMEJEMWx6MVhaYW9hYXJUOStJbEhBNlFCTTJ2?=
 =?utf-8?B?ZU1lNThuTUllRU0vM3hLRklTUGV5WCt1WjNrUjBEblVRTjBIaHk2K2ZabjNi?=
 =?utf-8?B?MVlSYU9HaUNxYytOTGxvQ1pYcVRzU05jNVYyS1VGOGR2ajlzNlBBSUNBZ1ln?=
 =?utf-8?B?QjVwdWlLT21TN1NuZWdMNUl5d2h0QkpMZkJCUVVCYyswWEswOVIyVVBMeUJr?=
 =?utf-8?B?QmJUaGZBTjYwdkFIdXgvdVhRMFFlYlFaaUdhOFdiTklzdHhmUGpOMTFIU0pH?=
 =?utf-8?B?LzZYQTZORzJXSHR3YURHVVVGWTBrZnlIV2h0U2kydXc5amd2WFdDTU1pZml3?=
 =?utf-8?B?d0JSeFJaMDltd0pVbE5EQzFqZEUwRVpxQ205MHZ4UkpoVS9YVVJZemxoYyt0?=
 =?utf-8?B?UWNyWG9kd25yYXo4dnFzMnByU3h4Z05aMFZqNFVUNWE1ZXk3aG5SWU9SUlBE?=
 =?utf-8?B?bEN3Y0F3ZVJHak5nSjQ3TVJ6Qy9EUExKTHpwRXdLdFUvVk9DQkJqVkJkVC9k?=
 =?utf-8?B?UVFqLzFxaTU2R3pLcjExNG05eFhSejRPcmxDMHM1YzRhTWFUUitkSGU0Wk1q?=
 =?utf-8?B?cGNKcHFvMVVBUjVhelo4bStoajhPYTNzbXdrRCtrYWpHTC9hWkhhWHc5aHdS?=
 =?utf-8?B?TTZhbWNEVjJ0Q1pmQnhzdlpiT05FRTZLOGlhaWtIcm1wNGhMQ0pBakFyKzBx?=
 =?utf-8?B?MGtEYThFTmxJaHpjMVlPU0RQSWpSUDQ3Nmh4VUM3S2xnODJBbzB2M3lDV0ZN?=
 =?utf-8?B?R0lpZlRuVWdGSmVkK3d1YmpnQk55czhJczBSYzc0WTkwVmRuNDNuYmZ2Nkd0?=
 =?utf-8?B?Yk1CZ3A0Snh2bzdZbENoU1hoa3hIT3BqR0s4RXMvY29xbi9FZFA0YTI4UEFX?=
 =?utf-8?B?Tzk4RXNOMDZrZDhBM3dRQitkRXNreFNQa3dUaE5rUDhuUVp3RHJ1UFBpYVhU?=
 =?utf-8?B?QVRNelczQTVPTHc5R1hjSGVWMS91bm4yVjNtQ2pHZzFKbC9GdDM3YytHVTR3?=
 =?utf-8?B?dDk3NEYwc29HYSs0dm02clB5U01nTlFpU1J1VmtvRUorK0dRbHZPRmdldWJp?=
 =?utf-8?B?bStXOWZBbnJ6YjFTbk9QaVF6eVlPZkJwYk1XWWttM0M5OUdhSEE1emFaUzYy?=
 =?utf-8?B?NVFiamh0YlBqZzBieWhTNEtCVVcxNkE3S1lKYXhENzNlZGZjZ1U1bHk5MktC?=
 =?utf-8?B?RXAwdG9DZGlzd2l0bFhsekJJS0FqTHFSZUhwVThlOE5YaXgrRkZtTlh3Vm9Q?=
 =?utf-8?B?UmxXNUZCOU1KL3Z6eVo5OUN3MHJFaFZqNWRHS2JhZXhxcVpiaEFmUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1EF11F5B42746047958180C1B043CBD7@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: f58sDrCKf+X175/WKI1pDUEKTrnkflXlollvrsEsl3jFs/xfWl533Kde4ZLhTd+h92aOuRRghehsKM4KpcAQOLmtUDAPn/j4k2SNLaI6KEoIYfualEQj+3woyEb7KpVATkTT5JLuhQeKUXttBEa/I7VuQW3GyqC/IcaqJsuUX5FMr3lE/UFPMP3XL+0ngD9W/qtEAQivFv5d+qtAdCMhahAg2Dh+tqKBOzFtkY7yKHBl+Xwc0cBwfiTmgaOgimR9t6M/4PG6lbiBirNBoK1SDtTvEUMQ4GcxC30cD2wOIu12kRwrQvKODzDazx6gzYXRXtLp+mrGmR593Em5xq9zkQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR03MB6195.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 046b04a0-53c6-4cd9-3110-08dee627cec1
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2026 06:26:17.9951
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cuz51g8DdFc7imBcT8W3WPPRcfJGck1jKibI2r3ZQOEggi7PwAET8jmJ3WxCj7pCykyf0qy1ddkxDoG3Snx0KA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB6526
X-MTK: N

T24gTW9uLCAyMDI2LTA3LTIwIGF0IDA3OjQ5ICswMjAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiBPbiAyMC8wNy8yMDI2IDA3OjQ2LCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3RlOg0K
PiA+IE9uIE1vbiwgSnVsIDIwLCAyMDI2IGF0IDA5OjIwOjUwQU0gKzA4MDAsIEt5cmllIFd1IHdy
b3RlOg0KPiA+ID4gQWRkIHRoZSBNVDgxOTYgY29tcGF0aWJsZSBzdHJpbmcgdG8gdGhlIE1lZGlh
VGVrIHZjb2RlYyBzdWJkZXYNCj4gPiA+IGRlY29kZXIgYmluZGluZy4NCj4gPiA+IA0KPiA+ID4g
Q29tcGFyZWQgdG8gcHJldmlvdXMgSUNzLCB0aGUgTVQ4MTk2IHN1cHBvcnRzIGEgMTAtYml0IGRl
Y29kZXINCj4gPiA+IGFuZCBoYXMgYSBkZWNvZGluZyBjYXBhYmlsaXR5IG9mIDRLQDEyMGZwcy4g
SXQgYWxzbyBzdXBwb3J0cw0KPiA+ID4gMzYtYml0IERSQU0gSU9WQSBhZGRyZXNzIGFuZCBWaWRl
byBQb3dlciBDb250cm9sIHRvIG9wdGltaXplDQo+ID4gPiBiYW5kd2lkdGggYW5kIHZvbHRhZ2Ug
dXNhZ2UuDQo+ID4gDQo+ID4gUGxlYXNlIHdyYXAgY29tbWl0IG1lc3NhZ2UgYWNjb3JkaW5nIHRv
IExpbnV4IGNvZGluZyBzdHlsZSAvDQo+ID4gc3VibWlzc2lvbg0KPiA+IHByb2Nlc3MgKG5laXRo
ZXIgdG9vIGVhcmx5IG5vciBvdmVyIHRoZSBsaW1pdCk6DQo+ID4gaHR0cHM6Ly91cmxkZWZlbnNl
LmNvbS92My9fX2h0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y2LjQtcmMxL3NvdXJj
ZS9Eb2N1bWVudGF0aW9uL3Byb2Nlc3Mvc3VibWl0dGluZy1wYXRjaGVzLnJzdCpMNTk3X187SXch
IUNUUk5LQTl3TWcwQVJidyFnRGpicTBFWk5raExUenVKTV93NVBvcG5ERmVqMW1HNHFua1JGZ3lv
aVU3RHZobTd0ajNNZUc1ZVpZTkdBMEwwR182MWotY21kSXhPUkEkDQo+ID4gwqANCj4gPiANCj4g
PiA+IA0KPiA+ID4gU2lnbmVkLW9mZi1ieTogS3lyaWUgV3UgPGt5cmllLnd1QG1lZGlhdGVrLmNv
bT4NCj4gPiA+IEFja2VkLWJ5OiBOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1ZnJlc25lQGNv
bGxhYm9yYS5jb20+DQo+ID4gPiAtLS0NCj4gPiA+IMKgLi4uL2JpbmRpbmdzL21lZGlhL21lZGlh
dGVrLHZjb2RlYy1zdWJkZXYtZGVjb2Rlci55YW1swqDCoMKgwqDCoMKgwqDCoMKgwqANCj4gPiA+
IHwgMSArDQo+ID4gPiDCoDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQ0KPiA+IA0KPiA+
IEFja2VkLWJ5OiBLcnp5c3p0b2YgS296bG93c2tpDQo+ID4gPGtyenlzenRvZi5rb3psb3dza2lA
b3NzLnF1YWxjb21tLmNvbT4NCj4gDQo+IEFjdHVhbGx5IG5vLiBJIGNoZWNrZWQgcHJldmlvdXMg
Y29tbWVudHMgYW5kIHlvdSByZWNlaXZlZCBmZWVkYmFjaw0KPiB3aGljaA0KPiB5b3UgYmFzaWNh
bGx5IGlnbm9yZWQsIHNvIGV4cGxhaW4gd2h5IHRoaXMgbW9kZWwgaGFzIGZsZXhpYmxlIG51bWJl
cg0KPiBvZg0KPiBjbG9ja3MNCj4gDQo+IEJlc3QgcmVnYXJkcywNCj4gS3J6eXN6dG9mDQoNCkRl
YXIgS3J6eXN6dG9mLA0KDQpBcyBtZW50aW9uZWQgaW4gdGhlIHByZXZpb3VzIHZlcnNpb24gb2Yg
dGhlIGNvbW11bmljYXRpb24sIHRoZQ0KaW5mb3JtYXRpb24gcmVnYXJkaW5nIGNsayB3YXMgaW5j
b3JyZWN0LCBhbmQgSSBoYXZlIGNvcnJlY3RlZCBpdCBpbg0KdGhpcyB2ZXJzaW9uLsKgDQoNClRo
YW5rIHlvdSBmb3IgeW91ciBhdHRlbnRpb24gYW5kIHJlbWluZGVyLg0KDQpSZWdhcmRzLA0KS3ly
aWUuDQoNCg==
