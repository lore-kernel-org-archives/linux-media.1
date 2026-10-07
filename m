Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazon11020094.outbound.protection.outlook.com [52.101.227.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 116034C10D8
	for <linux-media@vger.kernel.org>; Wed,  7 Oct 2026 15:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.227.94
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791387608; cv=fail; b=WVqTui72rUj0qKUQkpsqwK8X2JAMCOzU7t+8h0g3amPwaEh2oJ5f/azVA7KuKOcggerFMlk8UTO1y4zhqtlxc0K8ENWFBhZMDrRoprKVLfFsL63q2QON7V8r+b95F3rprJb1fppv0GUmCMeMnxUKeCh6pVw5B6v/smqHvqkPa2E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791387608; c=relaxed/simple;
	bh=pk9De1HrxhPsFQHwbyNhmCE5mDQAGa6/KoM1+AA5MKQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=YylWXjv3mvpfqg/NBZpsFbJyoesV4zKIDvp/1fC0kQeTpGbpIQ5tW1CXWbyh1cdOn1guxijLUU0hhtkSndAwfL4x8WtZgiBxABvTpYLe3vW02xPKnuPKjz5ICTIMLN/mN27DMwRLyN+Vc1e/NWKzbWcjU+kaaAiOdQWVxEMqnNo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=celFSUbw; arc=fail smtp.client-ip=52.101.227.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="celFSUbw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vk4QwI8FBWBiDAAPd45BRT2gv44ndp99C7g4RjDFynZVt1Mc0ig9fyCON+Xde2kMabX9myMs0j+KHK//G8FRR9JYlaIXAGc1VckvqPh0EfuGdppZS3ZU07v34+9RvUWbJKcaDAN7f20tVYWfgBbCCCKAlLutI1BE9A+JzCcAM+2cGadMn9w8QC4FFqF6JWCbbRqCbblAbGPEsFnFANXOC09hpS1bW0Uxtr+gc3hFQKdGCZXCPoAlHPsPGoR9Cgb5773Ypa6iVhrYDMrsarLqCqI0I3VKVMFsTSKpe5wizOLAuY7lFFK4xQyGFghGEDlLebG0VNma2M6pJTbMrMSOlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZX+Z4AXd/8Ni7GBaT9be8pBlIxDEBftGie1XPWB8TIM=;
 b=ihZ8ZtfyGeqFHKf14kgiJdEpDqfL+XuAatZrowsG5if/TfQ9OdIXRmRM8v6i5pQp11Hrhk9fxwcYcbadc4MgvHb28y3PBU5xktt+Ea7bGBp2tQdMY39HAhrfqp9sxIT8Q1Es8qv2/Wk7AUg+ddCd4jnFSC+kJpDE1tMQqw4n4Y8rBrYkwyPtwrhX6uIHL328dXPJYXRwcwwR+MvHtz+Z1KF+QjBC3D+qPboKCao20P4q5YMeErmv8lOpWN3U050a7fELbwe7wedTaN2qd1jJyi9utHeFHEp6Da1U/cWRuJ9VpkLrQTTArSY6/kMvdIeumg6flXeUklltuuwAWX107Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZX+Z4AXd/8Ni7GBaT9be8pBlIxDEBftGie1XPWB8TIM=;
 b=celFSUbwSqWzOcEzrsPd5pA3ZDYPiUgq67bxJgMNgZgnv6JedtADOZJwSZBiKvoIgMPQy9C0sDW/9ahu0C8SYo1ij4X84OJHIlNXgGym22w8qJHg+UyTmhmCUT9qttiYYOuaVwfFqhkUu4+a/fJbdGNjePHWOftdbTVRBEAFtC5uRxQbSymVftn74tdZ0WwM4wazMIlZ1GtwptE0A1nab6M44Ogi6mF8/3h3YZC9JC6N90aBkkeY65IKXHUNP60Y1YvssZNJe8Jpo7wCk9egdseIOHqfhLf+DOhM3xuMrWoxF/lfKh2GXbpRBL+25y6G2T9Gg4riKkDJSCZZw1Xw4Q==
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN3P287MB0259.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:d4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Wed, 7 Oct
 2026 15:39:56 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%3]) with mapi id 15.21.0496.010; Wed, 7 Oct 2026
 15:39:56 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>
CC: "antti.laakso@linux.intel.com" <antti.laakso@linux.intel.com>,
	"hao.yao@intel.com" <hao.yao@intel.com>, "dongcheng.yan@intel.com"
	<dongcheng.yan@intel.com>, Mehdi Djait <mehdi.djait@linux.intel.com>
Subject: Re: [PATCH v3 1/1] media: i2c: Add Omnivision ov05c10 sensor driver
Thread-Topic: [PATCH v3 1/1] media: i2c: Add Omnivision ov05c10 sensor driver
Thread-Index: AQHdUWxJYfLOBUcopEeQ8kMYWt6TzrbyJtAA
Date: Wed, 7 Oct 2026 15:39:55 +0000
Message-ID:
 <PN3P287MB1829F9B24FB03D373358AF358B942@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <20261001061250.37734-1-sakari.ailus@linux.intel.com>
In-Reply-To: <20261001061250.37734-1-sakari.ailus@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|PN3P287MB0259:EE_
x-ms-office365-filtering-correlation-id: 7b336d31-cdf9-4a12-31b0-08df24893cd3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|4022899009|376014|23010399003|1800799024|366016|6133799003|22082099003|18002099003|10067099003|38070700021|56012099006;
x-microsoft-antispam-message-info:
 tMcOAKts0YC1hx+2rB0g5XUuZFxKzP46okBa1NV+3aIIbKFXuWcy8pVdKPxRsGIKrfmrzYLDhupQmrrpkJFs+mZmJcs3dLNiuvNZbS4vHb9sCF1ba1jB4XjlOSsbukrT7piN1huhSlAXoD1syUPsdaK3s8Cv3zR1viP6806idiMHNo2i3q5smugerjWINLI1JfUdYAGFPbPOcnirF+Ss9WK3uH/Pow4eLzYJb+1jKyZX3NLm8NLwSugKMIaqIZptTgdahy7QSTCqCpANDgm6V2iUGjc4tPghIMAAxopaDOxhQgaacvqwVbryMWAApppoJohaSYpvh/jRG/Yh8XFvnxk0+5Olb4Er1Py6u9pqCcorQ3Pe4dnSddoouVsMP+Y9uWgtLPqDEKqzEVcsLuecXM5FR/KDlaBlKISoGdzCp7Xhh7CZZizOp4Mw7NgvSIuQVlK2EVUbguCJoGldq2QRdUnmSl7Olh/80MdXe/wL4z7B+abi+/QP3pgSjBb1IR+SvxSY5BXrWUoOqS/Z/pXmf8K/6AJBfzwRSQhhVtkVo0jVPxOAOOADjZ0+L2wDX3jTNOSsoBWHDqmBc84iLGBc9aZTiuY6F1onNHFtsfWorE8NmKoZTlB2Z8Tqut0egqyJZ6ZMpVSBMLUlUk6BMCDIJXHsA2Mxjtjoq8Y6xG0jB3sQ3SEyFkMD45I+MJ1cv6lOWee8QI/d3el4B0+eIgPsmb2d8Ay7SlL32EO7UIr53Lg=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(376014)(23010399003)(1800799024)(366016)(6133799003)(22082099003)(18002099003)(10067099003)(38070700021)(56012099006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?tB+WiF0DpfkNDwfPNJbWDG91ZySCG/3EcpUdYsJaCSWc+BR39xha52ZqfX?=
 =?iso-8859-1?Q?wtQvuZCp9FpfoA6TO6qaEM6anaYL46ObBoRBEHGfxzgsUH/DxnPmTNQWHD?=
 =?iso-8859-1?Q?XwY4qCwH0TfMuKfKHWvzkEOarZl3LvUsjF/Agu0Gilduj3U3x3pQl1ZnWu?=
 =?iso-8859-1?Q?BbJ+RlavTT0zkQcJAJPiITe6FVWAO31kcF36uwuCZTlO/yFptbzIyN8n15?=
 =?iso-8859-1?Q?PEfHIz0G7ZMbSQR+FXRMoK39/HHM/nxghWQsJEHKuImavb6DwqryB2oijY?=
 =?iso-8859-1?Q?ARZSneBv671/6z7M4zjxBYvOA07rwIhSkaXdyR+mnklqmgRjBIl0pBgt1H?=
 =?iso-8859-1?Q?SXbN28ZCX3PttocubmsRRz1fjwpV0oQMFBqjyO3vdM8WN/MKH1RUDR9eZ5?=
 =?iso-8859-1?Q?aR5DkrYpqjAktu/uZoEjw4UsjzCKAqmUhXge+mwhRpE7amqJXwgBxaT1ep?=
 =?iso-8859-1?Q?VGDS8CyemlrPZqeBchIBpPggYwU1I67b3675Oq1zC68t4s8DdF1NqSsO5M?=
 =?iso-8859-1?Q?NUYnd8ECHxOMtZjILlEDduPPG8yWPnrCJRgxI0hEOhQpOJWFN01cppOhRo?=
 =?iso-8859-1?Q?UjJJnbSjbeQgKAp0qgkHvTTZbLv4P+QJCPtS+0kYWlaV1/SKWoS/0uiLFc?=
 =?iso-8859-1?Q?RSqfOa4STwnyTrQLJwprw9jUJvkuqF6c2G1/rr7D5Ykzxmtl+vIrhPUSqP?=
 =?iso-8859-1?Q?whYIIZoR6/qsrW05+cE4jnwq9jbniUanClOkVdUFJkiOljTYtL0NTixbQu?=
 =?iso-8859-1?Q?xOt1e6oLC9wWYIN9h1/Qhp70oVY+ydaRDxdSsf5eyPBLKHy+UwsmGRB4/k?=
 =?iso-8859-1?Q?5KQSgH0VeIbZr9126oL9TiC/pyAoKOtOJRarFGl1c9on/MWK3COD7qG35R?=
 =?iso-8859-1?Q?XVtW+14t8MVCe55JhgLCLvbBKOpxt22GHKi5OuKVVchv6iki4glj/Dh/+d?=
 =?iso-8859-1?Q?zCLnZHPAoCr8IXcnqR/2fakxr/A2iSzN656jN1XCps2bsTMEctJtm6/4+F?=
 =?iso-8859-1?Q?co/IogWCiwr5RosNuxw0STx96+YeVYYxAXLXU82cTKqfkHxC7WVKuuQ4z+?=
 =?iso-8859-1?Q?ANmKkSvkxk9Zl02EDCJl+fE5FqeByzBmDuxLfQNFKavcCHc0820DidAO8x?=
 =?iso-8859-1?Q?6bMyPlt2UPgRvkwOuUqWe3dVTTxbbgKV7DV+gj9UZD4ey2IyjkSObKd4x3?=
 =?iso-8859-1?Q?AKruBd46JrwxHyZa7UQjIObNLf6X/W2p2HmmMrVI8uLiUbMRkZsd/ZMeP8?=
 =?iso-8859-1?Q?PGuOws6GjTp/FfoUF228Ps8YqB9ckFowNRfIrZR+8vIOA/UGhMkw7qBc7/?=
 =?iso-8859-1?Q?nnuH8bP2rU0NO4twN6qUsB+dVy6aQqgBZMKmF/CvAmeWBgxvwa6UV1oHSc?=
 =?iso-8859-1?Q?PBMhXiw4d8DhpiUr8fWhDxPIsPKUVztT6MGyqR9iy2a/LM0jo7EykzsxZD?=
 =?iso-8859-1?Q?/w8y+BTNOvMR7ayFA6CQGKsbcZVtf+9Q1iJvaIXJ38oF8E7NVs8kh4qavB?=
 =?iso-8859-1?Q?wA9USwP04v7u6i4jxjNKG0OKVEyEy14VdXlhANn5nZVzHzdj69y1WAcaC8?=
 =?iso-8859-1?Q?+4OU+sF/Uvt3ctqoWeLKfsTTIWjgYJQUmLkzuczSNl2X5//5iMR+x2XB/E?=
 =?iso-8859-1?Q?zq0gWi+gWPmp1QXazgzfZXAVPMzOE6TDSQjtVvOL9oja5xta1jtVc+X0e6?=
 =?iso-8859-1?Q?BVRxQwf1NJagJ6x5vsKNOcq3rh1Occwk38WfIZH21AfiuYEmWLFkYjHSnG?=
 =?iso-8859-1?Q?yGRYca39KwA3dB+D9N8rdDRg80j16Z1Iy94pSvC6Vz6yuCxjwr6ywtb1ry?=
 =?iso-8859-1?Q?xb3bnDoO6Kszfl7m4vPsr7q/PZNqvBI=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b336d31-cdf9-4a12-31b0-08df24893cd3
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2026 15:39:55.9145
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mVejC1oOoIreSI8JKTLaITG8iL8DA9r3aS8S16kikwr9eZh3ckv2kh9VFeapPaREljede5bLlhq8gshgXOar/fPRdM6DWaaDddNud3jeDcs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3P287MB0259

Hi Sakari, Hao,=0A=
=0A=
I identified a few issues. Could you please check the comments below?=0A=
=0A=
> From: Hao Yao <hao.yao@intel.com>=0A=
>=0A=
> Add a driver for the Omnivision ov05c10 camera sensor. This driver=0A=
> implements a single mode only.=0A=
>=0A=
> Signed-off-by: Hao Yao <hao.yao@intel.com>=0A=
> Co-developed-by: Sakari Ailus <sakari.ailus@linux.intel.com>=0A=
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>=0A=
> Tested-by: Antti Laakso <antti.laakso@linux.intel.com>=0A=
> Reviewed-by: Antti Laakso <antti.laakso@linux.intel.com>=0A=
> ---=0A=
> since v2:=0A=
>=0A=
> - Added missing MAINTAINERS entry.=0A=
>=0A=
>  MAINTAINERS                 |   7 +=0A=
>  drivers/media/i2c/Kconfig   |  10 +=0A=
>  drivers/media/i2c/Makefile  |   1 +=0A=
>  drivers/media/i2c/ov05c10.c | 978 ++++++++++++++++++++++++++++++++++++=
=0A=
>  4 files changed, 996 insertions(+)=0A=
>  create mode 100644 drivers/media/i2c/ov05c10.c=0A=
=0A=
...=0A=
=0A=
> +#define to_ov05c10(_sd)                container_of(_sd, struct ov05c10,=
 sd)=0A=
=0A=
Please use container_of_const.=0A=
=0A=
> +=0A=
> +static const char *const ov05c10_test_pattern_menu[] =3D {=0A=
> +       "Disabled",=0A=
> +       "Color Bar",=0A=
> +};=0A=
=0A=
...=0A=
=0A=
> +static const struct cci_reg_sequence mode_2800_1576_30fps[] =3D {=0A=
> +       { OV05C10_REG8(0x00, 0x20), 0x00 },=0A=
> +       { OV05C10_REG8(0x00, 0x20), 0x0b },=0A=
> +       { OV05C10_REG8(0x00, 0xc1), 0x09 },=0A=
> +       { OV05C10_REG8(0x00, 0x21), 0x06 },=0A=
> +       { OV05C10_REG8(0x00, 0x11), 0x4e },=0A=
> +       { OV05C10_REG8(0x00, 0x12), 0x13 },=0A=
> +       { OV05C10_REG8(0x00, 0x14), 0x96 },=0A=
> +       { OV05C10_REG8(0x00, 0x1b), 0x64 },=0A=
> +       { OV05C10_REG8(0x00, 0x1d), 0x02 },=0A=
> +       { OV05C10_REG8(0x00, 0x1e), 0x40 },=0A=
> +       { OV05C10_REG8(0x00, 0xe7), 0x03 },=0A=
> +       { OV05C10_REG8(0x00, 0xe7), 0x00 },=0A=
=0A=
Multiple entries for the same register value seem unnecessary.=0A=
You can keep the last entry only.=0A=
=0A=
I can see several similar cases below as well.=0A=
=0A=
> +       { OV05C10_REG8(0x00, 0x21), 0x00 },=0A=
> +       { OV05C10_REG8(0x01, 0x03), 0x00 },=0A=
> +       { OV05C10_REG8(0x01, 0x04), 0x06 },=0A=
> +       { OV05C10_REG8(0x01, 0x06), 0x76 },=0A=
> +       { OV05C10_REG8(0x01, 0x07), 0x08 },=0A=
> +       { OV05C10_REG8(0x01, 0x1b), 0x01 },=0A=
> +       { OV05C10_REG8(0x01, 0x24), 0xff },=0A=
=0A=
Use OV05C10_REG_ANALOG_GAIN here. Also, you can remove this=0A=
entry, as it is not required.=0A=
=0A=
> +       { OV05C10_REG8(0x01, 0x42), 0x5d },=0A=
> +       { OV05C10_REG8(0x01, 0x43), 0x08 },=0A=
> +       { OV05C10_REG8(0x01, 0x44), 0x81 },=0A=
> +       { OV05C10_REG8(0x01, 0x46), 0x5f },=0A=
> +       { OV05C10_REG8(0x01, 0x48), 0x18 },=0A=
> +       { OV05C10_REG8(0x01, 0x49), 0x04 },=0A=
> +       { OV05C10_REG8(0x01, 0x5c), 0x18 },=0A=
> +       { OV05C10_REG8(0x01, 0x5e), 0x13 },=0A=
> +       { OV05C10_REG8(0x01, 0x70), 0x15 },=0A=
> +       { OV05C10_REG8(0x01, 0x77), 0x35 },=0A=
> +       { OV05C10_REG8(0x01, 0x79), 0xb2 },=0A=
> +       { OV05C10_REG8(0x01, 0x7b), 0x08 },=0A=
> +       { OV05C10_REG8(0x01, 0x7d), 0x08 },=0A=
> +       { OV05C10_REG8(0x01, 0x7e), 0x08 },=0A=
> +       { OV05C10_REG8(0x01, 0x7f), 0x08 },=0A=
> +       { OV05C10_REG8(0x01, 0x90), 0x37 },=0A=
> +       { OV05C10_REG8(0x01, 0x91), 0x05 },=0A=
> +       { OV05C10_REG8(0x01, 0x92), 0x18 },=0A=
> +       { OV05C10_REG8(0x01, 0x93), 0x27 },=0A=
> +       { OV05C10_REG8(0x01, 0x94), 0x05 },=0A=
> +       { OV05C10_REG8(0x01, 0x95), 0x38 },=0A=
> +       { OV05C10_REG8(0x01, 0x9b), 0x00 },=0A=
> +       { OV05C10_REG8(0x01, 0x9c), 0x06 },=0A=
> +       { OV05C10_REG8(0x01, 0x9d), 0x28 },=0A=
> +       { OV05C10_REG8(0x01, 0x9e), 0x06 },=0A=
=0A=
...=0A=
=0A=
> +static int ov05c10_set_ctrl(struct v4l2_ctrl *ctrl)=0A=
> +{=0A=
> +       struct ov05c10 *ov05c10 =3D=0A=
> +               container_of(ctrl->handler, struct ov05c10, ctrl_handler)=
;=0A=
=0A=
Please use container_of_const.=0A=
=0A=
> +       struct i2c_client *client =3D v4l2_get_subdevdata(&ov05c10->sd);=
=0A=
> +       struct v4l2_subdev_state *state;=0A=
> +       const struct v4l2_mbus_framefmt *format;=0A=
> +       u64 vts;=0A=
> +       int ret;=0A=
> +=0A=
> +       state =3D v4l2_subdev_get_locked_active_state(&ov05c10->sd);=0A=
> +       format =3D v4l2_subdev_state_get_format(state, 0);=0A=
> +=0A=
> +       if (ctrl->id =3D=3D V4L2_CID_VBLANK) {=0A=
> +               ret =3D __v4l2_ctrl_modify_range(ov05c10->exposure,=0A=
> +                                              ov05c10->exposure->minimum=
,=0A=
> +                                              format->height + ctrl->val=
 -=0A=
> +                                              OV05C10_EXPOSURE_MARGIN,=
=0A=
> +                                              ov05c10->exposure->step,=
=0A=
> +                                              format->height -=0A=
> +                                              OV05C10_EXPOSURE_MARGIN);=
=0A=
> +=0A=
> +               if (ret)=0A=
> +                       return ret;=0A=
> +       }=0A=
> +=0A=
> +       if (!pm_runtime_get_if_active(&client->dev))=0A=
> +               return 0;=0A=
> +=0A=
> +       switch (ctrl->id) {=0A=
> +       case V4L2_CID_ANALOGUE_GAIN:=0A=
> +               ret =3D cci_write(ov05c10->regmap, OV05C10_REG_ANALOG_GAI=
N,=0A=
> +                               ctrl->val, NULL);=0A=
> +               break;=0A=
> +       case V4L2_CID_DIGITAL_GAIN:=0A=
> +               ret =3D cci_write(ov05c10->regmap, OV05C10_REG_DIGITAL_GA=
IN,=0A=
> +                               ctrl->val, NULL);=0A=
> +               break;=0A=
> +       case V4L2_CID_EXPOSURE:=0A=
> +               ret =3D cci_write(ov05c10->regmap, OV05C10_REG_EXPOSURE,=
=0A=
> +                               ctrl->val, NULL);=0A=
> +               break;=0A=
> +       case V4L2_CID_VBLANK:=0A=
> +               /*=0A=
> +                * REG_TIMING_VTS is read-only and increased by writing t=
o=0A=
> +                * REG_DUMMY_LINE in ov05c10. The calculation formula is=
=0A=
> +                * required VTS =3D dummyline + current VTS. Here get the=
=0A=
> +                * current VTS and calculate the required dummyline.=0A=
> +                */=0A=
> +               cci_read(ov05c10->regmap, OV05C10_REG_TIMING_VTS, &vts, &=
ret);=0A=
> +               if (ret)=0A=
> +                       goto err;=0A=
> +=0A=
> +               ret =3D cci_write(ov05c10->regmap, OV05C10_REG_DUMMY_LINE=
,=0A=
> +                               max_t(int, ctrl->val + format->height - v=
ts, 0),=0A=
> +                               NULL);=0A=
> +               break;=0A=
> +       case V4L2_CID_TEST_PATTERN:=0A=
> +               ret =3D ov05c10_test_pattern(ov05c10, ctrl->val);=0A=
> +               break;=0A=
> +       default:=0A=
> +               ret =3D -EINVAL;=0A=
> +               break;=0A=
> +       }=0A=
> +=0A=
> +       cci_write(ov05c10->regmap, OV05C10_REG_TRIGGER,=0A=
> +                 OV05C10_TRIGGER_APPLY, &ret);=0A=
> +       if (ret) {=0A=
> +               dev_err(&client->dev, "failed to trigger write");=0A=
> +               goto err;=0A=
=0A=
We can drop this line.=0A=
=0A=
> +       }=0A=
> +=0A=
> +err:=0A=
> +       pm_runtime_put_autosuspend(&client->dev);=0A=
> +=0A=
> +       return ret;=0A=
> +}=0A=
> +=0A=
=0A=
...=0A=
=0A=
> +       hblank =3D OV05C10_PPL - mode->width;=0A=
> +       ov05c10->hblank =3D v4l2_ctrl_new_std(ctrl_hdlr, &ov05c10_ctrl_op=
s,=0A=
> +                                           V4L2_CID_HBLANK, hblank, hbla=
nk, 1,=0A=
> +                                           hblank);=0A=
> +=0A=
> +       v4l2_ctrl_new_std(ctrl_hdlr, &ov05c10_ctrl_ops, V4L2_CID_ANALOGUE=
_GAIN,=0A=
> +                         OV05C10_MIN_ANALOG_GAIN, OV05C10_MAX_ANALOG_GAI=
N,=0A=
> +                         OV05C10_ANALOG_GAIN_STEP,=0A=
> +                         OV05C10_ANALOG_GAIN_DEFAULT);=0A=
=0A=
It would be better to add a blank line after this.=0A=
=0A=
> +       v4l2_ctrl_new_std(ctrl_hdlr, &ov05c10_ctrl_ops, V4L2_CID_DIGITAL_=
GAIN,=0A=
> +                         OV05C10_MIN_DIG_GAIN, OV05C10_MAX_DIG_GAIN,=0A=
> +                         OV05C10_DGTL_GAIN_STEP, OV05C10_DGTL_GAIN_DEFAU=
LT);=0A=
> +=0A=
> +       exposure_max =3D mode->vts_def - OV05C10_EXPOSURE_MARGIN;=0A=
> +       ov05c10->exposure =3D v4l2_ctrl_new_std(ctrl_hdlr, &ov05c10_ctrl_=
ops,=0A=
> +                                             V4L2_CID_EXPOSURE,=0A=
> +                                             OV05C10_EXPOSURE_MIN,=0A=
> +                                             exposure_max,=0A=
> +                                             OV05C10_EXPOSURE_STEP,=0A=
> +                                             exposure_max);=0A=
> +=0A=
=0A=
...=0A=
=0A=
> +static const struct v4l2_subdev_core_ops ov05c10_core_ops =3D {=0A=
> +       .subscribe_event =3D v4l2_ctrl_subdev_subscribe_event,=0A=
> +       .unsubscribe_event =3D v4l2_event_subdev_unsubscribe,=0A=
> +};=0A=
=0A=
Drop this.=0A=
=0A=
> +=0A=
> +static const struct v4l2_subdev_ops ov05c10_subdev_ops =3D {=0A=
> +       .core =3D &ov05c10_core_ops,=0A=
> +       .pad =3D &ov05c10_pad_ops,=0A=
> +};=0A=
=0A=
...=0A=
=0A=
> +static int ov05c10_get_pm_resources(struct device *dev)=0A=
> +{=0A=
> +       struct v4l2_subdev *sd =3D dev_get_drvdata(dev);=0A=
> +       struct ov05c10 *ov05c10 =3D to_ov05c10(sd);=0A=
> +=0A=
> +       ov05c10->img_clk =3D devm_v4l2_sensor_clk_get(dev, NULL);=0A=
> +       if (IS_ERR(ov05c10->img_clk))=0A=
> +               return dev_err_probe(dev, PTR_ERR(ov05c10->img_clk),=0A=
> +                                    "failed to get imaging clock\n");=0A=
> +=0A=
> +       ov05c10->avdd =3D devm_regulator_get(dev, "avdd");=0A=
> +       if (IS_ERR(ov05c10->avdd))=0A=
> +               return dev_err_probe(dev, PTR_ERR(ov05c10->avdd),=0A=
> +                                    "failed to get avdd regulator\n");=
=0A=
> +=0A=
> +       ov05c10->reset =3D devm_gpiod_get_optional(dev, "reset", GPIOD_OU=
T_LOW);=0A=
=0A=
Default state should be GPIOD_OUT_HIGH.=0A=
=0A=
> +       if (IS_ERR(ov05c10->reset))=0A=
> +               return dev_err_probe(dev, PTR_ERR(ov05c10->reset),=0A=
> +                                    "failed to get reset gpio\n");=0A=
> +=0A=
> +       return 0;=0A=
> +}=0A=
=0A=
...=0A=
=0A=
> +static int ov05c10_probe(struct i2c_client *client)=0A=
> +{=0A=
> +       struct device *dev =3D &client->dev;=0A=
> +       struct ov05c10 *ov05c10;=0A=
> +       bool full_power;=0A=
> +       int ret;=0A=
> +=0A=
> +       ov05c10 =3D devm_kzalloc(&client->dev, sizeof(*ov05c10), GFP_KERN=
EL);=0A=
> +       if (!ov05c10)=0A=
> +               return -ENOMEM;=0A=
> +=0A=
> +       ret =3D ov05c10_parse_fwnode(ov05c10, dev);=0A=
> +       if (ret)=0A=
> +               return ret;=0A=
> +=0A=
> +       ov05c10->regmap =3D devm_regmap_init_i2c(client, &ov05c10_regmap_=
config);=0A=
> +       if (IS_ERR(ov05c10->regmap))=0A=
> +               return dev_err_probe(dev, PTR_ERR(ov05c10->regmap),=0A=
> +                                    "failed to init regmap\n");=0A=
> +=0A=
> +       v4l2_i2c_subdev_init(&ov05c10->sd, client, &ov05c10_subdev_ops);=
=0A=
> +=0A=
> +       ret =3D ov05c10_get_pm_resources(dev);=0A=
> +       if (ret)=0A=
> +               return ret;=0A=
> +=0A=
> +       full_power =3D acpi_dev_state_d0(dev);=0A=
> +       if (full_power) {=0A=
> +               ret =3D ov05c10_power_on(dev);=0A=
> +               if (ret) {=0A=
> +                       dev_err(&client->dev, "failed to power on\n");=0A=
> +                       return ret;=0A=
> +               }=0A=
> +       }=0A=
> +=0A=
> +       ret =3D ov05c10_init_controls(ov05c10);=0A=
> +       if (ret) {=0A=
> +               dev_err(&client->dev, "failed to init controls: %d", ret)=
;=0A=
> +               goto probe_error_power_off;=0A=
> +       }=0A=
> +=0A=
> +       ov05c10->sd.internal_ops =3D &ov05c10_internal_ops;=0A=
> +       ov05c10->sd.flags |=3D V4L2_SUBDEV_FL_HAS_DEVNODE |=0A=
> +                            V4L2_SUBDEV_FL_HAS_EVENTS;=0A=
=0A=
Drop V4L2_SUBDEV_FL_HAS_EVENTS flag.=0A=
=0A=
> +       ov05c10->sd.entity.ops =3D NULL;=0A=
> +       ov05c10->sd.entity.function =3D MEDIA_ENT_F_CAM_SENSOR;=0A=
> +       ov05c10->pad.flags =3D MEDIA_PAD_FL_SOURCE;=0A=
> +=0A=
> +       ret =3D media_entity_pads_init(&ov05c10->sd.entity, 1, &ov05c10->=
pad);=0A=
> +       if (ret) {=0A=
> +               dev_err(&client->dev, "failed to init entity pads: %d", r=
et);=0A=
=0A=
Can we use dev_err_probe.=0A=
=0A=
> +               goto probe_error_v4l2_ctrl_handler_free;=0A=
> +       }=0A=
> +=0A=
> +       ov05c10->sd.state_lock =3D ov05c10->ctrl_handler.lock;=0A=
> +       ret =3D v4l2_subdev_init_finalize(&ov05c10->sd);=0A=
> +       if (ret < 0) {=0A=
> +               dev_err(dev, "v4l2 subdev init error: %d\n", ret);=0A=
=0A=
same here.=0A=
=0A=
> +               goto probe_error_media_entity_cleanup;=0A=
> +       }=0A=
> +=0A=
> +       if (full_power)=0A=
> +               pm_runtime_set_active(&client->dev);=0A=
> +       pm_runtime_enable(&client->dev);=0A=
> +=0A=
> +       ret =3D v4l2_async_register_subdev_sensor(&ov05c10->sd);=0A=
> +       if (ret < 0) {=0A=
> +               dev_err(&client->dev, "failed to register V4L2 subdev: %d=
",=0A=
> +                       ret);=0A=
> +               goto probe_error_rpm;=0A=
> +       }=0A=
> +       pm_runtime_set_autosuspend_delay(&client->dev, 1000);=0A=
> +       pm_runtime_use_autosuspend(&client->dev);=0A=
> +       pm_runtime_idle(&client->dev);=0A=
> +=0A=
> +       return 0;=0A=
> +=0A=
> +probe_error_rpm:=0A=
> +       pm_runtime_disable(&client->dev);=0A=
=0A=
Add pm_runtime_dont_use_autosuspend(&client->dev) before=0A=
pm_runtime_disable() to undo the pm_runtime_use_autosuspend()=0A=
call from probe. Maybe Sashiko will point this out.=0A=
=0A=
Also, if v4l2_async_register_subdev_sensor() fails with full_power=0A=
set to true, pm_runtime_set_active() has already been called.=0A=
After pm_runtime_disable(), the runtime PM status remains active=0A=
while the sensor is powered off.=0A=
=0A=
> +       v4l2_subdev_cleanup(&ov05c10->sd);=0A=
> +=0A=
> +probe_error_media_entity_cleanup:=0A=
> +       media_entity_cleanup(&ov05c10->sd.entity);=0A=
> +=0A=
> +probe_error_v4l2_ctrl_handler_free:=0A=
> +       v4l2_ctrl_handler_free(ov05c10->sd.ctrl_handler);=0A=
> +=0A=
> +probe_error_power_off:=0A=
> +       ov05c10_power_off(&client->dev);=0A=
=0A=
If full_power is false, power_on was never called.=0A=
so power_off must be skipped.=0A=
=0A=
> +=0A=
> +       return ret;=0A=
> +}=0A=
=0A=
...=0A=
=0A=
> +#if IS_BUILTIN(CONFIG_ACPI)=0A=
> +static const struct acpi_device_id ov05c10_acpi_ids[] =3D {=0A=
> +       { .id =3D "OVTI05C1" },=0A=
> +       { }=0A=
> +};=0A=
> +=0A=
> +MODULE_DEVICE_TABLE(acpi, ov05c10_acpi_ids);=0A=
> +#endif=0A=
> +=0A=
> +static struct i2c_driver ov05c10_i2c_driver =3D {=0A=
> +       .driver =3D {=0A=
> +               .name =3D "ov05c10",=0A=
> +               .pm =3D pm_ptr(&ov05c10_pm_ops),=0A=
> +               .acpi_match_table =3D ACPI_PTR(ov05c10_acpi_ids),=0A=
> +       },=0A=
> +       .probe =3D ov05c10_probe,=0A=
> +       .remove =3D ov05c10_remove,=0A=
> +       .flags =3D I2C_DRV_ACPI_WAIVE_D0_PROBE,=0A=
> +};=0A=
> +=0A=
> +module_i2c_driver(ov05c10_i2c_driver);=0A=
> +MODULE_DESCRIPTION("OmniVision ov05c10 camera driver");=0A=
> +MODULE_AUTHOR("Dongcheng Yan <dongcheng.yan@intel.com>");=0A=
> +MODULE_LICENSE("GPL");=0A=
>=0A=
> --=0A=
> 2.47.3=0A=
=0A=
Best Regards,=0A=
Tarang=
