Received: from mx07-001d1705.pphosted.com (mx07-001d1705.pphosted.com [185.132.183.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 392453E00BE;
	Wed,  5 Aug 2026 09:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.183.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785921817; cv=fail; b=YUlpsQfyhjKWBeCh+ZkCFuOjncpb4KmvxdKwJB8PjNxGDwf0AfB9iRyeeFZX09sQRth1HeHihAHkxP6iEqt59jSxDd80kI0ZIymEhy1zy9yQNA2cen4AsSQmpXbrZWgMvV2AIG6hx4mWNiMQr4r8mOq8Wi4r0oHtx21ykp+XIZk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785921817; c=relaxed/simple;
	bh=w/nT1yADyJwJT3oM4sea1FF51/Ii91Dxpp2QjRe8ArQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=IJWFwQspSz2cO3T28pirM9m9gYrdIY3RaaD8B7VkRpqZaTfsvbi9Zf86EjpswsDHxHScSw0ql0CRt4LqnhqGbG/K91WXq4jEne2hzikuXWwtO/PXOex4c2G+sJs9PFA63Mm9elvDMiT1E70S3OSCxZGP3YEbB9UUhmYTjN/3dFg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=pass smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=B3hpTqY2; arc=fail smtp.client-ip=185.132.183.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="B3hpTqY2"
Received: from pps.filterd (m0209325.ppops.net [127.0.0.1])
	by mx08-001d1705.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6758dvJX1829577;
	Wed, 5 Aug 2026 09:23:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=p1; bh=Bo7afWz
	TjwGX1yISF0w4FfCZcyVFNcmH4zdI88TMuvo=; b=B3hpTqY2NiI1bwDLfKXSZVl
	LWExb6pbccc3EAIG7oR9ukBehcRGJVdMvCILcnWIS8ecS3Edm8MFIH2B0uiMIFKt
	cu+PtYeBPRiyJ8yhnPdZbfutxeJPdQT5uAUBoQr/15dzuVIaSbVXNy49FTch2P5I
	9MW9Y/my+QhZVXaE+pmLHXsDIkUy6SH+x0jRDu5syhsx31fPCT7N+gIEi94FTWe9
	cmU97gf5p6ZqdFIVXyVN8m5TduudlmLkm2++UfSp/TGqNJTnxbw7mASDoJykX1ZC
	0JNHqlUAhdgI+KZOgdlxobulccIs5Q+DdPOKRgbGXRjngnZ9sZ3lRRUtzolaNrw=
	=
Received: from tyvp286cu001.outbound.protection.outlook.com (mail-japaneastazon11011047.outbound.protection.outlook.com [52.101.125.47])
	by mx08-001d1705.pphosted.com (PPS) with ESMTPS id 4fs61vvpss-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Wed, 05 Aug 2026 09:23:11 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q1EthR3jQiLxvce1K5v9NvAfs1PsNAlrEIlkKQdhvVGsqqAk3xwLw/x41WJ664kUH1hlSK27lb1WSoimq35dzqX5irJmqpj+gBz9dPsBt2UPGsQK+DbGJuGcLQtul7aygOHuFKqt1/L9Hqh1ZZQTw0403a0tt9f5qygXmhW84xn1yj/3s4vry6dQnrPYnqMKnYG3HVBLjLW1FgEdi73ZDL2dFprD4tnM0C1Ne0ICSSTtouLAQEuRMRwrH+2Aa8n3PfFcWBjFxsAAeJeOGCrE9+g41KBzveQcE55dML1ZK0+0mERSGu/wdeHBlqY6Mfrat3voSy9ivr6G2vqMlimqiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bo7afWzTjwGX1yISF0w4FfCZcyVFNcmH4zdI88TMuvo=;
 b=OtASsWQKgvBCluxkRtVT2X4EdQzyK3ckSO0KVRXd1sZaw6aTc+yq3I5eddv3DDhGyICNlJOf0lLv7gX1e7A6JzWChMaPmPzS1rPp5VdCbYFLrhVwR+Ju6Zm6ZU4KuFNPOWVHpOC3WGLJrhnTotQhyTBxbOPTKcmT3QsNYT3Tzn9MwHXasAZlTUg5oDng/IbNLfxmmbZKyV5iMRaPreXXS3t2QoNaSk0XMeUrROFx5ynmPBhiKH7ny5iPVZW6DDy951ZT4aP1PCFcGcjUyOEnbRA9f4CqtNKfvqlFU5E5Zh/PMj7wP1HLwBUIKjXCL86P02qs3V9ifQKLLiU/e+oK6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sony.com; dmarc=pass action=none header.from=sony.com;
 dkim=pass header.d=sony.com; arc=none
Received: from TY6PR01MB17839.jpnprd01.prod.outlook.com
 (2603:1096:405:348::15) by TYWPR01MB7329.jpnprd01.prod.outlook.com
 (2603:1096:400:c6::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Wed, 5 Aug
 2026 09:23:01 +0000
Received: from TY6PR01MB17839.jpnprd01.prod.outlook.com
 ([fe80::7155:ce29:dca3:29b0]) by TY6PR01MB17839.jpnprd01.prod.outlook.com
 ([fe80::7155:ce29:dca3:29b0%6]) with mapi id 15.21.0292.015; Wed, 5 Aug 2026
 09:23:01 +0000
From: "Lachlan.Michael@sony.com" <Lachlan.Michael@sony.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: "mchehab@kernel.org" <mchehab@kernel.org>,
        "sakari.ailus@linux.intel.com"
	<sakari.ailus@linux.intel.com>,
        "hverkuil+cisco@kernel.org"
	<hverkuil+cisco@kernel.org>,
        "laurent.pinchart@ideasonboard.com"
	<laurent.pinchart@ideasonboard.com>,
        "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        "robh@kernel.org" <robh@kernel.org>,
        "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
        "conor+dt@kernel.org"
	<conor+dt@kernel.org>,
        "kieran.bingham@ideasonboard.com"
	<kieran.bingham@ideasonboard.com>,
        "jai.luthra@ideasonboard.com"
	<jai.luthra@ideasonboard.com>,
        "Ryuichi.Tadano@sony.com"
	<Ryuichi.Tadano@sony.com>,
        "Kengo.Hayasaka@sony.com"
	<Kengo.Hayasaka@sony.com>,
        "Bird, Tim" <Tim.Bird@sony.com>,
        "Kazumi.A.Sato@sony.com" <Kazumi.A.Sato@sony.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] media: i2c: Add Sony IMX908 image sensor driver
Thread-Topic: [PATCH 2/2] media: i2c: Add Sony IMX908 image sensor driver
Thread-Index: AQHdH8lhE8SDcEsoKkihTzyT2JdkmbaFxp4AgAlv1zg=
Date: Wed, 5 Aug 2026 09:23:01 +0000
Message-ID:
 <TY6PR01MB17839831F80F2EABFF940ED8B92D32@TY6PR01MB17839.jpnprd01.prod.outlook.com>
References: <20260730021525.166811-1-lachlan.michael@sony.com>
 <20260730021525.166811-3-lachlan.michael@sony.com>
 <20260730-ruddy-tricky-wildebeest-ec9e46@quoll>
In-Reply-To: <20260730-ruddy-tricky-wildebeest-ec9e46@quoll>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY6PR01MB17839:EE_|TYWPR01MB7329:EE_
x-ms-office365-filtering-correlation-id: 2d2daced-94c0-4470-1316-08def2d32552
x-ld-processed: 66c65d8a-9158-4521-a2d8-664963db48e4,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|23010399003|10070799003|22082099003|18092099006|18002099003|11063799006|56012099006|4143699003|38070700021|6133799003|10067099003;
x-microsoft-antispam-message-info:
 BhwslIt+JjHduGg9fUtS/YiVhW4HTW8Puf7zUgOOzH3HuL0aE0TW7sTPDY/20WTVAk3BV+NM2nNxT9RgnxXI1kBx7Ik356hJTnYsGY06rUJLxCjKt8X6+pO+sLSe8cms6vCp138QRHExyXLOc/beBEgTQrS3sE3IYndaqdYHsy+cQ8k/K8waU8AgXGDdrDthqd92Np+9LVechuzgmq3YMRhvQZLvSXCaWb305HZxor7N39OIVj0RQFgDat0keJ45jye20xbgRvNwakUNyKhHd3yPlXSst0AVjEBxD40T2RY6fzz2cCYXlxXjSuNeNViFIJNsVUTTFmrJv65c1xW/JpBJhHgqugg9IFdefcxNug0mPsZIPFdJMqS4086ntJsn7KhqcTM6t9T+eAdlkyrUgI5m6bCLuAcGUFyr7Pe25kLh0ff3IyzNzY2sezDMhQwSF5kDHRVqLMlkTTEJYPkHSyxPlfO5yM+TBsifQf64Py4+2U3pBoZ2oOq/vK3thidmkAXqAV/axqh5TPOhF80V2gA6T9BEAHaWxzA7qgH7NJVkQj0XrSSB53odqoXDbhtPoRKRQeP7XgASxJw7Xzcw0rJS06z2nUDuhAZMeaCJpUbaTgJ45RTZ5aBAfSv4gkW5rTjtx2eKopGncHs6+zyNMSXvEHfiDI7rXPPwJvdBeBNqKESWOE8Ep4lpl7RNBg3m3AjieWcqvnnnHBBbT4DX4rmx0xJvszGNEsrpGKGb95g=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17839.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(23010399003)(10070799003)(22082099003)(18092099006)(18002099003)(11063799006)(56012099006)(4143699003)(38070700021)(6133799003)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?Eu5U+m+yM5xiG01pTGLthRIK2GqzL2igE3/xdoPBlDxVAXzj+Y3UAdzsvI?=
 =?iso-8859-1?Q?8zFH7N0F9pmf/4KX0vPRgDj4mOVyEYbsXe3FZSMLexx6g9zRra60Zb99gE?=
 =?iso-8859-1?Q?XS7J7135VN/hvu0LRiEaguH/c1sgfoO+ZoH+vd0kIQlkhiy6o52JqyJqjC?=
 =?iso-8859-1?Q?S4Ou50+ux923MGQrSX2qqSLFZPhrgw73e69Zoef6lbz1ytXXj3LUIt1QOw?=
 =?iso-8859-1?Q?hJIXaWc1D1HEP83uZH3QN+9iOWpwoy3Cl/YwXhCxDh9VUCMvqKfwV317F9?=
 =?iso-8859-1?Q?dviCKVOKP/jgI6ZC3tT3jfoQThrvVLEifoxHa82gKZY2GT8EXly8+zg3iT?=
 =?iso-8859-1?Q?8aFnn1dtHC+aJolYAOVImoOhn9Vc9OdcZNQ9dKVcpax0wUSF6Q2BbIEbtJ?=
 =?iso-8859-1?Q?aUZWIA/8V3oLs0dxjMUtvxNNw/uxe01mNAvvcchTuo8bAKJc1QLo6b65sb?=
 =?iso-8859-1?Q?A9gkaoa+lcSYxwVsgZCeYDOrahGDD5IDQCETUzWUVGafctPOj8Bi4iOBSH?=
 =?iso-8859-1?Q?469Jknh5wqMqi6cg8fSYTZ7WKj8XQZRTNJawpHzUPuNJgc+vaLw2hM0EWe?=
 =?iso-8859-1?Q?hh2Cg/sP87GU2MB/j37lHJ2rbaCbXowNtzCOeCElj0qYxqapTSj1OWEvTO?=
 =?iso-8859-1?Q?wHM3vlQxl5tir3HMmjBZsPXw94xMXebSTf50tAx81ksJWxDb5+NUCDqyVG?=
 =?iso-8859-1?Q?3fa1RkqoxRmt/JksqBoc1f3VPjjptyfk1npfHQzjMIi9rknYVEhWKid4UL?=
 =?iso-8859-1?Q?7DZ9WZJg0mvkitPgCMSY8JLhPcz6BYgM4Selz15u754dDYJ6Y2EQfWwzYr?=
 =?iso-8859-1?Q?iBsOjlC1V9z3LHPDmmmv3OgI2U/y1AQikIAgBBVAFmyyyXaFN92C6wERJx?=
 =?iso-8859-1?Q?lyylfzWOJEjrYN8EMz10koEweJGtypd+AbqhjNSeKDk5/vytTiNDBuj41s?=
 =?iso-8859-1?Q?lqsHNLOll5p5mI2HehwlGJR7N1a2T4PPUxp9sA+xF13w946TGrTV1+NuMQ?=
 =?iso-8859-1?Q?oHLSdLjllZKemdp2S6F5rdCQi/yxaylzrMxFgVHvkFJHo2o0FcGuGT/rXy?=
 =?iso-8859-1?Q?xMgwkTr+x7m+5cQ5gtIO4bTAxUPXiTQtdYDyiXLSXLr1iphzrcmPj0gI7V?=
 =?iso-8859-1?Q?lIiMNYYyQWp0unDdDFNKtaS/0EDAJPVsIADp5ncjDUY4M7fmmnWuJMB5Ar?=
 =?iso-8859-1?Q?ZbcxiMWAaPPKM7ZxemnyeBHi8Dd3lPVlPOaq95yVg/9x65DWyfdsSt9X5A?=
 =?iso-8859-1?Q?7ZaPx5w26DpIC21G0ycXkHRygcH+b16sOLh37DXxloSL0gsDO8q+pnSsfW?=
 =?iso-8859-1?Q?j6WZTNJA2OIluamySIJAnO2qvhKEmJb2ltf6RHrPqwkzKalNIGyMLVSwHl?=
 =?iso-8859-1?Q?NHsPRV5PaVAY+4q4oE6wpq3a4DfSTzipIl0SLSh1q8+1YDQ9cWrCbwJe5l?=
 =?iso-8859-1?Q?vCXR4zkqnCDld+mp0EHXzA3NKjjEdRlTcnf0ONOBgYiITu6WMnQMNt7xQg?=
 =?iso-8859-1?Q?OHlGOjnw55nIM8Nf0EF+X7vAgAJtSbCDylN+mgMBbr+SpER3xyj6I78ZWu?=
 =?iso-8859-1?Q?T5AsAH6XvX+gDvlkigQXlhvab8kqDfiQo0ihlShcolP3VH23ArO3ZDABFf?=
 =?iso-8859-1?Q?2Xzasi2Lm3fw0rIJHEQTI95RJyHYoJyCREhbP2FsTudCzznbkt0EWchWW/?=
 =?iso-8859-1?Q?frkX6JeJGCnwi1gZr03SFVZwsXDgOhMGfBYc/LSyzGvRx+I5t729DCg/Nh?=
 =?iso-8859-1?Q?QccL9KpGDBVuJoCZSX/LILSuGcuMwK5qxCal4eLgr8QKJ0cTcnZoyJtuWD?=
 =?iso-8859-1?Q?jI5+qq1RdxBy1ODdtGIpZapAktoFVEQQT12Wkqx9sqi3a6NZVZYF?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	tE1C/B2wsccvg+q9h7YrLBSay2zA+a5i20xbhsyOqLguW+qhJlJAmtpmO21bDFU+mlOYYvnoL1o6D10dKINs7RULnat2DwZutJNBwOLzlcblsNgh64BmHDQDHy15OrTXbVfS/yYADwq0467YPRNRwtLu7nSbSqt97K6uFKPLmz83eVQVMS8Q23Nc6E6GMrnfn2HFfDJYIlkR9sz4cYWWp7LTm0auAeLAel3fhUe8SlVWSFbC3382okirTB7CUWjtHEXUS/SvQSF5Ps7nk2matM+rGtTowpezvY4KlnVMBspXK9GPHOPI3rJmfG+bXbCObK7lqAvXnZAT95LkabOScw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	cDQzJALXCdmSg14Vz8qnPwzBy4gX7/8/YslZs7U8dr9Ae354XNHtZcO5gLvYmN6yfIZYvEuDB9wy3T/iaOKtaWKU8oqHch/DbAGy63V6VYV7vF41nkj5MfFysP3G8VfZYZ/e8m4N0nai7BNChCBxbYyA2AJ2GpwY8Pc9GskYykuk5WilY+BtAVZqw7QHT8Zpoe7YiyLmr4uVdMRGr3guDzDAH8brK8ThMOtNDZYllhJbRGLf50amh+Zu0LP16FlFx66tlKl3rYyb5jbM3kt/g+A2UcUrBsexJfEhrTZPjls9IXUGKmShoQdr8cdDmXSdgGLSBydwcPqP8qHuA457dNGoarTUs1tuy7nZw1XbsoiHK89O9EFE86yNvETugrX47Es/X1BZjGOpN9ODYZB779CCyT0e+vPUtvn+cO2ukgTPAveARHOdA288GbQ5bOHM9FpL6s5BglrQfhfNbytoMY3avtanMiO9er2aqjH/Oj1UT6z6FdffePJAOqWnrGHqrFmROWAlGK63mbsiDJMMNYsFC8ca2muGNsBDTmBYzyWTwNhaGCNJamVwGxeuI+QamtrDw/XB6AOye6UNTVRy+8anjc7zdQUcdStKTle4NJlyPSXP8bap4XErRBg3G8vz
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY6PR01MB17839.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d2daced-94c0-4470-1316-08def2d32552
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2026 09:23:01.0837
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mZjASasvu6koE31rwVSe3XeeGdvwoLC4wNGQpyX8+1PkiuGc2TQkE7hJ8LgZJtK73Tu+uMxwS4Pfe1mgYiy60pSMXtlISLgP/KOmdWkZtik=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB7329
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDA3NCBTYWx0ZWRfXyYCm4DA2fBjq
 YMW/4UDi5KJypZiDzk4iao2Werwl1JLbWOYK4K877ksQyoU4sChXT+9VXYbHTc8uFNMmp94WM9l
 8/VRmHIeVXwtCzonHNoSUJVUWTvjYrCCrPmenab8nb1Xb1Hxr40w
X-Authority-Analysis: v=2.4 cv=F/lnsKhN c=1 sm=1 tr=0 ts=6a7300ff cx=c_pps
 a=r7f8du3VfM+zdyvCaOKVSA==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=Sv0fKeRqtYgA:10 a=7j0FZ4iXMVMA:10 a=xR56lInIT_wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KAb5x4SsHD3PzxGk7EmX:22 a=FGjXJT7Bex8XaPnzAX5M:22
 a=68tjd57L9Bkg64VecrUA:9 a=wPNLvfGTeEIA:10
X-Proofpoint-ORIG-GUID: qxN9y5lxZj3K5LA61QHSJAhnPBQoF8Rd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDA3NCBTYWx0ZWRfX2QHAj41pU+qc
 DxPMmWGWuaFTEFXtifKBoH8tv+d3MsWIkhkMcAXHvw10WhjpIJIAr+2JnVinl77SRNoXeLj5+f8
 LxOpx57YakMFbe7PaoGawWsmXjrnF4jrhja7ArricGcoZF5VKbLGoNm0sGewia5vEt29iACgs3c
 qCSnBHrlaSgXethqxMO6+4FbHFJCruyN6ltr+Nc/AFyYpcMz81sfJbS65tfA6YB3acyCGm3hXzM
 MHwfdFhp/aRjWlHz6fmH9HxQIiJ+a4jAm+fWYquHhLye/uBXwqcLyBD99Iag2cI7AA4WbmsPTYl
 oO5lwjucyx/3T/327VMLw+rM46E2nsFAdx/QP/1Apnj1sJH5xcFaC1rQZ9wqpgO8z7oLijIlmbZ
 L5rb4uedgrWQILJCzLYYJd5zDJm0IOPN92xZPSTY8SI+Td0J8VbJ19lXWVj42hCpuTtL3tVbelS
 9ENq3Dd5EX5yOlOaZmw==
X-Proofpoint-GUID: qxN9y5lxZj3K5LA61QHSJAhnPBQoF8Rd
X-Sony-Outbound-GUID: qxN9y5lxZj3K5LA61QHSJAhnPBQoF8Rd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_03,2026-08-04_02,2025-10-01_01

=0A=
Dear Krzysztof,=0A=
=0A=
Thank-you for your review.=0A=
=0A=
<snip>=0A=
=0A=
On Thu, Jul 30, 2026 at 11:15:25AM +0900, Lachlan Michael wrote:=0A=
>> +	msleep(24); /* Regulator stabilization after standby cancel. */=0A=
>> +=0A=
>> +	ret =3D cci_read(imx->cci, IMX908_REG_TYPE_ID, &val, &err);=0A=
>> +	if (ret || err)=0A=
>> +		return ret ? ret : err;=0A=
>> +=0A=
>> +	chip_id =3D val;=0A=
>> +	dev_info(imx->dev, "IMX908 chip ID: 0x%04x\n", chip_id);=0A=
>=0A=
>Drivers should be silent on success. Drop or dev_dbg.=0A=
=0A=
I will dev_dbg in v2.=0A=
=0A=
>> +	if (chip_id !=3D IMX908_CHIP_ID) {=0A=
>> +		dev_err(imx->dev, "Unexpected chip ID 0x%04x (expected 0x%04x)\n",=0A=
>> +			chip_id, IMX908_CHIP_ID);=0A=
>> +		return -ENXIO;=0A=
>> +	}=0A=
>> +=0A=
>> +	/* Set to standby mode */=0A=
>> +	ret =3D cci_write(imx->cci, IMX908_REG_STANDBY, IMX908_STANDBY_EN, NUL=
L);=0A=
>> +	if (ret)=0A=
>> +		dev_err(imx->dev, "failed to enter standby state: %d\n", ret);=0A=
>> +=0A=
>> +	return 0;=0A=
>> +}=0A=
>> +=0A=
>> +static int imx908_probe(struct i2c_client *client)=0A=
>> +{=0A=
>> +	struct imx908 *imx;=0A=
>> +	int ret;=0A=
>> +=0A=
>> +	/* Allocate Memory */=0A=
>=0A=
>Really?=0A=
=0A=
I will review all comments for the v2 submission and remove / reword them t=
o be=0A=
more in line with the kernel style. =0A=
=0A=
>> +	imx =3D devm_kzalloc(&client->dev, sizeof(*imx), GFP_KERNEL);=0A=
>> +	if (!imx)=0A=
>> +		return dev_err_probe(&client->dev, -ENOMEM,=0A=
>> +				 =A0 =A0 "failed to allocate IMX908 device structure\n");=0A=
>> +	imx->dev =3D &client->dev;=0A=
>> +=0A=
>> +	/* Initialize V4L2 subdevice */=0A=
>=0A=
>Obvious.=0A=
=0A=
Will remove in v2.=0A=
=0A=
>> +	v4l2_i2c_subdev_init(&imx->sd, client, &imx908_subdev_ops);=0A=
>> +	imx->sd.internal_ops =3D &imx908_internal_ops;=0A=
>> +=0A=
>> +	/* Register access initialization. Set 2-byte (16-bit) addresses */=0A=
>> +	imx->cci =3D devm_cci_regmap_init_i2c(client, 16);=0A=
>> +	if (IS_ERR(imx->cci))=0A=
>> +		return dev_err_probe(&client->dev, PTR_ERR(imx->cci),=0A=
>> +				 =A0 =A0 "CCI regmap init failed\n");=0A=
>> +=0A=
>> +	/* Get mandatory input clock from DT (INCK) */=0A=
>=0A=
>Obvious.=0A=
=0A=
Will remove in v2.=0A=
=0A=
>> +	imx->xclk =3D devm_clk_get(imx->dev, "xclk");=0A=
>> +	if (IS_ERR(imx->xclk))=0A=
>> +		return dev_err_probe(imx->dev, PTR_ERR(imx->xclk), "xclk\n");=0A=
>> +=0A=
>> +	/* Get clock frequency and check against acceptable HW values */=0A=
>> +	imx->xclk_freq =3D clk_get_rate(imx->xclk);=0A=
>> +	ret =3D imx908_get_inck_sel(imx);=0A=
>> +	if (ret)=0A=
>> +		return ret;=0A=
>> +=0A=
>> +	/* GPIO reset acquisition */=0A=
>=0A=
>Please drop obvious comments. Can devm_gpiod_get_optional() be anything=0A=
>else than GPIO reset acquisition? No.=0A=
>=0A=
>Redundant comments bloat the code and make it more difficult to actually=
=0A=
>spot important things.=0A=
=0A=
Understood. =0A=
=0A=
>> +	imx->reset_gpio =3D devm_gpiod_get_optional(imx->dev, "reset",=0A=
>> +						 =A0GPIOD_OUT_HIGH);=0A=
>> +=0A=
>> +	if (IS_ERR(imx->reset_gpio))=0A=
>> +		return dev_err_probe(imx->dev, PTR_ERR(imx->reset_gpio),=0A=
>> +				 =A0 =A0 "reset gpio\n");=0A=
>> +=0A=
>> +	/* Link to power supplies */=0A=
>> +	ret =3D imx908_get_regulators(imx);=0A=
>> +	if (ret)=0A=
>> +		return dev_err_probe(&client->dev, ret,=0A=
>> +				 =A0 =A0 "regulator get failed\n");=0A=
>> +=0A=
>> +	/* Parse Device Tree endpoint */=0A=
>=0A=
>Obvious=0A=
=0A=
:-)=0A=
=0A=
>> +	ret =3D imx908_parse_fwnode(imx);=0A=
>> +	if (ret)=0A=
>> +		return dev_err_probe(&client->dev, ret,=0A=
>> +				 =A0 =A0 "device tree parse failed\n");=0A=
>> +=0A=
>> +	/* Power on IMX908 image sensor */=0A=
>=0A=
>What if imx908_power_on() does power off of the sensor?=0A=
=0A=
Will remove these comments for v2.=0A=
=0A=
>> +	ret =3D imx908_power_on(imx);=0A=
>> +	if (ret)=0A=
>> +		return dev_err_probe(&client->dev, ret, "power-on failed\n");=0A=
>> +=0A=
>> +	/* Read IMX908 device ID */=0A=
