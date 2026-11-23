Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=210.61.82.184
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795412004;
	b=Lfi1Nqk6zrN/gzXPDuJkaxUQ6v56aQlBsPiHHNGtoxtYFaDB1KzdXIm4BtjTCAZ2ZMmj
	 PmLwKTBg/+4TUFC3GBl1LejXq2L/kc3+6q7yyCsqJgb737OVjwLTeHyT9bexpJW05H4d+
	 V4zf8nTt5Jrh9rvAKBlD1Oq7SLZE/CstKsvhSIBGWFRfZPieeHBb5Ssrb3Xbkct9uebLi
	 Q195mzou2u8KTlCZhBxNUkDU1ps5EiGzxEvzLxeeLog/haD/xWuuQ8QyGyRwKd82le5Ca
	 2AmvwdAbbgfpupfaPdNjlTyWfsGw7cCO+dfW2Jh/Pp4vPs5kJBe07GviHsdS6Ne92pA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795412004;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ld-processed:
	 x-ms-exchange-senderadcheck:x-ms-exchange-antispam-relay:
	 x-microsoft-antispam:x-microsoft-antispam-message-info:
	 x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:Content-ID:
	 Content-Transfer-Encoding:MIME-Version:
	 X-Exchange-RoutingPolicyChecked:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-MTK;
	bh=L+Xo1xs6SKe6m97KJVaSLWpGZpZ6TJiXLNTcYc1aXtQ=;
	b=DMOclAMdeNjlAVdqvqfwK+AX0H9heWjpsHrl4MTdL1naeYsMQQ403zwVIi7daa40Xp8z
	 AWUJKJWo6ty56ZeTDPmCBcN8H+4aKp9oWT7GdbkxoWX0e/cqMPaf5lhnr75/qAevGjxe2
	 j2tEZZOQ9RZ86hzD0ggWvGVdjapwde55p51dcIsqYMwl3O9iTPT7EsxjH9B1BG8RhU3DI
	 5ahdv3TvHItV9MA++r/wzDCk5cxYB5TIqrgDtAiKXxb2PvxTCykmHH4YYEOCXRb1o0JAF
	 NnGe6vpgdbvwDntcsaeOa4ztDrVsX1CvNnVtTLUnOEOODraR1o1medm82PeXdRMDAFA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=UkG+87Rb;
	dkim=pass header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-mediateko365-onmicrosoft-com header.b=pzV78VZP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=210.61.82.184
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED34B606A31A;
	Mon, 23 Nov 2026 05:33:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED34B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=UkG+87Rb;
	dkim=pass (1024-bit key, unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-mediateko365-onmicrosoft-com header.b=pzV78VZP
X-UUID: 625b1d46e6ff11f18dc8c9802ae25ab1-20261123
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=L+Xo1xs6SKe6m97KJVaSLWpGZpZ6TJiXLNTcYc1aXtQ=;
	b=UkG+87RbWJqfB4fOPsLZONn0QjkDsCCFt0vk19sRIWzZEtetSW22v42Kq07yZMas6J8FFgfHyeiYCsbBQcEJV2SCZUrfbGIyWCslqPOWBbXjhA7d+eeZZGcvcIQ99Id2TDe87z8OuK7/4/q8PtAgOIOElQc1+GQIozpGDF2BLi4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:b796325f-6220-4979-b595-66f5ab30019c,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:f2aba966-4b51-4c95-bb1b-80ac6aad9c96,B
	ulkID:nil,BulkQuantity:0,SF:80|81|82|83|102|110|111|836|865|888|898,TC:-5,
	Content:0|15|51|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:n
	il,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 625b1d46e6ff11f18dc8c9802ae25ab1-20261123
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1053918392; Mon, 23 Nov 2026 13:33:16 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.53; Mon, 23 Nov 2026 13:33:15 +0800
Received: from SI4PR04CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.2562.53 via Frontend Transport; Mon, 23 Nov 2026 13:33:15 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gxffqXb10mI1X1r61ItmD5Lj22+nFCBCIL7eQJ0/2A7c8u08V8c67JEWQDPygnIFvynZ6PTMEmRlQieOrZZcpfXszcdBVce+eJM7u1potkq+uF5hbdiPrhXVh/ml2uzFia2jPerQJlH8SX1/e3OBWx1clvoXzouhOCgC9XyDbHHY57Vy5nq6Bo4PiYJ8Sfdw6bDrVqk9JyzfaWRCgPM542MXJ4ueIb7/aayqLzAC4UspoUHtka2TSggKMDkq6Iw53e/ka3KMYvASHZ1hUqQi/OJHwKPuUw1u66W/ZIM9hXFh+73JnNrBVqutQg3lWkDHjmE/aNxBT59cadaJdY3cMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L+Xo1xs6SKe6m97KJVaSLWpGZpZ6TJiXLNTcYc1aXtQ=;
 b=g3Z0wA5PhK34gfNrjHYXuCsj52oDm7svLwtpyk6wxgG02VAK+XQdHrFq2thtm8FCQBZ9RZY74xRnWwKJFFp74NOYxVFRlh3x6zWVIocDyb+sDEKbBe0nyAG0UNngTPT6lxnx1IpWWN08uColF7t+5n4Mkts4eW7X48mtyfdq4Xsf2pGMUqzFx9VPeaTlHZB1gA1LIgWZU06AU0Y4ACuA7XFk1OGgYtv5DVVgm/wXt1aDUBYH/AGcCx26p78uPNnrPIDM2eJM0NIYWfFur10FyEhk7Y3scqBeFrkrG5z91pB3E3L3RsR9rpJ+Zxw9kP2aPL7ATQwUidzPQeup+SLQ1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L+Xo1xs6SKe6m97KJVaSLWpGZpZ6TJiXLNTcYc1aXtQ=;
 b=pzV78VZPp4hkaU5493JhFdcCKrOuN0A2oPtUwF/UBxckcTa/Jw2on9OtsniGPcUH+obGPD6w4JJXtOzdZIeieqzzXaMW2vqlEQEbyoGQKMUOgopWQlLywmqVZUtcCydZTg9MXN0DRp6QhBAxdCi4guiTVXwEkewEjSIEOEUShDk=
Received: from PSAPR03MB6396.apcprd03.prod.outlook.com (2603:1096:301:a3::12)
 by KL1PR03MB8570.apcprd03.prod.outlook.com (2603:1096:820:135::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Mon, 23 Nov
 2026 05:33:11 +0000
Received: from PSAPR03MB6396.apcprd03.prod.outlook.com
 ([fe80::dba:9b76:9fde:3ab1]) by PSAPR03MB6396.apcprd03.prod.outlook.com
 ([fe80::dba:9b76:9fde:3ab1%3]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 05:33:11 +0000
From: =?utf-8?B?S3lyaWUgV3UgKOWQtOaZlyk=?= <Kyrie.Wu@mediatek.com>
To: "krzk@kernel.org" <krzk@kernel.org>
CC: "robh@kernel.org" <robh@kernel.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "nicolas.dufresne@collabora.com"
	<nicolas.dufresne@collabora.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>,
	=?utf-8?B?QmluIExpdSAo5YiY5b2sKQ==?= <bin.liu@mediatek.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "hverkuil@kernel.org"
	<hverkuil@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, =?utf-8?B?SXJ1aSBXYW5nICjnjovnkZ4p?=
	<Irui.Wang@mediatek.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"mchehab@kernel.org" <mchehab@kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "kyrie.wu@mediatek.corp-partner.google.com"
	<kyrie.wu@mediatek.corp-partner.google.com>
Subject: Re: [PATCH v19 10/13] media: dt-bindings: mediatek,jpeg: Add
 mediatek, mt8196-jpgdec compatible
Thread-Topic: [PATCH v19 10/13] media: dt-bindings: mediatek,jpeg: Add
 mediatek, mt8196-jpgdec compatible
Thread-Index: AQHddWqiqJLGTajOCkysI5HLwVexPbc6MbMAgAD7r4A=
Date: Mon, 23 Nov 2026 05:33:11 +0000
Message-ID: <d41c4cbe9c282b428c69abf172ec39b7783053ba.camel@mediatek.com>
References: <20261116013402.1273016-1-kyrie.wu@mediatek.com>
	 <20261116013402.1273016-11-kyrie.wu@mediatek.com>
	 <20261122-pristine-vagabond-coati-f6cfd3@quoll>
In-Reply-To: <20261122-pristine-vagabond-coati-f6cfd3@quoll>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR03MB6396:EE_|KL1PR03MB8570:EE_
x-ms-office365-filtering-correlation-id: 7c13209d-f997-467c-823a-08df4923434d
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|7416014|22082099003|18002099003|6133799003|4143699003|56012099006|11063799006|261102123227099003|261028144727099003|261022105027099003|261026140227099003|261022075727099003|261021121427099003|261026121527099003|38070700021|10067099003;
x-microsoft-antispam-message-info: aV7rzoNHYYUFitqMSgVHZ1UcfESTHaLB8mNBfnyZ6cp7USbz0Zoh3d3CoixdP69x+5OAGfUAQvbzqr9O6BAsMBdSTF4j6VPRhIE4GL3+xnkCnu+gaL2xcJK8apySaKSulvFBB43EhDqs3aYMV4/bxvB/GgiyzqALkGHKXHkPLGdUulc/RcrdKJJGb+W9xTimLlD7WWqCjhfNRQ6idR/AiOohIKcr0+KWyF2H2HU0C5uAF7vTB1JseTIRMOMcNmBiDaSxNmCa5oc5bSSxZZh3Mk+pXi/biYb2YJEmDv9ZrHXJ6PIH8qM/BVrwFjc3VSlyCG35rrOE3of0MvMxR+IlVCHE67Cm2Yw3Ku5m3bWUCTFhPBlgsVqHlY6SHfwy0iuKyvKQefiy3HOuM4Hz+k6vURdE15Jyj2nTwS63E3Bwo/9xtkXKVR624OHjyjnRTBba9HCPAl86tQyWpKbiabtd76MEAGUvMA2njA3SIN+1XRjT/jIOyvQwivpu8D04ikigj91BMHpWNVxyliBpRwG5ibTA6V9Yd8jmbhznQcLyVM2xOLTfNEDQLqCnmj95MMgK0PosqeuOADN2fQ0Ff//E6xKH/I4sF5VR5/4QrpBOXr+SvnkDopg+bnKXF3wblE9hQA1Sh3uUZU4XRZ+NFahJPc/SIsHETghHcFlVPajtu5yGj+jkbaxqodZuub/jp9Iad2PD3LYFhZRyxgqjJy5PiFmps8lB6Uz3CT0Cpyc6i0s=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR03MB6396.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(7416014)(22082099003)(18002099003)(6133799003)(4143699003)(56012099006)(11063799006)(261102123227099003)(261028144727099003)(261022105027099003)(261026140227099003)(261022075727099003)(261021121427099003)(261026121527099003)(38070700021)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TWkwQW50ZTY1N1g3SXQ0VEZWV0p0Q010dFhRZzZTeEMrQzlPUmladnV6YWhQ?=
 =?utf-8?B?Q25zaFNsRkxUUjg2K2orN0NOay9BcjhXajVkb0t0OXZ6d09aanIzcnE1L01u?=
 =?utf-8?B?aDRHbmJkbXNwTkF1VExHZU5XT1Nuam1CS1daaCsxdisvSmhMNWRBODZBNFd3?=
 =?utf-8?B?OFpqUzIzT1BYQTRydTVEeUxEWStsNlVjTkR6NFkyeXlzUkFEcFVHdlo4eVhr?=
 =?utf-8?B?WTEwN05jcFVQWDIyN2tTaHJIZy91QVNrSk1OMndJb29CakZyY2UwcXNNSy9O?=
 =?utf-8?B?UzNiVUdyQWdhWGhPclFjZlZGKzh5L1RmVDhzazRXNDlIUjlsa0tBaTJBTlNJ?=
 =?utf-8?B?WW5COWovamVIditHaUMwZXl5YnhvTThRWG9xQ0JXZHdUc1RwSFpLaXZad3Y1?=
 =?utf-8?B?cmZnRTU0aWdYMk90T3k3eFM1U3NOMW8ySC9sYTlqQmRHZkJEYk9sKzZyZjQ3?=
 =?utf-8?B?N0YxRnJMVHZaem1kdjdscC9JTE02Q0EvWUxVcjYxU09TaVB1ZUtTYVNndFdH?=
 =?utf-8?B?MFArRmw0dWl2dHhtMTRhWlNuVGpKVU0wT3ZUUmhqTUJKaWVSbEtjaVNDY3NT?=
 =?utf-8?B?Q0wrVHFTOU9adkhLb1N0S01XNTFxNkdZdHdadW05SWtSMzR3dVVoWEhXZFFv?=
 =?utf-8?B?bjlEbFE3cmgrcTF3czE4M20rVmRZV1FjU3J3dXhHaDNackt1WUJlaHZwNmJT?=
 =?utf-8?B?NmpKbWM3M3lxb3FHUEovaHRETldxeThtQU1WMlZUWm1yMUY4eEJJUk5FTUxa?=
 =?utf-8?B?cHJITlJjbkYxRVBRaE1GR3Y4MEp5UFRVOG5xNU5uU3JMeE9uZW0veGlmUnBU?=
 =?utf-8?B?QnJMMjBCOU1IWVNoVjBwcVVLVmxOMlZ6VEpkY0I3cWllQkRpQ000blREZTFr?=
 =?utf-8?B?OWhZRHoxSmo1ZDhVdXdFclpjNDVONUFScEZmQW9OS3BuYm8yakxVSlFGQ3gx?=
 =?utf-8?B?Z2sxbHVwcEVVSjVFNE03RVArdSs1SHNBbWxxUHV4Rmt5dC9OaGVWaXltUEZa?=
 =?utf-8?B?R0F5dEhySi9EQkhIdGovdFpieUpxOGgveUtNbVpMb01TeXQ1bk5QcittWWMr?=
 =?utf-8?B?SDRPbnE1ejBsZmYvZnRqUVlISlhUSkZHUVp4SEVOclF1MHFac1UyNENHR2Er?=
 =?utf-8?B?cHRDSWhaMGJTQkV6MWQxeEd6dHlUdk8zWGx2SVkwM1M5M1VPV0lneXlrVVBT?=
 =?utf-8?B?T3NvS05JbHM1clk4UnJIMFNPWHgycGRYdloxbU5lYnFaejhOcjV0YStBM1g5?=
 =?utf-8?B?MVY5eG9hYjhOemRUd05FUEtvOGhTK3E1bGRMSWFSVys1Ri92ZC9VSzBiRGFP?=
 =?utf-8?B?R1k5aUlTUkVuVHZSSFYrdnI2dHNSbnVlYXFwYXlpcElSMFRhN1kxT293VW1N?=
 =?utf-8?B?cWxwZUFkYTlTdG91WHhhNytWUEZHU3daWEM0ajJtdGIyRXFKZjJ2V1B4aEcy?=
 =?utf-8?B?WFoxTUE1NXVBbHlyWGpFRUZvUFVwd1JXQVZEanpFSVhFMExoNFFaeUtydFVR?=
 =?utf-8?B?a1lvK2RtZkw4MzZubGFOWVgxY09WTSttNmhuMEF3RzZMQXJsWm9pZUZiSVVT?=
 =?utf-8?B?VnN6NjRGbnhRNmtoSlZGV2NNSXRSL016Zm94cGUzTDJaRmZWL1lyOE1pSmx6?=
 =?utf-8?B?aUxhTFJrR1dOWVRvNzE1cmw2V1pMY3FVTXVFdEVrc29BU3F2cVlvTTVNQUZ5?=
 =?utf-8?B?RXlRZFR5TzlOZnRYM0k5KzRuT1YwalBXcEcveHpPeTdFWE04N09jQUtra2xD?=
 =?utf-8?B?UkJwenJCVW9QSk15UGRXdXBhSkUxSW9sWXhGcThTNldnOHZYQUViQUtHaldW?=
 =?utf-8?B?MkFSblN1am8xSTYwWnFTNnBMRzJGV0Jic3RhemNidDlhaTRBS3p3eUM1VWhD?=
 =?utf-8?B?VG9NcFNZcUxSTDdvbHFmQVdzaWVzbDg2eSswYnpBclZJTzB4QmV0anc0MnlQ?=
 =?utf-8?B?SThWK3RqeWNJdGVKR1ltZGEvUVhJTXV3YU81K0VMdVo5bVV4MVpRWnBjMGpW?=
 =?utf-8?B?anBvL21VNUM0dUtIMGpTOGVFbXZsMHFNeHdqeDRjdGtic2FxQXpRMXB6Y2ZS?=
 =?utf-8?B?NjljZy8vNVY5R0FRTU9FTlVaaDBFZHk1L2dFU21LWm4yNEhXdDJhQ3RRSDRS?=
 =?utf-8?B?YVFkZXFpd09kUUptem9rdTRGZEoyaTBxRzYxNVFrK3lRb3NnOUQyclduQity?=
 =?utf-8?B?YXhYYUNlWWlUSytpdERiTjJCcWRqUGtZVS9sUEZ0TWpMUGE5M1BNcHFwVTdK?=
 =?utf-8?B?UU5Dd1Bma1R4c0UwRVhHVWFZd1VaYTNZMG5Qa3lzZ3RkcHEweUx0MGJxazR1?=
 =?utf-8?B?UmJBdUlSSHpidmxwamVQWEl4YU1VbnJsTnFQdnF3cWZtUGI2eFpRZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B3606581A726DC479BEA09FDA5C011E1@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: gg50y596H9W/0fiYEY4tb3vaYL8J9fKbUj6T1kJoxYWvpnlJ5g96VSQVXVHnWIg7RlKPMYFYxpKnupi7iWthW6S084nY8MCw5mjr4leHiXGVgkL6HHueyduAI7TOFUMMxZofTLfW2Zk15rWGXMBFIiHOyOiZWvhiAc5I7Zp0gqQ4lS3erXYR67N6+X4HE/DvG3kavufut73r2sS046GkLcKHrIY05nAsos6/zfZ51Th7csqTuV/67hjtfMXGn/7Cq/nE6t9oh30UIkJLdzjCWqUgq6E3GVyj7wKOXGF6PUAFKizPx7K7afRqtwtTSC73AfikD0/TbuvwtDMlQt4JLg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR03MB6396.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c13209d-f997-467c-823a-08df4923434d
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Nov 2026 05:33:11.1470
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5PRZjjk8xxsRMXVhJCytH3S8QWxxfG4d8Ts2jVBzieCUYR0b8givGIzdASLrV+z9ubKvGplAJ1EI+KyaJ85BGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB8570
X-MTK: N

T24g5pelLCAyMDI2LTExLTIyIGF0IDE1OjMyICswMTAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiBPbiBNb24sIE5vdiAxNiwgMjAyNiBhdCAwOTozMzozNUFNICswODAwLCBLeXJpZSBX
dSB3cm90ZToNCj4gPiBBZGQgdGhlIE1UODE5NiBKUEVHIGRlY29kZXIgYW5kIGRlY29kZXItY29y
ZSBjb21wYXRpYmxlIHN0cmluZ3MuDQo+ID4gRGVzY3JpYmUgdGhlIGNoaWxkIG1lZGlhdGVrLHNt
bXUtY29uZmlnIHBoYW5kbGUgdG8gdGhlIGRlZGljYXRlZA0KPiA+IEpQRUcNCj4gPiBTTU1VIGNv
bmZpZ3VyYXRpb24gc3lzY29uIGFuZCByZXF1aXJlIGl0IGZvciBNVDgxOTYgZGVjb2RlciBjb3Jl
cywNCj4gPiBzbw0KPiA+IHRoZSBjb21wYXRpYmxlIGFuZCBpdHMgaGFyZHdhcmUgcmVxdWlyZW1l
bnRzIGFyZSBpbnRyb2R1Y2VkDQo+ID4gdG9nZXRoZXIuDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1i
eTogS3lyaWUgV3UgPGt5cmllLnd1QG1lZGlhdGVrLmNvbT4NCj4gPiAtLS0NCj4gDQo+IFRoaXMg
d2FzIHJldmlld2VkIGFuZCB5b3VyIGNvdmVyIGxldHRlciBpcyB2YWd1ZSBhYm91dCB0YWcgcmVt
b3ZhbC4NCj4gDQo+IEFkZGluZyBuZXcgcHJvcGVydGllcyBhdCB2MTkgaXMgbW9yZSB0aGFuIHVu
ZXhwZWN0ZWQuIEhvbmVzdGx5LCB0aGlzDQo+IHNob3VsZCBub3QgaGFwcGVuLg0KPiANCj4gSSBk
cm9wIHRoZSBwYXRjaHNldCBmcm9tIERUIHBhdGNod29yay4NCj4gDQo+IEJlc3QgcmVnYXJkcywN
Cj4gS3J6eXN6dG9mDQo+IA0KSGkgS3J6eXN6dG9mLA0KDQpJIGFwb2xvZ2l6ZSBmb3IgY2hhbmdp
bmcgdGhlIHNjb3BlIG9mIHRoZSBwcmV2aW91c2x5IHJldmlld2VkIERUDQpwYXRjaGVzIGF0IHYx
OSBhbmQgZm9yIHRoZSB2YWd1ZSBleHBsYW5hdGlvbiBvZiB0aGUgdGFnIHJlbW92YWwuDQoNCkkg
Zm9sZGVkIHRoZSBTTU1VIHByb3BlcnR5IGNoYW5nZXMgaW50byB0aGUgcmV2aWV3ZWQgZGVjb2Rl
ciBhbmQNCmVuY29kZXIgY29tcGF0aWJsZSBwYXRjaGVzIGFuZCByZW1vdmVkIHRoZWlyIFJldmll
d2VkLWJ5IHRhZ3MuDQpJIHNob3VsZCBoYXZlIGtlcHQgdGhlIHJldmlld2VkIGNoYW5nZXMgc2Vw
YXJhdGUgYW5kIGV4cGxpY2l0bHkNCmRvY3VtZW50ZWQgd2hpY2ggdGFncyB3ZXJlcmVtb3ZlZCBh
bmQgd2h5LiBUaGlzIHdhcyBteSBtaXN0YWtlLg0KDQpGb3IgdGhlIG5leHQgcmV2aXNpb24sIEkg
d2lsbDoNClJlc3RvcmUgdGhlIGNvbXBhdGlibGUtb25seSBwYXRjaGVzIHRvIHRoZWlyIHByZXZp
b3VzbHkgcmV2aWV3ZWQgZm9ybSwNCnJldGFpbmluZyB0aGUgYXBwbGljYWJsZSBSZXZpZXdlZC1i
eSB0YWdzLg0KU3VibWl0IHRoZSBTTU1VIHN5c2NvbiBhbmQgcHJvcGVydHkgY2hhbmdlcyBzZXBh
cmF0ZWx5IGZvciBmcmVzaCBEVA0KcmV2aWV3Lg0KQ2xlYXJseSBkb2N1bWVudCB0aGUgY2hhbmdl
cyBhbmQgYW55IHRhZyByZW1vdmFsIGluIHRoZSBpbmRpdmlkdWFsDQpwYXRjaCBjaGFuZ2Vsb2dz
IGFuZCBjb3ZlciBsZXR0ZXIuDQoNCkkgd2lsbCByZXNvbHZlIHRoZSBEVCBiaW5kaW5nIHJldmll
dyBiZWZvcmUgcmVwb3N0aW5nIHRoZSBjb21iaW5lZA0Kc2VyaWVzLg0KSSBhbSBzb3JyeSBmb3Ig
dGhlIHVubmVjZXNzYXJ5IHJldmlldyB3b3JrIHRoaXMgY2F1c2VkLg0KDQpCZXN0IHJlZ2FyZHMs
DQpLeXJpZQ0K
