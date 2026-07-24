Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020086.outbound.protection.outlook.com [52.101.225.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04F224908B7;
	Fri, 24 Jul 2026 07:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.225.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784876544; cv=fail; b=Fc5QPh9XDEyF8rhm1UHYPMVe0r7JDmMP/PJhXlWBxXMgwtk5FbknXWeBBEADSulKOwHibiJPd2Iv78BHZVO3kMy1a/pwfOhPWP2SVBtEWVShA5XIj/zoqqFIV1hylPtP4hnqOSRhlwwFRRbzw8w6XeADQILGebK0yJ+NjoXq1Dw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784876544; c=relaxed/simple;
	bh=QRA4DSeqXaJuP7LTQ9g7x7YbSFDysgcFJzIMQ/5Hbak=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=LDe9oA2Kho14Pb0QOKgm8nmlmmUxmSg8Nm+s+Xm/J3IjFPE5iy+aZ3NIoQghz7mGiEILz917FaOYZy2QBCtUjDUPJyMO3Q565yReF1s+gUHgRPLbZ6lF+NdHH8jZa2TXQMF3u6UDq4oGEfd92yvTpEX+0KYGDoyecHGm3FD9tkY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=fail (0-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=mtqe64EF reason="key not found in DNS"; arc=fail smtp.client-ip=52.101.225.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="mtqe64EF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W5wp6WtrXnk4i5rwxHGtVj3Gz+axqkw3pB7ChVli+QwQRPPwNlIvRE69Rp+r1uKrnlFQAaMmMYdwbrJ0XXCWXI9LQao4dKojPQD1W0BZMQ4GpWHYx0Wma6CTn000qfeBR/uyoeGFhs2omfeugKUsGQd8Xb95uW4zK30fIXIfShCme4g/AvIbNl9zCcJrZZnoiFTHJ71aVaDJmCS417j7CY6CYWg/x8W1vHIxpj02kUZYzbkNHcnjwzZbUz2tBZ0JnezBEq0JpbqbL7GjRqpjnAZLxjfZkmadL71tuvAMbWNJrpQ5II+drd6Ae1OTd4KynkRC5IJN0+1WkD8w0u7cEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n1ZkDAiq+3yqlJDipeMLTjr7WPERtW5HZIRFscXkw3o=;
 b=G9SOG0j9cQ3I4KS7J995qOneSI74izfNdutl3nCbyeUv4la6syBlKecJ/tziChGvKFRVq8SnLrdQjoUQ5EWcNy5CvIzZ2C0PNFii/ckaRe9niDpz+CeiLP4UoR0725CljNJtMfwr3kxQ1t59f3Q94kmorS8kzUJycAbyDLvnkraUsw9DrbfGcSNaMLdXcah6ajOAzhbQtKK9wmqUqFdBFE1I13MNnaXL5lpHDvPWBgrQNmtX2rlkWx56kT8yeC4eti15pBOLjx689hvNF/1HbuvCCxYgYtLH39CYWh/e5yl8ipKytoYtcafxZFJbuSx3PpO4vJfJ9DAFKearT/fKng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n1ZkDAiq+3yqlJDipeMLTjr7WPERtW5HZIRFscXkw3o=;
 b=mtqe64EFcDH1Xsgy2Xv1451hS7TYKlEqLUlRYolVbqXNH56o6p7RDCJ6F4nS9LiOydBbdelihOBfJr1YATOQhonaUu+lDStytBDxrYcSw9GGwVyAdKdCpf98h6qLA7Ai5a3f3TkfVSu3l5qU+I8PobWKrT6xZryk6fNKR8/N1NEKdn5cpanECEpinYiuk9Y8zKu73tIpEZHw03rRXOZk9kOmxQHKJDwIL2DtN5Sprtf7SGA9sHxElVadSLGzvox1i3Bp0qshgeyX9P7U1gR/nQ+1bBSQJfszwkXUOCKXSXfL4YHMeP0HIAvg/82L1ZMAddRKqIZfNRp3LpJ2ohr3Hg==
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by MA0P287MB0957.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:108::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Fri, 24 Jul
 2026 07:02:15 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%3]) with mapi id 15.21.0245.010; Fri, 24 Jul 2026
 07:02:15 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Jai Luthra <jai.luthra@ideasonboard.com>, "mehdi.djait@linux.intel.com"
	<mehdi.djait@linux.intel.com>, "sakari.ailus@linux.intel.com"
	<sakari.ailus@linux.intel.com>
CC: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>, Elgin Perumbilly
	<elgin.perumbilly@siliconsignals.io>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 16/17] media: i2c: os05b10: Enable runtime PM
 autosuspend
Thread-Topic: [PATCH v3 16/17] media: i2c: os05b10: Enable runtime PM
 autosuspend
Thread-Index: AQHdFvGnNC6NZM3cjUeG3+gA115qT7Z5ExkAgAMwI1c=
Date: Fri, 24 Jul 2026 07:02:15 +0000
Message-ID:
 <PN3P287MB18292491E9351D55A79BDCEE8BCF2@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <20260718200912.16001-1-tarang.raval@siliconsignals.io>
 <20260718200912.16001-17-tarang.raval@siliconsignals.io>
 <178470050057.3005206.9371104705812276156@freya>
In-Reply-To: <178470050057.3005206.9371104705812276156@freya>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|MA0P287MB0957:EE_
x-ms-office365-filtering-correlation-id: 7e013362-7415-4bdd-e093-08dee9517e26
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|23010399003|10070799003|1800799024|22082099003|18002099003|38070700021|4143699003|56012099006|10067099003;
x-microsoft-antispam-message-info:
 ud8nOBk9hBb6jNi4c752bCdVUjJm7qrnSuhHqC0yuAvFl7uCJy/AvPVvFh+ADAwDxCKw+V52P/oiUULP0kobgZ30Wt9PQc+o3YEMRNfOHEDnQehq79glAXfQA6Nx6skQqdItIcgldijBzsSJyTCLsNz5PiPod4bCkqPmrW8mk5CcoXHESRZa3EkWdjITgIRYuTZgNfNnoYciLzvDiuzR1reg7nUwZENoV9VnFSh/gpS7t1Ur9wg58K9iH51JwqWTl10ct6hy4gA5IWEmFb35loj+QSRaTRzVplNXhe7WPbGFhO8tOxaDKLOaXNhB9HLQE01y/3b4ja3PJpRW1BSP4RMeZUmokxXlwBdfAIlQRmelVouGir5m9u6MRdYYTR6zRhNSCmO69ugi5A9aihD6dJirvyiea8FEUmq/uGrCBe6+uUOFGidBpP/EARjh9kEyo+wrQnk7tVCsoKBhcKPBe0+U0cSQvuLwtu+GS2tgzq9OSfeUkIBfeLrdczEwh922wqAzvZy3zeBpQFNrE9TeJl8tGpcFcvoNcmQud4HXjQlLVtFyv1VitOkVWYwL3ZnKcFZJnoaUEgJpos3YV4oszgZdUICAt6zzJZ5mB7iEQoXgfPzzyh5YNKu1Rbej48nGGcl8zIA2zqFod+UOW4cur7nWovrrhi24XuuWqZQ7UPKZDH9ZZz8eCW2B/VIb8ZYSGI85gBxNt9Eoxhbxj3KU8A==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(10070799003)(1800799024)(22082099003)(18002099003)(38070700021)(4143699003)(56012099006)(10067099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?wOIB8L1CcnUihCqX2ZOGTCJ8ATl8oulUOVFXdD9yiPG8uudWgVyfaKpqfl?=
 =?iso-8859-1?Q?/P9JZepLPsAR+keQ0QyQT50Gchlih1wYbL/B1tFWgcui4oAmCdh9XFwteY?=
 =?iso-8859-1?Q?OGrHCQv2/Q6tdqaHnbFk+7m7eWh14oCI5k2V+93VZBEWCMLaVvUjHZ/TMX?=
 =?iso-8859-1?Q?bYO1SKd9Qanlc/9TLvSdArwd3DPxfNL5UUuoMbBlBqkgGMg8DxIKuM13kK?=
 =?iso-8859-1?Q?xXYfdNrfRgo00UgfvXQFdi7g1rRbHpnF8vXRnzj2KNvhUNaZl99//QR2C7?=
 =?iso-8859-1?Q?Vx9nsfg7F5i2Ek+D6qREgE13lNbas0rl2msqhErWOKLdOYDu5IMbuXpjDA?=
 =?iso-8859-1?Q?GNqf+qMKSIohymImIzHkFsJN4n5T3L4ZjEux6vpZOsqaS29rTiCEORN14e?=
 =?iso-8859-1?Q?up+jT/JdecMUoJQnpO8Ack40d5hZvVVF3VMSy/MUUlZDhlmYZGfSzRfHSF?=
 =?iso-8859-1?Q?Vf/Qx4lPAEj5xLE4XiieYlIPPTkxwukoIb/HjOKrcrFQHiqgwrinMaLnAu?=
 =?iso-8859-1?Q?zR/lURvUJ9uIB/SOie4JESt5GcO9EN18X5dWVaDvN9OlwZNKZm1AFGJXD0?=
 =?iso-8859-1?Q?mmrS6OwvKIgO0J3U8FrHxRQ2eyKlzBmdU6FQYO5GvSIXbZ2LUeRsfPp5AQ?=
 =?iso-8859-1?Q?8kyWXr6jQiqPO8eaSTqT5Op5kgDp7n+3H6g8+JgKZNs8Xupab74DB7peEb?=
 =?iso-8859-1?Q?ehF/qSCPsZJgRB6uYWfzCvqYoFDW8sQKwJbuqKwwSqtjbNem31x44h0Zum?=
 =?iso-8859-1?Q?KDILbANWf4SdXa5GSShNt8idUbiYxfS8uOVsltOt74NMl1iNxKft2EtNt/?=
 =?iso-8859-1?Q?ivxIVwM6xcHKsANev2mcwqtg91N12J69rkX2LjFfve4QACJDRgPE6yxh53?=
 =?iso-8859-1?Q?tvnjDUH2OannqC79HJvQxBSVIUZrxurdCcARphn0r7wwg95Ha1KfwxdBWm?=
 =?iso-8859-1?Q?UwM9dXeopyvBLM2BJ4HoNwtLpMhbhW5JtOJEbb4tg08kR2carVBJqFDWW1?=
 =?iso-8859-1?Q?BRtquYQ+/nplao+GnGnxAQog6PP+siP7blGvrm/5b0tXsqWq2hX05s/JhS?=
 =?iso-8859-1?Q?CaOyOmVQYwXOKL7nQwynY4yvcqIPiT49YChJb818RI6SFFYtryZWwyUbYL?=
 =?iso-8859-1?Q?m6MC2fi/f4gCw5ssVnfopBvwci4HqxApi2StTdRqFwP0H+p79l3VYj5n7c?=
 =?iso-8859-1?Q?kr0rESfliOf/0gLSX2gj331JMhIbxTRQliZYOZEwepa1RlXaTE7nyEL7DU?=
 =?iso-8859-1?Q?wZdQrbTNqbLm4GGpghoeHUEn5ux5Nq5iJN1D4BIFrPlonhlfrxPoA1C17m?=
 =?iso-8859-1?Q?/DzFGYZCkpxjhvX99ZyPOYDDkxCrnA9hAFY1i9xVdwobbvwce5lrnFUg+p?=
 =?iso-8859-1?Q?o49iw1+emXzHQTuA6KOIOu4ipHRcWG13msa68mUHCQPPu8cqszBQsF5j/P?=
 =?iso-8859-1?Q?heWpzNcErNJlcpcXnRVOrJw1wWANSOz3htkdA76hATXVBh8GVlDofL27A+?=
 =?iso-8859-1?Q?wMZmJm6mLrFQu+j6EytV/7MwOS1IGrD3CSHimCsVEPfT1UJzZ2imhej1AD?=
 =?iso-8859-1?Q?dZf6z4L8MotbP6wFnoMASPqr7vS/vqXtfSCmQt2ooZce86mA6d0dS5EfiR?=
 =?iso-8859-1?Q?T6GJ/k+kWY5u7BtmqkwPnJpqGHcLI+UmMDSHlqzwf7+WBhHsWfDvZR7qLT?=
 =?iso-8859-1?Q?T10BuTFtZzgWHbDPBCsV3/pHwosSDbFP72cYCAbul5oL971ETeyuofJIgo?=
 =?iso-8859-1?Q?OBazmbUBxf4Wkgm/pQyxNgy95px4oR3D3dUR1HtuOA5/YHBkYGCx0RPH/L?=
 =?iso-8859-1?Q?5jg1WZ+RKPTA2cfPTIhgG7UlGLc5EPd5ZxPr/LXWM3rIFBHXdN/4Zxr9YD?=
 =?iso-8859-1?Q?hK?=
x-ms-exchange-antispam-messagedata-1: gKWaVVYZaqzQ6E8fwMYYG1AEnW/Z5XT4ziY=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e013362-7415-4bdd-e093-08dee9517e26
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2026 07:02:15.0480
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3B2EPrzSIIBYL5xXdQdsftpuo2JXUTMzmdvTcnn5zzbB6H0N4RZkrUMUkmpjzgw/HdLl6wIW9W3OzZsL7r3UiH8c4qWz0OsuPZpUBvTqwcY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB0957

Hi Jai,=0A=
=0A=
Thanks for the review.=0A=
=0A=
> Quoting Tarang Raval (2026-07-19 01:39:07)=0A=
> > Use pm_runtime_put_autosuspend() instead of pm_runtime_put()=0A=
> > to allow autosuspend. Set a 1000ms autosuspend delay.=0A=
> >=0A=
> > Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>=0A=
> > ---=0A=
> >  drivers/media/i2c/os05b10.c | 6 ++++--=0A=
> >  1 file changed, 4 insertions(+), 2 deletions(-)=0A=
> >=0A=
> > diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c=
=0A=
> > index 59097eb96561..b4dd3137ad5c 100644=0A=
> > --- a/drivers/media/i2c/os05b10.c=0A=
> > +++ b/drivers/media/i2c/os05b10.c=0A=
> > @@ -1057,7 +1057,7 @@ static int os05b10_enable_streams(struct v4l2_sub=
dev *sd,=0A=
> >         return 0;=0A=
> >=0A=
> >  err_rpm_put:=0A=
> > -       pm_runtime_put(os05b10->dev);=0A=
> > +       pm_runtime_put_autosuspend(os05b10->dev);=0A=
> >=0A=
> >         return ret;=0A=
> >  }=0A=
> > @@ -1077,7 +1077,7 @@ static int os05b10_disable_streams(struct v4l2_su=
bdev *sd,=0A=
> >         __v4l2_ctrl_grab(os05b10->vflip, false);=0A=
> >         __v4l2_ctrl_grab(os05b10->hflip, false);=0A=
> >=0A=
> > -       pm_runtime_put(os05b10->dev);=0A=
> > +       pm_runtime_put_autosuspend(os05b10->dev);=0A=
> >=0A=
> >         return 0;=0A=
> >  }=0A=
> > @@ -1455,6 +1455,8 @@ static int os05b10_probe(struct i2c_client *clien=
t)=0A=
> >=0A=
> >         pm_runtime_set_active(os05b10->dev);=0A=
> >         pm_runtime_enable(os05b10->dev);=0A=
> > +       pm_runtime_set_autosuspend_delay(os05b10->dev, 1000);=0A=
> > +       pm_runtime_use_autosuspend(os05b10->dev);=0A=
>=0A=
> These two calls are easier to understand (for both humans and sashiko)=0A=
> moved to the end of the probe, when you're done configuring the sensor an=
d=0A=
> call pm_runtime_idle().=0A=
=0A=
Sure, I will move this just before pm_runtime_idle.=0A=
=0A=
By the way, I'm not sure why, but sashiko isn't reviewing my patches.=0A=
I'm not getting any mail from sashiko on any of my patches from this=0A=
series. Even though I recently sent one patch on int3472, on that=0A=
patch also sashiko had no comments. That's strange :)=0A=
=0A=
Best Regards,=0A=
Tarang=0A=
