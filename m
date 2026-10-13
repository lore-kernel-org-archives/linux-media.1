Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013055.outbound.protection.outlook.com [40.107.159.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A33F2D5408
	for <linux-media@vger.kernel.org>; Tue, 13 Oct 2026 01:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791854133; cv=fail; b=hmPGjvKvACSeEPbH8gx0QJSk8rr1oUEhRkaR/W1ohSGItjS4nm2DKpvi6A0qpkmYDmYr+33Qk2fMwiFK69eScHzG2fuAb9lvWrABERJXcq8D9QgiS/hdDsoO4sCb5cx4GEH/xxzZIpNDm3hmOjSugQA/uFGTmybPp3+xXO635ks=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791854133; c=relaxed/simple;
	bh=LDd2ei0MbsgmSjF9wQFGroA2/LD8Bofd4L4aZopsLNo=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=iqvuUnpZdFFB+z7y6EWNsrhJgdDM1S0xYxL1Z2eXzG0wHL5hKiN1AWNdxU7RLh4K++9Xqnb/0HHvmUbAny0BxL/9b/+AK66F//0FQtciIYy2R2inT4U90ziu7t40jWReemjmatNZu1AZVbLRveJJWyMhSFC9Dvizp/tMPI2YWsQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=S5mkFL1V; arc=fail smtp.client-ip=40.107.159.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="S5mkFL1V"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LDJqfvJhHwVEeAOmd2s7ZEO88jO5B63d+hX/f7aNGNjUxLqTvswPAnhCb+ZlKhSRsxY4EbuZxHOi1ROaAKKxRE38550GW0pLFhcf4R8v3XdXbmv/r9bVn+BXAYwBOG7CCT6vEWiGJXhe++u0BonKSAb5eK8xHtQWMwmQpfe+T4oW84ZKTWxZtH5b7dLe3zaWrOGLfxQJCkrWxTZINxAxcC/QCB2sUsX5lmuNjHCV2dIA6mnxQ6HdkoJJ7J2XYYVEr5pZ3xJu9TWELmsUf8nWurVktB+BLHxzCkuVgpBEUNZH+sJVs99bNdFu88eqYkn45j1eljhRco+SXJaiNkSORQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FYzJusnsgXkWyg7gk/uSwm5vtY95kMU8t2Q580DXFbw=;
 b=jytzPN5McFUo50E/ESC06C7hQZP8i/P5pnffNIJ/EHtlU4rd7lm496Fu7s5eCbCn4Wsu4O+brLXHYe2z6bEbrG5BH9xacS2lgxUtKfp9nOiAISsl5WAF+fPQ7b+FH9Oc/h9Vm6FVy8tb793vaG6+Dlya7SMgSJDTL8XlgW82Ns0ZOV92//zJwyUFtMEQgZtNHxJKEvl8prAsWB1HJx33pxU2V4f0G+HCAvpufrtAOaOLjuLSn2FW93qG1/sfRZSaWs+dCaqXyQsfWnHuAC03fCPPWW5Ypg/ym6/gtZqWpZeJqXXxQDR9KsSWeSWvSv+zvaypVJJBNfuQFsLgCR7c1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FYzJusnsgXkWyg7gk/uSwm5vtY95kMU8t2Q580DXFbw=;
 b=S5mkFL1VkrAm+YH4u5LYoUXUGQlrg6x+xGt+Yq9IoVZpbANYxEd+ohlSJmaONZNSrSxQg9nAXH+I0wU8QYsnYB7eJkE3tD/15NLb3iL+02MxwBOveXsaCqDILrKsYl15Why4u4PuwZrivVAyS6qrAuvT0To2MkTYQwrJg/eAXrQk8i9zfVMD9bUiHIuGXq8exfn+j9Pp2aZzbcnssgZFdG0UssO7GdnD1OEx2YNiuyEdc4vTdIAaTg2teiUeijOJdLjMf6fPUzguIOASh1rhYz5z905lFXBbUkxYwW2cOZpEFUl9CO4gYpg7vKiQJZi2LcNKUupsUFwzjr4F+9Rqmw==
Received: from AMBPR04MB335523.eurprd04.prod.outlook.com
 (2603:10a6:20b:7db::5) by GV1PR04MB11061.eurprd04.prod.outlook.com
 (2603:10a6:150:20d::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Tue, 13 Oct
 2026 01:15:26 +0000
Received: from AMBPR04MB335523.eurprd04.prod.outlook.com
 ([fe80::de1e:8baa:a70f:1813]) by AMBPR04MB335523.eurprd04.prod.outlook.com
 ([fe80::de1e:8baa:a70f:1813%2]) with mapi id 15.21.0496.021; Tue, 13 Oct 2026
 01:15:25 +0000
From: "G.N. Zhou (OSS)" <guoniu.zhou@oss.nxp.com>
To: Martin Hecht <mhecht73@gmail.com>, "laurent.pinchart@ideasonboard.com"
	<laurent.pinchart@ideasonboard.com>, "G.N. Zhou (OSS)"
	<guoniu.zhou@oss.nxp.com>, "Frank Li (OSS)" <frank.li@oss.nxp.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, Tomi Valkeinen
	<tomi.valkeinen@ideasonboard.com>, Tommaso Merciai <tomm.merciai@gmail.com>
Subject: RE: looking for working dtb for imx8mp-evk with one cam
Thread-Topic: looking for working dtb for imx8mp-evk with one cam
Thread-Index: AQHdWi5dU92Wx2a5IkmYyELntMjSybb6qniw
Date: Tue, 13 Oct 2026 01:15:25 +0000
Message-ID:
 <AMBPR04MB3355237A67AF9D2CC504A98548FA9E2@AMBPR04MB335523.eurprd04.prod.outlook.com>
References: <2634d4f0-b5f0-419b-bdc7-56f8e761f140@gmail.com>
In-Reply-To: <2634d4f0-b5f0-419b-bdc7-56f8e761f140@gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f6375508-4f8d-4bf0-98ed-14865d40f2d8_Enabled=True;MSIP_Label_f6375508-4f8d-4bf0-98ed-14865d40f2d8_SiteId=686ea1d3-bc2b-4c6f-a92c-d99c5c301635;MSIP_Label_f6375508-4f8d-4bf0-98ed-14865d40f2d8_SetDate=2026-10-13T01:14:51.0000000Z;MSIP_Label_f6375508-4f8d-4bf0-98ed-14865d40f2d8_Name=NXP
 Public;MSIP_Label_f6375508-4f8d-4bf0-98ed-14865d40f2d8_ContentBits=3;MSIP_Label_f6375508-4f8d-4bf0-98ed-14865d40f2d8_Method=Privileged
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AMBPR04MB335523:EE_|GV1PR04MB11061:EE_
x-ms-office365-filtering-correlation-id: 24859a57-42ab-4f95-d27a-08df28c7763f
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|6049299003|23010399003|19092799006|38070700021|56012099006|11063799006|261009223027099003|10067099003|18002099003|22082099003|4013099003|4053099003;
x-microsoft-antispam-message-info:
 0UuB/UszixERE2vaOCd0liV7pA/s6nH0SsWuJB4IIHZDnXMG4IQQV3yjT7BHK/Ss3lTSuJdlxOdO39IfP/Dj+O0r6scH7T84xIyMyLDida9A5qkkzlQrocDIUPQDyw5H6KlrgjGDNVNn4jBjjhCCREomVJRWA6Mtl6I+nXglAum9GAUU6AojC9sLKakZx0n8ChPE/g8/7uc10hmzq6h/w/3L4MKQwuAN45YEArS8XzHNlpRWg+Z4AsSOAlTnbpnQMymS8ZxFju7WFmxDAolXRSKZ54Sl4qVG66ZPeS0Yjn5G6+it2digy97esHDwoYXwHgihXRL3xqboJv3IjdjXdiD8SkHAs/HH0qS3RTYLZ5nIn0od27ZBKwulN8LPn/5TN8oJC3Nq///+/DOWi9+zzDQzPwfhPacB0Kz1fGF0M7FbnrWsgJmZs/cDyEFnOCKCmn+4ZYpuW91V9pUMY1pqdu/jhZh3vRTjMNYqraoeTk0O6BJQfPC/MWuPRwKvsFeM66tgXfvir/zNEoMJbphIv9JEDnJ698A17fFQMZm7YoB4fK670/+TQh9xHe5gz0zm0LcA5JIPunx72LnS7Vl7Av5qG1mYxcGm1BLSm4EjUjpizcMM1BdGBrUmrTLdQDDyLXWOZLhJ+vZljUFfUhnNI5wh7fgYYyqZ92HXwcxSRB1FOd9mN2uhrIGpIGoLOBVdj9oejjwhJA8FA2embF0wSPZCPagTFyKzIniI+jFsoeo=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBPR04MB335523.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(6049299003)(23010399003)(19092799006)(38070700021)(56012099006)(11063799006)(261009223027099003)(10067099003)(18002099003)(22082099003)(4013099003)(4053099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dTgrMWZCTmlLMjBocXU5Z3ZIMUlZTFhOVitubGxydkszZk9SZ0xadFVjQnFS?=
 =?utf-8?B?ZlB5TEhHUWpZVENJUWE2TlBTQnhWVnFmWm1NNjM0Ymc1c1hXd2xJN0tPMDQw?=
 =?utf-8?B?RzZ4TFRLU3Zob0dlWEt5S3UwVlBVcFV1eFZFY1FMYUhOcEM4eXdvU2JSUGx4?=
 =?utf-8?B?UDBuSFZRV3JOSGFBSWZ0K0N0REl5U2RSY2V2TGMxZ0pocmt4RXlQMG5jSlor?=
 =?utf-8?B?ZlQ5L2hrR3FZQVhjek13dGxQb1BEclk4bUN4bDcyVUJDcE5OT2lSTnluVTZt?=
 =?utf-8?B?WUprb0pIMUNTZkpLWWwrSlNQUU9vZE8xMmpqZ0FWcUd3RU9XdUFMZzhvc2Zi?=
 =?utf-8?B?Ym9TZEVEVXEzVlgvbFJ2dm8wOVNTVGtWNzFwdUtVWTRqcE5vbWRJTWZWVmh6?=
 =?utf-8?B?UVp0aE9LTnpRVmNEZUVVSk1zb0V4M2owSEFKSVJxWkxOVmJZY1FZRHhsYXNs?=
 =?utf-8?B?cFMzZlRGZmYzZnUrNTlxQmVGTUQ4N2ZaTWg0QjNVZzRCR0FKMUsrRDgzYmxs?=
 =?utf-8?B?VzZRUVdwc2t6eTNCS1FoMFMyVTZqWkVyRUNQRHBvaXFFNGxES3NzTWw4NGlh?=
 =?utf-8?B?S1ltdXpTbnVWaWdRYWZpeTAyNWxUajkvV1ZseEhwbDJhVDlyaDRBc2pYd1k3?=
 =?utf-8?B?Ujl4VmlwVWdJdUNKWFFuMm11UkV4aWlvMER5SmlnRlRhU0tkemVxYmlOd1Nn?=
 =?utf-8?B?V3A5M3Nvamo0bkduZFlWNTBYays0Ylk0N0NkUzgyNDdoTVhPWldKUFBiNG5G?=
 =?utf-8?B?aFBud0tvekhIOThrMGMrQlpEZUpqZ1hadDc1cFB3OFkwdTg1cTJ0MXNsWHRq?=
 =?utf-8?B?RTBFYUt5dUpxbmtQdzVrQkhsS2FWbVh6WTBWV1FDdmdZdWFWNDBmaEIvSmhh?=
 =?utf-8?B?Z0JsSVhadXhzMDN1RWkwemtZUHVHemJPejBIdFRkcUdNejN3dkpRTXdNcjV4?=
 =?utf-8?B?MjBXcSsyOEZ4OHZwbFZFRHBUMWkwMmZhYUpWYzh1MytnbEhZcWwzUWJIRXFC?=
 =?utf-8?B?T2FHQ2RYeDFMSTdIKzdUSTN1dEhEcml4WXNLWW5ZQ2twd2lHMTVQTzNTNkZM?=
 =?utf-8?B?WEh2eUFwNmZPQlNKeDVOTWlhWGM3THVXYVZwc0pYbWpkZ3dsdS9LdnpEOG0r?=
 =?utf-8?B?OS94UlFsNnk5SGVSN2dYSHFqMTk2Qkh2MGhhRFBYT3hKRUt2K0VVbXZSemlG?=
 =?utf-8?B?VTJQZnFHUy82Zkd0MkI3Z01xYlpPa2lvbTRjTGdFSzlBbjIySGhHWVZCNlhN?=
 =?utf-8?B?bk40V3FlWU40VDQ5bEo5ZGlYcDdCY1dkUlFab2xoeER6dXdla1puRVZ4Nis0?=
 =?utf-8?B?eVNQWDh1Q0FjREpvVEpIY2FxQWQ0bzRhT1FDNHMrMVk1aHhiM2F6WDlxSDdm?=
 =?utf-8?B?OCtIZWJ5dEdTWHhBWWQ4a1BVU1M0SkxKMUJjdXVrcW1SSStoSHZ4S25yMHA1?=
 =?utf-8?B?K2lYeWVhMmJGdHEza3RRMG5kQW4yRWx3RHBDNENMOFgvM0lDNjFGS3k5dndz?=
 =?utf-8?B?eHVtL0dYRE0rNU04TnorQmFxNHBsaXRobGIzZFZyNFZydzlWakNpUzlYcE1E?=
 =?utf-8?B?YU53VlkwUzRPTzFMeGdtdG1FOW1XYm9yd1VLYnQ2T0VYSERrdXFtUFRzL1B5?=
 =?utf-8?B?ZTJYTHVsZFZtTkszaEJzcnlQaFhiOFMwRGdFYSs4d25uWHBWeGtNaEVuT253?=
 =?utf-8?B?Z0VRRm85c25BbTRIdVJLSVdEK2I3eHNTb25PcVZDQVBLVE9OR2V2SEFydWlX?=
 =?utf-8?B?ZWordUE1N2g5NVNMNkhya2VoeEV6Mys5UElvbkxQSDFRd0ZwQklUdStqZjRq?=
 =?utf-8?B?M2dvQm0wNUtTdG1FcnNNSE9HTTZ6YTJxQ01aNnA0QUlrbG9SWXVPSzNnOXN3?=
 =?utf-8?B?Q3NSYTZ5Y2pQcmdVaHoyYUdLUHRRWU9FY253OE1jeDJHQ2RLQXZQUTlVa0RX?=
 =?utf-8?B?OTY3R2xEZmFrTUNleGlQTlBZRmcrVlpCMGFaRUpudkI4clptMndPQUEyaGZp?=
 =?utf-8?B?L29JRVBNZzhhb0JHejlGNWdrdnk1eVdLdFhENkdBOWJkOWJEVHNpUFMyMFdz?=
 =?utf-8?B?UnNzcnlzSTdoMFQ5U1RtQXFNcVlQMTZOZG9RR0xuRnBDQWJsSm5keEpKcktI?=
 =?utf-8?B?WDFYSlpKUkF6aEtCMDRVaFJReFBrbUF2S0JUZTBIT0FwUGk1THZ2OEhRZG13?=
 =?utf-8?B?cnl1NU9kUDlocTVYK0lKTVZUcWJ5YkYzUW1CNHlmSnppZkd0U3FuNDNJVTlU?=
 =?utf-8?B?dEJzR2NBWUk1WUxpcjB0YU9BeDh4SE9YTFJpeEtyYytMbmtRQllobUJRZzN1?=
 =?utf-8?B?NVdURXo4aGdPRmhGSTRBeWJBWHhMWVFROEo3c1NrQk9ZOUpGQUFvUT09?=
Content-Type: multipart/mixed;
	boundary="_003_AMBPR04MB3355237A67AF9D2CC504A98548FA9E2AMBPR04MB335523_"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AMBPR04MB335523.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24859a57-42ab-4f95-d27a-08df28c7763f
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2026 01:15:25.7330
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4LUW5X5wOncUw2IcgLBmhx1bL6+BmruikEjPngX24X1PlUzVv5yeS6Pu/Zfqxc3LtgrX1EZcgYrQA0AD/d00Dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB11061

--_003_AMBPR04MB3355237A67AF9D2CC504A98548FA9E2AMBPR04MB335523_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgTWFydGluLA0KDQpGaXJzdCBvZiBhbGwsIHRoYW5rIHlvdSBmb3IgdXNpbmcgTlhQIHByb2R1
Y3RzLg0KDQpCZWxvdyBhcmUgdGhlIHN0ZXBzIEkgdXNlZCBsb2NhbGx5IHRvIGdldCB0aGUgaS5N
WDhNUCBJU0kgdmlkZW8gcGlwZWxpbmUgdXAgYW5kIHJ1bm5pbmcgc3VjY2Vzc2Z1bGx5Lg0KDQpL
ZXJuZWw6IGh0dHBzOi8vZ2l0LmxpbnV4dHYub3JnL21lZGlhLmdpdC9jb21taXQvP2lkPWQ3ZTdi
Y2E3MTY5ODczYjQ2ZTg1N2MwMjVjMTBmMzMzNmMxMjU4ZDgNCkRUQjogaW14OG1wLWV2ay5kdGIN
Cg0KSGFyZHdhcmUgc2V0dXA6DQotIGkuTVg4TVAgRVZLDQotIE9WNTY0MCBjYW1lcmEgc2Vuc29y
DQoNCktlcm5lbCBidWlsZDoNCiMgbWFrZSBkZWZjb25maWcgaXNpLmNvbmZpZw0KDQpUZXN0IHBy
b2NlZHVyZSBhZnRlciBib290Og0KLSBWZXJpZnkgdGhhdCB0aGUgbWVkaWEgZGV2aWNlIGlzIGF2
YWlsYWJsZToNCiAgICMgbHMgL2Rldi9tZWRpYTANCg0KLSBSdW4gdGhlIGF0dGFjaGVkIHNldHVw
LnNoIHNjcmlwdCB0byBjb25maWd1cmUgdGhlIG1lZGlhIHBpcGVsaW5lLg0KICAgIyAuL3NldHVw
LnNoDQoNCi0gU3RhcnQgdmlkZW8gc3RyZWFtaW5nIHVzaW5nOg0KICAgIyB2NGwyLWN0bCAtZCAw
IC12IHdpZHRoPTE5MjAsaGVpZ2h0PTEwODAscGl4ZWxmb3JtYXQ9WVVZViAtLXN0cmVhbS1tbWFw
DQoNCi0gRXhwZWN0ZWQgcmVzdWx0Og0KICAgcm9vdEBpbXg4bXBldms6fiMgdjRsMi1jdGwgLWQg
MCAtdiB3aWR0aD0xOTIwLGhlaWdodD0xMDgwLHBpeGVsZm9ybWF0PVlVWVYgLS1zdHJlYW0tbW1h
cA0KICAgPDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDwgMzAuMDAgZnBzDQogICA8PDw8
PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PDw8PCAzMC4wMCBmcHMNCiAgIDw8PDw8PDw8PDw8PDw8
PDw8PDw8PDxeQw0KDQpyb290QGlteDhtcGV2azp+IyB1bmFtZSAtYQ0KTGludXggaW14OG1wZXZr
IDcuMy4wLXJjMS1nZDdlN2JjYTcxNjk4ICM2NCBTTVAgUFJFRU1QVCBUdWUgT2N0IDEzIDAxOjAy
OjExIFVUQyAyMDI2IGFhcmNoNjQgR05VL0xpbnV4DQoNCkkgaG9wZSB0aGlzIGluZm9ybWF0aW9u
IGNvdWxkIGhlbHAgeW91Lg0KDQpCZXN0IFJlZ2FyZHMNCkcuTiBaaG91DQoNCg0KDQoNCk5YUCBQ
dWJsaWMNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTWFydGluIEhlY2h0
IDxtaGVjaHQ3M0BnbWFpbC5jb20+DQo+IFNlbnQ6IE1vbmRheSwgT2N0b2JlciAxMiwgMjAyNiA1
OjQ1IFBNDQo+IFRvOiBsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb207IEcuTi4gWmhv
dSAoT1NTKQ0KPiA8Z3Vvbml1Lnpob3VAb3NzLm54cC5jb20+OyBGcmFuayBMaSAoT1NTKSA8ZnJh
bmsubGlAb3NzLm54cC5jb20+OyBsaW51eC0NCj4gbWVkaWFAdmdlci5rZXJuZWwub3JnOyBUb21p
IFZhbGtlaW5lbiA8dG9taS52YWxrZWluZW5AaWRlYXNvbmJvYXJkLmNvbT47DQo+IFRvbW1hc28g
TWVyY2lhaSA8dG9tbS5tZXJjaWFpQGdtYWlsLmNvbT4NCj4gU3ViamVjdDogbG9va2luZyBmb3Ig
d29ya2luZyBkdGIgZm9yIGlteDhtcC1ldmsgd2l0aCBvbmUgY2FtDQo+DQo+IFtZb3UgZG9uJ3Qg
b2Z0ZW4gZ2V0IGVtYWlsIGZyb20gbWhlY2h0NzNAZ21haWwuY29tLiBMZWFybiB3aHkgdGhpcyBp
cw0KPiBpbXBvcnRhbnQgYXQgaHR0cHM6Ly9ha2EubXMvTGVhcm5BYm91dFNlbmRlcklkZW50aWZp
Y2F0aW9uIF0NCj4NCj4gRGVhciBhbGwsDQo+DQo+IEknbSBzdHJ1Z2dsaW5nIGN1cnJlbnRseSBn
ZXR0aW5nIHRoZSB2aWRlbyBwaXBlbGluZSBvbiBpbXg4bXAgd2l0aCBpbXg4LWlzaSB1cA0KPiBh
bmQgcnVubmluZy4gU29tZXRoaW5nIGlzIG1pc3NpbmcgYW5kIHRoZXJlIGlzIG5vIG1lZGlhIGRl
dmljZSB2aXNpYmxlLg0KPg0KPiBNYXkgSSBhc2sgeW91IGZvciBhbiBleGFtcGxlIG9mIGR0cy9k
dHNpIHdoYXQgaXMgd29ya2luZyB3aXRoIGFueSBjc2kyIHNlbnNvciBpbg0KPiBpbXg4bXAgZS5n
LiBpbXg4bXAtZXZrPw0KPg0KPiBJIGhhdmUgaXQgcnVubmluZyBidXQgd2l0aCB0aGUgb2xkIHBy
b3ByaWV0YXJ5IGRyaXZlcnMgYnV0IEkgbmVlZCB0byBjb252ZXJ0IGFzYXANCj4gZm9yIHRlc3Rp
bmcgd2l0aCBnbXNsLg0KPg0KPiBUaGFuayB5b3UgaW4gYWR2YW5jZS4NCj4NCj4gQlIgTWFydGlu
DQo=

--_003_AMBPR04MB3355237A67AF9D2CC504A98548FA9E2AMBPR04MB335523_
Content-Type: application/octet-stream; name="isi.config"
Content-Description: isi.config
Content-Disposition: attachment; filename="isi.config"; size=1174;
	creation-date="Tue, 13 Oct 2026 01:13:57 GMT";
	modification-date="Tue, 13 Oct 2026 01:15:24 GMT"
Content-Transfer-Encoding: base64

Q09ORklHX01FRElBX1NVUFBPUlQ9eQpDT05GSUdfTUVESUFfUExBVEZPUk1fU1VQUE9SVD15CkNP
TkZJR19WSURFT19WNEwyX0kyQz15CkNPTkZJR19WSURFT19WNEwyX1NVQkRFVl9BUEk9eQpDT05G
SUdfVjRMMl9NRU0yTUVNX0RFVj15CkNPTkZJR19WNEwyX0ZXTk9ERT15CkNPTkZJR19WNExfUExB
VEZPUk1fRFJJVkVSUz15CkNPTkZJR19WNExfTUVNMk1FTV9EUklWRVJTPXkKQ09ORklHX1ZJREVP
X0lNWF9NSVBJX0NTSVM9eQpDT05GSUdfVklERU9fRFdDX01JUElfQ1NJUz15CkNPTkZJR19WSURF
T19JTVg4X0lTST15CiNDT05GSUdfVklERU9fSU1YOF9JU0lfTTJNPXkKQ09ORklHX1ZJREVPX1ZJ
UlRVQUxfU0VOU09SPXkKQ09ORklHX01FRElBX0NBTUVSQV9TVVBQT1JUPXkKCiMgRGVidWcKQ09O
RklHX0RZTkFNSUNfREVCVUc9eQpDT05GSUdfRFlOQU1JQ19ERUJVR19DT1JFPXkKCkNPTkZJR19B
Uk1fSU1YX0JVU19ERVZGUkVRPXkKQ09ORklHX0lOVEVSQ09OTkVDVF9JTVg9eQpDT05GSUdfSU5U
RVJDT05ORUNUX0lNWDhNUD15CkNPTkZJR19WSURFT19EV0NfTUlQSV9DU0lTPXkKQ09ORklHX0dQ
SU9fQURQNTU4NT15CkNPTkZJR19NRkRfQURQNTU4NT15CkNPTkZJR19GU0xfRURNQV9WMz15CkNP
TkZJR19GV19MT0FERVJfVVNFUl9IRUxQRVJfRkFMTEJBQ0s9eQpDT05GSUdfVklERU9fSU1YOE1R
X01JUElfQ1NJMj15CkNPTkZJR19SRVNFVF9JTVg4VUxQX0NTUj15CkNPTkZJR19JMkNfUlBCVVM9
eQpDT05GSUdfVklERU9fSU1YOTVfQ1NJX0ZPUk1BVFRFUj15CkNPTkZJR19WSURFT19EV19NSVBJ
X0NTSTJSWD15CkNPTkZJR19QSFlfRlNMX0lNWDlfRFBIWV9SWD15CkNPTkZJR19QSFlfRlNMX0lN
WDkzX0RQSFlfUlg9eQpDT05GSUdfQ09ORklHX0lNWDlfQkxLX0NUUkw9eQpDT05GSUdfVklERU9f
RFM5MFVCOTUzPXkKQ09ORklHX1ZJREVPX0RTOTBVQjk2MD15CgojIFNlbnNvcgpDT05GSUdfVklE
RU9fT1Y1NjQwPXkKQ09ORklHX1ZJREVPX0FQMTMwMj1tCkNPTkZJR19WSURFT19PWDAzQzEwX0xJ
Qj15CkNPTkZJR19WSURFT19PWDAzQzEwX0RSVj15CgojIFY0TDIgY29yZQpDT05GSUdfTUVESUFf
Q09OVFJPTExFUj15CkNPTkZJR19WSURFT0RFVj15CkNPTkZJR19WNEwyX01FTTJNRU1fREVWPXkK
CiMgSU1YOE1NCkNPTkZJR19WSURFT19JTVg3X0NTST15Cg==

--_003_AMBPR04MB3355237A67AF9D2CC504A98548FA9E2AMBPR04MB335523_
Content-Type: application/octet-stream; name="setup.sh"
Content-Description: setup.sh
Content-Disposition: attachment; filename="setup.sh"; size=465;
	creation-date="Tue, 13 Oct 2026 01:09:49 GMT";
	modification-date="Tue, 13 Oct 2026 01:15:24 GMT"
Content-Transfer-Encoding: base64

IyEvYmluL2Jhc2gKCnNpemU9MTkyMHgxMDgwCm91dD0xOTIweDEwODAKCm1lZGlhLWN0bCAtbCAi
J292NTY0MCAxLTAwM2MnOjAgLT4gJ2NzaXMtMzJlNDAwMDAuY3NpJzowIFsxXSIKbWVkaWEtY3Rs
IC1WICInb3Y1NjQwIDEtMDAzYyc6MCBbZm10OiBVWVZZOF8xWDE2LyR7c2l6ZX0gZmllbGQ6bm9u
ZV0iCm1lZGlhLWN0bCAtViAiJ2NzaXMtMzJlNDAwMDAuY3NpJzowIFtmbXQ6IFVZVlk4XzFYMTYv
JHtzaXplfSBmaWVsZDpub25lXSIKbWVkaWEtY3RsIC1WICInY3Jvc3NiYXInOjAgW2ZtdDogVVlW
WThfMVgxNi8ke3NpemV9IGZpZWxkOm5vbmVdIgptZWRpYS1jdGwgLVYgIidteGNfaXNpLjAnOjAg
W2ZtdDogVVlWWThfMVgxNi8ke3NpemV9IGZpZWxkOm5vbmUgY29tcG9zZTooMCwwKS8ke291dH1d
IgptZWRpYS1jdGwgLVYgIidteGNfaXNpLjAnOjAgW2ZtdDogWVVWOF8xWDI0LyR7b3V0fSBmaWVs
ZDpub25lXSIK

--_003_AMBPR04MB3355237A67AF9D2CC504A98548FA9E2AMBPR04MB335523_--
