Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C35D03ADBB4;
	Fri, 14 Aug 2026 02:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786675104; cv=fail; b=UvEjFGT9LJ5M/uknS3rjhFs3+QmgL5vFqlDDSF5nKjEBA6RtMPzL0adPy9xjgRB55fek6RFQyjccHUzgmMAVFv14SB8YtCiVmslymXVUr0eNMCUfFShWovcdi07fAAFRhOHTpTj5RhsaWbnmm5aVYRk6MI/yE5to0iIQ2060Ako=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786675104; c=relaxed/simple;
	bh=9XM8Z7x61AnXGh1vq+gbbqN3WO6mbYDulO6kq9LqxFc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=JEOruCO+VjuxDm0rGU/++r8e3a+iQkTMnA1fOsB7og5lSVeI4h8mATiSGWiM46tlsAhQwLlOFXzc4S4Y5UKmcw9vnTf/hOG0lwpzVoWKEbxfamt7LtOJ42gS7Z1iTKhmkcKvQjPdMIHuTHVdAxtC3i09DCSdv6HcgxW8/lYu7bI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=Cfhn2HtE; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=sCCZbaTn; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Cfhn2HtE";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="sCCZbaTn"
X-UUID: 333e49a4978911f1b1788b6acf885367-20260814
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=9XM8Z7x61AnXGh1vq+gbbqN3WO6mbYDulO6kq9LqxFc=;
	b=Cfhn2HtEA0+hf2XmsHzZXZ9Oyhv91z1ClMlS5ZFfNGqMQqkt8oMTaobSL/ry1DjBKnprymmZ6p3i9/ERnKwZ3O1eixpjd03YEgT962LIVz83AhBgdwbhOuVdKg4wO1BEraU/reHmrlFn02Us7LDvHTe0ZCcF9bHM62a9ZMC8BA8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:c21cd3f4-afee-4494-b3b6-da05bb6b7f56,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:32cafca7-8a7b-4c49-a0c0-42d13e7adac0,B
	ulkID:nil,BulkQuantity:0,SF:80|81|82|83|102|110|111|136|836|865|888|898,TC
	:-5,Content:0|15|50|99,EDM:-3|-100,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:
	nil,BEC:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC
	:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 333e49a4978911f1b1788b6acf885367-20260814
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 129989019; Fri, 14 Aug 2026 10:38:15 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 14 Aug 2026 10:38:13 +0800
Received: from SG2PR04CU010.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 14 Aug 2026 10:38:13 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XVnGQXCOOZIYU+dEbvXYyoZok5l3wN6zYIBILg2Jfy7K19o3di8YqvHw14z9Kl7IebxuGcuUPZYqAtC4C71gE1M43uXhG16fAVWDwK7uvldUu04lQLI+JsgJGZke49335Lest+lupWPyK+xXtbjDvWoimaiNLUToLfpIkBz/A3Aa9f4KIlS0RITmpxWRl3vnk4hIB6sQr9CIpc+QEiWSIV+VMajSWNw3V6Z2uFEjk+r/zKEeWc3HzHT6UkTNWCmfb759aOOvHWFKGwivm3Et5N/4hRzkvOIU03Ny4IFIhyCy73O9ElpkEqBlYmpPvzlmWjVV7XZmy+Sw/FfdUyfj3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9XM8Z7x61AnXGh1vq+gbbqN3WO6mbYDulO6kq9LqxFc=;
 b=J2lG5Qr7XZbxbNyCOl6mc9W+nKvH+KPD4NlmN/Li10Em7Dzg35SfhNluNB+FcICFv3PdbC71ztE2wlVslyRl3DbW/ypb3B5L9GLvHXSQDhmudzehwn+ROLeGK+ssnfsMr4AIMnffd+JGAl9GJsTa2RyoM0WYUrfquO7peaqmtpJmkRyI7gbckZzXq2BwT4+ZDEmol+mEtU6Ke9nAIdoOEXNNvVV4LsR5bQXowkf1I+2lOzQoBBhTHt4OTEkQLirt+bGa2PibyO0+FQCWUdC/r2MoBBeAgsSoyDMrHQWrwR1FyGwVgr+aKSxY/xEfXTJXncw7sHxEYwh7uMzVzwvQ8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9XM8Z7x61AnXGh1vq+gbbqN3WO6mbYDulO6kq9LqxFc=;
 b=sCCZbaTn9ikNDELp3kFCEJGhlkztKycW/6SmyzOigfdRy3S2rdw4Js0Av2vnln8Wb3zMQ2Zi7TQLCIY1vBz7a+OAyYABnfyTWIs/ybd5DdbWPf/6SF5OX4AbiDk6ODaFI6B6YhpfUrvEQes9j+vmomrm7M4G+WNQ/Ue4laj93fo=
Received: from KL1PR03MB6197.apcprd03.prod.outlook.com (2603:1096:820:90::5)
 by TY1PPF4A10620CF.apcprd03.prod.outlook.com (2603:1096:408::a51) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.13; Fri, 14 Aug
 2026 02:38:09 +0000
Received: from KL1PR03MB6197.apcprd03.prod.outlook.com
 ([fe80::6c6:8246:f9fa:d89d]) by KL1PR03MB6197.apcprd03.prod.outlook.com
 ([fe80::6c6:8246:f9fa:d89d%5]) with mapi id 15.21.0315.012; Fri, 14 Aug 2026
 02:38:08 +0000
From: =?utf-8?B?S3lyaWUgV3UgKOWQtOaZlyk=?= <Kyrie.Wu@mediatek.com>
To: "fshao@chromium.org" <fshao@chromium.org>,
	=?utf-8?B?WXVuZmVpIERvbmcgKOiRo+S6kemjnik=?= <Yunfei.Dong@mediatek.com>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "fanwu01@zju.edu.cn"
	<fanwu01@zju.edu.cn>, "jacopo.mondi@ideasonboard.com"
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
	=?utf-8?B?S3lyaWUgV3UgKOWQtOaZlyk=?= <Kyrie.Wu@mediatek.com>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	=?utf-8?B?VGlmZmFueSBMaW4gKOael+aFp+ePiik=?= <tiffany.lin@mediatek.com>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "sebastian.fricke@collabora.com"
	<sebastian.fricke@collabora.com>, "robh@kernel.org" <robh@kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	"laurent.pinchart+renesas@ideasonboard.com"
	<laurent.pinchart+renesas@ideasonboard.com>, "hverkuil+cisco@kernel.org"
	<hverkuil+cisco@kernel.org>, "nicolas.dufresne@collabora.com"
	<nicolas.dufresne@collabora.com>
CC: "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v6 01/14] media: mediatek: vcodec: support vcp
 architecture
Thread-Topic: [PATCH v6 01/14] media: mediatek: vcodec: support vcp
 architecture
Thread-Index: AQHdF+Y7RSrzq5sjDEOtpJV5U92T/rZ2XuOAgCBbTwCAArQ6AIADjaeA
Date: Fri, 14 Aug 2026 02:38:08 +0000
Message-ID: <44d9ec5c5f856b378f745fae8bd60aa4730df044.camel@mediatek.com>
References: <20260720012056.1026551-1-kyrie.wu@mediatek.com>
	 <20260720012056.1026551-2-kyrie.wu@mediatek.com>
	 <c3abd49fc12e8cfab6993feb60b361ba07b6fb7d.camel@collabora.com>
	 <275503aae6ff76a4c186efe665acf996dec9229d.camel@mediatek.com>
	 <c8ab26c2edfa4ee4fbbb83faf5f54547f252464f.camel@collabora.com>
In-Reply-To: <c8ab26c2edfa4ee4fbbb83faf5f54547f252464f.camel@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR03MB6197:EE_|TY1PPF4A10620CF:EE_
x-ms-office365-filtering-correlation-id: 2d57c370-8c94-4c23-1b53-08def9ad13b3
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024|23010399003|921020|22082099003|18002099003|38070700021|11063799006|4143699003|56012099006|10067099003;
x-microsoft-antispam-message-info: AY0fdD18Q5uMQvWisX6BlNVLOGHyDjxjcHWEvFcbMEvdOMRLV0qO3om/Ic9MmSVpyIVwTDfH7cuPScRlc6sZ3oFkouYbcy6YovlJmmdZoLTRy3GpNIonbHQoq0Nvrzm5309+945HfuLcQruK25rPgYL1EzT30AsacXaJjp3PYTncgXW64WiXZRfUYLfKlUun+9YcbLXCF7oGzjotsYJ/WmYQQZk0+SQLw7IwKeLMb/LsnieIbjjh3HL7WbeB/j/Lx3sQ3XLbrOBXSZZxVx3VpLWbdHpcrMo0DIDFclenCxyek1Ca77HmcquYuZsaDbjIxWQ17v00ni8oFA9ZAuGEHAWoYGkJkQmy0+oyJbjoMWnwYmRa+xKBndGUcdFPbj6MIDEoVMeFgf8rz6/ViIg/ZnL6NQp9yrihJGlFwyNR9wEq+R2tRcHoirzI3kYqea/gLGPs6iW/z/hd9IuW1wspKgDKh3ZCr2DiYNjAAPVwHqX0eh2C8+5thQl+1dcytvTOHuatntGArsrvsgTSuLvhATTF1jl3PlyP9ztzDa6vxR3aiKK6g1Hnly+Etbo2QxwzgXpzMNlFsWcQ4j+eHH0Ga7P7Iwx/G4++9soZoQB5uOTpAXnTI1mPJeblDhSieX5MFIDOCLzBy5BaeSJ/5Atxz1EqPi3Nru29Cudkfwqweg12gyu3Fm+bmwFAuB2Kdek/bGpeTXHyxq08kA6KCgcJRHvu7rapbepVLBK7zppdAdFvrlfS5WAp1a/CznY9wfDE
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB6197.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(23010399003)(921020)(22082099003)(18002099003)(38070700021)(11063799006)(4143699003)(56012099006)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YlhQQlVxOEM5Qzc4a2Fjek5MQll6N3VZTFN6ZDQyd2pMbmEvR3N2MHVKVmc0?=
 =?utf-8?B?VGNKVWQ2T2FoSHZ1NkN6VnFheURYY05qQnF5aFNyQ250TDZIb3pQSVY5RU4v?=
 =?utf-8?B?cXg5bzNWZjU5WXVKc3p0U3N2R2NGKzFKanYzb3hyU0s5MnF2Mmk0Ty9uVVVH?=
 =?utf-8?B?cTFTMUxncURqQXpoYUNLSk1QNlMxYlpOUkdLUll2WnFacnY2Z3ZSQ1ZjRVgx?=
 =?utf-8?B?RDJ6WmFYTE13Y1Y0NVFzK05zTEFmUFBXSU5CcjZ1ZDVhNm9ETlV0OGlzUisr?=
 =?utf-8?B?dkZqQ0xTTkp2bHVkb3N4OFBmYllPcTVsZnJ1WlFiR1lwNTdxYXNjREVpTzA4?=
 =?utf-8?B?TnAwYzVBV2RxMVZzYktCS0c2TG9FWEN5N1lXTGlPYmdrd2krWmd5UndzeXFu?=
 =?utf-8?B?ZExjTmJ4NUNDQzdOZmd2MWMwQmNDRGxqdkc4YS9Sc2pwTnVMZ0xtSUpyMEsx?=
 =?utf-8?B?a3k1WXJpY25BNy9DMW9qNEIrYXdyVmEwRHR0NXA5RTNObithajMxNXVCaG1n?=
 =?utf-8?B?SEl6b1lxVDJ1aWwwQ2ZIc3AyUWtMb290U2tOQzk2bFBzZFhvYjdNY1FTQ0Vk?=
 =?utf-8?B?NTJ5cHdyNzJDK2ZRMFlTVjlsaTNMeG5oRlI3OE9NNmM4VWRGbENndld0MFR1?=
 =?utf-8?B?dGVQbC8wYW5CZi8wekpEbGhIbHBYMmNZQ0V2dkx4Q1lVSVhLa1dwYzdnYXY5?=
 =?utf-8?B?eWJsWUhvU1E3NjFVQWZTaTRpWjJVRm1jZGZ1US93eDBzZENiTHFSNEUwSFYz?=
 =?utf-8?B?Tm82R0tWOTBHbVpwd20zd05FT2ZoZldMUmJkMEFsaGNDVGpGUVhHQWdieEJS?=
 =?utf-8?B?dGVlTndGckNpcVVqcXFOT21BWEQyekxiZVRMem4zaGZmZGZyNk54MXJCTGJS?=
 =?utf-8?B?MWttTWVHMkhISEt0bWdteTJwQVcyVUJIWWsrZ0JFOEh5WmMxNWFMOU4vZHc5?=
 =?utf-8?B?TFhmc3pRbERxR3dzUWYvbzJPM2hIekx6U2xkdnZEUVIzdmJOMWR2T1ZaMURB?=
 =?utf-8?B?aDIxcHFTVmNwVWFBY2RQbWxsSVI3Ny9YY3dmaEtUNzdzdjBDQy9aN0dsenhs?=
 =?utf-8?B?Wk5MT0lWK00xbzlMeWpGNW5rVEkvaGFaTGt3enBjbFl3SW4vNUtFZlBvQ2tL?=
 =?utf-8?B?eVhVcGRaRUo5N3phekp5TUp4MFBLK1dyb2JxRVVZaGJRR1E5VG9EWGNiZk5n?=
 =?utf-8?B?V3NMTG5JdHlkN2M3MVpzekM5eHBDSVFGOC9Cd1lFSUprYmxLREc2ditaNWd2?=
 =?utf-8?B?Z2JGbmFhZnRlU016RDl4ZjJZS3poa2ZCazlnTXQwYStGRm80NFZSMjZtd01I?=
 =?utf-8?B?cVNMSndSK1lEdWZmV0Ixc0NMR0tQV1hWbVJzYndqZzlLbGJuTUtDQ0htU2VY?=
 =?utf-8?B?NUdBVEVjc0tPT2hVVC9rbU5mQzJwWUhJVTIveGFBRm9CRFkrbXQ1NFNYK3dq?=
 =?utf-8?B?TFh6SGgrNitDVERNQjkveHNmZFpiaTFleGtNZ0ViSzI2WHg4bXFiS3lmd1JO?=
 =?utf-8?B?WjJQMElTazdaOXIvWkJpcGlYK1ltRUtBN1J1NC9xVk01NTF3WU03dHRYdkRy?=
 =?utf-8?B?OFpTUEdETVZLb245YkNLb0VtVlVtRmxwcGdxcnJmbUFlRWpLOFFsN29oNmFt?=
 =?utf-8?B?ZlF6TFVPTmN1UWdaQlgzc2p1RmRERWlyazVGU0pWeEtmU3VqbVdOZ3lCWkY3?=
 =?utf-8?B?UTBFM0xrcStqZnNEMU9xSEpSbGxmcFhLemcycGJmVDZWdCs4dXNmMGpnSUZQ?=
 =?utf-8?B?K0Y2dlhrU01CV2ZMcSs0aTlQUjVxWW5aZ21Wd1hGbld0QTVrVVF5Zkh0YVZx?=
 =?utf-8?B?QytHSjVVeXBLYlJvNFAvbkxScEd1YzVnNmNCZGV0L2dPNmpzY3R2cURJazRV?=
 =?utf-8?B?VFJLbkw1Ry9DdFpFUysvVTZTM3dETWFyQTUxc3hQZ3FFK2xUSm9UcTUxTXJD?=
 =?utf-8?B?YlpLOVpvVkEzb1lsRmFacHVzaFZzOUlMMmFvQVkxWTN5NXhPbHJ1ajQ2S01T?=
 =?utf-8?B?VmRhRjBBS0pMYktFVHlLemdtazdNR3d3eElwYXdVd1dTS0N5SDljc0tzTzRj?=
 =?utf-8?B?Q0QyN2pKL2pFNzVQOXhRY0VjYnJmRnhTWVRSbll6SW5ZZU5kQURDcE9aT29R?=
 =?utf-8?B?SWFqMlROdjBuS0pQSVhlUHBtOWZCTFZIdWlhVnFXVjVRZTdvL3d5Q1FsdzZs?=
 =?utf-8?B?QlgzUHM2eG5GRHR1cmd3ai9hRmVsZW1TYmhJcFBhNWpUTzBDRFJjV1RydzRB?=
 =?utf-8?B?R0NiYXFNVEJXWERnek1YaTljb3BPcmRqK2lYaTFhelc4L1p3cHVmc24ydWdW?=
 =?utf-8?B?WDFoTVVKTmFhY1d3U2t0R1V3bFhqQisrV0NyNURMTld5UDBuT0dRQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B05F64F98359964CA402D33E032A606E@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: rqXs83zJp7ZOPqoSVe0M/u2JyuVTjRoIIr1Wf2uX9co8cKOOsmGSOTw+SvEzi6emyRtfIY25f3DJ7sZ/yVm179qjX8Uo5P7f7eJJnXJ4Kg5kM9p9G8chKZCnHWeRIJd5qq4nnsF8mul8sDLYjClTlM8UjabIQ3ZuwFGsLa7HPaJ7czNA01W5E6WEySJtE71jnmYLKEaev9uSaDW+GqajLGwer3ozCuexDm+zGVv5jfqaYD0YAs/jUmab+61ywN2c65lPJyFugIURMqKs1IQgNbxTsweub5VEcR/kyWYiuej63Zct7kXa3LlLN+x8mI4mYRLP+rD0h6c2m3jUDkjUOg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB6197.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d57c370-8c94-4c23-1b53-08def9ad13b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2026 02:38:08.7883
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bAvTGo3B60y9QNk7ovpsRwyKcyjIhvHcmbUtcFGsmypKzCOQUK9HbZVZCGczEz+U/m6XbLk9eyFiDYhLn45Oow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PPF4A10620CF
X-MTK: N

T24gVHVlLCAyMDI2LTA4LTExIGF0IDE2OjIyIC0wNDAwLCBOaWNvbGFzIER1ZnJlc25lIHdyb3Rl
Og0KPiBIaSBLeXJpZSwNCj4gDQo+IExlIGx1bmRpIDEwIGFvw7t0IDIwMjYgw6AgMDM6MDUgKzAw
MDAsIEt5cmllIFd1ICjlkLTmmZcpIGEgw6ljcml0wqA6DQo+ID4gSSBhZ3JlZS4gU2luY2UgdGhl
IHBsYXRmb3JtIGRhdGEgaXMgaW50cm9kdWNlZCBpbiB0aGUgTVQ4MTg5IHBhdGNoDQo+ID4gc2Vy
aWVzLCBJIHdpbGwgbW92ZSBmd190eXBlIHRvIHRoZSBwbGF0Zm9ybSBkYXRhIGFuZCBtYWtlDQo+
ID4gbXRrX3Zjb2RlY19kZWNfZ2V0X2NoaXBfbmFtZSgpIGRlcml2ZSB0aGUgY2hpcCBpZGVudGlm
aWVyIGZyb20gaXQNCj4gPiBpbg0KPiA+IHRoZSBNVDgxODkgc2VyaWVzLg0KPiANCj4gSSdtIG5v
dCBzdXJlIEkgaGF2ZSBjYXB0dXJlZCB0aGUgcGxhbiBjb3JyZWN0bHkuIFdvdWxkIHlvdSBtaW5k
DQo+IGNsYXJpZnlpbmcgPw0KPiANCj4gTmljb2xhcw0KDQpIaSBOaWNvbGFzLA0KDQpTb3JyeSwg
bXkgcHJldmlvdXMgcmVwbHkgd2FzIHVuY2xlYXIuDQoNClRoZSBwbGF0Zm9ybS1kYXRhIHJlZmFj
dG9yaW5nIHdpbGwgYmUgaW5jbHVkZWQgaW4gdGhlIG5leHQgcmV2aXNpb24gb2YNCnRoZSBNVDgx
ODkgc2VyaWVzLiBUaGF0IHNlcmllcyBkZXBlbmRzIG9uIHRoZSB1cGRhdGVkIE1UODE5NiBlbmNv
ZGVyDQpzZXJpZXMsIHNvIEkgbmVlZCB0byB3YWl0IGZvciB0aGUgbmV3IE1UODE5NiBlbmNvZGVy
IHJldmlzaW9uIHRvIGJlDQpwb3N0ZWQgYmVmb3JlIEkgY2FuIHJlYmFzZSBhbmQgc2VuZCB0aGUg
dXBkYXRlZCBNVDgxODkgc2VyaWVzLg0KDQpJbiB0aGUgdXBkYXRlZCBNVDgxODkgc2VyaWVzLCBg
ZndfdHlwZWAgYW5kIHRoZSBjaGlwIGlkZW50aWZpZXIgd2lsbCBiZQ0Kc2V0IGluIHRoZSBwbGF0
Zm9ybSBkYXRhIGZvciBlYWNoIGNvbXBhdGlibGUsIHJhdGhlciB0aGFuIGJlaW5nIGRlcml2ZWQN
CmJ5IHByb2JpbmcgRFQgcHJvcGVydGllcy4gQ29uc2VxdWVudGx5LCB0aGUgRFQtcHJvcGVydHkt
YmFzZWQgc2VsZWN0aW9uDQpzaG93biBpbiB0aGlzIHBhdGNoIHdpbGwgYmUgcmVtb3ZlZC4NCg0K
SSB3aWxsIG1ha2UgdGhpcyBkZXBlbmRlbmN5IGV4cGxpY2l0IGluIHRoZSBjb3ZlciBsZXR0ZXIu
IFNvcnJ5IGFnYWluDQpmb3Igbm90IGV4cGxhaW5pbmcgdGhlIHBsYW4gY2xlYXJseS4NCg0KQmVz
dCByZWdhcmRzLA0KS3lyaWUNCg==
