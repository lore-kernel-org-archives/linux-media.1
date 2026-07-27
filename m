Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazon11020092.outbound.protection.outlook.com [52.101.227.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB95515E5DC;
	Mon, 27 Jul 2026 05:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.227.92
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785130628; cv=fail; b=R3Vgw/omYrqOtn5Pt9vaexpcYnwdSMJ0jOU4N7udrjbxPTyqXoK132eMs0HEjWED/kQCciUWMffrfimfJy/oEGpXZ54+po0xz6va9ZjidPafzpjX8k9/iqEbOE4FOPu9d42BxGBzOTystk5skE5idyIBZ9MzOfHbuLM4ky8M9kg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785130628; c=relaxed/simple;
	bh=niQPviMxgUcYe+1o5W0XO2L93beBUWM01UA9oHF7D4U=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=e/Ge6SegPCwbs1H6LrQvMF0ue0LcZEmQMhNdebiLw7l63C7F/EgLuLQYzzfmoLROlDH3Vc89mLFrHKsoa4dttxvQFDEH+MWTR6q8l4HmQ5eO2jlJMB0oFv/QWqBk/QOO8AXHFPJgACp3+2nHQMTngReQhEzHEL+l0zSOYGEBbVk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=fail (0-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=aAsMocya reason="key not found in DNS"; arc=fail smtp.client-ip=52.101.227.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="aAsMocya"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TSobZ/5wzI5FpG3Lo7sI1uMKS8++advZLCf3mEwDO3GHbIp05QhnuTc792EvvsuFJYEkX2OuzPXVbTxjOrOwcVoHOXduVi89q1q2ydohsQMkbZGYtMdkYyITcqJ5WFCkWtHk97c6ByDZFt6HiLbf4KpB6UViGFRdMhB9dXqNYybTCRPcXucfIalv1KU5dTcoM2HXaHKFzwcRFOHMQXg1gG+5yrhWlpAShsLOh49sYE9TP65uA6DZ7t5raSMh4EQNV1WnXU6Hn4w6YnZVI3k0z5O8vLYMxZV/PZ9MZsBVZtWRXDRGs2vA3FLy9xHp146fcRio3mwyc/HAKmgYg/i6ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YMHRrvMJGnNUQp/8sWTu/uq36EHarSBVXYBQSC9xhT8=;
 b=si0fdAEVjfnIE15erO68io5qFDg2qYeupJHHTmJJ+mcXBLPYSeDo4mkn1VFHV1w2tXYagaw1lKDmu6O9eXxXWbry31i646v8/sz9G4ik+6aEU9lJK0Zj832dsskPP9DzfitQX1iq1I2eoz6DOvcvxqBHoVLKwtlGsMRCgrhVCSHeBHk35WxCLXV/VX6QITsc3DYcMlMMPfhuGnDTlQTEYUUp5aa35awfMog8VnWHBFw/gB6JnyutpJQ26qpQ6W3QbHsvwtwBY6E94eB93odZ2/W1b7HiIic7mzacZdpwSpLg1/ylFyZmTzlGw2Awve4EoisW7Upoe0GKeAu/whCZ2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YMHRrvMJGnNUQp/8sWTu/uq36EHarSBVXYBQSC9xhT8=;
 b=aAsMocyadoW6JqgZYrSKpHOGp7vap5Rle3Mu0YFSx/qmCUN8kKBz3YnUrUQKWmw1aN5ORg4CiNzHkE1oVHSK6hu3+igfIvpEIIny5qe1ehWxDYtngyfP3jtV+pVY+NYnVGYqp03Lc0gJa//iJD9oogtEIIuI4YWsFAXyBnzTVXkE90Nwlk4AAjDjnOUVE1Q6ybbl2/zCmjwT8C76zraC055OA1d+Y/Zm0rUIeH6JQ0t7xnKBOaG1hfiJQT/LJ6dP+oxpZZVs1PHytXrVjCR8Fy0Co3/J9qMoB7+PHuRoDiOs3rVHrCkZyXqzqYN+/6yAyGrReDoDdrr9u8DYZlWxEw==
Received: from MA0P287MB2178.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:11e::14)
 by MAUP287MB5260.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:1c2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 05:37:01 +0000
Received: from MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
 ([fe80::f8da:c075:cde1:e167]) by MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
 ([fe80::f8da:c075:cde1:e167%6]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 05:37:01 +0000
From: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
To: Jake Steinman <j@metarealtyinc.ca>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>
CC: "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
	"mchehab@kernel.org" <mchehab@kernel.org>, "hansg@kernel.org"
	<hansg@kernel.org>, "bingbu.cao@intel.com" <bingbu.cao@intel.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/2] media: add Himax HM1092 monochrome IR sensor support
Thread-Topic: [PATCH 0/2] media: add Himax HM1092 monochrome IR sensor support
Thread-Index: AQHdHUf49RF2TPyUVUS4HcuEC+iOR7aA2R36
Date: Mon, 27 Jul 2026 05:37:01 +0000
Message-ID:
 <MA0P287MB2178567FE7F591B4268D1EB588CC2@MA0P287MB2178.INDP287.PROD.OUTLOOK.COM>
References: <20260726214401.19042-1-j@metarealtyinc.ca>
In-Reply-To: <20260726214401.19042-1-j@metarealtyinc.ca>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA0P287MB2178:EE_|MAUP287MB5260:EE_
x-ms-office365-filtering-correlation-id: cf20282a-f0c1-4b3c-a4f8-08deeba11567
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|10067099003|56012099006|3023799007|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info:
 kIqfHe2p56pCkDAfoyNguFEKRP4Kfvb5lLlY2wto31CQRqOfjpQ6cRhdul0CO+yEcdJM3j5KBmej/O+SdCD2ugk4fOdhl7oluBhY7HrW35byPb4X6XqJv9fsEJsqmXmG1uThcaWQ1EdV3HweqUSIgC06RzHbEUIIVdI8M/yLb+JKaUG1YVZ36yFMdiYht/YMcUmi8bhqAKTKWW6TSgKev7EDwLJqeRFrzHM688P3RtgfEMcntaoxoarGDseEiH3q/NlWxGugqyBSJhKti48OKjcLpstE0787NGpuCTJV4WJyXbPtH8G0SsVMM27TO053UcbNz+uhyJWOJXQL195M2+8T2LoGQpnOBUYAjrc3p/s7xwKWhS9f24KbhX5vIdg8E9gVFcgRnk2qloX0U+vYUjbSurJ2tXXhJE3RY/MV8PX/jZ4m9ahzatr6oiaNB4JftLIM7oZN9QL1QeSclNIJV6mFyy5n3C3HVVJWgbBqIYwfF0uL3zTBixfZEZphy/eGlSIpT7gUEAJksUR4EyvMmSXqPKZLKVle95bFVCe0uZEoBntd09qmKzp7WEm+YcQVGuLSHq3877m5xBA8uhSK6zqZGIV3lOCBR8FsYZOayaFeasak6ZAmuHwsAfOjngJfd52MuHfHUaPcyipZj9MCXJmk7RIVap9K5lpSjoYci7gwWgPnLBFPtKEvqfs4GTrb2xjmHC/rjz6zQy/TONtJzyCACjjtio1ixoVfQCEcI4k=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA0P287MB2178.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(10067099003)(56012099006)(3023799007)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?wbG1J4JxFgS/UZEzzr0WpXUhH7/o0p0Z2FP9WmQ4ahdrfBKDkiDURelx3o?=
 =?iso-8859-1?Q?J1QsgrEF04d+wwUjAIMweEaPlpDzbHNOG7drRgthApwuM+tanwuVRWJouN?=
 =?iso-8859-1?Q?VpHr8QSsOSLuQcniwAaqXAvJKkFCHkrB2WWfAlzCs8ivUjRiNlzhUdzGyL?=
 =?iso-8859-1?Q?FI7MXjIhgHpcSA8hsOLo2APuJ1BBnqQXW3KjQrTMuFXZkUUyiVajGegzpf?=
 =?iso-8859-1?Q?TFr3Uz9SOb1eUkNmWB2qbfe7hQMY0dCVXSBUoNWOwp31SZjfW6dnDPtV7F?=
 =?iso-8859-1?Q?w+L44NvrbszmzlR1Zkp/OTNm+zWFWSaI8Ht7n6U+lM6GTH5VQpocIhR1mo?=
 =?iso-8859-1?Q?YWHUY02Woc/LT/PSxjZbnDVqLv/vSW9xcgJIUKEtyZ/lKF26LWsW0VFPoB?=
 =?iso-8859-1?Q?hTVoYmcBSbuuKkDnIgzGuVpOtAwtwZ8yBubaeESLg0sIKtoLxSBpa+MXTe?=
 =?iso-8859-1?Q?kel2awSexCzyA5DX+Yf8fAFtcjG31MQtkOY0HyNY1zTIOB+Ew/s56Kjn+w?=
 =?iso-8859-1?Q?05G3U2Cdp5kzlz5f17rK6l7D/vVAjI+cnfJYcP/JOB8Kj/31LsEAyvj1+U?=
 =?iso-8859-1?Q?sk8om7pQRDx/DdDIJhCFrNgygPoGMaClqnuIDlKwDQEe7E4ZULK0BwkePN?=
 =?iso-8859-1?Q?ZxLLeJGvYRZamDQ7RabsCfdOx/TJ5Wf9hLbH+VGNTEzc7ladTwPCfqi1aj?=
 =?iso-8859-1?Q?dp8ACpDBzdM+hI9LAsK4EPWLOZW9JgYef+zex5cMrmlB+mN50chEf5EVev?=
 =?iso-8859-1?Q?H4AgN1mQVk+StidkyWvYxDtf3cVPadY40Vsm+LSZnOesqvsJBVPQgL+6BR?=
 =?iso-8859-1?Q?a1DFYN9GA0KjwCr4gxByoDuONTAKR3d+rRl2jcYp+t/6EhOZ+gP3czt+61?=
 =?iso-8859-1?Q?+mQftIUqFsLh5tARrd9XnUNx6FKNwHZX3/Kb29HxsoN7x0FkFpnpUw+RmM?=
 =?iso-8859-1?Q?CeZtfhZX48LwMOEcfLG9CFq2Ri5iBmhUiB5mv0Ac+Zg/NEICJNCjiEC2ka?=
 =?iso-8859-1?Q?D6jGSQLueQbvuXqTBLNF9xQD9hpRsQiOBnBy+agQEzv+dhwsqiJObHn2Kh?=
 =?iso-8859-1?Q?qMZOwEAu4sxq3G7NEfNxb/kHDAOQ7DU/gc2E1f+gKKnUKmZYiU/RvvuK6p?=
 =?iso-8859-1?Q?ohsuclNt/kEtQ5eWT7OfN2t+j44bhI+wiPL2SH8XbVflisS3B0gPTp9RHA?=
 =?iso-8859-1?Q?pZbCwEK4+KSvcA+CXEn1eBt3MILnV5YVvS8948h4yuF6zWe1HAhEWzZR99?=
 =?iso-8859-1?Q?eonf3TXg+OtsOv5kxmXNrzzY4PwaxPwodL9xNTX4axivaM/pD66o5wR+dN?=
 =?iso-8859-1?Q?fvOPUJjJsm/i38I9JHUqTOdz3l8j4eH1vbV4m9GM4H+sLs9ygYeqZBF2F5?=
 =?iso-8859-1?Q?jFXSjIvcORmRrMmNaxHRxAdgQDI94vh4iviPBTqJImWWZxOq9wZVlkBc4i?=
 =?iso-8859-1?Q?RuR37eWegtr/dU/0SO+D5/gDaSRrn8nRWw3UKIV3zewuui4fZghvLZSj/U?=
 =?iso-8859-1?Q?rivWf92g5Y+xa/K6F+0g3AVZZjHab/QElrqja/dqofnOVy5vKRCP3BV2mk?=
 =?iso-8859-1?Q?7+z2dsUwy3goaE4+mD/wRsZEIwWHJgBrfhOvPbxQUG+ASUa4n9AVHlpM5V?=
 =?iso-8859-1?Q?12oDUPDRLJ6lnZeFcjACScHKEypwyYmidjEaC955UatqiUzeToX5MAaIKN?=
 =?iso-8859-1?Q?sVng+7sA1gAyEFDOqL3PZttTPrbD6iZIpNcEhyqzKvygSLoGk7pnoewVXs?=
 =?iso-8859-1?Q?11ckOBIzo478EdQIXvb6PpkELru4Vziss8VZHxCgJYbt3u8IKCdZZpp6vr?=
 =?iso-8859-1?Q?CZMnALZhoymanuYxpLY/Ob15dvV7BgU=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: cf20282a-f0c1-4b3c-a4f8-08deeba11567
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2026 05:37:01.4330
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OFA9dMJWXMPxGHlP8RL9U1ATPrjiwkmJCjsLZi4dbPFnh9dZZanFYM4EuzQP+FNEMLfsw3GV5aWU6T8LaJOp9JcKEFyCVS8fyOnACWlo/HJuPLkJzFslgnulGe9y2AZq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAUP287MB5260

Hi Jake,                                                                   =
     =0A=
                                                                           =
     =0A=
>This series adds support for the Himax HM1092, a monochrome infrared      =
     =0A=
>image sensor. It has a 1280x720 pixel array and a single usable mode:     =
     =0A=
>648x368 at 30fps, 10-bit raw (MEDIA_BUS_FMT_SGRBG10_1X10) over one        =
     =0A=
>MIPI CSI-2 data lane. It is ACPI-enumerated with HID HIMX1092, sits on    =
     =0A=
>I2C, and on the machines that carry it provides the infrared stream       =
     =0A=
>used for face authentication.                                             =
     =0A=
                                                                           =
     =0A=
Looks like the HM1092 driver has already been submitted by someone else.   =
     =0A=
It might be better to add your patches on top of that series instead.      =
     =0A=
                                                                           =
     =0A=
LINK: https://lore.kernel.org/linux-media/20260709-hm1092-driver-v5-0-a1f5b=
aa6fe08@gmail.com/=0A=
                                                                           =
     =0A=
Best Regards,                                                              =
     =0A=
Elgin   =
