Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020101.outbound.protection.outlook.com [52.101.225.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B14A837A486;
	Tue, 28 Jul 2026 10:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.225.101
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785233417; cv=fail; b=dsZAZEwHURhjj7h+H/2fY+cNu1Fpbl4DMnHBpXU/V7m9Y+xg46EbFOZBnGU6wr0DHzhPXnVFXwYN3LVtaxqcT1lJE4XYR9zynr7WMtml6epHhsxeoSzAJ7mXsg5yPyWATni2KyEI8MtLMx5wehVfHFs8yZ15pyiV6cxkmURrT8k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785233417; c=relaxed/simple;
	bh=YJEWKlaWLblURjg/LXFg8rriSVcywn1luNm9l4KDEcg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=cMmijbvdb+FkjT6uf2z4SenJZVzcPsmRasQBAOfW+VWQAlb80ejwwCxRjlhGBoPEvis7HfkPNGFcYtNJC8aPPv58yk6KFS66N/77tpXXbKDsFQaaHaGQbhAJsfNlBKzwJzXO0QechUo+QRlXb8PM3MgGHgsjEepFpdUc20mhu3U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=fail (0-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=VwUtCHtI reason="key not found in DNS"; arc=fail smtp.client-ip=52.101.225.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="VwUtCHtI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vz8LpBHXwXXV0P8SjR5wDKf7BaEL4tDlHsLxxH4Vxl/HTQqRV9AfywxVeS37DnjjXpqY6/3lQYKcTa9iJLKc3DBz6hrLbHph7UI3EyMmkjE6yp/foGh6JVuk7mPpRDib8fefxcS2WjaML7Rocv18QWkwyf557TzjMzB/F6Kx1SnmXk7XWgEQBN0YPV7Pk3x1CV6J+fdCk8TY4bNVKltJo/CtA0avCyg1QvPBWh3wLzT8va0w4FrPvfZldq8tTu+60+aexCf+IFQK/gw5Qrku+yCFepIiwSIHvfxpGkg67ZaKEWYkrcFAfu7GLVMZwMj34w2NMe990lF6f/SUZLslnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Qdyfq5oFBH4GPdeDZFk7BQdsU9Op4Ndu7SFiC09sFo=;
 b=qQo/8NaPOVWzRkdgEI0QsF3oFNMvdPtwxx7l06efmeeHsVxc8MxMEiXQRFhszUsMcf+wWtFb/3DBdn+aBtRLJ3t6RvnYGj+Bhmlz2Oj7GAszrY/4wydzRMZ5aj0IWNjeIlAgnqz6lBsZjlDX6JBIWq62nlZw6yjTH1E4X/YjC2WqG6AGSV/zhBdXRn2Ylg1hx6nPOQOP1cP/uTIeKynBXWXfjo7BuxZOILrw4VqZOJV/83k7ssTRjpO+1pKGTNWAxMxEyR7EpIeAdCfbxlhx3I/uk0p8I66Jb/9wv4FIurzSZvtK6NgGbsdoVhQ4Vw30ft8aCmt2d+JvpxV6KTJZtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Qdyfq5oFBH4GPdeDZFk7BQdsU9Op4Ndu7SFiC09sFo=;
 b=VwUtCHtIxAV6zZZihmdyDX+YF3FqsjGmay8X8EQ/MNOIgIgQ2UX6ssyRjTY+uaAG/yHBijM0MQuOLvQqayGtEzZiiuKEBsLALoaWfJRbNVxYleFfWnVN9hESh+1M0v5kWZpa/poAHnZqHuV2MapWsvHofAU2j5GpK0vlhAAJuGt30wtiH2Mu/ollB75MABfNP6Wv48thQpImrjIKmlx/thrKSg9Ep6FcVCbwWWWtePW1dU3cr5uUyJiUMqPgpWaNDatJuDLl4INHHhLerF/WRVrs+JkSSz49PYYfTQtPnePBM3dgzAsdAf30rGwffnvBK207HCXU8e/UhnbYdIdbQA==
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by MAUP287MB4667.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:18c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Tue, 28 Jul
 2026 10:10:11 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%3]) with mapi id 15.21.0245.012; Tue, 28 Jul 2026
 10:10:10 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: David Carlier <devnexen@gmail.com>, Kate Hsuan <hpa@redhat.com>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] media: i2c: imx471: Fix uninitialized error value in
 imx471_set_ctrl()
Thread-Topic: [PATCH v2] media: i2c: imx471: Fix uninitialized error value in
 imx471_set_ctrl()
Thread-Index: AQHdHnLqdEMOLKxkyUqsa9ChwPEg8baCtD5Y
Date: Tue, 28 Jul 2026 10:10:10 +0000
Message-ID:
 <PN3P287MB182971964DB25348A10176E88BCB2@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <20260724041417.9921-1-devnexen@gmail.com>
 <20260728092430.12491-1-devnexen@gmail.com>
In-Reply-To: <20260728092430.12491-1-devnexen@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|MAUP287MB4667:EE_
x-ms-office365-filtering-correlation-id: 4af5dea5-054d-423e-620f-08deec9068a8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|38070700021|56012099006|4143699003|10067099003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 rNlQlyvc5zDdfShbIv/GLrbCeQVLy+LGdybJJNuzmHSWx41L+ad+tP9vQ7dCR75olgPKIhn5siyxW1IHqrzSsOwQZU/9SRZjwUz9Fab+owI+X0YWchB1ggBF10JNhwAydQFeFCpYy/B6B/PFPezSNdPxkQ8kxJ2/zuB6V4gYViAwmcR/V7SWQIihmk4SuFu/wrOV3RdwdFlnUp3tTUm7K68BTd4RARASSON2tzVKAjbG8ywTgEigZiCDxtlbKFabf/xKUoxDdCnwd1Hj8T235focQ8eUCGcguaDZ5QbkJlPR3/Bwii35sx2bbJ5OaQ5mkdFormp3U47lVwEFlstprDevDGLLTveT3OhWtBNkKM/+sUbj4E2Gjia9UxeHitmB61J8RxQO4sjp0+pZDdh0YFhINQzMg3C9qPVQCOnyjntGcC4UJEKxCljZ45B0rNXuTu7tFosOUo6nH+/8ChTEvg9AHx62U5+q39eGe7uUNpD4+ZZ+8Nop1AnV0qzyjQr3bfEGuZNpJbzPAGjwLHCoOYQ4TumHouvCuMggOIj4puiOFsklTUi0X1W6Bi5yEEsmBkdP71JOnH+nfdMbkh1RXHRtzzpMJwdxgL5ze/I+wWJur14twbOw+o3LeVESX4KgNQDNR6oKqatDvSfumXJKxIQN9cH0JccNQ5iBJsXTdsE5E4OQXVDSiaPhUdVTHBc4Fm75wm8Bd1OvbCjm9cxhkcc+bcv7qyCR6051uPfFsFI=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(38070700021)(56012099006)(4143699003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?KM7j9DSWnZqz1qdvojn582iJekVYXwJJ7IBbcCrCBw/0E3fzgRC0TmDDF4?=
 =?iso-8859-1?Q?hfpbjPdCWn8089zpvQVwa2WtLMGF5Rs8FuB/SoT1Hw7Ew1l/OzZ0SbFwmV?=
 =?iso-8859-1?Q?ITYqE2VPVLUgXTpiBjA9ymUmP1rcDZ6eT9ZZvx1+sLcJI8BXfUQlHeZ+mv?=
 =?iso-8859-1?Q?UnZg9x74tBzcvGx2zEhiIhq4mSq186rPncpYRqAjHL+jRCaoxkple7uy+A?=
 =?iso-8859-1?Q?kX3ZvnwZy5jO9CnYU0zSxKpUsgG1IkZk14p5UGju9JfxLc9IwLlFLG0y6E?=
 =?iso-8859-1?Q?RWRgSwToLDgaBUpavJvSpIKjU4fKYYM9d1ZOCNjXOz67EUUNECT9RtiQdN?=
 =?iso-8859-1?Q?N+5hlhmz4u5PAXsbgokSbTeBox/Zaw5VEALX8Gpj7cU+ifL0i9GqbdgKS1?=
 =?iso-8859-1?Q?ZV1AbDFVqb+ZOCoh2Bihaz/qyE8y5kOSoO4jDaBO4uVihVZDFQd7beFXuf?=
 =?iso-8859-1?Q?FivFDGSpSnrf80rHr5gt+k32epxXkPzgMxR/MdHg0iFvYI4xIzQmv3AkV0?=
 =?iso-8859-1?Q?kzuNnI2E7zlb+hbWvy0DO6CdAxxgamSYjm1oWPHly3p8D7uj2hoRa+rUYW?=
 =?iso-8859-1?Q?qwn4qKr8YU5ZLBcahixg7OSy/ShvdDmU2joBtlLVNgTAeKBMjpI9/PvQbD?=
 =?iso-8859-1?Q?tk9xVZ17kk2QPQpnPksnUfH1EWARntpyaTIRpo6XQ+KFvThYf0bFPV+7TG?=
 =?iso-8859-1?Q?X2Tyyn4/oHhzjF0HEcSyhUvONhKkpZF1pP5ZUienLpV837Sm9USX5PXVa8?=
 =?iso-8859-1?Q?ap5/ojxhM9CGQdSa2xbbibzADIZADUcXRhCTHIubyPewibPD9YQ5wAj9rH?=
 =?iso-8859-1?Q?XQR8D5gbMoKHMsViX1ic6NHgh7dMmO9PCXnRpWCSkiG0Tuvv0gqZE7u/JH?=
 =?iso-8859-1?Q?LZkXMa+VaNVsgyGV/3HOy3090iyPEZNHUks9SJLN1WrZTCvc4gENsJmc2k?=
 =?iso-8859-1?Q?I4vUww87yRRZk044xf4MWn+E75SIB4hQj6hT0Qf5X9zoUK9RKXCadS7/em?=
 =?iso-8859-1?Q?/H7lwMxote7l4R2Y1GsjQiRDiD2wbqgmdq3XENOXSza1AmNfNPocOKSL7m?=
 =?iso-8859-1?Q?smeO9dzuT+ZicahhY1c1XnlCkOpVP6Ib14GQhPwjAX1mU/FFQpxDC2vXlq?=
 =?iso-8859-1?Q?dbnE+RFZjd4oSQ1YxSWdM+UlogQXBrmcA75vCHdITx57RaXUEORTfELc1s?=
 =?iso-8859-1?Q?xsFu1MKdqp/VZMHa64WVfYGX0KDj5c+Xlqa8Kj8MbXWgAYKBxHgOta8baW?=
 =?iso-8859-1?Q?OKsmvwXFqvg595NnnM4pQ9U1BOyOgiwN69TJSk2lCk9NYXKiQzGdNYDSh8?=
 =?iso-8859-1?Q?BwjWL4gjBQ8uyc1QLhFvjihg8it/6X+uSB4Re22p8w9nI017TOumqV10jU?=
 =?iso-8859-1?Q?q7RsU4Im+wfD357x79GDELHQb/R4X2xQB4yuB/CyrCFBcgAaEREU89fI+C?=
 =?iso-8859-1?Q?w+VWwJ+tfbiLLxxyBUHqibbLT02oxleVmd7R6z+J54qtYTt3xWmkB1kBdI?=
 =?iso-8859-1?Q?SHuWttd6anp7ixhmk+QraR6B0t1pYg2+Uv+IYeFI9dM2QKQf/+MRpHstQp?=
 =?iso-8859-1?Q?lWGtHXeh82kcw3Y/YzdljqxIQGg03K7/1CH8dxC084k5bMONUb1EzN/3eD?=
 =?iso-8859-1?Q?V0dZdTGLqC+wHjjxvKMSFEPkti8nYrz4uGLhZB8uTNiS7HpHhmUlA2fjzw?=
 =?iso-8859-1?Q?PKrVehNks76kFTkAUnN+zefA2j0DlOvM1GHaoh82Yi+kHTyT71+0cgrp5E?=
 =?iso-8859-1?Q?/Ye4opbSMWiGS2l7diUm+RW0XagjM3TrpJK1sErEcIA/REUKuYpDTqiuRv?=
 =?iso-8859-1?Q?9Lqa6wrJo3/ubdemGoB4ze+m7BBvLtg=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 4af5dea5-054d-423e-620f-08deec9068a8
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2026 10:10:10.8232
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y2s5Wxu+9IgVOIxL4RA5B54ArJtSNRPb0DmPjIFQvGYJJtzDGX+73kXvOCQRFw9cnrC5hapSE7nEwwpBBaNL2p1u9ZzWXPFUz+5yR52SI+U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAUP287MB4667

Hi David,=0A=
=0A=
> The exposure and vertical blanking writes pass the address of the local=
=0A=
> ret variable to cci_write() as its error pointer, but there is no earlier=
=0A=
> error to propagate: each case is a single standalone write, like the othe=
r=0A=
> controls in the same switch that already pass NULL. In the exposure case=
=0A=
> ret is still uninitialized, so a non-zero stack value makes cci_write()=
=0A=
> return early without programming the register, and the control write=0A=
> reports a bogus status. The vertical blanking case is benign today becaus=
e=0A=
> ret is zero there, but the construct is equally wrong.=0A=
>=0A=
> Pass NULL as the error pointer in both cases.=0A=
=0A=
Nice catch! Thanks for spotting this.=0A=
=0A=
Reviewed-by: Tarang Raval <tarang.raval@siliconsignals.io>=0A=
=0A=
Best Regards,=0A=
Tarang=0A=
=0A=
>=0A=
> Fixes: be1589e567ae ("media: i2c: imx471: Add Sony IMX471 image sensor dr=
iver")=0A=
> Suggested-by: Kate Hsuan <hpa@redhat.com>=0A=
> Signed-off-by: David Carlier <devnexen@gmail.com>=0A=
> ---=0A=
> Changes in v2:=0A=
> - Fix the root cause by passing NULL as the cci_write() error pointer for=
=0A=
>   the exposure and vertical blanking writes, instead of initializing ret=
=0A=
>   to zero (Kate Hsuan).=0A=
>=0A=
> v1: https://lore.kernel.org/linux-media/20260724041417.9921-1-devnexen@gm=
ail.com/=0A=
>=0A=
>  drivers/media/i2c/imx471.c | 4 ++--=0A=
>  1 file changed, 2 insertions(+), 2 deletions(-)=0A=
>=0A=
> diff --git a/drivers/media/i2c/imx471.c b/drivers/media/i2c/imx471.c=0A=
> index 6d358b11e96d..4053aed84340 100644=0A=
> --- a/drivers/media/i2c/imx471.c=0A=
> +++ b/drivers/media/i2c/imx471.c=0A=
> @@ -334,12 +334,12 @@ static int imx471_set_ctrl(struct v4l2_ctrl *ctrl)=
=0A=
>                 break;=0A=
>         case V4L2_CID_EXPOSURE:=0A=
>                 ret =3D cci_write(sensor->regmap, IMX471_REG_EXPOSURE,=0A=
> -                               ctrl->val, &ret);=0A=
> +                               ctrl->val, NULL);=0A=
>                 break;=0A=
>         case V4L2_CID_VBLANK:=0A=
>                 /* Update FLL that meets expected vertical blanking */=0A=
>                 ret =3D cci_write(sensor->regmap, IMX471_REG_FLL,=0A=
> -                               format->height + ctrl->val, &ret);=0A=
> +                               format->height + ctrl->val, NULL);=0A=
>                 break;=0A=
>         case V4L2_CID_TEST_PATTERN:=0A=
>                 ret =3D cci_write(sensor->regmap, IMX471_REG_TEST_PATTERN=
,=0A=
> --=0A=
> 2.53.0=
