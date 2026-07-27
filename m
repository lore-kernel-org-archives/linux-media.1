Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013057.outbound.protection.outlook.com [40.107.162.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D702367B9F;
	Mon, 27 Jul 2026 02:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785121164; cv=fail; b=dt5a1F1rWn2ImmqIY3o5omzqmh5EBEw+dOqkkQ0KjZWsF2d52ohLUV5coqdp7+tYqE/czrRwGol6ynO9dMFvBIf/tbEHwzsYa4/3tUux2O13nnYnDIRG8gxQwyNM/+FjmfFdsKEl+ubfGGFe/Nl0vSjZ+Tp+YfxAhO7jWnhQEcw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785121164; c=relaxed/simple;
	bh=nzPI+Q1M+sMK6CmOf8yH3jzYR0jA18lCAWEgxESeYSI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Ux4Lyqqk/7H7vtmIM5oKGSnGG3PHmg+ufGisW7PLtDwy1toHsxrYs+T+PTFxfAlyiSWqgidzkvckJKDRCk5ffW5Qk+juQWrqnU4X1gxa4dxeOky1i1dadbD70B9bKmqY1SQ0bsPMijKgGCfMeY866uz3qCDh7m1wq77FWLlVw9k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=QwZslAaQ; arc=fail smtp.client-ip=40.107.162.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="QwZslAaQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WOG1GKyH90ncZYJpGHtLdz4EN8lm7Ocm7ZFgSsGlxBSjCquw4CuQkDLH3Ybhbil/+APJJduC9B+fyrZkLvSW4ZptdvdbrOBQ70BKP3vFqF45Y2wFDwn57yfD8L2zvOrteqek6tIBTXIShy0BMoizDQSbB2A1YXquXVJRWmSgd5yPuWixmRw0rhsRQ1PWu29Q6hyM7+kt8dfeP42A6w/vEFIDWmOWY2qQaKYdyCpStAtfulGQawaQ5HGekDyCfKFIAZZ+aLI6T7m3U3TQDXngZiF0zNl6iLL8SEMj0wZN8a5DRkIwpd/UlT25bA9H+ZDNyQEQ9rb/OUkytPnekXUTJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7PcB8NWlYKzsVHDAQsFQJZaCz+JwoJqGPUgbeSHo0K0=;
 b=SpDbzP+/LhE2aYT3+6RWG39uao4x8REaBrr6JzWFvECpsqEgfWvFXPkhYxNY4W594ycmxQR2PWpeDI3KT3EU/SQYp2alg6dsEAV2X5wtwcrrxcsUGOTp3sGJJIzGt4xTw07s9yoXinVTK6BASgWbmPD50EIhKwK6AZD35qYJgubvjsh+HxwQLBNSHCOHb3v3FXyY47nZ3C9EM76r0XDePbiPpUuwb2F4gO7RXs3kXISAaUbZnaP3nU4QufwegcPr049mP0xfVGEZaBddF37NAf9I5MMryy81+Y88GziIDgNTC7jnFYqcn8VjYaMwOmW3BVAxM9d96/ddgwUpU6hlVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7PcB8NWlYKzsVHDAQsFQJZaCz+JwoJqGPUgbeSHo0K0=;
 b=QwZslAaQTLWoAVXsXvnxIciTJrcNlAvgiR/MQFK0KO/jRnAADBp9suNuDvUuELx0HESh1Xm4f2Dci1S2qX29IKRusfA7y6C4wdUJwKAlq8NzwiLAjue5e6hZVyhtaY0JV0ojg5aiVZI4D1BAM0c2+MbP91OLdMbJQdNJFkpr1wFxjnVuyI3iXyC8GzRL3tRZTQCloE47Z7/dETR5eZ2vQWrbhAIJKYLr8px8quuKI281ycTODW9uOc5mFGtgPm6vo/HNmmHvyx2/it7VWNZTpKUsBUgWgv0g49YqgRbON+jdYbOn47rp0tAFNg3WPzAZ2Hps5xjVvTLLdeiSzf+Q5A==
Received: from AM9PR04MB8570.eurprd04.prod.outlook.com (2603:10a6:20b:435::12)
 by PAXPR04MB8765.eurprd04.prod.outlook.com (2603:10a6:102:20c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 02:59:18 +0000
Received: from AM9PR04MB8570.eurprd04.prod.outlook.com
 ([fe80::c9cc:24fa:6f6d:fb03]) by AM9PR04MB8570.eurprd04.prod.outlook.com
 ([fe80::c9cc:24fa:6f6d:fb03%4]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 02:59:18 +0000
From: Ming Qian <ming.qian@nxp.com>
To: Jiawen Liu <1298662399@qq.com>, Eagle Zhou <eagle.zhou@nxp.com>, Mauro
 Carvalho Chehab <mchehab@kernel.org>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [EXT] [PATCH] media: amphion: fix runtime PM imbalance on probe
 failure
Thread-Topic: [EXT] [PATCH] media: amphion: fix runtime PM imbalance on probe
 failure
Thread-Index: AQHdHMkEIGjA+nej30qVcO8eWZYkw7aArhYw
Date: Mon, 27 Jul 2026 02:59:18 +0000
Message-ID:
 <AM9PR04MB8570C32418A32423130CF69DE7CC2@AM9PR04MB8570.eurprd04.prod.outlook.com>
References: <tencent_F163A5663D7C110964AC2EAF933720DEEF06@qq.com>
In-Reply-To: <tencent_F163A5663D7C110964AC2EAF933720DEEF06@qq.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR04MB8570:EE_|PAXPR04MB8765:EE_
x-ms-office365-filtering-correlation-id: 68d0f72c-c8da-4685-fbf0-08deeb8b0d3f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|19092799006|1800799024|366016|376014|56012099006|11063799006|10067099003|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info:
 RAfMYPQqedrCgXvpH9maq9STLzQYgShQlg+kPSvWD5VV8533+1mcS2tLOtnxAG0uwX7DJjVMLZtC0GX9b1WR9JsPL5jLOg9zDYiWHDFZiAsXUKWbNfyDldjYxw85/UKaWxB+P7tclULhRy5wGcQ36ADNrMoz0W5lxwYp8fo2uWQWl55jVdSuUdOQev8I39tIByGY14zffMefIBXwDPriwf3QDTaNRbzuWOjG2zu/VVwJxQHSjI8McVoZ5hcvndRcJw6nYOnJsEsnuVqT6VaR+Ec6uGkG5Ip/ZwN9MC+nwGsilJAmzPy0gyk8VTNVoQu/BonnEB55ZAj/M0dZiNIJbxfTdmlqtGtUjUJsMDZ/a5HCpq2/HmU3Ly1yc07MAW3GFeO4AvxNv2WvHM0LbAQ5YqiWokqvA85LQwa++WxXYRI3YHPR4ywG2ySSGgaVnGdHd/9a/uWADy5xnL3JyC+74OvaYScEjKES1ZlUUSqgrm6MlxyhfdpcbIFUAwH448bzzEQzygcpoEwgq7eGGi34EwJA88dKwt06Jaof438YrI/siM9jS1HWZXuC4YuCGOjZKIiZK1Cp3K/RQ4IHOpx18N65Imv9DNDuQGx1DKG2ThojRL3iebJ549gCY7KclSQEG9hjU1K3gyTPd6rv4diIvi0ySx7nV2pOnl7dklAr6nNunPdl54lk8uQGIiA/kPzZo4Prj7DVpv0gawimqJMoffhRBxvnFhatCB7PcZvpNZ0=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8570.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(1800799024)(366016)(376014)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Uy9UuZmXa3GVbq6HueGPY6kVBcX7i50TABE/17+BoIW+WcGF6aKlepp9rJQ/?=
 =?us-ascii?Q?mNkddSixS2csNUdEv+zscYxm7v1sv/iUZE2HRcDq7/WONyqEd1zhpJUMgLid?=
 =?us-ascii?Q?dW6JKozoqodnnJZLZhI8BnW+sDEG3Ta6jYpRMPWkux+EMpL8bHhiFolISWSy?=
 =?us-ascii?Q?HgbYfr/lcu+30y6zef6ENGUKNkOZBJtWG7VKbF5lAonoR3gWTvghLKS9bu/a?=
 =?us-ascii?Q?1r0vIOjTF5biz0ZFnI6fvlKtdX+Ry+xBRdv9KcXwVI7B7kh6VHj1rR8zyiCD?=
 =?us-ascii?Q?qsk5XpCjqQL/+w4ENrOu8Mgy7tNwlFwn2GqkwUtUZYqtGsbbebZmQAQDj1/T?=
 =?us-ascii?Q?edDur0y0SkIfZRed15jL5TjSf7oFrha0rupfTCb3g9SgL39BS8sNHUAf0anQ?=
 =?us-ascii?Q?NEdDxvKR3L5qVb0ooN4cPnSGdrQDlM3YE9Z1pUmQb/8HHa1tg0PiFJlt0JZj?=
 =?us-ascii?Q?7fIfsp/QnqMcG2lgpeEoMs1r4ZuyBc8DG2pGXaqy4RCpGTd9OWUZcf9LJBpa?=
 =?us-ascii?Q?BlXdtvpnq/GRtOT7Us5TVUpu6swLswJxh6poQGYVwTSd7KBlIbnwhMKAVs/N?=
 =?us-ascii?Q?h5mzueufYP1AzAcwdwSvoAVaDTOAxwu3bCCPpOzvMNkODeF9HJ9CMsi9hIdw?=
 =?us-ascii?Q?3jvEazCHKaVf25/OnqivighCmB+qyhoouJVfLmV/dHQE/I4TlcCslF3QGEc/?=
 =?us-ascii?Q?gyhF66S6yjqKIdMWpfM17dVvYKwkVsTt8oIKhNFDZ4SNH673EsuG8BaboFUk?=
 =?us-ascii?Q?6yEpuyDT4FALEYz+4W2ZGmtfNBF3yvGwtjm6rTxO78WlDCO5aC4OdvB978De?=
 =?us-ascii?Q?z+CzOSS4S+lb6tRC3b7UndgW7ZcC6W140f9bD24MQstYETYDkceZxamXgRB9?=
 =?us-ascii?Q?zTz6RwfV8+mwEw4InAcUaCQgpfOCyogOp44hapzReYmLHwOO4/Gn1Hd7pNXY?=
 =?us-ascii?Q?PgyES14NM3DldGqnV+UVLxvsdK0YCjP1dqVJvDbaHbkldK4FtWiDsdRVVBfj?=
 =?us-ascii?Q?Kd91el0r2acZDtE+oZzGIDoWje7KJIF7mT6srsI2GByWZRyPFXS9GceBV1TI?=
 =?us-ascii?Q?Dgnz67GERescbstvJNEClj+cM7rKyZ6kg23KUZAs0bw5x1u3PbO71xtwUjcS?=
 =?us-ascii?Q?hqwM/goWOLJSPxFaHs5HJW8TOPPGhdW/AqPzabYA42agydGtHLxYSeqKrjcd?=
 =?us-ascii?Q?6mM3PLAGnqx6B1nKbhJUY5NFvF1lunMOHGQdB9LNbJiEVWIePP9RIk7E/f7L?=
 =?us-ascii?Q?PRBv8TBTP+g9WMvn74n+wKGUNrqpP2EAfPfIWmgp2EX+LPVZzpo9ytDJhUNu?=
 =?us-ascii?Q?NzuGnnDChXCvfH8Hv7zNbD/Rby1rWuYZ6Caf+yebl/KdNnxgA6OI6m0Q0Ij0?=
 =?us-ascii?Q?bzKISr1k9poKEfujtN+IzP4pXkEtI2QevZGq2cBBDWan2wdVlrbuzHaA3+y5?=
 =?us-ascii?Q?FMcCbCk+QIMVLHWjuJ+EOT0LDctNdEgsQwemlZpYRr8XNS0BK/RbvSJ5wQY9?=
 =?us-ascii?Q?Os6dV2+VtVaOF+GmudcM9SHUHV4TyrokkLyUR6Cg2uT4680he16tK5KneTjp?=
 =?us-ascii?Q?vvOfIWZskNATLlnXsu+fuj3bNrRWm0KWnf9NqOzG/vHqYVo5FyLTAKqwCYWI?=
 =?us-ascii?Q?CGLlLVJBJhf2htPhOxGDm+2qjUCKO9bGox7ZcqwUBbNrJ82930H7Y9NWOVEB?=
 =?us-ascii?Q?BQOsI19vT5nHhgM8XoBDTvU+uFHmlfKkzcPZeUDMFjmSkX/G?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8570.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68d0f72c-c8da-4685-fbf0-08deeb8b0d3f
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2026 02:59:18.8286
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BzgR4/+zP5iYVZpi86PHO4jxN3GImIdDHs3XK+pWECzj4pTm0pVxo7WpD42gH8t6adqH6oCD3hYLFNwzEbbQPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8765

>From: Jiawen Liu <1298662399@qq.com>
>Sent: Sunday, July 26, 2026 2:36 PM
>To: Ming Qian <ming.qian@nxp.com>; Eagle Zhou <eagle.zhou@nxp.com>;
>Mauro Carvalho Chehab <mchehab@kernel.org>
>Cc: linux-media@vger.kernel.org; linux-kernel@vger.kernel.org; Jiawen Liu
><1298662399@qq.com>
>Subject: [EXT] [PATCH] media: amphion: fix runtime PM imbalance on probe
>failure
>
>[Some people who received this message don't often get email from
>1298662399@qq.com. Learn why this is important at
>https://aka.ms/LearnAboutSenderIdentification ]
>
>Caution: This is an external email. Please take care when clicking links o=
r
>opening attachments. When in doubt, report the message using the 'Report
>this email' button
>
>
>vpu_core_probe() enables runtime PM before calling
>pm_runtime_resume_and_get().
>
>If pm_runtime_resume_and_get() fails, it has already dropped the runtime P=
M
>usage counter that it acquired before trying to resume the device.  Callin=
g
>pm_runtime_put_noidle() again on this error path drops the counter one ext=
ra
>time.
>
>Remove the extra put and keep the existing cleanup that marks the device
>suspended before disabling runtime PM.
>
>Signed-off-by: Jiawen Liu <1298662399@qq.com>

Reviewed-by: Ming Qian <ming.qian@nxp.com>

>---
> drivers/media/platform/amphion/vpu_core.c | 1 -
> 1 file changed, 1 deletion(-)
>
>diff --git a/drivers/media/platform/amphion/vpu_core.c
>b/drivers/media/platform/amphion/vpu_core.c
>index 85cc4a14f8ed..3192cccb7e68 100644
>--- a/drivers/media/platform/amphion/vpu_core.c
>+++ b/drivers/media/platform/amphion/vpu_core.c
>@@ -666,7 +666,6 @@ static int vpu_core_probe(struct platform_device
>*pdev)
>        pm_runtime_enable(dev);
>        ret =3D pm_runtime_resume_and_get(dev);
>        if (ret) {
>-               pm_runtime_put_noidle(dev);
>                pm_runtime_set_suspended(dev);
>                goto err_runtime_disable;
>        }
>--
>2.34.1

