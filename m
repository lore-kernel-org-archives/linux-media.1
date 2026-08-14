Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA6153D648C;
	Fri, 14 Aug 2026 01:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786672630; cv=fail; b=ifxwiuMl3lqhe2XFGP3iXqryd5m3PuAFM1YRs1eoqZi/8dDe4E253DbkVly4JC5wwM9RceAl3hSFPwr8mN2znjV6HpwtAG0NLiEXEWsjp+ZyE7R2YtVNW/CFja46rC0Kf/1ujvv/e047RcaRuSYkSe/S7WpN2yWoYau25c3MOUw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786672630; c=relaxed/simple;
	bh=TYoc7hJP7KBwJ1fapK45YJAHzyVQMoa0REwvurIbnSc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ONShBcZZDQciNlQ6s+VM7J+Q9YMjkDSL7QrDAz1dSUEr09ef7o3vJbC1z9RiLi1IGScMES2UE+zuXLmwRDwLM0QX+56MrsouwraWOVtxITwKJt4X6Vndnf+ULwzVxF+LockMWsnbLQrq6Os9w7UQLEJrVFXRAgJflKK+3DHU3oc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=kUTBSUH7; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=qLEcTfN9; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="kUTBSUH7";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="qLEcTfN9"
X-UUID: 6c507cc2978311f1b1788b6acf885367-20260814
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=TYoc7hJP7KBwJ1fapK45YJAHzyVQMoa0REwvurIbnSc=;
	b=kUTBSUH7vd7MCFioVz0QbpuU3k7jDC3ZRIdKKTSmfFm8Z/K4GdL8SymIxswyhIjfy+FqApUH0dsbJ/Qo77WFFvyE+1NhOgE+0+lszYed52QIoRBdNeVoa7ropIyOowP/aNW/Kcwidhi+Cp91JN5YrrYJdC3ulDxxGdkf9YEAMIQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:ca518e4c-9bac-4078-aacf-7b12b2c60834,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:f80875e2-71f1-405e-92eb-6802d6af74fd,B
	ulkID:nil,BulkQuantity:0,SF:80|81|82|83|102|110|111|836|865|888|898,TC:-5,
	Content:0|15|50|99,EDM:-3,IP:nil,URL:99|80|1,File:130,RT:0,Bulk:nil,QS:nil
	,BEC:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 6c507cc2978311f1b1788b6acf885367-20260814
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 138093927; Fri, 14 Aug 2026 09:56:53 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 14 Aug 2026 09:56:52 +0800
Received: from SG2PR04CU009.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 14 Aug 2026 09:56:52 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EnnVH3R/hvvb8+yl0shfGVF99i9+z+UZQ7YW9SK6RHIE2x03iH3PQPrUjUU+JmEw/6zJZmNGKBR37zMlnGowBXX0UKgayC0DkmghLcowEo3yVLDo2qtzBy4o/oXw/Wj5BA0EJVdwC7R53IY8T8xCU3KGq5KBmkeTdtHSvHv7NdHO+CkC+QLc25sBTL0aDpJ2OZHd1PS7dszsA62hSZ7vU1QCDStUcHh7kt4pr9Uqpo7ZItqO8baRHHJys2aqH4FVeWiMwo8sM6ESpNhxXwmJcI1FiNQ8VNWaiArdn4T7ttREoOOejXsZ30qcaTnfhsSI4/j0QEyvjd3uU1V1Np20ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TYoc7hJP7KBwJ1fapK45YJAHzyVQMoa0REwvurIbnSc=;
 b=yhYpckdedrRBi/vOgWuJV3eCcoWK6u1W2G4+GrGmQ2PYvZRqDPDx0tgXWeS4l4cUbYzy++vvQVLNybDfCyOUFsL0a4u3tx0H4uLGkDeJdVociT70Q21zRCDBngyzWeGfYAIikeK/maabQAkYIMbnH42QdMcuw5sBuaHh4aVvv9uBbrl5NPBg0qL6NaGK8I1gKmOfEmghD5yjJXqiMJFo1xyimihSBbZwo/7vIpLqK2Og6I7S6bGmZfnfdwZwELeHbzwvaqiDz33Y/dssSbW9IlvcPQlPUDkz8+8fXXVxQqwZlaMVgcheQMeVZatEWuNYTj4iruaBFsou5Dx3lzjSSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TYoc7hJP7KBwJ1fapK45YJAHzyVQMoa0REwvurIbnSc=;
 b=qLEcTfN9jgVHNDbhm9jDalfDFSOhxr/h3T60XPCh+X72E7aWthZbelSchjTyUhFzgMfnvrSS7eJ6eKKrDW/FbBl06VYwqOTHRbXr3Lz95TCUEMJz+lGHn+n52IgzcHlmJjG2B9EJ32ZErXnGGTATvan5dN+WqaQpCdbj/3Ddt+4=
Received: from KL1PR03MB6197.apcprd03.prod.outlook.com (2603:1096:820:90::5)
 by KUZPR03MB9638.apcprd03.prod.outlook.com (2603:1096:d10:64::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.13; Fri, 14 Aug
 2026 01:56:39 +0000
Received: from KL1PR03MB6197.apcprd03.prod.outlook.com
 ([fe80::6c6:8246:f9fa:d89d]) by KL1PR03MB6197.apcprd03.prod.outlook.com
 ([fe80::6c6:8246:f9fa:d89d%5]) with mapi id 15.21.0315.012; Fri, 14 Aug 2026
 01:56:39 +0000
From: =?utf-8?B?S3lyaWUgV3UgKOWQtOaZlyk=?= <Kyrie.Wu@mediatek.com>
To: "krzk@kernel.org" <krzk@kernel.org>
CC: "fshao@chromium.org" <fshao@chromium.org>,
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
	"benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>,
	=?utf-8?B?SXJ1aSBXYW5nICjnjovnkZ4p?= <Irui.Wang@mediatek.com>,
	=?utf-8?B?S3lyaWUgV3UgKOWQtOaZlyk=?= <Kyrie.Wu@mediatek.com>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	=?utf-8?B?VGlmZmFueSBMaW4gKOael+aFp+ePiik=?= <tiffany.lin@mediatek.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "rongqianfeng@vivo.com"
	<rongqianfeng@vivo.com>, "mchehab@kernel.org" <mchehab@kernel.org>,
	"sebastian.fricke@collabora.com" <sebastian.fricke@collabora.com>,
	"robh@kernel.org" <robh@kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	"laurent.pinchart+renesas@ideasonboard.com"
	<laurent.pinchart+renesas@ideasonboard.com>, "hverkuil+cisco@kernel.org"
	<hverkuil+cisco@kernel.org>, "nicolas.dufresne@collabora.com"
	<nicolas.dufresne@collabora.com>
Subject: Re: [PATCH v6 08/14] dt-bindings: media: mediatek: vcodec: add
 decoder dt-bindings for mt8196
Thread-Topic: [PATCH v6 08/14] dt-bindings: media: mediatek: vcodec: add
 decoder dt-bindings for mt8196
Thread-Index: AQHdF+ZCyChClad61Eelw4Pditpo87Z15nYAgAAAywCAAAm5AIAAQdgAgCCIo4CAADifAIAF/EaA
Importance: high
X-Priority: 1
Date: Fri, 14 Aug 2026 01:56:39 +0000
Message-ID: <56933a0efc37485b2513d2a14b2e9d273f245d02.camel@mediatek.com>
References: <20260720012056.1026551-1-kyrie.wu@mediatek.com>
	 <20260720012056.1026551-9-kyrie.wu@mediatek.com>
	 <20260720-gregarious-satisfied-shrew-f71cba@quoll>
	 <f499f2c3-f31d-4c2c-84fb-d1d9d95fc868@kernel.org>
	 <a9123dce5ae7ef184f5640b12e3e9427084ec542.camel@mediatek.com>
	 <8558035b-d825-4e56-bfd2-551cff51f73f@kernel.org>
	 <2b567b39434d7d125dcdca75e198a1442e4c2f22.camel@mediatek.com>
	 <8d924236-5a1f-4cd6-a7a6-d12b1bed5615@kernel.org>
In-Reply-To: <8d924236-5a1f-4cd6-a7a6-d12b1bed5615@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR03MB6197:EE_|KUZPR03MB9638:EE_
x-ms-office365-filtering-correlation-id: 4aef6133-aa92-4a7d-518b-08def9a747bf
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024|23010399003|22082099003|18002099003|38070700021|11063799006|4143699003|56012099006|10067099003|3023799007|4133799003;
x-microsoft-antispam-message-info: sx1fHbZxPmGi8n3AfRoyX+qGBmNDL9PpqtbLJ4MGCAXdt7KZ2q+JJJLGTBlG+nkq/+fAS9OJW69GFpkF/xz3Tk91kDng8qErUtIW2k20/bjwsNspsM2GqDHzY33M7Wm04ofF7LE4POJ/+m754+cJb4EOcSkBsw4heqRLagz45RUQqN5J7e0MPB+PcenA4aeIKbLGb1717JeUQ4PWB5LHUL//X/ZVIgFQnNWLNi5uxl1JHJNTO7Ek/SGEnw17gYI5eXs1StduCMGIuDomRb6uNrw+dquy8ibB1wu1itUDNRZ9x7hQapkC9bpdUzmThVqYo5nftIdHOAYF6GlCbgFqPG5QFXzsr2GuAuWXysCV/Y9ZLVOrSLKFrNTxJQFSSUBLxZRCklpz8r7x0rZQi6EK/mDYrt60sdMpoCL8TKkySqCcrzm2PjnJlWgwQpO4+Ucr6iJgcI99a78D05NRL2QPOvrz69qVD4ktepZh6R6WT3dOmWE6VxGbU5ETbIt8ih3KW/EmodSDiigwQSlX9IECstp76dSGpA9aR/EUEN3364HWgnxtZFoEpfwCdrkSoSL7Muep2JXWe8Nmv7pfhHyss80NmlPz5PDLuvflNRhykNYPz6CmWrt+TVW0qbnPDgaEbD53hsGijG27YVuiOU/m0tg/NREBSNK0e8z3VJT2TcU=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB6197.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(23010399003)(22082099003)(18002099003)(38070700021)(11063799006)(4143699003)(56012099006)(10067099003)(3023799007)(4133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d1QyWjVSc2NDZDBza3hYeVA2aEpSbllZR2hpWGlYb2dLNkF3WE1taTdmOXJO?=
 =?utf-8?B?WTc5M052SlgrSS9HQ2RwYWk4alI5Y1NOWEJtMHc3dHhGY2ltQVdwb0ptbTNn?=
 =?utf-8?B?RjJFcHBWeTd0ZzRvSVZqL0t1SzRmNk5hWVgrRDNkWjhaaXB5a2JsYlptV3do?=
 =?utf-8?B?U0lsSks2d2pkZ1Rub3hSeHp5Znh4UjhIU3lOK3R6WHNXRnNCWW1IUzZZait5?=
 =?utf-8?B?YVkzejhNcHdwR0gvekhBR0RsdGpYMitJcmhGYzVMeVMrSENoZHhNVnlRUnJs?=
 =?utf-8?B?Qm9aUnA1OFQyWE1RYUJibllMT2hiUGdXTXVnZGRwUnJZNGxxZy9yLzNGY1kw?=
 =?utf-8?B?OTlMbDE4czZhYTFBU2k0VThkVnRHejBTRXlmdVBoaFpnSVo5bU5ZYlN4SDNI?=
 =?utf-8?B?ekppb2F2VGdCTE92VElDd3lVdVU2bGFNc1BidGxwVmRKWDR1QWgxc1RCeWIz?=
 =?utf-8?B?RlB4RCt6a3hicWxub2hsY0g2Qk4zdEh5c2ZwZm4rTTlEcUp3MmxzRlJjdWZr?=
 =?utf-8?B?MXBMY1VnSDlqdGl2cXlNSHZzdTkvT3ViWHdvTDRmQ0ROdHFWN2F6djZYRW5Z?=
 =?utf-8?B?QjlHTHhVdXk2SmI3ZUp3T2NXcnpVTFJvNXN6Nll5ZXliYy9wMURFcVRCd21m?=
 =?utf-8?B?akRJVGJSa29peUZ3MGFCc3c4VXg5clRVaHU0cUlNbjFiZ0pKMVoxWlc1K095?=
 =?utf-8?B?encyYVhtTUlDdmhBR0NuQzhlNlN0VXNQZEROcDRRMGhaUnFxc1pxSnlLTGpU?=
 =?utf-8?B?cUZMWUl1bEhRVitMUUE0aVFIVmZqOGV3ek5Ld3hrVGNrNUJvNmlLYTZVcThO?=
 =?utf-8?B?WDBiNmpHTnVHV3QzY2tVaXdrVEJ4RlR0TUJBUXJjNURpZktGeHJ5RjJmSnFB?=
 =?utf-8?B?VlNxb3RnSS9tUjNyM09TRThLTjdMeFBhSHMrWWN6RkN4ZTBOTGhiTkVrbWQx?=
 =?utf-8?B?MWozSy9TNGsyQXBrUVhLWFB2VHBLbmxTYkU4eERyKy84Wlh6bDhaczFXalVN?=
 =?utf-8?B?TzJYSDFOaVdrSW5XQzI0SUlER2R5L1ZQSDdvdnpEQkRiMzk0WXR6cmdDczJI?=
 =?utf-8?B?UHBUK1dtK1drT1FlcHZMVnFobnhwQmN4MDE0V3NDRXpPL3BhbmRzdTJJQ1Fj?=
 =?utf-8?B?RGRRWmg2Wlg5REFja25pdjlpWkRvRFQwcm9DVGFyek04SGYyYUZqQmthMTQ0?=
 =?utf-8?B?dW1sZjFCWVZnNTd6Y1pCWFhWZzNEc1F2SUxKcGRUR2U2NnM5K0ZuejdjK0Yw?=
 =?utf-8?B?NTAyc3lBOG1ra1pLUVZkV2hOR3JoQURtM09uL2VYWDI2YXhKTjIyYkJIaWpY?=
 =?utf-8?B?MjBkRnl0ZUNjdFo0U2pVZjBKdUllc1ZWSGVid25OeXNSWUFkdWdjQmp6aGE3?=
 =?utf-8?B?MFUxZkdTeEc0anJ4bW1RMjBkYkE3V0EvcThxUGZUSVZnUVZMU2Y4dEt6Y3ZG?=
 =?utf-8?B?aXJtWHhxYVdrSEp0Yzg3OWMvQ2UyZUduYUJVdFdEbDA3eDJEZ3Q1YnczeTN1?=
 =?utf-8?B?YlE2WHZ1WDZsS3RkTlhuZmJ4c1BjMHhFRWxSNTdaK3FIVUNHbXk2dHhySVhq?=
 =?utf-8?B?R2xibWJIUmt4RTNPVnM0UWFiSUVUTlpQaElDMGJZQnZmYURPRTAyOWNQWEtq?=
 =?utf-8?B?U2d6RTZCdGVKTzljVTE3Nk8xa3Y2OUlRaUZXWGJQdldWSE13WW1KSm1aNUw3?=
 =?utf-8?B?QWZlNjBUaUJGeEZTdmxwTTR6OEU2QVM0a2tOWUNqeGxGTDZ4K2hpMFRXa2hq?=
 =?utf-8?B?L3lUTC9VaVp4YnlRVlViZWxhZkpEOG1Vd0p3R2hycEpMYXdZQUFRL2JLajgv?=
 =?utf-8?B?K0VOK1ZJTlRiMWcwcGpHU2l3L1Y3cHhPajFZcHZKQUhKdzcrQllXcjROZHA3?=
 =?utf-8?B?NjVtQytpSkZmRWQ4aGx6dm1VZUQ1T0lmU2tOT3JRSHYySEtsQWxzMzBmRjlY?=
 =?utf-8?B?WmRzbVc3OHVkQkV6K3BNYnhCTld6dlRVQVZROEJLR09FcDhIYnNzWFB3cnYz?=
 =?utf-8?B?NTVnK081ZjVFaHJveGRSMEpEU0U1RTVQYkpkM2h3bVpGYU5vRWR6QTVXRHhS?=
 =?utf-8?B?eG1lYVF6NC96UWJxWEF1U1VGMHZlSWZDVzZXd0pkK0pMNzFnLytmWG1FMC9v?=
 =?utf-8?B?ZTBEek5pVFBRQ0RkMTlHMkdXQWlaWFQ4bzV5Qm9WbnJVQWhIK2tpQ2NRZ0Jl?=
 =?utf-8?B?TllnalVHZUJFZGswazByVk1vc1RMT1FOb1FqN21FenEwcitvNms4ekpCMUpy?=
 =?utf-8?B?cGxEdGVuY2I5RW1wakRPQ0kvZ1g3anBLQWFQenYxZ01yYzE3U05wMWtWaWls?=
 =?utf-8?B?aFZDU3cvaGVwYlZDMlhqQjM2WHJtaE5hemJrTjdkYmpFcldGdVJ2QT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5A4410C909512B438890F689AA9433AA@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: ra06Vj6azIpEcchnm3OJUUbEosUnl8pZSlhrPa8sPrV8Z/OzN3ckzFFXZvdxyNksyDstAyXBYvQ1j/xdQLoGO3WMS+pGS434cW3HS8Wz1+/bIPof8S+P9p0u/2xJkE2Y26EV5OIKdqCSqc3r/N8q0xlwNw5YB+DmXODVIFEZaacywZv4sD/DN/6RxpzK558Ew7xBzEq1Bp3VhuBeuV31MykL3lg/ZHEOpDoTSGBRV3pGJqwHU7Ir1cBfcjYIr2M1Ud+53PBeTSyBlD/2KAGWm5d6WqVzrnSXOilb67Uldhwix8jibD2su7+KZqiSe9s6EeX3C4rpjrjT8e1GZe6xWQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB6197.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4aef6133-aa92-4a7d-518b-08def9a747bf
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2026 01:56:39.1516
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nI1CQ/I64Ly41oX2xv8H1B99qCjOaMDqUusegCLRDPI133oDH3luA1czSznadhgyvwKp+mF+KAa0iI6IZzVoIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUZPR03MB9638
X-MTK: N

T24gTW9uLCAyMDI2LTA4LTEwIGF0IDA4OjMxICswMjAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiBPbiAxMC8wOC8yMDI2IDA1OjA5LCBLeXJpZSBXdSAo5ZC05pmXKSB3cm90ZToNCj4g
PiBPbiBNb24sIDIwMjYtMDctMjAgYXQgMTI6MTkgKzAyMDAsIEtyenlzenRvZiBLb3psb3dza2kg
d3JvdGU6DQo+ID4gPiBPbiAyMC8wNy8yMDI2IDA4OjI2LCBLeXJpZSBXdSAo5ZC05pmXKSB3cm90
ZToNCj4gPiA+ID4gT24gTW9uLCAyMDI2LTA3LTIwIGF0IDA3OjQ5ICswMjAwLCBLcnp5c3p0b2Yg
S296bG93c2tpIHdyb3RlOg0KPiA+ID4gPiA+IE9uIDIwLzA3LzIwMjYgMDc6NDYsIEtyenlzenRv
ZiBLb3psb3dza2kgd3JvdGU6DQo+ID4gPiA+ID4gPiBPbiBNb24sIEp1bCAyMCwgMjAyNiBhdCAw
OToyMDo1MEFNICswODAwLCBLeXJpZSBXdSB3cm90ZToNCj4gPiA+ID4gPiA+ID4gQWRkIHRoZSBN
VDgxOTYgY29tcGF0aWJsZSBzdHJpbmcgdG8gdGhlIE1lZGlhVGVrIHZjb2RlYw0KPiA+ID4gPiA+
ID4gPiBzdWJkZXYNCj4gPiA+ID4gPiA+ID4gZGVjb2RlciBiaW5kaW5nLg0KPiA+ID4gPiA+ID4g
PiANCj4gPiA+ID4gPiA+ID4gQ29tcGFyZWQgdG8gcHJldmlvdXMgSUNzLCB0aGUgTVQ4MTk2IHN1
cHBvcnRzIGEgMTAtYml0DQo+ID4gPiA+ID4gPiA+IGRlY29kZXINCj4gPiA+ID4gPiA+ID4gYW5k
IGhhcyBhIGRlY29kaW5nIGNhcGFiaWxpdHkgb2YgNEtAMTIwZnBzLiBJdCBhbHNvDQo+ID4gPiA+
ID4gPiA+IHN1cHBvcnRzDQo+ID4gPiA+ID4gPiA+IDM2LWJpdCBEUkFNIElPVkEgYWRkcmVzcyBh
bmQgVmlkZW8gUG93ZXIgQ29udHJvbCB0bw0KPiA+ID4gPiA+ID4gPiBvcHRpbWl6ZQ0KPiA+ID4g
PiA+ID4gPiBiYW5kd2lkdGggYW5kIHZvbHRhZ2UgdXNhZ2UuDQo+ID4gPiA+ID4gPiANCj4gPiA+
ID4gPiA+IFBsZWFzZSB3cmFwIGNvbW1pdCBtZXNzYWdlIGFjY29yZGluZyB0byBMaW51eCBjb2Rp
bmcgc3R5bGUNCj4gPiA+ID4gPiA+IC8NCj4gPiA+ID4gPiA+IHN1Ym1pc3Npb24NCj4gPiA+ID4g
PiA+IHByb2Nlc3MgKG5laXRoZXIgdG9vIGVhcmx5IG5vciBvdmVyIHRoZSBsaW1pdCk6DQo+ID4g
PiA+ID4gPiBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly9lbGl4aXIuYm9vdGxp
bi5jb20vbGludXgvdjYuNC1yYzEvc291cmNlL0RvY3VtZW50YXRpb24vcHJvY2Vzcy9zdWJtaXR0
aW5nLXBhdGNoZXMucnN0Kkw1OTdfXztJdyEhQ1RSTktBOXdNZzBBUmJ3IWdEamJxMEVaTmtoTFR6
dUpNX3c1UG9wbkRGZWoxbUc0cW5rUkZneW9pVTdEdmhtN3RqM01lRzVlWllOR0EwTDBHXzYxai1j
bWRJeE9SQSQNCj4gPiA+ID4gPiA+IMKgDQo+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+ID4gDQo+
ID4gPiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEt5cmllIFd1IDxreXJpZS53dUBtZWRpYXRlay5j
b20+DQo+ID4gPiA+ID4gPiA+IEFja2VkLWJ5OiBOaWNvbGFzIER1ZnJlc25lDQo+ID4gPiA+ID4g
PiA+IDxuaWNvbGFzLmR1ZnJlc25lQGNvbGxhYm9yYS5jb20+DQo+ID4gPiA+ID4gPiA+IC0tLQ0K
PiA+ID4gPiA+ID4gPiDCoC4uLi9iaW5kaW5ncy9tZWRpYS9tZWRpYXRlayx2Y29kZWMtc3ViZGV2
LQ0KPiA+ID4gPiA+ID4gPiBkZWNvZGVyLnlhbWzCoMKgwqDCoMKgwqDCoMKgwqDCoA0KPiA+ID4g
PiA+ID4gPiA+IDEgKw0KPiA+ID4gPiA+ID4gPiDCoDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKQ0KPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiBBY2tlZC1ieTogS3J6eXN6dG9mIEtvemxv
d3NraQ0KPiA+ID4gPiA+ID4gPGtyenlzenRvZi5rb3psb3dza2lAb3NzLnF1YWxjb21tLmNvbT4N
Cj4gPiA+ID4gPiANCj4gPiA+ID4gPiBBY3R1YWxseSBuby4gSSBjaGVja2VkIHByZXZpb3VzIGNv
bW1lbnRzIGFuZCB5b3UgcmVjZWl2ZWQNCj4gPiA+ID4gPiBmZWVkYmFjaw0KPiA+ID4gPiA+IHdo
aWNoDQo+ID4gPiA+ID4geW91IGJhc2ljYWxseSBpZ25vcmVkLCBzbyBleHBsYWluIHdoeSB0aGlz
IG1vZGVsIGhhcyBmbGV4aWJsZQ0KPiA+ID4gPiA+IG51bWJlcg0KPiA+ID4gPiA+IG9mDQo+ID4g
PiA+ID4gY2xvY2tzDQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gQmVzdCByZWdhcmRzLA0KPiA+ID4g
PiA+IEtyenlzenRvZg0KPiA+ID4gPiANCj4gPiA+ID4gRGVhciBLcnp5c3p0b2YsDQo+ID4gPiA+
IA0KPiA+ID4gPiBBcyBtZW50aW9uZWQgaW4gdGhlIHByZXZpb3VzIHZlcnNpb24gb2YgdGhlIGNv
bW11bmljYXRpb24sIHRoZQ0KPiA+ID4gPiBpbmZvcm1hdGlvbiByZWdhcmRpbmcgY2xrIHdhcyBp
bmNvcnJlY3QsIGFuZCBJIGhhdmUgY29ycmVjdGVkDQo+ID4gPiA+IGl0IGluDQo+ID4gPiA+IHRo
aXMgdmVyc2lvbi7CoA0KPiA+ID4gPiANCj4gPiA+ID4gVGhhbmsgeW91IGZvciB5b3VyIGF0dGVu
dGlvbiBhbmQgcmVtaW5kZXIuDQo+ID4gPiANCj4gPiA+IFJlYWQgbXkgbWVzc2FnZSBjYXJlZnVs
bHkgaW5zdGVhZCBvZiByZXNwb25kaW5nIHdoYXRldmVyDQo+ID4gPiBuZWNlc3NhcnkgdG8NCj4g
PiA+IG1ha2UgbWUgZ28gYXdheS4NCj4gPiA+IA0KPiA+ID4gTkFLDQo+ID4gPiANCj4gPiA+IFdo
ZXJlIGRpZCB5b3UgZXhwbGFpbiB0aGF0IGRldmljZSBoYXMgZmxleGlibGUgbnVtYmVyIG9mIGNs
b2Nrcz8NCj4gPiA+IA0KPiA+ID4gQmVzdCByZWdhcmRzLA0KPiA+ID4gS3J6eXN6dG9mDQo+ID4g
DQo+ID4gSGkgS3J6eXN6dG9mLA0KPiA+IA0KPiA+IFlvdSBhcmUgcmlnaHQsIG15IHByZXZpb3Vz
IHJlcGx5IHdhcyBub3Qgc3VmZmljaWVudC4gU29ycnkgYWJvdXQNCj4gPiB0aGF0Lg0KPiA+IA0K
PiA+IE1UODE5NiBoYXMgYSBmaXhlZCBzZXQgb2YgY2xvY2sgaW5wdXRzOiA5IGNsb2NrcyBmb3Ig
dGhlIGRlY29kZXINCj4gPiBoYXJkd2FyZQ0KPiA+IGFuZCAzIGNsb2NrcyBmb3IgdGhlIFZDUCBp
bnRlcmZhY2UuIEJ5ICJmbGV4aWJsZSBudW1iZXIgb2YgY2xvY2tzIiwNCj4gPiBJIG1lYW50IHRo
YXQgY2xvY2sgY29udHJvbCBjYW4gYmUgc3BsaXQgYmV0d2VlbiB0aGUga2VybmVsIGRyaXZlcg0K
PiA+IGFuZCBWQ1AgZmlybXdhcmUuIFRoaXMgaXMgYSBzb2Z0d2FyZSBpbXBsZW1lbnRhdGlvbiBk
ZXRhaWwsDQo+ID4gbm90IGEgaGFyZHdhcmUgb3IgRFQgYmluZGluZyBwcm9wZXJ0eS4gTXkgd29y
ZGluZyB3YXMgaW5jb3JyZWN0Lg0KPiA+IA0KPiA+IFRoZSBiaW5kaW5nIHNob3VsZCBub3QgaW1w
bHkgdGhhdCB0aGUgbnVtYmVyIG9mIGNsb2NrcyBpcyBmbGV4aWJsZS4NCj4gPiBJIGhhdmUgdXBk
YXRlZCB0aGUgY29tbWl0IG1lc3NhZ2UgdG8gY2xhcmlmeSB0aGlzLg0KPiANCj4gU1cgZGV0YWls
IHNvIG5vdCByZWxldmFudCB0byB0aGUgYmluZGluZ3M/IFRoZW4gbXkgTkFLIHN0YXlzLg0KPiAN
Cj4gRHJvcCBteSB0YWcgYW5kIGZpeCB0aGUgcGF0Y2guIElmIHlvdSBkbyBub3QgaW50ZW5kIHRv
IGZpeCB0aGUgcGF0Y2gNCj4gLSBJDQo+IHJlYWxseSBjb3VsZCBub3QgZ2V0IGZyb20gYWJvdmUg
d2hldGhlciB5b3UgYWdyZWUgd2l0aCBwcmV2aW91cw0KPiBmZWVkYmFjaw0KPiBvciBub3QgLSB0
aGVuIHRoaXMgc2hvdWxkIG5vdCBiZSBhcHBsaWVkLg0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiBL
cnp5c3p0b2YNCg0KSGkgS3J6eXN6dG9mLA0KDQpJIHJldmlld2VkIHRoZSBiaW5kaW5nIGFuZCB0
aGUgTVQ4MTk2IERUUyBhZ2Fpbi4gTXkgcHJldmlvdXMNCmV4cGxhbmF0aW9uDQp3YXMgaW5jb3Jy
ZWN0Lg0KDQpNVDgxOTYgaGFzIHR3byBkZWNvZGVyIGNoaWxkIG5vZGVzLCBvbmUgZm9yIExBVCBh
bmQgb25lIGZvciBDT1JFLiBFYWNoDQpub2RlIGhhcyBhIGZpeGVkIHNldCBvZiBmb3VyIGNsb2Nr
cywgd2l0aCB0aGUgZm9sbG93aW5nIGNsb2NrLW5hbWVzOg0KDQogICAgInNlbCIsICJ2ZGVjIiwg
ImxhdCIsICJ0b3AiDQoJDQpUaGUgY2xvY2sgY291bnQgbXVzdCB0aGVyZWZvcmUgbm90IGJlIGZs
ZXhpYmxlLiBJIHBsYW4gdG8gYWRkIGFuIE1UODE5Ng0Kc3BlY2lmaWMgc2NoZW1hIGNvbnN0cmFp
bnQgaW4gdGhlIGJpbmRpbmcsIGVxdWl2YWxlbnQgdG86DQoNCiAgICAtIGlmOg0KICAgICAgICBw
cm9wZXJ0aWVzOg0KICAgICAgICAgIGNvbXBhdGlibGU6DQogICAgICAgICAgICBjb250YWluczoN
CiAgICAgICAgICAgICAgY29uc3Q6IG1lZGlhdGVrLG10ODE5Ni12Y29kZWMtZGVjDQoJCQkgIA0K
CSB0aGVuOg0KICAgICAgICBwYXR0ZXJuUHJvcGVydGllczoNCiAgICAgICAgICAnXnZpZGVvLWNv
ZGVjQFswLTlhLWZdKyQnOg0KICAgICAgICAgICAgcHJvcGVydGllczoNCiAgICAgICAgICAgICAg
Y2xvY2tzOg0KICAgICAgICAgICAgICAgIG1pbkl0ZW1zOiA0DQogICAgICAgICAgICAgICAgbWF4
SXRlbXM6IDQNCiAgICAgICAgICAgICAgY2xvY2stbmFtZXM6DQogICAgICAgICAgICAgICAgbWlu
SXRlbXM6IDQNCiAgICAgICAgICAgICAgICBtYXhJdGVtczogNA0KICAgICAgICAgICAgICAgIGl0
ZW1zOg0KICAgICAgICAgICAgICAgICAgLSBjb25zdDogc2VsDQogICAgICAgICAgICAgICAgICAt
IGNvbnN0OiB2ZGVjDQogICAgICAgICAgICAgICAgICAtIGNvbnN0OiBsYXQNCiAgICAgICAgICAg
ICAgICAgIC0gY29uc3Q6IHRvcA0KDQpJIHdpbGwgdXNlIHRoZSBleGlzdGluZyBjaGlsZC1ub2Rl
IHBhdHRlcm4gZnJvbSB0aGUgYmluZGluZyByYXRoZXIgdGhhbg0KaW50cm9kdWNpbmcgYSBuZXcg
b25lLg0KDQpXb3VsZCB0aGlzIGJlIHRoZSBhcHByb3ByaWF0ZSB3YXkgdG8gZGVzY3JpYmUgdGhl
IGZpeGVkIGNsb2NrDQpyZXF1aXJlbWVudHMgZm9yIE1UODE5Nj8gSWYgc28sIEkgd2lsbCBzZW5k
IGEgbmV3IHJldmlzaW9uIHdpdGggdGhpcw0KY2hhbmdlIGFuZCB3aXRob3V0IHlvdXIgQWNrZWQt
YnkgdGFnLg0KDQpTb3JyeSBmb3Igbm90IHByb3Blcmx5IGFkZHJlc3NpbmcgeW91ciBwcmV2aW91
cyBmZWVkYmFjay4NCg0KQmVzdCByZWdhcmRzLA0KS3lyaWUNCg0K
