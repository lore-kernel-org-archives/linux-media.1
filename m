Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 779DD2236EB;
	Mon, 10 Aug 2026 03:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786331379; cv=fail; b=Bb2fuFs2SaNof5TE8oeiq/zcqimcL/2ik3EVHImKplHA7tEor4vIk4ocbAZfuzE+FXXItL707cbVsbygcIE2b06dWpLlVXmHWw9mJsUP3yWrzjeT05NXZl/ebzBGm4SWYaWLH2JUzhxYRKIM7WzP3bq5LxRJiTlysb2Yqh0QwIM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786331379; c=relaxed/simple;
	bh=Tz5Oj/qKKkTfAaqQZf82hn4y5WtOSaQFj/lZlLVK1xY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=NS8eV+PI790pjKNaumjWNrMHa7Vc/avNjtXDezQtmiEyuuKFyC7czuvT0+wnG7Hfo6l0dpup5aerepcE6URuSH6JsBiOyD16R1etP6/UUFkPD3NbogfQ3tSJPPaQJ19dxuz4jidDZd/rDlRK42d4MaL5JhSZDbhUO7Adhqp3CPs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=MZzO2aJf; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=KeeJJyBA; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="MZzO2aJf";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="KeeJJyBA"
X-UUID: e8251ad8946811f18dc8c9802ae25ab1-20260810
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=Tz5Oj/qKKkTfAaqQZf82hn4y5WtOSaQFj/lZlLVK1xY=;
	b=MZzO2aJfyRXmSEdljTJ6BL7hqKdiM03wdz4rvYp1DDBtLbOK50Al6/maRfgX7f117JT3JJAEN4Raz+znYdOtlHFYRLPm2HyitguIReeJf1P9folaMBkD/uSc/d5V1Wle7X3s/1M6jBpqAZ01rP50Yis9LmjGS/HXSGP54Q2iK9A=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:d2f9b366-cb57-412e-af55-ae728e6995c1,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:314853d6-b747-4cfb-ae5b-248273dc1cb2,B
	ulkID:nil,BulkQuantity:0,SF:80|81|82|83|102|110|111|836|865|888|898,TC:-5,
	Content:0|15|50|99,EDM:-3,IP:nil,URL:99|80|1,File:130,RT:0,Bulk:nil,QS:nil
	,BEC:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: e8251ad8946811f18dc8c9802ae25ab1-20260810
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1845924571; Mon, 10 Aug 2026 11:09:31 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 10 Aug 2026 11:09:30 +0800
Received: from SG2PR04CU009.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 10 Aug 2026 11:09:30 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tzdnLwAaK8yLK6+IeT6zcfZY7s5W/gbGHBGnhohaMTea2qN11SGBYAYMsptd8CT4cRL9jNpKWTl3qf3LZ56qIdMkviTxaoX+VhDW0x8HKOUYjkTjCkdpl4LB+CsMEs5I0288earHQzxm2eEjHjxSe+cICwn/Z+wJJt1nJTEGl+WLNPlbDnGP+NUHr9LqE5odas0QlNzeD+UR0Sk/G5DpEtRTVmEYvHPefNaOy2K744R3BXC8yoa+fOO6TEvnbJCMq0sPKgZtUp7ey2k9vJC5gCZClkNSpy49f19RkpWIz/XRHV7YCgJ2pyKfG15LUDfaA4wCUAi/04fxYVKdGlb/6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tz5Oj/qKKkTfAaqQZf82hn4y5WtOSaQFj/lZlLVK1xY=;
 b=qaaEDlvKrZkwPywqrXlUgyMiT7dtB8+d1eRLh8F/jekdzB9iw2+LtzRgs0oNEKLBCRUE6Rp2Dk8xh5bE1n5p7aUD+eXTW7KmZQfHGHwPKSKBigM15cumAWU8YYRXr1Me0h6DciIpo6RqAHdJKi3udd7T5TDZSGxPU0oT/Gwkw98305SVVyGmhVDXtinHtwsKSS7Km+Wd6Sk/DuRUb1qOdOJ+D/e3dUfJ8Ptzwc9ErRcOZ1F4/kfUd9oAVYv8J8AraMSAD/P+HuqUew+OpWVL1MJYQ+KWtIGUAhVMLO5EBJNoVnYHbEr2pBR2ackR6iJMo+g20EAZJZmc18x7veUl1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tz5Oj/qKKkTfAaqQZf82hn4y5WtOSaQFj/lZlLVK1xY=;
 b=KeeJJyBAD53R573jvVkkQkSybzprKFuiAasnOG02q7HrwxjfxYBEL0enH9yB/QUUhHOIe8QqkgVO7Z9dy0Bh4h44SdNHY4Z2m5FGwQjlHt+0m95iaygAg09NgplbS7KK8pLLszD2Wi8KlDb3O/npi5yncW92TPE0ROaH+CbXW10=
Received: from SI2PR03MB6195.apcprd03.prod.outlook.com (2603:1096:4:14f::13)
 by TYZPR03MB9672.apcprd03.prod.outlook.com (2603:1096:405:39c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 03:09:27 +0000
Received: from SI2PR03MB6195.apcprd03.prod.outlook.com
 ([fe80::ea95:8d21:d28a:6b2c]) by SI2PR03MB6195.apcprd03.prod.outlook.com
 ([fe80::ea95:8d21:d28a:6b2c%6]) with mapi id 15.21.0292.024; Mon, 10 Aug 2026
 03:09:27 +0000
From: =?utf-8?B?S3lyaWUgV3UgKOWQtOaZlyk=?= <Kyrie.Wu@mediatek.com>
To: "krzk@kernel.org" <krzk@kernel.org>
CC: "fshao@chromium.org" <fshao@chromium.org>,
	=?utf-8?B?WXVuZmVpIERvbmcgKOiRo+S6kemjnik=?= <Yunfei.Dong@mediatek.com>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "fanwu01@zju.edu.cn"
	<fanwu01@zju.edu.cn>, "jacopo.mondi@ideasonboard.com"
	<jacopo.mondi@ideasonboard.com>, "haoxiang_li2024@163.com"
	<haoxiang_li2024@163.com>, "rongqianfeng@vivo.com" <rongqianfeng@vivo.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?utf-8?B?QW5kcmV3LUNUIENoZW4gKOmZs+aZuui/qik=?=
	<Andrew-CT.Chen@mediatek.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "ribalda@chromium.org" <ribalda@chromium.org>,
	"wenst@chromium.org" <wenst@chromium.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "kees@kernel.org" <kees@kernel.org>,
	"benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>,
	=?utf-8?B?SXJ1aSBXYW5nICjnjovnkZ4p?= <Irui.Wang@mediatek.com>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	=?utf-8?B?VGlmZmFueSBMaW4gKOael+aFp+ePiik=?= <tiffany.lin@mediatek.com>,
	"sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "tfiga@chromium.org"
	<tfiga@chromium.org>, "mchehab@kernel.org" <mchehab@kernel.org>,
	"sebastian.fricke@collabora.com" <sebastian.fricke@collabora.com>,
	"robh@kernel.org" <robh@kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "nicolas.dufresne@collabora.com"
	<nicolas.dufresne@collabora.com>, "laurent.pinchart+renesas@ideasonboard.com"
	<laurent.pinchart+renesas@ideasonboard.com>, "hverkuil+cisco@kernel.org"
	<hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v6 08/14] dt-bindings: media: mediatek: vcodec: add
 decoder dt-bindings for mt8196
Thread-Topic: [PATCH v6 08/14] dt-bindings: media: mediatek: vcodec: add
 decoder dt-bindings for mt8196
Thread-Index: AQHdF+ZCyChClad61Eelw4Pditpo87Z15nYAgAAAywCAAAm5AIAAQdgAgCCIo4A=
Date: Mon, 10 Aug 2026 03:09:26 +0000
Message-ID: <2b567b39434d7d125dcdca75e198a1442e4c2f22.camel@mediatek.com>
References: <20260720012056.1026551-1-kyrie.wu@mediatek.com>
	 <20260720012056.1026551-9-kyrie.wu@mediatek.com>
	 <20260720-gregarious-satisfied-shrew-f71cba@quoll>
	 <f499f2c3-f31d-4c2c-84fb-d1d9d95fc868@kernel.org>
	 <a9123dce5ae7ef184f5640b12e3e9427084ec542.camel@mediatek.com>
	 <8558035b-d825-4e56-bfd2-551cff51f73f@kernel.org>
In-Reply-To: <8558035b-d825-4e56-bfd2-551cff51f73f@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PR03MB6195:EE_|TYZPR03MB9672:EE_
x-ms-office365-filtering-correlation-id: 1f0f423b-db47-4553-ffee-08def68cc980
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|376014|7416014|1800799024|366016|38070700021|10067099003|4143699003|56012099006|11063799006|22082099003|18002099003|4133799003;
x-microsoft-antispam-message-info: 5IymfDFuMxXuJd6LmZ2QJdF2GEfGsoGS6RMfzhVIWfIaz3LaPNwPiZITP2X52DuK53y6UjEHmskOHeFqzerQbV3qzv9OUwBNifgV4Do7YFRoao1xiMu8FeCjiAJ9cjckNdCtthm0wg+rAfjC9vR2+ZiH+H6i0GjZYIplw4Bahit+j1gkH5zjFK2SfsAW1gQZUdXDHmS5kRZb8nSM52WnVY+ZDP6O9fAvfRJRxe64+pjC92ars/Lj1N+k9LXZRukqTfwtJjjncSoyDrIR98LGige3pYk9heOUx2/9Kd2n82QneTc3M32Lm7Ds/6U6yVONr5+UwCFn1y3RbtpBwuc0fWWmnPeh1cksIUEgEe7XmDU+fAUXNTL+jUiSTbM+APMpIy1UlUCBBv8n8BZ4WroCocV2dtX1Pj1vejPSNC4gx7dSU0a89Xiq/9vsFk+gkA0VmKC+FACLi8c5/VKmavaH0+4sdm9vKykyrWdWOKicy2Q5ReS2xN0KXlKECUXkFYkGeWPsTICkDAcyOqbZ/+HnanXthv1pzrcB/kEB8u+T8GA9aneK0OVkcZ4qz23Y5BWeu5JkzFwu87dyPPgNDX8aIEKvfUFAV5BtEq0kf40V3oICvZAUgb5UCrYFJa/vWtUsKRd8dc7g6lFcnco7ucIhtTpUIDbw4Ly0oy7UsPzdPKeaLdsrCR1ImSUPre+WGuw+mWY59o4Dx/v5MRQK7Yq+vM9ZnrLVSBfMz+2r0uTqdOk=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR03MB6195.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(1800799024)(366016)(38070700021)(10067099003)(4143699003)(56012099006)(11063799006)(22082099003)(18002099003)(4133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?THQrRm1FWGYyS3JSWnFQc1pvcFNWT0FTZlBkMCt6RnFpVjAzTEJYNk11QzJR?=
 =?utf-8?B?eU41YnFUWFBLckNpQjNkZ0p3bTd2akFDMTlPVjZnMk84cHpxd1Myay9yYjVh?=
 =?utf-8?B?azFvdWNJMzN1ZFdzRmk0cXJTZ21RRkxqTkRpOXZkSVhQMSt0bWx4NXV2Q0Y4?=
 =?utf-8?B?bzBPbmdvL2lWQ2ZGK3FmNDV6K0lSeHBZdGJ4cTB5M0FaTE8rK2dMQ2czbzRw?=
 =?utf-8?B?VnpYa3g2VS9zZ2JDaisxaXg2Rm9BeC8yemM0RzFkdnErN29GU2xFTGlMQmlQ?=
 =?utf-8?B?UlVidmpHTkNEcUYwbEJNWk10R0Y0YmFMTmpyNzBSclBrNXVUenJ3eG83b2V6?=
 =?utf-8?B?UHdkRjFkRFR3cVNFLzYvMXhyNEd3Z2x1Q2h6dDNxZDhhdk9CUUNRZVRzcHFM?=
 =?utf-8?B?ZFh0VDdoY01ZdzRHU3ZzR2ZzLytHOVVZWjlhREZDejFIT3BQa1pWcHJvMmk0?=
 =?utf-8?B?czdIZWNCYXpWM0ZkaERnWkZaNk51YndYdXRPTjdHWnM4MnFXVjFIaTh3aFdU?=
 =?utf-8?B?VmNtYTkvY1VTMVRyaGorYVBsS1JnYWh0NksxcWtBZC9UdHpCaTN0cWNDY2tV?=
 =?utf-8?B?U3o0NExoZVRERWZwKzBvRXFnMi9maUxET2lTQlc2RWtleVl0ck9RaHAxZFky?=
 =?utf-8?B?Nyt4NWdnaE43eFVVbDgrNTRWb09oSSthdXpJYzNQejJsTFZldGEvZ05QUFJO?=
 =?utf-8?B?T3pCZThCSXNBZHlETFMyemV4NGxIL040T3crMEhUVllIQ1FkdVhBOEEvN1hG?=
 =?utf-8?B?eFBQREJNSDRPRndmQmo3M29YTG1HMkIyM2doSHlFakJKVTRLK2JhSzFKbEdY?=
 =?utf-8?B?YWNNZ0YvODRBa053S2VXRzR0YVJkaEExUW5LVG80dEJJdTVWdDUrTjA1bHAx?=
 =?utf-8?B?Vmtuc0tLcWJnWkNMdUY1VytJQ0NhdndpZHpFcXFDL2MxRUZkOFR6L01qRGRP?=
 =?utf-8?B?Uk82VE5ocTB2aHBvWlBaMVJiSlRjQXM1WlpoRktoaUMvb0ViU3ordFdXTTk3?=
 =?utf-8?B?Tk1oVXFHVWUwTFU5dGxMc3pQMTgyMEFmaWpDNUdrNVNlUEV2SzRKUXpIcWNE?=
 =?utf-8?B?WGxrOTZqenB3UE1pOThUbDJjVEppRWNmMm1PUHc3TG93K2tjZ2Nic3BBcGhJ?=
 =?utf-8?B?VFAydkc3WXFud0hqYllKd2RrengrWi9TZndwK21KRXRUNzNmWEpKZFM4endG?=
 =?utf-8?B?SlRWTlo5ay90TnU1ZVpOWVJicVJ1UGlIZ2hhaU9RTDdER3ZQK0ZIcXdhbFNP?=
 =?utf-8?B?QzRiUDdVMEx3S1pCeGVyNVpSTm5RMEE0dzhuOWFVbUVzT3ZWSmRiZnloMTZ6?=
 =?utf-8?B?bHR1bVQvQTJHVjBhM3QyMnF6eUh6ckQwNnJRNHlXM1RKZkFsVUVIWjZrbGZR?=
 =?utf-8?B?MjhINVNISVhaZmk5U041MjRNaURocVcrOHhrektGYXl2TmdPY01NaHhEckZ2?=
 =?utf-8?B?aUM2aG5oNnE5QWdycDJHVnNkcDQrTEYvQXFpMXV6WkJjUHBPcEFhYm01cHBl?=
 =?utf-8?B?SGFGUE1iSjJJaFFkU3FGa05EVDBuMVJYUkVIWisyeGE5R1V5TlMveG1aS3RL?=
 =?utf-8?B?b0VNZnVuZkxNNFdQazJDK042NjlZL2RJYXIxZlJSTTRoSmFRTVlMbUlhdC9w?=
 =?utf-8?B?bmEyTDJhZWhHeUpZQWV0VWRyTmtla25pWGlwamd0azF4WnU1aEVQb3dBSGlS?=
 =?utf-8?B?dy9oTDgzR3RIc0FKdStqbWNKdlZBL25uZW4raFBzMTliTXNCOXd0MTFOeGRk?=
 =?utf-8?B?QzNzNjQyNGJTN2ZobjBjTFAxalp3THE2Kys1Wjk4S1hzSmQzNUNjWC9VWW5N?=
 =?utf-8?B?UjIxZ1dYVjgvb0poVkxSQmlTY2tOUzh6NXVKa0hETXJzVW84TnJVa2JOemFU?=
 =?utf-8?B?b00xOUNXcnozTE05NlR4dmZMNk1KdTFuUUdYbmxMaHROQlN5eklVbG9mdi9B?=
 =?utf-8?B?M21FazBhU0x1M01BaFgxT0llZVFseitHY05Gdyt5UzFORFJQTTZCbkp5emdE?=
 =?utf-8?B?RVJwN0ZubHV3TWR2MWdHaVpXNHhjNHQ2WDQ0VjNCSUlBZDFtc29WMlE1L3Y4?=
 =?utf-8?B?MVlaMlpOdlpoU01TSmZXY1l5Tk5lTk85RkF4VkVSeTNvUTlaWTEwYXFJdnlU?=
 =?utf-8?B?Vnc1bVppM1RYcjU1OUI4OEsxdWJyOVQvYk1zTldId2h5c3A4ak5EVWtQTmQw?=
 =?utf-8?B?RytBOEpxem9GSk8zQURleW5Nb1RKVWIxS3N2am9mdWl0S0xlZU1xa3Z3bUpp?=
 =?utf-8?B?bnVkN3hIVFFGWGlMNC9mcmxwZzBBZWEwNUdYMlRvdmNyaVNnQXpMMmJ6SFI5?=
 =?utf-8?B?YXRCdjNxeWh1TkRnSnYwemlkbUpxVUlpc1hheGlJNVd0MlhlemlXUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9E4F943390CCDF4B9BF5C5C9600C99A4@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: shmj7vE7KIz4oe20ZcKzSC+290pobkmWSbWzLHusdrvbhJydrIcXRbpmo38XovH/C0oArINmOdYzWaWmTu45cCl7CCbMTLRoc7ql9/33mrY3Laa6bqGw09qMhuUZA2jv1N8xSxd2V0avQ+ehUlNAV768RqmQGESKhXE4tFxKNYSK0E10eu0to6lr2etwND1xsUo9MkxaDzcfkw8/IT6aSioRR2UebTSOnKLO+sVwMzfZq+FUeJ2+b7spI+pmIcu9tv8Wn7LUCMXZLj4r81KwkGwcbhw1cGLuEDtX/HhCqrXEiyWxTAVqK+CR4Lrp5exgFpXlxCEZTHn2hS1QL4t59g==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR03MB6195.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f0f423b-db47-4553-ffee-08def68cc980
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Aug 2026 03:09:26.8899
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q3J1jPxOP6WlQMpPDtaqiICpY9/gLakuFEDmZBSwOwKdKJZFMJ7Oj21QtCi1GKSzshi87FPxtocpRaEEwa/3tA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB9672
X-MTK: N

T24gTW9uLCAyMDI2LTA3LTIwIGF0IDEyOjE5ICswMjAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiBPbiAyMC8wNy8yMDI2IDA4OjI2LCBLeXJpZSBXdSAo5ZC05pmXKSB3cm90ZToNCj4g
PiBPbiBNb24sIDIwMjYtMDctMjAgYXQgMDc6NDkgKzAyMDAsIEtyenlzenRvZiBLb3psb3dza2kg
d3JvdGU6DQo+ID4gPiBPbiAyMC8wNy8yMDI2IDA3OjQ2LCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiA+ID4gPiBPbiBNb24sIEp1bCAyMCwgMjAyNiBhdCAwOToyMDo1MEFNICswODAwLCBL
eXJpZSBXdSB3cm90ZToNCj4gPiA+ID4gPiBBZGQgdGhlIE1UODE5NiBjb21wYXRpYmxlIHN0cmlu
ZyB0byB0aGUgTWVkaWFUZWsgdmNvZGVjDQo+ID4gPiA+ID4gc3ViZGV2DQo+ID4gPiA+ID4gZGVj
b2RlciBiaW5kaW5nLg0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+IENvbXBhcmVkIHRvIHByZXZpb3Vz
IElDcywgdGhlIE1UODE5NiBzdXBwb3J0cyBhIDEwLWJpdA0KPiA+ID4gPiA+IGRlY29kZXINCj4g
PiA+ID4gPiBhbmQgaGFzIGEgZGVjb2RpbmcgY2FwYWJpbGl0eSBvZiA0S0AxMjBmcHMuIEl0IGFs
c28gc3VwcG9ydHMNCj4gPiA+ID4gPiAzNi1iaXQgRFJBTSBJT1ZBIGFkZHJlc3MgYW5kIFZpZGVv
IFBvd2VyIENvbnRyb2wgdG8gb3B0aW1pemUNCj4gPiA+ID4gPiBiYW5kd2lkdGggYW5kIHZvbHRh
Z2UgdXNhZ2UuDQo+ID4gPiA+IA0KPiA+ID4gPiBQbGVhc2Ugd3JhcCBjb21taXQgbWVzc2FnZSBh
Y2NvcmRpbmcgdG8gTGludXggY29kaW5nIHN0eWxlIC8NCj4gPiA+ID4gc3VibWlzc2lvbg0KPiA+
ID4gPiBwcm9jZXNzIChuZWl0aGVyIHRvbyBlYXJseSBub3Igb3ZlciB0aGUgbGltaXQpOg0KPiA+
ID4gPiBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5j
b20vbGludXgvdjYuNC1yYzEvc291cmNlL0RvY3VtZW50YXRpb24vcHJvY2Vzcy9zdWJtaXR0aW5n
LXBhdGNoZXMucnN0Kkw1OTdfXztJdyEhQ1RSTktBOXdNZzBBUmJ3IWdEamJxMEVaTmtoTFR6dUpN
X3c1UG9wbkRGZWoxbUc0cW5rUkZneW9pVTdEdmhtN3RqM01lRzVlWllOR0EwTDBHXzYxai1jbWRJ
eE9SQSQNCj4gPiA+ID4gwqANCj4gPiA+ID4gDQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gU2lnbmVk
LW9mZi1ieTogS3lyaWUgV3UgPGt5cmllLnd1QG1lZGlhdGVrLmNvbT4NCj4gPiA+ID4gPiBBY2tl
ZC1ieTogTmljb2xhcyBEdWZyZXNuZSA8bmljb2xhcy5kdWZyZXNuZUBjb2xsYWJvcmEuY29tPg0K
PiA+ID4gPiA+IC0tLQ0KPiA+ID4gPiA+IMKgLi4uL2JpbmRpbmdzL21lZGlhL21lZGlhdGVrLHZj
b2RlYy1zdWJkZXYtDQo+ID4gPiA+ID4gZGVjb2Rlci55YW1swqDCoMKgwqDCoMKgwqDCoMKgwqAN
Cj4gPiA+ID4gPiA+IDEgKw0KPiA+ID4gPiA+IMKgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspDQo+ID4gPiA+IA0KPiA+ID4gPiBBY2tlZC1ieTogS3J6eXN6dG9mIEtvemxvd3NraQ0KPiA+
ID4gPiA8a3J6eXN6dG9mLmtvemxvd3NraUBvc3MucXVhbGNvbW0uY29tPg0KPiA+ID4gDQo+ID4g
PiBBY3R1YWxseSBuby4gSSBjaGVja2VkIHByZXZpb3VzIGNvbW1lbnRzIGFuZCB5b3UgcmVjZWl2
ZWQNCj4gPiA+IGZlZWRiYWNrDQo+ID4gPiB3aGljaA0KPiA+ID4geW91IGJhc2ljYWxseSBpZ25v
cmVkLCBzbyBleHBsYWluIHdoeSB0aGlzIG1vZGVsIGhhcyBmbGV4aWJsZQ0KPiA+ID4gbnVtYmVy
DQo+ID4gPiBvZg0KPiA+ID4gY2xvY2tzDQo+ID4gPiANCj4gPiA+IEJlc3QgcmVnYXJkcywNCj4g
PiA+IEtyenlzenRvZg0KPiA+IA0KPiA+IERlYXIgS3J6eXN6dG9mLA0KPiA+IA0KPiA+IEFzIG1l
bnRpb25lZCBpbiB0aGUgcHJldmlvdXMgdmVyc2lvbiBvZiB0aGUgY29tbXVuaWNhdGlvbiwgdGhl
DQo+ID4gaW5mb3JtYXRpb24gcmVnYXJkaW5nIGNsayB3YXMgaW5jb3JyZWN0LCBhbmQgSSBoYXZl
IGNvcnJlY3RlZCBpdCBpbg0KPiA+IHRoaXMgdmVyc2lvbi7CoA0KPiA+IA0KPiA+IFRoYW5rIHlv
dSBmb3IgeW91ciBhdHRlbnRpb24gYW5kIHJlbWluZGVyLg0KPiANCj4gUmVhZCBteSBtZXNzYWdl
IGNhcmVmdWxseSBpbnN0ZWFkIG9mIHJlc3BvbmRpbmcgd2hhdGV2ZXIgbmVjZXNzYXJ5IHRvDQo+
IG1ha2UgbWUgZ28gYXdheS4NCj4gDQo+IE5BSw0KPiANCj4gV2hlcmUgZGlkIHlvdSBleHBsYWlu
IHRoYXQgZGV2aWNlIGhhcyBmbGV4aWJsZSBudW1iZXIgb2YgY2xvY2tzPw0KPiANCj4gQmVzdCBy
ZWdhcmRzLA0KPiBLcnp5c3p0b2YNCg0KSGkgS3J6eXN6dG9mLA0KDQpZb3UgYXJlIHJpZ2h0LCBt
eSBwcmV2aW91cyByZXBseSB3YXMgbm90IHN1ZmZpY2llbnQuIFNvcnJ5IGFib3V0IHRoYXQuDQoN
Ck1UODE5NiBoYXMgYSBmaXhlZCBzZXQgb2YgY2xvY2sgaW5wdXRzOiA5IGNsb2NrcyBmb3IgdGhl
IGRlY29kZXINCmhhcmR3YXJlDQphbmQgMyBjbG9ja3MgZm9yIHRoZSBWQ1AgaW50ZXJmYWNlLiBC
eSAiZmxleGlibGUgbnVtYmVyIG9mIGNsb2NrcyIsDQpJIG1lYW50IHRoYXQgY2xvY2sgY29udHJv
bCBjYW4gYmUgc3BsaXQgYmV0d2VlbiB0aGUga2VybmVsIGRyaXZlcg0KYW5kIFZDUCBmaXJtd2Fy
ZS4gVGhpcyBpcyBhIHNvZnR3YXJlIGltcGxlbWVudGF0aW9uIGRldGFpbCwNCm5vdCBhIGhhcmR3
YXJlIG9yIERUIGJpbmRpbmcgcHJvcGVydHkuIE15IHdvcmRpbmcgd2FzIGluY29ycmVjdC4NCg0K
VGhlIGJpbmRpbmcgc2hvdWxkIG5vdCBpbXBseSB0aGF0IHRoZSBudW1iZXIgb2YgY2xvY2tzIGlz
IGZsZXhpYmxlLg0KSSBoYXZlIHVwZGF0ZWQgdGhlIGNvbW1pdCBtZXNzYWdlIHRvIGNsYXJpZnkg
dGhpcy4NCg0KQmVzdCByZWdhcmRzLA0KS3lyaWUNCg0K
