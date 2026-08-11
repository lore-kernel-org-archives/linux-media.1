Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020132.outbound.protection.outlook.com [52.101.225.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8FAD41DE02;
	Tue, 11 Aug 2026 09:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.225.132
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786439781; cv=fail; b=D0c4lrezcUZEp7z6sasSpxqbpAkNdJkJsHjOrL3PQRpUuGCFVNNIB9kpaNo70kE2ih91Npx+7R+Hncw0aI2Ji39q5dsnjx44Xx0xLV2s+CEPtbkNZhoZZIrrlAx21tPERwagBb+GxYrwIaKCkvGHq6YBst1mSxGCL+LQ1Vbm7KI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786439781; c=relaxed/simple;
	bh=xW60TyZuOWLuUnTS6Co2T3Ugx8+pf0xg90qcoEPUL5I=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=OdLuqdKtXQ/ZbEM9oLEaKrIfcNKde2hN7JdTz0WsUXP67iDgT3KVqRXTDXVAQ22ArfmvCqRC7gCSDx81ypP2H7JHGW0iqOezoGT1uai+C8npS1rzDtll/GVdFOipli4N0Cj1FV4DUjFyvQTVP1Q9vDXJE1dQ8BHZJXJXBdrn4fw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=fail (0-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=cxQEqZ4n reason="key not found in DNS"; arc=fail smtp.client-ip=52.101.225.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="cxQEqZ4n"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MW0F9VtqJUpH1U9fb+oPMwduzMkotp7+b75p4RWMaeJZv8isZSgbYehxnPvPVdCe8aJTYNArpwOLIt3fwM7pnWGhqiuNuoM+xkYfevYHUZ6//gMdQonGYsGYFXG/dPA2O6lG8a3PWFhT3aWAkab2n0k96+yTGUvtGEah4TjJqVc4Ou3m7+67P3i7czVYAfiS2mBfq7grqFR+q58abdQWdyhwv6QN9yfbMLY3c17PJcj4wWWyjN5uyVopHZ1MxJsyBLdZm6CAxwoDNhnYFCrvl4seF4AAAWXjLefz02K8BvMobecL+Fs77+SSeuNFOWb2JOM7seJFW4NxdTg3Eq21/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aDlPddlyQmLdXfLdWhP2wapnEr5AhJJQ6rxBtj9bKL8=;
 b=nXSquXhShXMughOJNP0y/sjxzGPv65ekdldx9oobPchZ2W4djX//imv5XxvGg6DIJfr5j5dk069bS7RuUjgZc9kJOe0B/6k+e5NUNYPyFVgda/3kyJaWec2MlvZvAtjM3uHnAO1ZWGWs0SVVU5QmvnwKXZrCZRd2KBAqW5SSu+48IX2IcdWsv7Ays6u91Ppi7q3UhP4c7BlFGGVPucWiWnRMqjhs2dxLi+LP0hk2mtBOAp8yW8NaMi1/nYJLAsTIeK6PkdtOgBD+a589K/nsAgNlid7laN4kGocMZGFE0xLuRnm9FpRWkEMhGJ08GF6su6CSkbYDgp4ySLfNYPa7HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aDlPddlyQmLdXfLdWhP2wapnEr5AhJJQ6rxBtj9bKL8=;
 b=cxQEqZ4nCK2YcNINy+6zw0jW9ZJIGY8JJvdCGQ3mGydyHLNcB9XqnRRjCa2xzRMR4CzX+geVtpM2/Y1DOg9AUPtw2tNZNZBquJ02FMnciZZW3TyAGyVY0IKSS1UKN1MIJeXuJAIdmEdH+mZdK1C2ofV2ykcfbvIMaZckmAilWbNw0D+mgNSo564F7qJNk4ez71CiSEL1w/a37oJ1kH8iWagX53yooXaVdBP1WqBC0xi4MmcWi0U8SM7GuppB13MIcaG/3ZweraYzxQhf0dqoceLiTTDEg+cR+oWqX06BFxCc55THTtZNnxtm6U7LzVZnzD92eR/RBK7/B+F1bRnkwQ==
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1b8::9)
 by MAUP287MB5955.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:224::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.11; Tue, 11 Aug
 2026 09:16:14 +0000
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::ebd8:538d:c705:8432]) by PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::ebd8:538d:c705:8432%6]) with mapi id 15.21.0315.008; Tue, 11 Aug 2026
 09:16:14 +0000
From: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
To: Jai Luthra <jai.luthra@ideasonboard.com>, "sakari.ailus@linux.intel.com"
	<sakari.ailus@linux.intel.com>
CC: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
	<konradybcio@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>, Vladimir
 Zapolskiy <vladimir.zapolskiy@linaro.org>, Hans de Goede
	<johannes.goede@oss.qualcomm.com>, Tarang Raval
	<tarang.raval@siliconsignals.io>, Elgin Perumbilly
	<elgin.perumbilly@siliconsignals.io>, Kate Hsuan <hpa@redhat.com>, Xiaolei
 Wang <xiaolei.wang@windriver.com>, Walter Werner Schneider
	<contact@schnwalter.eu>, Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>, Bartosz Golaszewski
	<bartosz.golaszewski@oss.qualcomm.com>, Mehdi Djait
	<mehdi.djait@linux.intel.com>, Miguel Vadillo <miguel.vadillo@intel.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, LKML
	<linux-kernel@vger.kernel.org>, "linux-arm-msm@vger.kernel.org"
	<linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: sm7225-fairphone-fp4: Add Sony
 IMX576 front camera support
Thread-Topic: [PATCH v3 3/3] arm64: dts: qcom: sm7225-fairphone-fp4: Add Sony
 IMX576 front camera support
Thread-Index: AQHdJZuOLkX8gz7F4kutrW9cTd3eIraSKGOAgAZwNBk=
Date: Tue, 11 Aug 2026 09:16:14 +0000
Message-ID:
 <PN0P287MB2019FFBFD284AB4822AFF4B39ADD2@PN0P287MB2019.INDP287.PROD.OUTLOOK.COM>
References: <20260806120216.24145-1-himanshu.bhavani@siliconsignals.io>
 <20260806120216.24145-4-himanshu.bhavani@siliconsignals.io>
 <178608575956.4139729.7371211848831143170@freya>
In-Reply-To: <178608575956.4139729.7371211848831143170@freya>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN0P287MB2019:EE_|MAUP287MB5955:EE_
x-ms-office365-filtering-correlation-id: 954a36af-f5b3-48c5-86e9-08def7893189
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|366016|7416014|376014|1800799024|38070700021|56012099006|10067099003|4143699003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 L+JybVCvq16NhThLOs3+jJy+HARb+vGeaHPCk/2WnVWlsFOMg4LcxwGtaR/e458x5910RMP89/vZDxeyUnIIW52tbQoC20D7SGkoSbs9SCVgs9t/BuqwDx34I917gx4D7FG0K7GdTWdQBfS+PCTwn/mQZ1OvgdpNfO7gWIRnoeM003vL33zjab/Et1JaWchHJT+DPN9lyTfmpvDL72MBieEvMTvczE2Z18XXkFuR1J0h/3H/PixzTjsY6IxC+vDiI/qbZK2pD0zTF3V28++o0z26Z8F8Q3kj7rOCUzIDVVwdfUdOc6kpfjlmB2GaYbAfwTxw3kSQva+5cIK7NEwgY7b4IEctmtkpLBLVzitPrdj24LybcWq3Sg2yiebLXTKwAod1QGQC0MhIUtS/j+X8efl/lzazneFgC+ecFqeb5K5gKew6MUyRyGV1wuAbAh3R1qYa6nUh72+wCK3g6JSwsw7uXGnlPmKXo/qCcLsaV+wXVk8CD0buniGRnIhVnQe8ZFU+c1UO/y2Iac14GKOqYjsBTI8/zz/RyrSrPA+W8o3b8uad58Lj5eFXJL3zKZAlwHb0n0x02Fc7hbOY9MbwbnQbBSkPYQVCBWTFdx5OS9uAA3UKjJ4AXZEiW0GH3UHNKqvlUvHYp/ky7MAl4s0dy/IBYmSyzSKRIp9+nifdRiSUj/0NDCavV2pAmDG7EfZXrVj66AS7Osp/t9ViSFHbcDgYOBzIigu3+a78+pLS1vU=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN0P287MB2019.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(7416014)(376014)(1800799024)(38070700021)(56012099006)(10067099003)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?Windows-1252?Q?NqQn5pvrIoQjxXcyVopG8C0R+U1Ul927pQpD1A8tScreFRfHQOZOWYL1?=
 =?Windows-1252?Q?IEqZEseIzGOtFW2wZ4c0bSCUQOqTB1cj+jZKkz6jd/GJltaHzGQTS7t4?=
 =?Windows-1252?Q?ObmI3vh88DRsIV2DTxz/3Q00K+FsQ5iZj+CM9hctQRZBYv3OenfSbDH7?=
 =?Windows-1252?Q?JWjDwht5kfHoNdTQGgB1LDXf1UI6AtC8kVbdQo3ptWMUlh88Y8trDqot?=
 =?Windows-1252?Q?JFfv1WP8Xs+fSzWCZiohBb47JsxDq0hm9fbkeukkjX6VLazqj3M8Uogc?=
 =?Windows-1252?Q?eKGSuQ7/QNhQfA3LCinCsXnzYxLaMiibQ9b+8/IpN49JgtHcC5XjH2N/?=
 =?Windows-1252?Q?GkxjxklIl8EII5VobOgOjbmCEmRru5Kuc/HMqFoqQ6i89xQ8+yUEqClI?=
 =?Windows-1252?Q?0WvjC7w6/FoHj3ch6NFJw73f5x4vcrIVKTvRQXPFhNu0PYalS6ITIzSY?=
 =?Windows-1252?Q?fubOCIAtnqQXjZ2jjqKV4rKv29iU9jlRHFtuxRRgp7EiXzo+dpKLUeOW?=
 =?Windows-1252?Q?A3IE6ea+tPtAQWDKciAkj9e0vzCJPtj0chIYGn/uSQRf/kWYkcb6EZ/O?=
 =?Windows-1252?Q?Pm34YXva3H6qFxnkLG5nteS7Dn9Ou6ZaLpgJ0RZvR629QhnvnKwUBATF?=
 =?Windows-1252?Q?XA1TQn/xL/oIoq6U1tKtyiqCtx9qYO4cQZUPTtWczUyMPkvt7Bn2qNvW?=
 =?Windows-1252?Q?kBOwMlm1KAsUe8wgtb/9qHDT/GNH8sm4F0qrRzJMAza5HmUigg/JUJ8w?=
 =?Windows-1252?Q?flxT+tUirE+gUaNxJjYyyhFxYeEGsLobckZQIEDOhEFGZWH7RtpIqqwI?=
 =?Windows-1252?Q?ex76QOwgg8Mi/9loIcyHI2L9cg6E6AAJtvx5lvluF2C6UHJOevlA1KtJ?=
 =?Windows-1252?Q?tBRtyLe8wnfXLfI1brgTKjvD6sUbQYvvO8TYsig7zVjRoQ2ykEfwZBh+?=
 =?Windows-1252?Q?wk15g8sA1WoCyelQLHGqRr/VIscTYlJRSJ/09vP4UZzTCVJHiejSmKrq?=
 =?Windows-1252?Q?oQZT8yMMMGFuf5IQJAzEGGXAr4e6fI/rtGj+sgLWs6c5qMkAnUyLucOR?=
 =?Windows-1252?Q?NjmOPpNPgyefmGN+moR+UekMCjT/Cx+Q/TifiD5OSY/wle2FDbt228g/?=
 =?Windows-1252?Q?FHFc239nIOLE5HkIk65CB8ERjEPQ5ecMBujYuNHb5fG1XtnDA4UkcdM9?=
 =?Windows-1252?Q?Co+SwhcikZoNRiXqksmW0gUxUqjG06a6Yc602tHmrWMnZtVfRSmHmRXh?=
 =?Windows-1252?Q?4mImIy2aUiDhs/jL8ydx2aLk5P3SVZozTIRBiZrmYzI8MhWrI2DfDflg?=
 =?Windows-1252?Q?aTzBlDuT+vAJCnvt0YCqPDjhvyo8eX0g1whxy2tGPiLQ0HCpaIgqLIDt?=
 =?Windows-1252?Q?kUK4PkNRMqyQZ5MHCIhoU7JTzDSLDwYsj2yiLn1NQ40LBUe3I+O1qa6k?=
 =?Windows-1252?Q?jN2RRi4CHt3XoavPzLi3eXvizgVDczqk8EC2F9Rrk3wPMbp54wCMbgn7?=
 =?Windows-1252?Q?StdwrqcMZJhrOcbm4YXewK1aW9b38V5fzPJBxuleTf/Lr4jn1ruMfaGV?=
 =?Windows-1252?Q?z/I/jlCm7I6M8s/m7fQ2YOxrFQs5KsCbbW6pn+a0HY2ahyjxFKzZV06Y?=
 =?Windows-1252?Q?1JjulLR6pwndhsLxiZpQyX5kGtWu55/WybSseb+x+PpqimfcA+v5FPoF?=
 =?Windows-1252?Q?haa68cqx8d3ggcjfMAbvrD3ymBeE5AUQch3vSHJaoKsn7l4giSzILqEU?=
 =?Windows-1252?Q?dnxCph8NoT+iP32nb0hNpDAPeDhmNk7wtfdpq0PXo9HdE6XH7XMhITz4?=
 =?Windows-1252?Q?tP8bkC4Cp39ZgseszrA9bYcEaAXSDAO1p/FyVHQOKm8Up6TUxR4I3vRK?=
 =?Windows-1252?Q?NGKySKpom+N/Yv6Tqdb6QTELbfOoZaU6Ok4=3D?=
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 954a36af-f5b3-48c5-86e9-08def7893189
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2026 09:16:14.6403
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x5a42dVQqJscpolueU0tZeA3S+OrPzIl9a0VM3tgglrpGB9HZspdF5fhdfi2KWxHVgwA8TIf2Pw9fSXUuBHI0vmgIuik/iswwoe+OqVZNwi1pqbTR38o+ONQSY/8GyMW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAUP287MB5955

Hi Jai,=0A=
=0A=
>Hi Himanshu,=0A=
>=0A=
>Quoting Himanshu Bhavani (2026-08-06 17:32:09)=0A=
>> From: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>=0A=
>>=0A=
>> Add device tree support for the Sony IMX576 front camera=0A=
>> sensor and connect it to CAMSS via CSIPHY3.=0A=
>>=0A=
>> Signed-off-by: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.i=
o>=0A=
>> Signed-off-by: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>=0A=
>=0A=
>It's best to keep the DT series (which go through the arm tree) separate=
=0A=
>from the one adding the driver and bindings (which go through media tree).=
=0A=
>=0A=
>Moreover, I believe DT changes can't be merged until the bindings land in=
=0A=
>mainline (or at least the linux-next tree)=0A=
>=0A=
>Thanks,=0A=
>    Jai=0A=
=0A=
Thanks, understood. We=92ll submit the DT changes separately after the bind=
ings=0A=
land in mainline.=0A=
=0A=
Best Regards,=0A=
Himanshu=0A=
