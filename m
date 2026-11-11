Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.229.74
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794407056;
	b=i3ROoMBNPHug87ivCwFnCt1npoPHS59JgkHC0JHbELMEZtYwfoJ8VbWBTxtLnvjPA6hU
	 w+CrdRKQSMipIX6GyWw1yx6dNZJ2B7sKpAWWJICLKDHpNHDVGD7rw8dOKPbzz76zinLWE
	 1Sqc1RheNiky/j1uPMWZgllheu57UkQs3SCoHxd0SgABJ/3T5Q1CzEaxkhADxnstNP6U1
	 +hyz908sVioxSa7z21N5SFHkU33WLo0WpnT9M2rPB/aUrBUrEVAOSg7TR3ZHjhlO4e4kQ
	 iq+xbo/7cZ8mL35XDBtrlXqMPbAXxUr5YOVtJMnnz3woaATSW9/dGdIqw0XRtqM49xA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794407056;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:Accept-Language:
	 Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:x-ai-generated:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=jMUmzVGfd5ARmR3vhkAHIS3b+WUWCNfDeCRlSbDMLgE=;
	b=WiBwjzU0jJBDmsKgXmiTthr2WVLyWNOCKRs6YOkG13MSkMxEMB+WCcuo1D7dQ2enJOvR
	 HDgzTa8xwgEmov8o391gbbiJss0/c3UFalwbXJWUhya3mXQpHPyjyTFZQKkid++z1+YN6
	 ot/FPgHFLy9CuveEr0QAc3gp7rb4LqJT07LC1CQCan/5M9sfTmiawjS9CGUlfT+ZbmmzL
	 OPbY05EPraysjI0sVb0eauWQZGPWuy5Ox1kH9cfUT/gQkxCq7BtBt21LySB5jer+Xgml/
	 Lhl/Jmu9nJCGUCBT88gi6YJwK2KWsRyFe5h3zEzuclMJSXT4q8/1TKLtwaOTJmqbprw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=doany.io;
	spf=pass smtp.mailfrom=doany.io;
	dkim=pass header.d=doany.io header.i=@doany.io header.a=rsa-sha256 header.s=selector1 header.b=a4V3ucBD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.229.74
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11020074.outbound.protection.outlook.com [52.101.229.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC6A606A330
	for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 14:24:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0BC6A606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=doany.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=doany.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=doany.io header.i=@doany.io header.a=rsa-sha256 header.s=selector1 header.b=a4V3ucBD
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ovfi4JXkse8mGUBLTOaOJWRpht13Kj7GObg8qRwMqHCOtgPR0GTzmRnaje5teZ2mMJevorswQOOXmiYVjQ2umzf3/xE4QVNLI21Xd8avvPmhIi3mq4WNKgONUEWEizgzwKoElAtN/D/FsEsRP5gltgTW9xRZjBssKv3+Yyfh92STfV7QW25BEZ4G6Mil8w6fVFyeKT20LI5fOLANN3MJjC339piF4npTO3Qev5UYBl9zLimZkFOTr9A5ODtaXgQGwPhGYFtt1c3UmYpBUgo56usi6uwr7Pw3UPVUrBt1zrM6q+z2otBVUauqZcSW3kv+GeGWSXeaxSY+StIbPIhZ5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jMUmzVGfd5ARmR3vhkAHIS3b+WUWCNfDeCRlSbDMLgE=;
 b=kXH7fNWGp1JqlzyRIGh9llbhzQ1v+8dB8KAaAHo0dKVOZ6MOsKsLePqNhbSwlJxbwP2UpYP8ji/lctxbH+CP0rdbstI7fJhI79iBGvQA9BZulSvwbPbzD2p+4LH/dqwcrjtV1OSd4O06xyFlABT5W3TKWa7++j1aVXJ7q4983GIkOYOKX37v3hIJ0ftMnS1hEyQZPfdA7xewuse//gSzCMH+YNKzbE0WMvXUxRmosN31dXnc3K9T9Vnq6XErcN1X2qPA5tw29gbi9KEuYQpUzOlB1q2Y1M+QqmACRqG3JjhSISN91iC9c0t8PtBO2vodoOWVVsg+1pJULD3/svX0lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=doany.io; dmarc=pass action=none header.from=doany.io;
 dkim=pass header.d=doany.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=doany.io; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jMUmzVGfd5ARmR3vhkAHIS3b+WUWCNfDeCRlSbDMLgE=;
 b=a4V3ucBDLZZqiq2W6j3eQRXJ4ATnkJ11yb8GGyQ06ktDTKL6bvfhW1eq8tY/ENOlbTOFeGsixzo/br6OPSjQa2Of56psM5pr94lNDePbZ6sASmtJu2DipEwGd4AnUkYL59kn53N0Hcq0MXBlhkLsQLcG4EeMBpkn6IMrSfXF6zh0j/TytkyhLeMFJYkI8twbngV38sny3pCLPFZJ51uX6SoN8TqNHSpCeX4u51TZOaX7Cm74gHB/rBEzDu6A56Y7G0+Ib7f3v6ayAKucwGy3cYrDce2QIkWXDsVJDJQvFtcdK3NUIqabMAcaYd6TMlVDvBCXVr11egrgKJXvskvDyA==
Received: from TYCPR01MB8850.jpnprd01.prod.outlook.com (2603:1096:400:18d::13)
 by TY4PR01MB13885.jpnprd01.prod.outlook.com (2603:1096:405:1fc::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 14:24:10 +0000
Received: from TYCPR01MB8850.jpnprd01.prod.outlook.com
 ([fe80::dc0a:e711:9a33:4362]) by TYCPR01MB8850.jpnprd01.prod.outlook.com
 ([fe80::dc0a:e711:9a33:4362%5]) with mapi id 15.21.0615.008; Wed, 11 Nov 2026
 14:24:10 +0000
From: Ryuki Maruyama <info@doany.io>
To: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
CC: "mchehab@kernel.org" <mchehab@kernel.org>, "tskd08@gmail.com"
	<tskd08@gmail.com>
Subject: [RFC] media: dvb: add SYS_ISDBS3 delivery system
Thread-Topic: [RFC] media: dvb: add SYS_ISDBS3 delivery system
Thread-Index: AQHdcehRPQh8YU+E9kiZkPyWjytllQ==
Date: Wed, 11 Nov 2026 14:24:09 +0000
Message-ID:
 <TYCPR01MB88506BC7FF73705F292AAE80A1712@TYCPR01MB8850.jpnprd01.prod.outlook.com>
Accept-Language: en-US, ja-JP
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ai-generated: mcp-office365
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=doany.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB8850:EE_|TY4PR01MB13885:EE_
x-ms-office365-filtering-correlation-id: 45370670-10bf-478b-35dc-08df3fff73c2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|6133799003|261009223027099003|10067099003|3023799007|261028144727099003|261026140227099003|261026121527099003|261021123027099003|261102123227099003|261022075727099003|261021121427099003|261022105027099003|5023799004|56012099006|38070700021|21046099003|18002099003|7055299009;
x-microsoft-antispam-message-info:
 n992xEB0Prva+MCY4/Rovss5Wx1y2HLYrkOz8gmeYqfazOsSyU1em57VNHH9Q69bxBWtFsgDxigzvKDfWGeAanvV4SM9ljUjvbnPwchrbkfOasqMYz7K0jIpBK3auXIt5+5qcBzU8IqVgBOKytKxmWJAf1L6FIan4457g6lksQH6f7ZFLQ6cPrXPfbuR8VMuLjtvWjN9qBFcOOEVZlD9ZsbG6T5kXcs2SGVOfzq3z0p5FNJt3DzUKg90OwuxRLPkMxTfrPw0jtnTmwsvbd5QcRM5EuEanHbtbFPO7BCOHFOh9HJ/ZblJJ7alIpTUFsp43+YCYkV+dbAs8q79CeNRlLpq7Y7RTFVcYYZerCDDG2uWTv1GNCZLxPJA2jgLmiwbL3PoYktmgay/vbHU0nukNDuRGYGDEIyy1j4TVRqBAdxu90d/ukqASv2qKTqvr5m5JvuKdEcLumbOOSxNRgloMcSZq57GdJRyyNV679FDbrOMR/IYZDvie8kg2G/4gVqJusnE4GTkUnmgXVV15OtLEN8MhNy8pEz7zUyww6eAGL+uf8L/PutHHUzoT3m6gD3vjhqlN+9GfnPhWr3v2I164x8NJbjIbCrTo7/LU6ehCkEcc/6JvhAuZG05sFAeRzCPJ0CKkwRmsXXiypvguutTD3UFvbSmfxbQYxowEpXcqdTl8fbY6uYBApVC5BYF3PPk9O7cuKPVXnrqDStOkuDHFxzwKwsELbeMaeEdMm/YWp2tYjvB9jTG465tZisFeyvo
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB8850.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(6133799003)(261009223027099003)(10067099003)(3023799007)(261028144727099003)(261026140227099003)(261026121527099003)(261021123027099003)(261102123227099003)(261022075727099003)(261021121427099003)(261022105027099003)(5023799004)(56012099006)(38070700021)(21046099003)(18002099003)(7055299009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?7v5pO+WD+L0R1127wuJV6AFEnBtQm2+lXGFHJO8V3S8sgvGijtKz2Hjp1Koy?=
 =?us-ascii?Q?AdOPoztBpeooPCCtmFsj5PjX3AOx+qMV1Yg3+Zd1rs6Mp+31jWB2vpQ43OIB?=
 =?us-ascii?Q?8vM07RBDgseGq3OiACA6A22uN9nWHSn/VYIc3dWtkHKtiAJPGQ1kjkHIx3KN?=
 =?us-ascii?Q?WSGO4/0RNBuxgNEzCqMQ5n8ihmyvaMXqIO2eyXdWrgM74IHc3e/sislK/n0j?=
 =?us-ascii?Q?BorZjJowvzj0HsQ9BET3mSJ0sQeT6mfnax7pzzR6haT0N1+9R0sLA1oCRSJb?=
 =?us-ascii?Q?8E65jr9pjj68XbDWg5CuEp4RiYvV0BEY7/3HX/LUfpUfx1NLuvsOWqIHyawc?=
 =?us-ascii?Q?hvOjkKs3PBOHDTAIAHN39GSCkvpm9n1zUDR5iEt/3dcVv0W2TTK+VptUciaN?=
 =?us-ascii?Q?yZhma/dRQYojK0k1eWSzacNDVL8lNtc1zlNi9/hryRONCJg/z/iH/yqk/9je?=
 =?us-ascii?Q?BZ797KDJ7NtRZgcDLaSKPcVld1B1DeFA59yoH0sIiInqELc5eHOpQfEYkWcl?=
 =?us-ascii?Q?1vvzbRceWVR0emXgsQufXjI01xsPcunwl1bxZp7cNL/EpL4mnvoJ7YSloeq0?=
 =?us-ascii?Q?s9Lzfgsj58H7XyYiJV/VgNM8bBLTJ1TXcTqEd8J+aX06IdTh4iMNinsV4ELY?=
 =?us-ascii?Q?All6v0m6ihJy5nKbWXb8mSjvij3QuT2ercTw144j/hLz2gyVo4yr5VAexyxD?=
 =?us-ascii?Q?ocx6iOocQG5I7IB1CVcWoa6w0QleERcGuI9AJPOmR5AzX2/MH/o7Y0OPjpKV?=
 =?us-ascii?Q?gMTF2khTTvfiiGyR7F1g1gaBxpf4Iqz3ni9xisnET6rdFk2ZRm2r8rL8G8GO?=
 =?us-ascii?Q?y8fBhUdhKJiZD4g06xHiYLflk9u9tJhtFAWYAqQmn8xblNBvNwf0pX60PJbY?=
 =?us-ascii?Q?VmnLRVnIJZ9UeNXPCHDNiVWvzQV6XZS9lkIPlpIiEGcV+sXYdZ6rqKmgDXYn?=
 =?us-ascii?Q?ojvzwG1Yl7fHHcc2TqBWwAM5b9ILkb0bY1C5/0sxYzvM5w/JwtPS0kcEjiZi?=
 =?us-ascii?Q?FBw377WfQtigH3s/demXtA+Bn7OjwPz/904il2P5AkTqfI98oZ4jG2j6lvK2?=
 =?us-ascii?Q?LPG1DP7gFTXbJ9LJobAXpA7ylgLb9uvEPTA8gyqunrup+DFzTHlRDMdnQtjh?=
 =?us-ascii?Q?+4i+7InGJMp2Q5eSIHU4Aht020hgx1SuFn2uKmU43aKvwzbiP1WhYme/Z+rP?=
 =?us-ascii?Q?beuyn6LY0Vl9VQGb4GhasMYhnUWZspXgaagkN1hV06v8eaXARPw8Bndqj3KI?=
 =?us-ascii?Q?ZJrDYdYrUO3VuK6KXZYFPWh1h5zICe99SM33upTDUpsG4E5x/e+15PXHIMWq?=
 =?us-ascii?Q?qg+EYmDXJvkOvjDoo/0zbIutIUiM5mkHTPvcaiy1Pt9KECKHxFbd0LyLX67b?=
 =?us-ascii?Q?TWlV2p1GmxcgtlTm4NjEx0ZtdoH+b25b4yNLtszXN9gtup0FPcfZ9dxsYydQ?=
 =?us-ascii?Q?H7bOHvpaC67WMbkhuBXCY0AxW7QS3JGhEs63n2ccR7OqTtKaiggIZci/mLjf?=
 =?us-ascii?Q?Lzr+THYTSOFJb5so5RNxlAlo8A0QnAOO3KDiInV5g7D1Rr3x63G5VHAXqVHV?=
 =?us-ascii?Q?vHhrmjFd7E6jof7KuHqjeb361VanSVml0LPjPzqgP7oZ7InZ5c1wr7HqgPBm?=
 =?us-ascii?Q?o4VqylqhG+kdkR6lPIWSKBMMVnmn+P5b6Qi996rxMVXzHFzAqUKQV0ZgX2R3?=
 =?us-ascii?Q?FazJDylYXmCDrLKq4HDrmE8XRXk=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-OriginatorOrg: doany.io
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB8850.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45370670-10bf-478b-35dc-08df3fff73c2
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2026 14:24:10.0597
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 22ac977d-b140-4dc8-8150-90d645d3475b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Pso1rp7tTLyyo90ZejuyrwaNEdjpf7oPiqwh+XKwWY+cIznulSCgoGkCZEmQM/h7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB13885

Hi,=0A=
=0A=
I'd like to ask for feedback on adding a delivery system for ISDB-S3=0A=
before I prepare a patch.=0A=
=0A=
Background=0A=
----------=0A=
ISDB-S3 (ARIB STD-B44, Rec. ITU-R BO.2098) is the transmission system=0A=
used for the 4K/8K satellite broadcasts in Japan, on the BS and the=0A=
110-degree-East CS satellites since December 2018. It is a separate=0A=
system from ISDB-S (ARIB STD-B20), not an extension of it:=0A=
=0A=
- the frame structure and the TMCC (Transmission and Multiplexing=0A=
  Configuration Control) are different, the inner code is LDPC, the=0A=
  roll-off is 0.03, and the modulations go up to 32APSK=0A=
- a carrier holds up to 16 streams, each identified by a 16-bit=0A=
  transmission stream ID: a TS_ID for a TS stream, or a TLV stream ID=0A=
  for a TLV stream=0A=
- each stream is either an MPEG-2 TS or a TLV stream (ITU-R BT.1869,=0A=
  carrying IP packets), signalled per stream in TMCC; the 4K/8K=0A=
  services in Japan use TLV with MMT on top=0A=
=0A=
ISDB-S and ISDB-S3 carriers share the same satellite band, so the=0A=
frequency alone does not tell the receiver which system to=0A=
demodulate.=0A=
=0A=
What exists today=0A=
-----------------=0A=
There is no ISDB-S3 entry in enum fe_delivery_system. The out-of-tree=0A=
driver for the TBS6812 (also known as "PT4K" in Japan,=0A=
https://github.com/otya128/tbs6812_drv) reports SYS_ISDBT and=0A=
SYS_ISDBS in DTV_ENUM_DELSYS and receives ISDB-S3 through SYS_ISDBS.=0A=
It decides the system from the value of DTV_STREAM_ID: values below 8=0A=
are relative TS numbers, IDs whose upper 4 bits are 0xB or 0xC are=0A=
ISDB-S3 TLV stream IDs, and anything else is an ISDB-S TSID.=0A=
=0A=
This relies on how IDs are allocated in Japan, not on the standard.=0A=
Both special ranges overlap the documented ISDB-S TSID range (1 to=0A=
65535): TSIDs 1 to 7 would be taken as relative TS numbers, and=0A=
0xBxxx and 0xCxxx are valid TSIDs as well. A TS stream inside an=0A=
ISDB-S3 carrier has an ordinary TS_ID, which this convention would=0A=
treat as ISDB-S. Applications also cannot learn from DTV_ENUM_DELSYS=0A=
whether a frontend can receive ISDB-S3 at all.=0A=
=0A=
Proposal=0A=
--------=0A=
1. Add SYS_ISDBS3 to enum fe_delivery_system. As with SYS_DVBS2 next=0A=
   to SYS_DVBS, a separate generation gets a separate value. DVB-S2X=0A=
   reuses SYS_DVBS2 because it extends DVB-S2 (commit 6508a50fe84f=0A=
   ("media: dvb: add DVB-C2 and DVB-S2X parameter values")), which is=0A=
   not the case for ISDB-S3 and ISDB-S. The Android tuner HAL also=0A=
   has ISDB-S3 as its own frontend type, next to ISDB-S=0A=
   (FrontendIsdbs3Settings).=0A=
=0A=
2. Properties for SYS_ISDBS3:=0A=
   - DTV_FREQUENCY (kHz, as for SYS_ISDBS), DTV_VOLTAGE=0A=
   - DTV_SYMBOL_RATE: ISDB-S3 does not fix the symbol rate; the cache=0A=
     default would be the example rate of ARIB STD-B44 (33756100),=0A=
     just as SYS_ISDBS defaults to 28860000=0A=
   - DTV_STREAM_ID: the 16-bit transmission stream ID (TS_ID or TLV=0A=
     stream ID) of the stream to output=0A=
   - read only: DTV_MODULATION and DTV_INNER_FEC (point 4)=0A=
   The carriers on left-hand circular polarization use intermediate=0A=
   frequencies above the 950-2150 MHz range that the in-tree ISDB-S=0A=
   frontend (tc90522) advertises, so drivers would advertise a wider=0A=
   range.=0A=
=0A=
3. dvb_frontend.c gets SYS_ISDBS3 everywhere it handles SYS_ISDBS:=0A=
   the DVBv3 type for FE_GET_INFO, the kHz frequency limits and step=0A=
   size, the default zigzag parameters, the cache defaults, and the=0A=
   bandwidth calculation (with a roll-off of 0.03; DTV_ROLLOFF is not=0A=
   used, as no ROLLOFF_* value matches). A carrier holds several=0A=
   streams, so dvb_frontend_check_parameters() would reject a stream=0A=
   ID above 0xffff, including NO_STREAM_ID_FILTER, with -EINVAL: the=0A=
   demodulator outputs one stream at a time and has no unfiltered=0A=
   output (see question c).=0A=
=0A=
4. The cache defaults for SYS_ISDBS3 set DTV_MODULATION to QAM_AUTO=0A=
   and DTV_INNER_FEC to FEC_AUTO, and get_frontend() sets them back=0A=
   while not locked. Once locked, it reports the transmission mode=0A=
   that carries most of the selected stream's slots. ISDB-S3 can mix=0A=
   up to 8 modes in a frame, more than the 3 entries of layer[] that=0A=
   tc90522 uses for the two ISDB-S hierarchies. APSK_16 and APSK_32=0A=
   already exist, and all 11 nominal code rates of ISDB-S3 already=0A=
   have FEC_* values. pi/2-BPSK has no value; like tc90522 for the=0A=
   BPSK of ISDB-S, a driver can report QPSK until one is needed.=0A=
=0A=
5. A stream selected with SYS_ISDBS3 is either TS or TLV. For TS, the=0A=
   driver feeds the demux as usual. For TLV, the driver calls=0A=
   dvb_dmx_swfilter_raw(), and the application opens a single TS feed=0A=
   (for example PID 0x2000 with DMX_OUT_TS_TAP) and reads the DVR=0A=
   device. The DVR device returns the received TLV packets back to=0A=
   back; read() boundaries do not follow packet boundaries. PID and=0A=
   section filters have no meaning for TLV. dvb-usb-v2 also uses=0A=
   dvb_dmx_swfilter_raw(), for the ATSC-M/H frontend (lg2160) of=0A=
   mxl111sf, but there the payload type is fixed per frontend. Here=0A=
   one frontend would switch between TS and raw depending on the=0A=
   selected stream.=0A=
=0A=
   dvb_dmx_swfilter_raw() passes the buffer to demux->feed (feed[0])=0A=
   without checking that it is an active TS feed. If an application=0A=
   opens a section filter first, the section callback would be called=0A=
   through cb.ts. This affects ATSC-M/H today as well, so I would send=0A=
   a separate fix first that passes the buffer to every TS feed in=0A=
   feed_list that is in DMX_STATE_GO.=0A=
=0A=
6. Documentation: fe_property_parameters.rst,=0A=
   frontend-property-satellite-systems.rst (a section like the one for=0A=
   ISDB-S) and frontend.h.rst.exceptions.=0A=
=0A=
Questions=0A=
---------=0A=
a. Is it acceptable for one frontend to switch between TS and raw=0A=
   output depending on the selected stream? If an application retunes=0A=
   from a TLV stream to a TS stream while the DVR device is open,=0A=
   should the driver stop the feed, or drop data until the next TS=0A=
   sync byte?=0A=
b. SYS_ATSCMH already outputs raw data, and the delivery system is=0A=
   the only hint of the format. Is that enough here, or should the=0A=
   frontend report the output format (TS or TLV) with a read-only=0A=
   property, since both can appear under SYS_ISDBS3?=0A=
c. The documentation says that any stream ID outside the valid range=0A=
   disables filtering, and DTV_CLEAR sets NO_STREAM_ID_FILTER. In=0A=
   practice tc90522 writes stream_id & 0xffff for ISDB-S, so=0A=
   NO_STREAM_ID_FILTER is written to the demodulator as TSID 0xffff.=0A=
   Rejecting it means an application cannot tune to a carrier whose=0A=
   stream IDs it does not know yet. Is it fine to reject it in the=0A=
   core for SYS_ISDBS3, or should the driver select the first stream=0A=
   listed in TMCC instead?=0A=
=0A=
Compatibility=0A=
-------------=0A=
Nothing changes for SYS_ISDBS (TSID 1 to 65535 as documented).=0A=
Out-of-tree drivers can keep their current convention; an in-tree=0A=
driver would use SYS_ISDBS3.=0A=
=0A=
Users=0A=
-----=0A=
There is no ISDB-S3 driver in mainline today. The out-of-tree TBS6812=0A=
driver would be the first user. Today it passes all data, including=0A=
ISDB-T and ISDB-S TS, through dvb_dmx_swfilter_raw(), and does not=0A=
output TS streams inside an ISDB-S3 carrier. An in-tree version=0A=
would have to switch the demux path per stream type as described in=0A=
point 5. Its bridge files carry GPL-3.0-or-later notices, so it=0A=
cannot be merged as is, and I do not know of a plan to submit it.=0A=
That is why I am asking about the uAPI first: it lets drivers and=0A=
applications agree on one convention now.=0A=
=0A=
Would you take the uAPI change on its own, as with SYS_DVBC2, or only=0A=
together with a driver?=0A=
=0A=
If the direction is fine, I can send patches for frontend.h,=0A=
dvb_frontend.c, dvb_demux.c, the documentation above, and libdvbv5 in=0A=
v4l-utils.=0A=
=0A=
Thanks,=0A=
Ruk Doe=0A=
