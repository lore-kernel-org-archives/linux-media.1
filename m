Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020124.outbound.protection.outlook.com [52.101.225.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 188593EDACB
	for <linux-media@vger.kernel.org>; Fri,  9 Oct 2026 06:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.225.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791528005; cv=fail; b=DYYIEA2vH/7WsX77SppynzvXU0Zl/10BeTX/Ezj376rho0mUatxQ2+sVJkRtGy/RvzyVRNZiuPnH0ubXT+WQxftyTPbGAjv/Gk+BZ2NlAx3cnXybZI48VEsiSNAQJbbqVEvAS3T+XaNILa1V3a4xNrarWNX6QV90vHtE6q5pzzY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791528005; c=relaxed/simple;
	bh=P1TwDV/IUmD1ZnKQUm2O9tlLWbAkyNO5VcLprqbE1d0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=JKUwAQDj3pQPlFAg6TfrHzgog6xjy3erSLVPYwYzuaUGhhK2u0X9ii/au0/56KIJ8BXgYSs0y59BTrFtagzP27AX/dnZiLiAdqDU/Hcxmwc7477PSfxsUSfI1Kh6ion3iNc0baxOPq1nfvUeWWXPxA+TfWPFjtaAkHbraSK9mPc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=V6Hqk7Vo; arc=fail smtp.client-ip=52.101.225.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="V6Hqk7Vo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xMV0wa0PCa+dEBGEkN9Y39q71oBVN5uT5w2t31tabVQP6C/Rr4AXdDfqp5zXayJJEIZ6EBqRJawoB2GUaZvAuAZAEmznc0AN96O9nE4JQSeE1thkK8JTyxXHDTs7aG/QnWHkInrgfYJzPXMEWaXO9/65y5wiADm/A6A/H5HIlBEnMpIbeaurqpRKcg8FeFNzToVgxIbN9Wp4IRVbnpbqfycldeY2v3Ge9lAUXqxug39rq+qcsKmsbBlx2Vk2nXC5lRbzFEVw5Z7BLMmArrAOxgmLvO1Gu24zETpa+FUxDvlIOeQAmxbSxmurlL3dlm3Y680/rr7Ulz9QfXcbr0mHsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P1TwDV/IUmD1ZnKQUm2O9tlLWbAkyNO5VcLprqbE1d0=;
 b=T9gGahVc4XIeMs53gbAcGh/snXknW8SPLtgY3G1gZGd2/NhSB4DubeCJ7ygyWtkYrxQyMPW9Zm3GU0po321mBmt6yPf2GYw8F+f5B7FNMiFLNM3J461A31i8pfDSTqCQpA2rL42es4pkXeclXfPoJ0FVPNOGiw3iydpHmUrVFVFFoim4HGgBtHsB8mq6azDjYkQPPBZuneAcHTkWby44XVSR4Pz3QJ44qC3KLKr10OFjCzfNxZtGENdbSFkTpCMsrEO21E1kqjOLQcztykbDnQgKdxln/Ol8/hNtzqfhCE33zQVC+0z9IVweOBEcPvxB1vxwSQxBOFQjqNnxRnUQkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P1TwDV/IUmD1ZnKQUm2O9tlLWbAkyNO5VcLprqbE1d0=;
 b=V6Hqk7VoLvC75Jf7IC/UawcVHnlraCfUdZncw6oC8oHttYShGecN3AT+v8ar7D6qnfU6PlEq70HLXUXOkLEz0BDIiO5x/421N3EGAMuW7hxFinSANvvAMfM1gmgz1XXOHaPugW1tZZvhp3b/39mxK+M2I1/cC4kE7qCwV/rwR61nsUn+suSXUUE06Z81mhfflGwamM4CUnZW/UjASbz10Z5hHfgYBssOwWyLEBLgb1H6+FHXKCzCE2u0mM/FwpuTWGlWxPTbRPlHy38Q6PZUstvSjeHiqRfdajsLsTnjSbNHJdxZY3SY6onPmKyL6XxaowCdAN81Necqr9tcHIg4QA==
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by MA0P287MB1150.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:f2::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Fri, 9 Oct
 2026 06:39:58 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%3]) with mapi id 15.21.0496.015; Fri, 9 Oct 2026
 06:39:58 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>
CC: Antti Laakso <antti.laakso@linux.intel.com>, "hao.yao@intel.com"
	<hao.yao@intel.com>, "dongcheng.yan@intel.com" <dongcheng.yan@intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>
Subject: Re: [PATCH 1/4] media: ov05c10: Small cleanups
Thread-Topic: [PATCH 1/4] media: ov05c10: Small cleanups
Thread-Index: AQHdV2kW+tn1aWZKIky8hOzipdcUNbb0wgOQ
Date: Fri, 9 Oct 2026 06:39:58 +0000
Message-ID:
 <PN3P287MB1829410C1ACDE6638CAF580A8B922@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <20261008210503.1878442-1-sakari.ailus@linux.intel.com>
 <20261008210503.1878442-2-sakari.ailus@linux.intel.com>
In-Reply-To: <20261008210503.1878442-2-sakari.ailus@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|MA0P287MB1150:EE_
x-ms-office365-filtering-correlation-id: 4cd2dd4b-a672-47bb-9c74-08df25d02351
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|22082099003|18002099003|10067099003|38070700021|4143699003|56012099006;
x-microsoft-antispam-message-info:
 o11zN6OrfPrDd1bR94JcjNU42WnWGff7+eZvQlnLatc+pPOrVUVvcI8h30NaBFWxDBMm5imRYMGTTgtW703UKuCIokGCEaJK98dt0JSy5iiGl1V2ojrs0QQK0e/m2MbWuElgDdpjXc9Zdrm9U4xLTcBzbMZQDw3wJc1Bxoxo1vjpd9zkge8Ttd29okJpOc5aJ2jxXzTBHmU3yrWGOk0cZcmk6NEFkzlxp30yIsZ+YjvOQySBXHmchwzufXdD/k6kHBDN8AVcbYK0FCWWR+gBwkm46Q4OzRelFqf9PuBXDuosb8WHonjW/l1D6jfVIvClVJc1X8JqjaEhaFPv8D+j4oDdycRzePLGb7Sec1Ed05toU7XRToGRV13eK3YVgTZTQGvM9aSUwEcXqy5W9Ykk8kxou6aoWWRTn62XzM63eQWksTJOHdwhRVnB1OIBeqZvb6jf3iYwRwgn1YD1qPochxtsYposiKShbg7kOhgyJ0dQCGU475ZHochP37y7lXHTq+nIWcLe9do/KIKdbLuh0hm8KF9jr6kod6qoiiMbVC1TvaU1lZ4RxqeK1BTPoyV3ruj/WwFN1NpX5eOnba6szHAMHFPTmXm+D1C/Roi8oSsCq2vcHAg3kO/HM+/kF00fLI/af4wvcvzU2OQayYR5rHfiHky+w9qBrIZuDh2CFSLSDdtOR0GE1BxDaX+sENt6Gpi4uOowu0ltx/Hh7zP1gDZDBeotGnN9vlaoJqhpJZg=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(22082099003)(18002099003)(10067099003)(38070700021)(4143699003)(56012099006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?KkVeUvFZQiuHW9TLQbh1ngxU0geOHkffyf7a+cdZge5W3unCMxR4VHPkgK?=
 =?iso-8859-1?Q?KGS2QPFkpXXbWwW1Bz2FLkP99WnVO52v+mjxPfcRy0UcWgMU17C0BB2503?=
 =?iso-8859-1?Q?sG6P7z/X765Vf9+suBfSf/U5NNpprt9aKnHHdKvaOU300zzkWecCCNRfSo?=
 =?iso-8859-1?Q?3bNXpG6sJz2+xw7lwn6yzOT8sAqdgmCOia9zZ+qfU8C6hJsPNC/cSzCj8C?=
 =?iso-8859-1?Q?XGqzRaLexI7B4aF47s8yrfiVoh+AuhTe8s7f1uVjQec1VSll+tBpK/V3Ep?=
 =?iso-8859-1?Q?CbUKTTwRFLYKExC1+Zsw8L6ibhyq+u46AYw/GkQybMqcZzS+tVRNmIguwr?=
 =?iso-8859-1?Q?EUa0SvXd5UVvV7uOA/s6ZVeZ2FCRzMd2xxdL8t1KHCAn7wccJrWsFKoO6p?=
 =?iso-8859-1?Q?oujFJP46/s4itpzEgFCAE07liB9Y+Oo0Qa9+5gC6wx8el+V33f9FsM2kNy?=
 =?iso-8859-1?Q?C5ryweucNIFhMw1/hKAzunFCG/eL90LqvEWOAb2lA7nUDwDGVPwq0lDczg?=
 =?iso-8859-1?Q?BGUoy/JiyVL6LcCszWL8DmunuEBSszWBwaekuRNHzgUHNrcHg9fGmyaqet?=
 =?iso-8859-1?Q?8eDMw/+aIF7AuUYt9q2TeEldChMsFxwr10ahPI9hacE1GGwubyHD3tUju7?=
 =?iso-8859-1?Q?TOkVb8rwnyS71AN9b7QnRCSij3uGsh9iK6gBJT0EbFA68rqZxb5cjpzT0X?=
 =?iso-8859-1?Q?SpphO5THFZsY1nBqEtnYnlqMYCLOhu/fnaiVeHeNZRcMqoNpWOabvrZnNc?=
 =?iso-8859-1?Q?7ePsKX+FQLb1a9YVDzNA/K8wdwe/FDP0rW2EioWpL5/JEuVXawh5val01R?=
 =?iso-8859-1?Q?7gLY6aWuk36+BYZIzKYgv+d6Ty9sJIYI3+ZNA2cIPCDGMUdd5TgDF/vYyQ?=
 =?iso-8859-1?Q?GhN6HmBzDwCXKzEUGTn61Oy/eVpyZlXwNvj8RHLyH0vndMr58UChC75BZi?=
 =?iso-8859-1?Q?y49WztsjLhe4f56k/9GffHrhiY5OlSbJQcbpdIIr7TeyuOgwMhrm3tcDOY?=
 =?iso-8859-1?Q?SQClGcRCB7x3Yr+4tXDDNUMowk3PPf82M5+GyWmcwZBbfqW0Pfet3r9YRE?=
 =?iso-8859-1?Q?N7ag2qI/foGP652oQQ/8IfIARXYqgxjYvI4tLnb+/OZc9zywUQLxvniE1I?=
 =?iso-8859-1?Q?8i5RXRtEGZAiJh1OMjy2QsXTq6Nf09jlm4q06g3/NQHeBXQ0w7Xj9TAX4k?=
 =?iso-8859-1?Q?JuS2rA4uW68GZtawPmeedTHKUFgN9aXIxFAiZCkMW+FYyo0FojD8sIxSLm?=
 =?iso-8859-1?Q?7XQE/Wb3Sgab4yNO54Owr0CW6qCuzRgKqg5DQ0/nmQB8MhSP4/J+l5YM8X?=
 =?iso-8859-1?Q?kPHAxm4XufKO1GtMxAIxBIhNcmkOKlHZs0c+cKobgYUjjbid8OtdrpYxD4?=
 =?iso-8859-1?Q?xahc8+lsslxI9WQ18i6KDgjW1TyjgiL3utw2gktib7Jj2VnqkSPgtk7asa?=
 =?iso-8859-1?Q?pPvcjLtnNi0R5OtiSce8ryTGRKbXghL7trYh5VGpNQ7K8iAZbqijIg2yv/?=
 =?iso-8859-1?Q?ZQUttf0tvbyYw0c+Ip8iyrkFMLB5I1IS+hn0VbhssUil78TYk4sJ8BnZN+?=
 =?iso-8859-1?Q?S7aUqBUDCgfc8biEY59kVTONUPLkIqUSjG3TNf2ZASo0Na+FXfn0F5W2JS?=
 =?iso-8859-1?Q?NUkRjBBG8zo1JoR1GBOugrpSXupj62j6JelWdYmcdOiHh/U+Z24K4xYaFS?=
 =?iso-8859-1?Q?u/NKZYzP9Ykn5iVI9PAu8IdCLL4eU3m/WsGaIgXU6PxeA4zODGk19jpp5Q?=
 =?iso-8859-1?Q?Ny0rmIEs9fzGi2Hn+ZuEaLCt/FAPeDzKkNgIgb0BQv5HGT5WOaqobSwoaf?=
 =?iso-8859-1?Q?kOZfdgHiIZulA2tv5cn9cCP26KT0PbQ=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cd2dd4b-a672-47bb-9c74-08df25d02351
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2026 06:39:58.5454
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ESVSh+0Zj+hjf3j6gYKcMqouBAd7Bk9xxV63SIFxXpI+BwHTkwlHL5vWC29ML3JWM6xWrj/dfp9If88Sr0BmqQOAfjZ1M1awpillzA4s9xY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB1150

Hi Sakari,=0A=
=0A=
> - Use dev_err_probe() instead of dev_err() in probe() path=0A=
> - Don't set event handlers just for controls=0A=
> - Don't set HAS_DEVNODE sub-device flag=0A=
> - Coding style improvements=0A=
> - Use container_of_const()=0A=
>=0A=
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>=0A=
=0A=
Reviewed-by: Tarang Raval <tarang.raval@siliconsignals.io>=0A=
=0A=
Best regards,=0A=
Tarang=
