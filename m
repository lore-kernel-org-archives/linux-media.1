Received: from mx08-001d1705.pphosted.com (mx08-001d1705.pphosted.com [185.183.30.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 581B54B04A7;
	Mon, 17 Aug 2026 09:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.183.30.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786959732; cv=fail; b=m947/6nQg7H1Io6ujAeqpRAqSPlWQv1YUcd3IQZo7kucKbO9aI/jbkq+WZ6MugoxB7SjB3AskxlgwqjBHelbnjhD9j/4M3JQsIYtpplv5qm33l8xh/ry7f6c+88FBhnNlIZ8D3xV6luIO/RWJlpq1/pqinYeeE+YzpV0znRkfBs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786959732; c=relaxed/simple;
	bh=HbTA1PMJluS7VV3AhIZgnPInfofjK3Qsqi4osje2NRA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=RwqnKEfATjwQtNUIpP7sBJGuS0Er5IhGxtj5MDbmCoEGu8dH7lxkTJO7xN2kcaild7yvtDzoCfNNmq13p0owPUAdqQcTkDg0QT5LFNCO/QmWcmEErJExzZeHTFV75CzNfS457BBq+DDRRBrH39F93n/aBdC9gcbuQ/vNCRu5jaU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=pass smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=gk5StZbR; arc=fail smtp.client-ip=185.183.30.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="gk5StZbR"
Received: from pps.filterd (m0209321.ppops.net [127.0.0.1])
	by mx08-001d1705.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67H3s5WE2745657;
	Mon, 17 Aug 2026 09:21:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=p1; bh=CnRD+/S
	qvKFKJbBBe3Q4cUi77yN3mRaM/EcLZUzKnrw=; b=gk5StZbRyVW47PRFigaFCxL
	9LbxJ5hnmGoGgCCAOnKkHzuREixrgvQAc3cWkSAn5bHDLGSM4o5FRr2CX6YoFUD0
	MXSFsSPkh5xVuRyihcD6GrbAqJYXHFFi5SWFl8TmInVcVTLYy0vh24sLWZGDjaub
	Aje8UQ77DRmbDVgs2ppIlYf1erIOMWz+tb5fYJrq3rEpHSU7Zgj8M6WDq1I5QFas
	gMN1Mr8jJb5SlctcgY6Y1tATPDMqLVuXknMzYF0AcmbjZE1niVxfZ8Z+B2Ci4hd5
	enZRE8NFNmMTZNL/yYknXfiXiXGlBbUkgu64wEA7U3NpLIXSzZy8ODoHAMCFLPg=
	=
Received: from os0p286cu011.outbound.protection.outlook.com (mail-japanwestazon11010038.outbound.protection.outlook.com [52.101.228.38])
	by mx08-001d1705.pphosted.com (PPS) with ESMTPS id 4g2dh01y26-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Mon, 17 Aug 2026 09:21:16 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ErNj+BUW0+DIYCF6yWdUGoAJFjlqoJsbNUdd7GK/9o3ecudbAhTr1I9rgiWKnKhNDLzG3yBqJegi5bU4i/VOy9i/Qa4B7oOo1kN6Cyg2t9+nBgV2BjbOnTlTef13aW7A+GU97AwC/8ro1DfmRo7UMkgrAFYuagV08ooKnoqphmNlo5fu+nqPlLY2Su56llPi0iWdc8vvdzKAe+Nxc7z9GUX2C7CJpGnGU5dWTHyhQCm00RYwjt/21kb9k4zdAOr2OE+uTj1v/Pf4N7o03TWbWgCaCJHk00fhZoQNHKwsXF2gwdeca/mTneQ2iNlkXQL9bcY/+Yc7I5pwu7MXW5D6bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CnRD+/SqvKFKJbBBe3Q4cUi77yN3mRaM/EcLZUzKnrw=;
 b=aRPkTS5maFVxObUDyYWrYB5Czpm0AB52Zs5i3V6gwLZvDrr0qd240T4S5Mjcmw31EVN1AnapDm/saoSPqTJVoe/9bqiXJy99a62ZX8U+Ki70sAcfk64fObc7ub5Z2eQpxXrhOUqN5ljTgfA/MspiDlUC06zRs4GNVfYgSK8kODbullW7dwah/brJRsCM6ObJ4k4rG8iUnT1W6PWaV7GHDrO+reFNU/GGbl5NX2Xdwdd+7cwEbZmMKqRqFUpsDu6CPj0FTEvNNmvGrmz0dsXR8uxDvhRnYC+URMoCygE2BOHbp1rIF5JgyaGUPv125pBdJ9oA4kLv+wPkavsAlBvGDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sony.com; dmarc=pass action=none header.from=sony.com;
 dkim=pass header.d=sony.com; arc=none
Received: from OS7PR01MB17833.jpnprd01.prod.outlook.com
 (2603:1096:604:445::14) by TYYPR01MB12419.jpnprd01.prod.outlook.com
 (2603:1096:405:f4::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Mon, 17 Aug
 2026 09:21:09 +0000
Received: from OS7PR01MB17833.jpnprd01.prod.outlook.com
 ([fe80::6938:cbba:dd27:306a]) by OS7PR01MB17833.jpnprd01.prod.outlook.com
 ([fe80::6938:cbba:dd27:306a%4]) with mapi id 15.21.0315.016; Mon, 17 Aug 2026
 09:21:09 +0000
From: "Lachlan.Michael@sony.com" <Lachlan.Michael@sony.com>
To: "dave.stevenson@raspberrypi.com" <dave.stevenson@raspberrypi.com>
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
Subject: Re: [PATCH v2 2/2] media: i2c: Add Sony IMX908 image sensor driver
Thread-Topic: [PATCH v2 2/2] media: i2c: Add Sony IMX908 image sensor driver
Thread-Index: AQHdJXLJ+iNb4Rp7PUW31ChQ9CDkHLaRPJSAgBBVPjs=
Date: Mon, 17 Aug 2026 09:21:09 +0000
Message-ID:
 <OS7PR01MB17833AD851D9272D1E1CE9AA592A72@OS7PR01MB17833.jpnprd01.prod.outlook.com>
References: <20260806070934.21764-1-lachlan.michael@sony.com>
 <20260806070934.21764-3-lachlan.michael@sony.com>
 <CAPY8ntCHzT1H3Qpbi9WpAbZc-fY0ezDxLc93jxnD1v+OCNbh0Q@mail.gmail.com>
In-Reply-To:
 <CAPY8ntCHzT1H3Qpbi9WpAbZc-fY0ezDxLc93jxnD1v+OCNbh0Q@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS7PR01MB17833:EE_|TYYPR01MB12419:EE_
x-ms-office365-filtering-correlation-id: 4655aa2a-c20c-439a-24c0-08defc40dfc6
x-ld-processed: 66c65d8a-9158-4521-a2d8-664963db48e4,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|10070799003|1800799024|366016|23010399003|18002099003|22082099003|56012099006|3023799007|38070700021|6133799003|11063799006|4143699003|10067099003;
x-microsoft-antispam-message-info:
 KUXjIhQiMxHH5KuejzDV6uG9x4apjTvycHRs5AfdxNABsUmTWFeed55eZ84cHvKnFZszA9eo6F5Qy5L1NAA9eLBL5K6wWizgZZaZYG1TamNnw5pUtjnoNNJYe3Zwv0lq9Egc5VKYYO7cy769z+05plfv3egfZkXur5QXBqccfIsGUlTisq1+jQILUOpA9ZRuDS+tYZumwrYIKLAXqP8Sp8su5yZpfgyRuZQswVvdTSYQPIPY9DeLpaIaZWX4IB2MoqRpaVxoI5GTcTDZ6l1K48VzFeCYbPfOylbD962Vf69ScDihz1yU6Kc4RmhLCPxtQKEXKOPW6m8ApP601kNPmGozm1xnSSzammtuqOcVwK5Rgnk5IaPlt+d45qLaHFuadnsX43YbFc97HSiuydKMxCvLHBjwFLc2oA8YOMGaivJtrMAHAxiBq+XsgQkUiybVHRmSzc4q+A24NfQeao7wEFLWYeaJIjQPffh+hqkh94zqdRQhtRZO2/7lGdJZ3i/mQIboMl7XVxEf6Wt8brJy7aLR0mYgrlBjMPJAGlydMo25TVinOOpKUucxVpsaP/67i47yMLS4acvsvvl0s4UAYdy7y+MdiBc+p3dazzwM7sbD7MZhbAQTr85J3ILEpoS6W6oUsaqHBBbPdSbYBkSukI0W7h2I6xX0HzhO/l4CIv9aX3CC4UIBCuUZ4XV1oMngyy2cJNKfMtMByBKnUJbI2zxgPVRvOELg7E5IsFkIiYw=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS7PR01MB17833.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(10070799003)(1800799024)(366016)(23010399003)(18002099003)(22082099003)(56012099006)(3023799007)(38070700021)(6133799003)(11063799006)(4143699003)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:
 =?Windows-1252?Q?QGQZ8UiTJgvuRqSCvNfVrEwcTXZHPkh15447Gv5/LnKQm84NG2M5hv+B?=
 =?Windows-1252?Q?jpB9ANnaOHlLzjOUZPqgHGcbPaqIb+cCLu992k3A5qrVhAc9vRUHpGIo?=
 =?Windows-1252?Q?iBVdG40tsO6DrA/NChXnMZJhFjGGZWy6XaHPGLb0Io4WJ/kIViYzaYUa?=
 =?Windows-1252?Q?dMjE7/HUFaFrKhXnYzvrMvgpzPp9lu8cLN7ofvnZY7Z3sbkqYtgQiGqk?=
 =?Windows-1252?Q?04sWVmUafkTOF3ur+eOIFZKuZcxdpfvc9QfJNM0MtrYSL30YhxMYpAPC?=
 =?Windows-1252?Q?NGZkvzr+CKmJvi1tt0iigNrBs7l8ikCle3ZN8ziF3PtLWfYefIK10/pa?=
 =?Windows-1252?Q?iAWQTOtiy2BvHU472qtIzFgzxojqvKMqKkrxryjvZFKHf7ymh4FpOAGL?=
 =?Windows-1252?Q?BetuenKzJsNhx4/Kabuh0rCqWM3TRl/Dbg9gbmVuBxSJb4yTraqt/j11?=
 =?Windows-1252?Q?7KDIJHBBWCq3G/qD3UgtMEuIhX54tSDKAOS3v+rYQDoYyMPk0MsXNshd?=
 =?Windows-1252?Q?Wr7tEL8GyWCsuAe+S/uCMD+4U40fLcoig/TnId89ienYdPr/D30rlaYv?=
 =?Windows-1252?Q?pg8R8b/5xqm37HL82IhBhuTOuTx9g16SbGGGMqA93wgbDI0ShNfscWxU?=
 =?Windows-1252?Q?ikIWqJLDZk/IcXVpwB6erRHJPxo/NWEnl8wQHqmz5XvBOIT4FjT+Fw1u?=
 =?Windows-1252?Q?2dpRw9grvkHlThpfHY3hLOuoPSr4XP/VQreI55kYkAK/IUlLyjV3KMdA?=
 =?Windows-1252?Q?5M3TditYfJtl1lFxD0sJt8r5OXiqFVyk2k1tfZG2Opkh1GzwT2XhT7Yb?=
 =?Windows-1252?Q?8ZCW1XTzPkrCyN7enqN/Qxx/OWfc8jurR+NJSDur7LkxTe/Ba3M7HMiP?=
 =?Windows-1252?Q?A80tVAWhVkR8Y9N5xLMSJFdBhjRnypsiO2MSUhQQCUQRo7UFzjj3F9yB?=
 =?Windows-1252?Q?XTwv1uu3v31vltIXaMz3uqE4xvi/qpX+IhSfy5kXsIw/DZKbjnDImzLg?=
 =?Windows-1252?Q?BO9PqrbgQZ3xV8jbMoQdNF+KF+z1y1JqgjE0Rp9GvjW9ERTNxNt1RV5X?=
 =?Windows-1252?Q?A/55R0Tcq4WVlAvQyvzH3QyCJz/t9vzMDOd+zb2mtgl8ojs3C0t7698m?=
 =?Windows-1252?Q?IGuI8PtCr+Rd1V/s+srbCvvyZoyjQjJT/mk8QPWcPypa//FGnd4VpBSI?=
 =?Windows-1252?Q?mwkA/uF+yTPMYgAOKSWrqETNNkYOpBIzxLRN4H8FYFoCVbX94BkZ6c6t?=
 =?Windows-1252?Q?iGZ2qyCV4WjP0ytVUziMYHZ594R30DVYu5rYihYgrj3d3+MbcxJk6FV8?=
 =?Windows-1252?Q?krNrSNotrXwcC7wBOZ8gVrTmMNb2oG4zDComahKVvtkJK4tLz/7/lkSX?=
 =?Windows-1252?Q?WdyqglvpcRh5NbQjvWaPkBYYfNygDHTlaPKtI0xnBk8Vo830LYGWzoPV?=
 =?Windows-1252?Q?FoEyUA7yMlO4gb6ba9D5ZKSAMRWNJxAy7xNA5cixZTobsqPOzZYQkAsG?=
 =?Windows-1252?Q?G5/+gChhfSCrQKPy0p10vvrVnX4l956Z9h8X5Zkzll8/KYcTnWamNVcF?=
 =?Windows-1252?Q?LpQy0zt7iN6NAfwkGDL8De8MgIw6jGkZWO84LbEePAv6v8rpjk2sQ2LC?=
 =?Windows-1252?Q?Ym8THrFkmZrV8LmXdRvYtlisDPXh/EFKFFhLcPFets+6sAgK5W8Tuc0c?=
 =?Windows-1252?Q?sZv5471O4DKM2pgjXs81FgJlLIaffi6R9OvlCRqVXFR9/X/cCcyOVi9e?=
 =?Windows-1252?Q?jidFabAx/ENfsI8vvn+ctnXx/jgi5l5dZXqIMe8wJcHWnEnm6krJpA3/?=
 =?Windows-1252?Q?N05HCu05+P6PwouopsGY0bdzKNItuwfjRgJ7fiAUQkiwpTttOh8l411g?=
 =?Windows-1252?Q?BtmDXdRojhLhnLjBZa7tGEu2H1nEkkuQK+XM8n8FTzkXESTHjtBJJpBL?=
 =?Windows-1252?Q?FGJVk2Tu?=
x-ms-exchange-antispam-messagedata-1: 9o15jL7BG/FRfg==
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	azKtkT8flt+Pxo7BPBAVrR5pQaYu4cooFvOBUp/CXUklJil+R4UOMMV1fqes0oxr94SoZOgGs9+MvgJwX3sg+kJZaHwO2Qn/OgwejayVy41oy1hlq6XMtnwyOTzntXJJUKayYmiRpsTofo5iWIaZpVg7oTx0vDha1fbzeQ/rHa7wYhbo+YyyxGOUAa0nJtRzglf8DAVG3BNYjxP1uv/54xMYADiGQYXaOJjqU/8T4yxqG3PGGGzzn5ek883n7MJkSzVu7/yK7Ufnl7vDQ8OfflTd6oy1RDthp3ngIFGiQA9wJl1K34BxNuPRXCdD8vsyx0ZlBP3sjYej7z+tFLnEaQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Aumgh1cy5eRS02N/z+/C9jkjGcJ+8P+TChw0TJfVfMIDb14qnKVo5IRQvwz6PnFgQ6ZXnqxWLeJBJF15et1i27i0zBVrR7uttCKDCKrk6i/KLUkNJc5oPltwRMfPKEzEWO8l9JrF3A7TkmWHvGh0Ln6cqCtD1uJRlIwSmhv+F1U8DSUDIOJTbLbqgYbisBGrwc3sNoqU+oqTcOZUpR7PASF280ChESQQ7LtMBP2SxR+bLA+SrYWgPkdeJGCEtsJBGUifCM2+3r5wHSYtFFb71FU2pCbXXQYNx5YEmkIoN/FJcZB48DZbfR5wJW++o/kPjQU1++CkTLD68WPwLBX0L/nQMsmifp6wNAjayoOu9HxuOyYynohhw0znyini9oDi+8TszUqiSXnIYKgxKtzezur0YORxaQg7BWo1Vxfka41Jl5+xqOgI/oNCgv0sQC6UhIlDbiK4m2BaQhlVdvEqsHWd5EKr1Q9OYiWhATV89mrjjaTc3HVM0eDwR8KGRxrLXRjAAOU8+OPpyCSzOASwZ6dvgRd1WpxilkBfCrxE1INliTSOAtV2g5q+/0k78H8iTWox2Uha1Z0LJhtyKdtPKrPxuXwQyn5nP7n8wU/hstJklz7UYv3/FIQkhmrj2Vtj
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS7PR01MB17833.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4655aa2a-c20c-439a-24c0-08defc40dfc6
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Aug 2026 09:21:09.5399
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GpQ4r02cnZMa5Zo+QmCUNs/J45zQr9W0w4LW8yQob7ZLqesbZxN7oLrn5dJpkyJb/bOSeNebrjhIKEz0n8jbw587K8MNLzKS9+j/luPznhI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB12419
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDA3MCBTYWx0ZWRfXzjlIxEttdrnI
 gsVgF1puxUAm50muhzc5Q6JWwj7Zlz95cACKjHeyXDf5UMCMcuwCv5MB43Zag1Kxrtvus+5uxwi
 K4iy6UwylqKesO9GmjwTS9NBMBKRtreqAzxmFSTbpQ/Zb/Xs+13U
X-Proofpoint-GUID: VmehFjkYtL3RerCCxkhsrWvxvM5Nlh33
X-Authority-Analysis: v=2.4 cv=V/1NF+ni c=1 sm=1 tr=0 ts=6a82d28c cx=c_pps
 a=AI8kQwU1CkerJl91QOTYlA==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=N659UExz7-8A:10
 a=Sv0fKeRqtYgA:10 a=7j0FZ4iXMVMA:10 a=xR56lInIT_wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KAb5x4SsHD3PzxGk7EmX:22 a=M2bq-ooH9SiLYa4vvubY:22
 a=z6gsHLkEAAAA:8 a=lQsVZ7t_d8X_-ST0NxcA:9 a=pILNOxqGKmIA:10
X-Proofpoint-ORIG-GUID: VmehFjkYtL3RerCCxkhsrWvxvM5Nlh33
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDA3MCBTYWx0ZWRfX7bsZN37RvjOG
 T5O3g69XeM3U7pula2K+7s9WCmw3GglOIgARGCKwJDVc37Uy8fg9ndrhrGCFdrMEMsVoAk/tmxN
 dPQnpruzMphFOBx13qp4HUF9gwqmEWuqlP7lnvb3UKHCi420le7jyhjUB386TgQGEB7cPuCtJCf
 ti34DVYS8gyGXL8zuoxen0NbVm2ME2kHO0RyHUycE4J2UPSSFlupZZJJue/hx8BEyQqxS0bxQeI
 uJdUiLuandELJ6hc0IFvcp/M7Zo5BRb/Xuv9BXyCvQfKyYyhr8YcOho6wG4bVdbVcKsXN9msklV
 ymubs6MhJjunoPkdKoYDjWIQN6KCb7r/TfY5Tx1FM46TKFgHnXIBFpiTdaSQJIUVmtAjL0HWZFZ
 URylyyqymPFTb3V/5K3JRysUilHp/kaeGexCO7NCpFycrZyqleDG/lvfjDK0UpCrFNGHd1D7Bzl
 bQoKt/UTbUlmfvbYcDA==
X-Sony-Outbound-GUID: VmehFjkYtL3RerCCxkhsrWvxvM5Nlh33
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_06,2026-08-12_01,2025-10-01_01

Dear Dave,=0A=
=0A=
Thanks for your review. =0A=
I was on summer holidays last week so sorry for the delay in replying.=0A=
=0A=
>Hi Lachlan=0A=
>=0A=
>These comments are made without having access to the datasheet or=0A=
>software reference manual (I have requested them), so are based on my=0A=
>experience of other Starvis sensors. Feel free to dismiss them if not=0A=
>applicable to this sensor.=0A=
>=0A=
>And some are personal preferences, so feel free to disagree there :-)=0A=
>=0A=
>On Thu, 6 Aug 2026 at 08:12, Lachlan Michael <lachlan.michael@sony.com> wr=
ote:=0A=
>>=0A=
>> The Sony IMX908 is an 8.39 megapixel (3856x2176) CMOS image sensor=0A=
>> with a MIPI CSI-2 output interface, configurable as either 2 or 4=0A=
>> data lanes.=0A=
>>=0A=
>> Add a V4L2 sub-device driver for the sensor. The driver supports=0A=
>> RAW10 and RAW12 output formats, exposure and analogue gain controls,=0A=
>> horizontal and vertical flipping, horizontal and vertical blanking=0A=
>> controls, window cropping and test pattern generation.=0A=
>>=0A=
>> HDR modes and RAW16 output are not currently supported.=0A=
>>=0A=
>> Signed-off-by: Lachlan Michael <lachlan.michael@sony.com>=0A=
>> ---=0A=
>> Changes in v2:=0A=
>> - Treat the pixel rate as a fixed sensor property (594 MHz, 8 px/clock),=
=0A=
>> =A0 read-only.=0A=
>> - Compute HMAX from both the array and MIPI link floors.=0A=
>> - Express HBLANK in pixels with a step of 8; keep HMAX fixed in crop=0A=
>> =A0 mode.=0A=
>> - Drop struct imx908_mode; cache hmax/vmax directly.=0A=
>> - Change the link-frequency table to s64.=0A=
>> - Fix the probe error-unwind ordering.=0A=
>> - Be silent on success (chip ID print is now dev_dbg).=0A=
>> - Drop redundant comments.=0A=
>> - Kconfig: fix a "module will be called" typo.=0A=
>> ---=0A=
=0A=
<snip>=0A=
=0A=
>> + =A0 =A0 =A0 { CCI_REG8(0x46a6), 0xcf },=0A=
>> + =A0 =A0 =A0 { CCI_REG8(0x46e2), 0xf3 },=0A=
>> +};=0A=
>> +=0A=
>> +static const u32 tuning_regs[] =3D {=0A=
>=0A=
>Rename to bit_depth_regs? That is what they are programmed based on.=0A=
>Almost all registers affect the tuning.=0A=
=0A=
Ok.=0A=
=0A=
>> + =A0 =A0 =A0 CCI_REG8(0x3d78),=0A=
>> + =A0 =A0 =A0 CCI_REG8(0x3d79),=0A=
>> + =A0 =A0 =A0 CCI_REG8(0x3d80),=0A=
>> + =A0 =A0 =A0 CCI_REG8(0x3d81),=0A=
>> + =A0 =A0 =A0 CCI_REG8(0x3d88),=0A=
>> + =A0 =A0 =A0 CCI_REG8(0x3d89),=0A=
>> + =A0 =A0 =A0 CCI_REG8(0x3d90),=0A=
>> + =A0 =A0 =A0 CCI_REG8(0x3d91),=0A=
>> +};=0A=
>> +=0A=
=0A=
<snip>=0A=
=0A=
>> +enum {=0A=
>> + =A0 =A0 =A0 IMX908_LINK_FREQ_297MHZ,=0A=
>> + =A0 =A0 =A0 IMX908_LINK_FREQ_360MHZ,=0A=
>> + =A0 =A0 =A0 IMX908_LINK_FREQ_445MHZ,=0A=
>> + =A0 =A0 =A0 IMX908_LINK_FREQ_594MHZ,=0A=
>> + =A0 =A0 =A0 IMX908_LINK_FREQ_720MHZ,=0A=
>> + =A0 =A0 =A0 IMX908_LINK_FREQ_891MHZ,=0A=
>> + =A0 =A0 =A0 IMX908_LINK_FREQ_1039MHZ,=0A=
>> + =A0 =A0 =A0 IMX908_LINK_FREQ_1188MHZ,=0A=
>=0A=
>If you reversed the order in this enum then it would also be the=0A=
>register value. If you want to be explicit, then assign a value to=0A=
>each as well=0A=
>=A0  =A0 =A0IMX908_LINK_FREQ_1188MHZ =3D 0x00,=0A=
>  =A0  =A0IMX908_LINK_FREQ_1039MHZ =3D 0x01,=0A=
> =A0 =A0 =A0IMX908_LINK_FREQ_891MHZ =3D 0x02,=0A=
> =A0 =A0etc=0A=
>That would make imx908_datarate_sel[] and=0A=
>imx908_link_freq_to_datarate_sel() redundant.=0A=
>The link frequency control is read only, so it makes no difference to=0A=
>userspace what order they're in.=0A=
=0A=
Oh, nice suggestion :-) =0A=
Fixed for next version.=0A=
=0A=
>> +};=0A=
>> +=0A=
>> +static const s64 imx908_link_freqs[] =3D {=0A=
>> + =A0 =A0 =A0 [IMX908_LINK_FREQ_297MHZ] =A0=3D =A0297000000LL,=0A=
>> + =A0 =A0 =A0 [IMX908_LINK_FREQ_360MHZ] =A0=3D =A0360000000LL,=0A=
>> + =A0 =A0 =A0 [IMX908_LINK_FREQ_445MHZ] =A0=3D =A0445000000LL,=0A=
>> + =A0 =A0 =A0 [IMX908_LINK_FREQ_594MHZ] =A0=3D =A0594000000LL,=0A=
>> + =A0 =A0 =A0 [IMX908_LINK_FREQ_720MHZ] =A0=3D =A0720000000LL,=0A=
>> + =A0 =A0 =A0 [IMX908_LINK_FREQ_891MHZ] =A0=3D =A0891000000LL,=0A=
>> + =A0 =A0 =A0 [IMX908_LINK_FREQ_1039MHZ] =3D 1039500000LL,=0A=
>> + =A0 =A0 =A0 [IMX908_LINK_FREQ_1188MHZ] =3D 1188000000LL,=0A=
>> +};=0A=
>> +=0A=
>> +/* DDR lane_rate (Mbps/lane) =3D 2 x link_freq (Hz) / 1e6 */=0A=
>> +static const u8 imx908_datarate_sel[] =3D {=0A=
>> + =A0 =A0 =A0 [IMX908_LINK_FREQ_297MHZ] =A0=3D 0x07, /* =A0594 Mbps */=
=0A=
>> + =A0 =A0 =A0 [IMX908_LINK_FREQ_360MHZ] =A0=3D 0x06, /* =A0720 Mbps */=
=0A=
>> + =A0 =A0 =A0 [IMX908_LINK_FREQ_445MHZ] =A0=3D 0x05, /* =A0891 Mbps */=
=0A=
>> + =A0 =A0 =A0 [IMX908_LINK_FREQ_594MHZ] =A0=3D 0x04, /* 1188 Mbps */=0A=
>> + =A0 =A0 =A0 [IMX908_LINK_FREQ_720MHZ] =A0=3D 0x03, /* 1440 Mbps */=0A=
>> + =A0 =A0 =A0 [IMX908_LINK_FREQ_891MHZ] =A0=3D 0x02, /* 1782 Mbps */=0A=
>> + =A0 =A0 =A0 [IMX908_LINK_FREQ_1039MHZ] =3D 0x01, /* 2079 Mbps */=0A=
>> + =A0 =A0 =A0 [IMX908_LINK_FREQ_1188MHZ] =3D 0x00, /* 2376 Mbps */=0A=
>> +};=0A=
>> +=0A=
>> +/* Allowed clock values in Hz */=0A=
>> +static const u32 imx908_inck_table[] =3D {=0A=
>> + =A0 =A0 =A0 74250000,=0A=
>> + =A0 =A0 =A0 37125000,=0A=
>> + =A0 =A0 =A0 72000000,=0A=
>> + =A0 =A0 =A0 27000000,=0A=
>> + =A0 =A0 =A0 24000000,=0A=
>> +};=0A=
>> +=0A=
>> +struct imx908 {=0A=
>> + =A0 =A0 =A0 struct v4l2_subdev sd;=0A=
>> + =A0 =A0 =A0 struct media_pad pad;=0A=
>> + =A0 =A0 =A0 struct device *dev;=0A=
>> +=0A=
>> + =A0 =A0 =A0 struct regmap *cci;=0A=
>> +=0A=
>> + =A0 =A0 =A0 struct clk *xclk;=0A=
>> + =A0 =A0 =A0 struct gpio_desc *reset_gpio;=0A=
>> + =A0 =A0 =A0 struct regulator_bulk_data supplies[ARRAY_SIZE(imx908_supp=
ly_names)];=0A=
>> +=0A=
>> + =A0 =A0 =A0 u8 =A0inck_sel;=0A=
>> +=0A=
>> + =A0 =A0 =A0 u8 num_lanes;=0A=
>> + =A0 =A0 =A0 unsigned long link_freq_bitmap;=0A=
>> + =A0 =A0 =A0 unsigned int link_freq_idx;=0A=
>> +=0A=
>> + =A0 =A0 =A0 /* Cached current sensor timing */=0A=
>> + =A0 =A0 =A0 u16 hmax; =A0 =A0 =A0 /* clocks per line */=0A=
>> + =A0 =A0 =A0 u32 vmax; =A0 =A0 =A0 /* lines per frame */=0A=
>> +=0A=
>> + =A0 =A0 =A0 struct {=0A=
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct v4l2_ctrl_handler handler;=0A=
>> +=0A=
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct v4l2_ctrl *pixel_rate; =A0 /* fixed=
, read-only */=0A=
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct v4l2_ctrl *exposure;=0A=
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct v4l2_ctrl *vblank;=0A=
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct v4l2_ctrl *hblank;=0A=
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct v4l2_ctrl *test_pattern;=0A=
>> + =A0 =A0 =A0 } ctrls;=0A=
>> +};=0A=
>> +=0A=
>> +static inline struct imx908 *to_imx908(struct v4l2_subdev *_sd)=0A=
>> +{=0A=
>> + =A0 =A0 =A0 return container_of(_sd, struct imx908, sd);=0A=
>> +}=0A=
>> +=0A=
>> +/* ----------------------- Basic Helper Functions ---------------------=
------ */=0A=
>> +=0A=
>> +static int imx908_link_freq_to_datarate_sel(struct imx908 *imx,=0A=
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 u64 link_freq_hz, u8 *sel)=0A=
>> +{=0A=
>> + =A0 =A0 =A0 for (unsigned int i =3D 0; i < ARRAY_SIZE(imx908_link_freq=
s); i++) {=0A=
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (imx908_link_freqs[i] =3D=3D link_freq_=
hz) {=0A=
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 *sel =3D imx908_datarate_s=
el[i];=0A=
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return 0;=0A=
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }=0A=
>> + =A0 =A0 =A0 }=0A=
>> + =A0 =A0 =A0 return -EINVAL;=0A=
>> +}=0A=
>> +=0A=
>> +static bool imx908_mbus_code_supported(struct imx908 *imx, u32 code)=0A=
>> +{=0A=
>> + =A0 =A0 =A0 for (unsigned int i =3D 0; i < ARRAY_SIZE(imx908_mbus_code=
s); i++) {=0A=
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (imx908_mbus_codes[i] =3D=3D code)=0A=
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return true;=0A=
>> + =A0 =A0 =A0 }=0A=
>> +=0A=
>> + =A0 =A0 =A0 return false;=0A=
>> +}=0A=
>> +=0A=
>> +static u16 imx908_calc_hmax(u32 width, u32 hblank)=0A=
>> +{=0A=
>> + =A0 =A0 =A0 /* Fixed pixel rate makes this a divide-by-8 */=0A=
>> + =A0 =A0 =A0 u32 hmax =3D DIV_ROUND_UP(width + hblank, IMX908_PIX_PER_C=
LK);=0A=
>> +=0A=
>> + =A0 =A0 =A0 return min_t(u32, hmax, IMX908_HMAX_MAX);=0A=
>> +}=0A=
>> +=0A=
>> +static u32 imx908_calc_vmax(u32 height, u32 vblank)=0A=
>> +{=0A=
>> + =A0 =A0 =A0 return min_t(u32, height + vblank, IMX908_VMAX_MAX);=0A=
>> +}=0A=
>> +=0A=
>> +/*=0A=
>> + * Array (producer) floor: with the fixed pixel rate the column ADC emi=
ts=0A=
>> + * IMX908_PIX_PER_CLK pixels per internal clock, so a line cannot be sh=
orter=0A=
>> + * than ceil(width / 8) internal clocks.=0A=
>> + */=0A=
>> +static u32 imx908_calc_array_min_hmax(u32 width)=0A=
>> +{=0A=
>> + =A0 =A0 =A0 return DIV_ROUND_UP(width, IMX908_PIX_PER_CLK);=0A=
>> +}=0A=
>> +=0A=
>> +/*=0A=
>> + * Link (consumer) floor: the line period must be long enough for the M=
IPI=0A=
>> + * burst (width * bpp bits) to drain over num_lanes * link_freq * 2 (DD=
R).=0A=
>> + */=0A=
>> +static u32 imx908_calc_link_min_hmax(struct imx908 *imx, u32 width, u8 =
bpp)=0A=
>> +{=0A=
>> + =A0 =A0 =A0 u64 link_hz =3D imx908_link_freqs[imx->link_freq_idx];=0A=
>> + =A0 =A0 =A0 u64 num =3D (u64)width * bpp * IMX908_XHS_HZ;=0A=
>> + =A0 =A0 =A0 u64 den =3D (u64)imx->num_lanes * link_hz * 2; /* DDR */=
=0A=
>> +=0A=
>> + =A0 =A0 =A0 /*=0A=
>> + =A0 =A0 =A0 =A0* den can exceed 32 bits (e.g. 4 lanes * 720 MHz * 2 =
=3D 5.76 GHz), so=0A=
>> + =A0 =A0 =A0 =A0* DIV_ROUND_UP_ULL / do_div would truncate the divisor =
to u32. Use a=0A=
>> + =A0 =A0 =A0 =A0* full 64/64 division.=0A=
>> + =A0 =A0 =A0 =A0*/=0A=
>> + =A0 =A0 =A0 return DIV64_U64_ROUND_UP(num, den);=0A=
>=0A=
>It's unlikely to make that significant a difference, but don't you=0A=
>need to account for the LP to/from HS transitions on the MIPI link?=0A=
=0A=
A more accurate minimum is really drain_time + framing + LP/HS_transition=
=0A=
and you're right that here I am only calculating the drain_time. It's meant=
 as=0A=
a safe lower bound for the HBLANK range rather than an exact line time.=0A=
=0A=
At 1440 Mbps/lane (720 MHz link) for 4K RAW10 the floor is about 495=0A=
clocks (~6.67 us):=0A=
 - CSI-2 packet header/footer is 48 bits on top of width*bpp, ~0.1%.=0A=
 - the LP/HS transition, from the D-PHY timings, is a few hundred ns per li=
ne, =0A=
   ~7% of the floor at 4 lanes (~3% at 2 lanes).=0A=
=0A=
Both terms are strictly positive, so folding them in only ever raises the f=
loor,=0A=
so this is more about accuracy than safety. =0A=
=0A=
Given that, do you suggest I should add in the packet framing and/or the =
=0A=
LP/HS transition into this floor, or is it ok to leave it as the payload-on=
ly =0A=
bound (as-is)?=0A=
=0A=
>> +}=0A=
>> +=0A=
>> +/* HMAX must satisfy both the array (producer) and link (consumer) limi=
ts */=0A=
>> +static u16 imx908_calc_min_hmax(struct imx908 *imx, u32 width, u8 bpp)=
=0A=
>> +{=0A=
>> + =A0 =A0 =A0 return max(imx908_calc_array_min_hmax(width),=0A=
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0imx908_calc_link_min_hmax(imx, widt=
h, bpp));=0A=
>> +}=0A=
>> +=0A=
>> +static u32 imx908_calc_min_vmax(const struct v4l2_rect *crop)=0A=
>> +{=0A=
>> + =A0 =A0 =A0 /* In window crop mode constrain VMAX (from datasheet) */=
=0A=
>> + =A0 =A0 =A0 if (!v4l2_rect_equal(crop, &imx908_active_area))=0A=
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return max_t(u32, crop->height + IMX908_VM=
AX_CROP_MIN_MARGIN,=0A=
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0IMX908_VMAX_CROP_MI=
N_LIMIT);=0A=
>> +=0A=
>> + =A0 =A0 =A0 return IMX908_VMAX_DEFAULT;=0A=
>=0A=
>VMAX values in the Starvis datasheets always seem to be "let's give a=0A=
>nice round frame rate", not "this is the minimum that is valid".=0A=
>If run in window mode at 3856x2176 then VMAX would be 2176+70 =3D 2246,=0A=
>so I guess not such a big difference, but default is not the same as=0A=
>minimum.=0A=
>=0A=
>(IMX662 runs quite happily with a margin of 40 which gives an extra=0A=
>10% on the frame rate compared to the default. I ought to check=0A=
>against the datasheet for that one though)=0A=
=0A=
You're right =97 2250 is the 30 fps operating point, not a stated minimum,=
=0A=
but the +70 margin is only given for window-crop mode in the datasheet. =0A=
=0A=
There's no documented all-pixel VMAX minimum, so for crop mode I keep the=
=0A=
datasheet restriction (height + 70, >=3D 1206) and for all-pixel I leave th=
e=0A=
floor at the 2250 default as a conservative bound rather than inferring one=
.=0A=
=0A=
I added a comment:=0A=
	/* No datasheet min for all-pixel; use 30 fps default as safe floor */=0A=
	return IMX908_VMAX_DEFAULT;=0A=
=0A=
>> +}=0A=
>> +=0A=
>> +static u32 imx908_calc_min_vblank(const struct v4l2_rect *crop)=0A=
>> +{=0A=
>> + =A0 =A0 =A0 u32 min_vmax =3D imx908_calc_min_vmax(crop);=0A=
>> +=0A=
>> + =A0 =A0 =A0 if (min_vmax <=3D crop->height)=0A=
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return 0;=0A=
>> +=0A=
>> + =A0 =A0 =A0 return min_vmax - crop->height;=0A=
>> +}=0A=
>> +=0A=
>> +static u32 imx908_calc_max_vblank(u32 height)=0A=
>> +{=0A=
>> + =A0 =A0 =A0 return IMX908_VMAX_MAX - height;=0A=
>> +}=0A=
>> +=0A=
>> +static int imx908_set_exposure_lines(struct imx908 *imx, u32 exposure_l=
ines)=0A=
>> +{=0A=
>> + =A0 =A0 =A0 u32 max_lines =3D imx->vmax - IMX908_MIN_SHR0;=0A=
>> +=0A=
>> + =A0 =A0 =A0 exposure_lines =3D clamp_t(u32, exposure_lines, 1, max_lin=
es);=0A=
>=0A=
>Isn't this clamp already enforced by the control handler limits?=0A=
=0A=
For a plain exposure set it's redundant. But it guards the combined =0A=
VBLANK+EXPOSURE set: exposure is validated against the old (larger) VMAX,=
=0A=
so if VBLANK's s_ctrl shrinks VMAX first, SHR0 =3D VMAX - exposure underflo=
ws.=0A=
The clamp absorbs that; I added a comment.=0A=
=0A=
>> +=0A=
>> + =A0 =A0 =A0 u32 shr0 =3D imx->vmax - exposure_lines;=0A=
>> +=0A=
>> + =A0 =A0 =A0 return cci_write(imx->cci, IMX908_REG_SHR0, shr0, NULL);=
=0A=
>> +}=0A=
>> +=0A=
=0A=
<snip>=0A=
=0A=
>> +static void imx908_update_vblank_limits(struct imx908 *imx,=0A=
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 const struct v4l2_rect *crop)=0A=
>> +{=0A=
>> + =A0 =A0 =A0 if (!imx->ctrls.vblank)=0A=
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return;=0A=
>=0A=
>Is there actually a path that calls this function before the control=0A=
>has been created? I can't immediately see one, but I do know they can=0A=
>hide.=0A=
=0A=
You're right, there's no such path. init_controls() sets the initial VBLANK=
=0A=
range inline and never calls update_vblank_limits(); the updater only runs=
=0A=
via update_framing_limits() (init_state/set_fmt/set_selection), all after t=
he=0A=
controls exist.=0A=
=0A=
>> +=0A=
>> + =A0 =A0 =A0 u32 min_vblank =3D imx908_calc_min_vblank(crop);=0A=
>> + =A0 =A0 =A0 u32 max_vblank =3D imx908_calc_max_vblank(crop->height);=
=0A=
>> +=0A=
>> + =A0 =A0 =A0 __v4l2_ctrl_modify_range(imx->ctrls.vblank, min_vblank, ma=
x_vblank, 1,=0A=
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0imx->ct=
rls.vblank->default_value);=0A=
>> +}=0A=
>> +=0A=
=0A=
<snip>=0A=
=0A=
>> +=0A=
>> +/* -------------------- Mode Building ----------------------- */=0A=
>> +static void imx908_mode_build(struct imx908 *imx,=0A=
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 const struct v=
4l2_mbus_framefmt *fmt,=0A=
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 const struct v=
4l2_rect *crop)=0A=
>> +{=0A=
>> + =A0 =A0 =A0 u8 bpp =3D imx908_bits_per_pixel(fmt->code);=0A=
>> +=0A=
>> + =A0 =A0 =A0 /* --- H timing (HMAX) --- */=0A=
>> + =A0 =A0 =A0 if (v4l2_rect_equal(crop, &imx908_active_area)) {=0A=
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 u16 min_hmax =3D imx908_calc_min_hmax(imx,=
 fmt->width, bpp);=0A=
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 u32 min_hblank =3D imx908_hmax_to_hblank(m=
in_hmax, fmt->width);=0A=
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 u32 max_hblank =3D imx908_hmax_to_hblank(I=
MX908_HMAX_MAX,=0A=
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0fmt->width);=0A=
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 u32 hblank =3D clamp_t(u32, imx->ctrls.hbl=
ank->val, min_hblank,=0A=
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0max_hblank);=0A=
>=0A=
>Again, isn't this clamp enforced by the control handler?=0A=
=0A=
This is the set_fmt/set_selection path, not a control write, so the handler=
's=0A=
range check doesn't apply. The hblank range is width-dependent, so on a=0A=
width change the stored hblank->val is still validated against the old widt=
h=0A=
and can be out of range for the new one. We clamp it into the recomputed=0A=
range before deriving HMAX (same reason the vblank clamp just below it is=
=0A=
needed).=0A=
=0A=
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 imx->hmax =3D imx908_calc_hmax(fmt->width,=
 hblank);=0A=
>> + =A0 =A0 =A0 } else if (!imx->hmax) {=0A=
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* First crop before any all-pixel config:=
 seed from default */=0A=
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 u32 hblank =3D imx908_hmax_to_hblank(IMX90=
8_HMAX_DEFAULT,=0A=
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0imx908_active_area.width);=0A=
>> +=0A=
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 imx->hmax =3D imx908_calc_hmax(fmt->width,=
 hblank);=0A=
>> + =A0 =A0 =A0 }=0A=
>> + =A0 =A0 =A0 /* else: crop with HMAX already fixed by the drive mode - =
keep it */=0A=
>> +=0A=
>> + =A0 =A0 =A0 /* --- V timing (VMAX) --- */=0A=
>> + =A0 =A0 =A0 u32 min_vblank =3D imx908_calc_min_vblank(crop);=0A=
>=0A=
>General query over defining variables in the middle of functions as=0A=
>you'll get some reviewers pushing back on it[0].=0A=
>In this case you're only using the values once each, so there's little=0A=
>need for them at all.=0A=
=0A=
Ok, I've folded them into the clamp (also HMAX) for the next version.=0A=
=0A=
>> + =A0 =A0 =A0 u32 max_vblank =3D imx908_calc_max_vblank(fmt->height);=0A=
>> + =A0 =A0 =A0 u32 vblank =3D clamp_t(u32, imx->ctrls.vblank->val,=0A=
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0min_vblank, max=
_vblank);=0A=
>> +=0A=
>> + =A0 =A0 =A0 imx->vmax =3D imx908_calc_vmax(fmt->height, vblank);=0A=
>> +}=0A=
>> +=0A=
>> +static void imx908_update_framing_limits(struct imx908 *imx,=0A=
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0struct v4l2_subdev_state *state)=0A=
>> +{=0A=
>> + =A0 =A0 =A0 const struct v4l2_mbus_framefmt *fmt;=0A=
>> + =A0 =A0 =A0 const struct v4l2_rect *crop;=0A=
>> +=0A=
>> + =A0 =A0 =A0 fmt =3D v4l2_subdev_state_get_format(state, IMX908_SOURCE_=
PAD);=0A=
>> + =A0 =A0 =A0 crop =3D v4l2_subdev_state_get_crop(state, IMX908_SOURCE_P=
AD);=0A=
>> + =A0 =A0 =A0 u8 bpp =3D imx908_bits_per_pixel(fmt->code);=0A=
>> +=0A=
>> + =A0 =A0 =A0 /* All-pixel: HBLANK drives HMAX. Crop: HMAX fixed, HBLANK=
 derived. */=0A=
>> + =A0 =A0 =A0 if (v4l2_rect_equal(crop, &imx908_active_area))=0A=
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 imx908_update_hblank_limits(imx, fmt->widt=
h, bpp);=0A=
>> + =A0 =A0 =A0 else=0A=
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 imx908_update_hblank_crop(imx, crop->width=
);=0A=
>> +=0A=
>> + =A0 =A0 =A0 imx908_update_vblank_limits(imx, crop);=0A=
>> + =A0 =A0 =A0 imx908_mode_build(imx, fmt, crop);=0A=
>> +=0A=
>> + =A0 =A0 =A0 __v4l2_ctrl_modify_range(imx->ctrls.exposure,=0A=
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0IMX908_=
EXPOSURE_MIN,=0A=
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0imx->vm=
ax - IMX908_MIN_SHR0,=0A=
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0IMX908_=
EXPOSURE_STEP,=0A=
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0imx->ct=
rls.exposure->default_value);=0A=
>> +}=0A=
>> +=0A=
>> +/* ----------------------- HW Programming ---------------------- */=0A=
>> +=0A=
>> +static int imx908_mode_apply(struct imx908 *imx,=0A=
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0const struct v4=
l2_mbus_framefmt *fmt)=0A=
>> +{=0A=
>> + =A0 =A0 =A0 int ret =3D 0;=0A=
>> + =A0 =A0 =A0 u8 adbit, mdbit;=0A=
>> +=0A=
>> + =A0 =A0 =A0 switch (fmt->code) {=0A=
>> + =A0 =A0 =A0 case MEDIA_BUS_FMT_SRGGB12_1X12:=0A=
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 adbit =3D IMX908_ADBIT_12BIT;=0A=
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 mdbit =3D IMX908_MDBIT_RAW12;=0A=
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;=0A=
>> +=0A=
>> + =A0 =A0 =A0 case MEDIA_BUS_FMT_SRGGB10_1X10:=0A=
>> + =A0 =A0 =A0 default:=0A=
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 adbit =3D IMX908_ADBIT_10BIT;=0A=
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 mdbit =3D IMX908_MDBIT_RAW10;=0A=
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;=0A=
>> + =A0 =A0 =A0 }=0A=
>> +=0A=
>> + =A0 =A0 =A0 cci_write(imx->cci, IMX908_REG_XMASTER, IMX908_CONTROLLER_=
MODE, &ret);=0A=
>> + =A0 =A0 =A0 cci_write(imx->cci, IMX908_REG_ADBIT, adbit, &ret);=0A=
>> + =A0 =A0 =A0 cci_write(imx->cci, IMX908_REG_MDBIT, mdbit, &ret);=0A=
>> +=0A=
>> + =A0 =A0 =A0 /* Tuning registers that need to be changed for RAW10/10-b=
it */=0A=
>> + =A0 =A0 =A0 u8 value =3D adbit =3D=3D IMX908_ADBIT_10BIT &&=0A=
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0mdbit =3D=3D IMX908_MDBIT_RAW10 ? 0=
x0c : 0x05;=0A=
>=0A=
>It's impossible for only one of those conditionals to be true as=0A=
>they're set above.=0A=
>Set "value" from the switch/case above to put it all in one place.=0A=
=0A=
Ok, done for the next version.=0A=
=0A=
>> +=0A=
>> + =A0 =A0 =A0 for (unsigned int i =3D 0; i < ARRAY_SIZE(tuning_regs); ++=
i)=0A=
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 cci_write(imx->cci, tuning_regs[i], value,=
 &ret);=0A=
>> +=0A=
>> + =A0 =A0 =A0 cci_write(imx->cci, IMX908_REG_INCK_SEL, imx->inck_sel, &r=
et);=0A=
>> + =A0 =A0 =A0 if (ret) {=0A=
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(imx->dev, "INCK register write fai=
led: %d\n", ret);=0A=
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return ret;=0A=
>> + =A0 =A0 =A0 }=0A=
>> +=0A=
>> + =A0 =A0 =A0 u8 datarate_sel;=0A=
>> + =A0 =A0 =A0 u64 link_freq =3D imx908_link_freqs[imx->link_freq_idx];=
=0A=
>> +=0A=
>> + =A0 =A0 =A0 ret =3D imx908_link_freq_to_datarate_sel(imx, link_freq, &=
datarate_sel);=0A=
>=0A=
>Is it possible for this call to fail? Probe has filtered the link=0A=
>frequencies using v4l2_link_freq_to_bitmap(), so the value has to=0A=
>match one of the entries.=0A=
>(Then again I've proposed removing imx908_link_freq_to_datarate_sel() abov=
e).=0A=
=0A=
Fixed per your previous suggestion.=0A=
=0A=
>> + =A0 =A0 =A0 cci_write(imx->cci, IMX908_REG_DATARATE_SEL, datarate_sel,=
 &ret);=0A=
>> + =A0 =A0 =A0 cci_write(imx->cci, IMX908_REG_LANEMODE, imx->num_lanes - =
1, &ret);=0A=
>> +=0A=
>> + =A0 =A0 =A0 /* Recommended black level offset is 50 in 10-bit, 200 for=
 others */=0A=
>> + =A0 =A0 =A0 u16 blklevel =3D (mdbit =3D=3D IMX908_MDBIT_RAW10) ? 50 : =
200;=0A=
>=0A=
>Move this assignment into the switch/case too.=0A=
=0A=
Done.=0A=
=0A=
>> +=0A=
>> + =A0 =A0 =A0 cci_write(imx->cci, IMX908_REG_BLKLEVEL, blklevel, &ret);=
=0A=
>> +=0A=
>> + =A0 =A0 =A0 return ret;=0A=
>> +}=0A=
>> +=0A=
>> +static int imx908_program_window(struct imx908 *imx,=0A=
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0const s=
truct v4l2_rect *crop)=0A=
>> +{=0A=
>> + =A0 =A0 =A0 bool all_pixel_mode =3D v4l2_rect_equal(crop, &imx908_acti=
ve_area);=0A=
>> + =A0 =A0 =A0 int ret =3D 0;=0A=
>> +=0A=
>> + =A0 =A0 =A0 cci_write(imx->cci, IMX908_REG_WINMODE,=0A=
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 all_pixel_mode ? IMX908_WINMODE_ALLPIX=
 : IMX908_WINMODE_CROP,=0A=
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 &ret);=0A=
>=0A=
>This one knocks on to several other checks of the active_area / all-pixel =
mode.=0A=
>Why switch into the pre-defined all-pixel mode at all? What advantage=0A=
>does it give you over always using window mode?=0A=
>=0A=
>To my mind it just gives the possibility that the crop defined in the=0A=
>structure is incorrect, therefore you aren't getting the pixels you=0A=
>thought you were.=0A=
>(I learned the hard way working on IMX675).=0A=
=0A=
All-pixel mode has variable HMAX; in window-crop mode the datasheet says=0A=
to keep HMAX at the drive-mode value, so collapsing to always-window would=
=0A=
lose that. The test pattern generator is also all-pixel only. On the crop-a=
ccuracy=0A=
concern: the advertised active_area (2176) is the datasheet's active height=
, distinct=0A=
from the 2180 effective height (the extra 4 lines are the ignored effective=
-pixel area),=0A=
so all-pixel mode does read out what we advertise.=0A=
=0A=
>> +=0A=
>> + =A0 =A0 =A0 if (!all_pixel_mode) {=0A=
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 cci_write(imx->cci, IMX908_REG_PIX_HST, =
=A0 =A0crop->left, =A0 &ret);=0A=
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 cci_write(imx->cci, IMX908_REG_PIX_HWIDTH,=
 crop->width, =A0&ret);=0A=
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 cci_write(imx->cci, IMX908_REG_PIX_VST, =
=A0 =A0crop->top, =A0 =A0&ret);=0A=
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 cci_write(imx->cci, IMX908_REG_PIX_VWIDTH,=
 crop->height, &ret);=0A=
>> + =A0 =A0 =A0 }=0A=
=0A=
<snip>=0A=
=0A=
>> +static int imx908_set_selection(struct v4l2_subdev *sd,=0A=
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct v4l=
2_subdev_state *sd_state,=0A=
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct v4l=
2_subdev_selection *sel)=0A=
>> +{=0A=
>> + =A0 =A0 =A0 struct v4l2_mbus_framefmt *format;=0A=
>> + =A0 =A0 =A0 struct v4l2_rect *crop;=0A=
>> + =A0 =A0 =A0 struct v4l2_rect *r =3D &sel->r;=0A=
>> + =A0 =A0 =A0 struct imx908 *imx =3D to_imx908(sd);=0A=
>=0A=
>One for the maintainers.=0A=
>Sakari asked for set_selection to NOT be implemented on imx678 as it=0A=
>complicates the common raw sensor model conversion [1], and that was=0A=
>then echoed for imx662 [2] (although that is now hopefully going to be=0A=
>an extension of imx678).=0A=
>Is implementing it acceptable here or not?=0A=
=0A=
IMX908 only does analog window crop, no binning, so I think it's ok in ligh=
t of=0A=
the discussions you raised, that is analog-crop-vs-binning distinction Laur=
ent=0A=
and Sakari drew on the os02g10 thread.=0A=
(sorry my company mailer mangles links so deleted here)=0A=
I will wait for official comments on this.=0A=
=0A=
>> +=0A=
>> + =A0 =A0 =A0 if (sel->target !=3D V4L2_SEL_TGT_CROP)=0A=
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;=0A=
>> +=0A=
>> + =A0 =A0 =A0 if (sel->which =3D=3D V4L2_SUBDEV_FORMAT_ACTIVE &&=0A=
>> + =A0 =A0 =A0 =A0 =A0 v4l2_subdev_is_streaming(sd))=0A=
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EBUSY;=0A=
>> +=0A=
>> + =A0 =A0 =A0 crop =3D v4l2_subdev_state_get_crop(sd_state, sel->pad);=
=0A=
>> + =A0 =A0 =A0 format =3D v4l2_subdev_state_get_format(sd_state, sel->pad=
);=0A=
>> +=0A=
>> + =A0 =A0 =A0 /*=0A=
>> + =A0 =A0 =A0 =A0* Round the crop rectangle size down to the hardware al=
ignment=0A=
>> + =A0 =A0 =A0 =A0* constraints, then clamp it to the supported size rang=
e.=0A=
>> + =A0 =A0 =A0 =A0*/=0A=
>> + =A0 =A0 =A0 r->width =3D clamp_t(s32, ALIGN_DOWN(r->width, IMX908_CROP=
_ALIGN_HWIDTH),=0A=
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0IMX908_CROP_MIN_WID=
TH, imx908_active_area.width);=0A=
>> + =A0 =A0 =A0 r->height =3D clamp_t(s32, ALIGN_DOWN(r->height, IMX908_CR=
OP_ALIGN_VWIDTH),=0A=
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 IMX908_CROP_MIN_HE=
IGHT, imx908_active_area.height);=0A=
>> +=0A=
>> + =A0 =A0 =A0 /*=0A=
>> + =A0 =A0 =A0 =A0* Round and clamp the crop position similarly, with the=
 maximum value=0A=
>> + =A0 =A0 =A0 =A0* chosen so that the crop rectangle remains fully insid=
e the active=0A=
>> + =A0 =A0 =A0 =A0* pixel array.=0A=
>> + =A0 =A0 =A0 =A0*/=0A=
>> + =A0 =A0 =A0 r->left =3D clamp_t(s32, ALIGN_DOWN(r->left, IMX908_CROP_A=
LIGN_HSTART), 0,=0A=
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 imx908_active_area.wid=
th - r->width);=0A=
>> + =A0 =A0 =A0 r->top =3D clamp_t(s32, ALIGN_DOWN(r->top, IMX908_CROP_ALI=
GN_VSTART), 0,=0A=
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0imx908_active_area.heig=
ht - r->height);=0A=
>> +=0A=
>> + =A0 =A0 =A0 *crop =3D *r;=0A=
>> +=0A=
>> + =A0 =A0 =A0 /* IMX908 has no binning, so the output size matches the c=
rop 1:1 */=0A=
>> + =A0 =A0 =A0 format->width =A0=3D crop->width;=0A=
>> + =A0 =A0 =A0 format->height =3D crop->height;=0A=
>> +=0A=
>> + =A0 =A0 =A0 if (sel->which =3D=3D V4L2_SUBDEV_FORMAT_ACTIVE)=0A=
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 imx908_update_framing_limits(imx, sd_state=
);=0A=
>> +=0A=
>> + =A0 =A0 =A0 return 0;=0A=
>> +}=0A=
=0A=
<snip>=0A=
=0A=
> +=0A=
>> +/* ----------------------- Power management ---------------------- */=
=0A=
>> +=0A=
>> +static int imx908_power_on(struct imx908 *imx)=0A=
>> +{=0A=
>> + =A0 =A0 =A0 int ret;=0A=
>> +=0A=
>> + =A0 =A0 =A0 ret =3D regulator_bulk_enable(ARRAY_SIZE(imx908_supply_nam=
es),=0A=
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 im=
x->supplies);=0A=
>> + =A0 =A0 =A0 if (ret) {=0A=
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(imx->dev, "failed to enable regula=
tors\n");=0A=
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return ret;=0A=
>> + =A0 =A0 =A0 }=0A=
>> + =A0 =A0 =A0 msleep(200); /* IMX908 power ok after 200ms */=0A=
>=0A=
>Using fsleep() avoids the debate over which delay function is=0A=
>required. Ditto in various other places.=0A=
=0A=
Ok, switched to fsleep() here and for the other delays in the driver.=0A=
=0A=
>> +=0A=
>> + =A0 =A0 =A0 if (imx->reset_gpio) {=0A=
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 gpiod_set_value_cansleep(imx->reset_gpio, =
1); /* XCLR low */=0A=
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 udelay(1); /* >=3D 500ns T_low */=0A=
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 gpiod_set_value_cansleep(imx->reset_gpio, =
0); /* Sensor start */=0A=
>> + =A0 =A0 =A0 }=0A=
>> +=0A=
>> + =A0 =A0 =A0 ret =3D clk_prepare_enable(imx->xclk);=0A=
>> + =A0 =A0 =A0 if (ret) {=0A=
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(imx->dev, "failed to enable xclk: =
%d\n", ret);=0A=
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto err_reset;=0A=
>> + =A0 =A0 =A0 }=0A=
>> +=0A=
>> + =A0 =A0 =A0 /* T_1 >=3D20us delay before initial SDA/SCL */=0A=
>> + =A0 =A0 =A0 usleep_range(20, 25);=0A=
>> +=0A=
>> + =A0 =A0 =A0 return 0;=0A=
>> +=0A=
>> +err_reset:=0A=
>> + =A0 =A0 =A0 gpiod_set_value_cansleep(imx->reset_gpio, 1); /* assert re=
set */=0A=
>> + =A0 =A0 =A0 regulator_bulk_disable(ARRAY_SIZE(imx908_supply_names), im=
x->supplies);=0A=
>> + =A0 =A0 =A0 return ret;=0A=
> +}=0A=
>> +=0A=
>> +static void imx908_power_off(struct imx908 *imx)=0A=
>> +{=0A=
>> + =A0 =A0 =A0 gpiod_set_value_cansleep(imx->reset_gpio, 1);=0A=
>> + =A0 =A0 =A0 clk_disable_unprepare(imx->xclk);=0A=
>=0A=
>This may be correct for imx908, but most commonly the power off=0A=
>sequence is the reverse of power on. This has swapped the order of=0A=
>clock and reset.=0A=
=0A=
Fixed in next version.=0A=
=0A=
>> + =A0 =A0 =A0 regulator_bulk_disable(ARRAY_SIZE(imx908_supply_names), im=
x->supplies);=0A=
>> +}=0A=
>> +=0A=
=0A=
<snip>=0A=
=0A=
>> +static int imx908_probe(struct i2c_client *client)=0A=
>> +{=0A=
>> + =A0 =A0 =A0 struct imx908 *imx;=0A=
>> + =A0 =A0 =A0 int ret;=0A=
>> +=0A=
>> + =A0 =A0 =A0 imx =3D devm_kzalloc(&client->dev, sizeof(*imx), GFP_KERNE=
L);=0A=
>> + =A0 =A0 =A0 if (!imx)=0A=
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -ENOMEM;=0A=
>> + =A0 =A0 =A0 imx->dev =3D &client->dev;=0A=
>> +=0A=
>> + =A0 =A0 =A0 v4l2_i2c_subdev_init(&imx->sd, client, &imx908_subdev_ops)=
;=0A=
>> + =A0 =A0 =A0 imx->sd.internal_ops =3D &imx908_internal_ops;=0A=
>> +=0A=
>> + =A0 =A0 =A0 imx->cci =3D devm_cci_regmap_init_i2c(client, 16);=0A=
>> + =A0 =A0 =A0 if (IS_ERR(imx->cci))=0A=
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return dev_err_probe(&client->dev, PTR_ERR=
(imx->cci),=0A=
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0"CCI regmap init failed\n");=0A=
>> +=0A=
>> + =A0 =A0 =A0 imx->xclk =3D devm_clk_get(imx->dev, NULL);=0A=
>> + =A0 =A0 =A0 if (IS_ERR(imx->xclk))=0A=
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return dev_err_probe(imx->dev, PTR_ERR(imx=
->xclk),=0A=
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0"failed to get clock\n");=0A=
>> +=0A=
>> + =A0 =A0 =A0 ret =3D imx908_get_inck_sel(imx, clk_get_rate(imx->xclk));=
=0A=
>> + =A0 =A0 =A0 if (ret)=0A=
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return ret;=0A=
>> +=0A=
>> + =A0 =A0 =A0 imx->reset_gpio =3D devm_gpiod_get_optional(imx->dev, "res=
et",=0A=
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 GPIOD_OUT_HIGH);=0A=
>> +=0A=
>> + =A0 =A0 =A0 if (IS_ERR(imx->reset_gpio))=0A=
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return dev_err_probe(imx->dev, PTR_ERR(imx=
->reset_gpio),=0A=
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0"failed to get reset gpio\n");=0A=
>> +=0A=
>> + =A0 =A0 =A0 ret =3D imx908_get_regulators(imx);=0A=
>> + =A0 =A0 =A0 if (ret)=0A=
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return dev_err_probe(&client->dev, ret,=0A=
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0"failed to get regulators\n");=0A=
>> +=0A=
>> + =A0 =A0 =A0 ret =3D imx908_parse_fwnode(imx);=0A=
>> + =A0 =A0 =A0 if (ret)=0A=
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return dev_err_probe(&client->dev, ret,=0A=
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0"device tree parse failed\n");=0A=
>> +=0A=
>> + =A0 =A0 =A0 ret =3D imx908_power_on(imx);=0A=
>> + =A0 =A0 =A0 if (ret)=0A=
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return dev_err_probe(&client->dev, ret, "p=
ower-on failed\n");=0A=
>> +=0A=
>> + =A0 =A0 =A0 ret =3D imx908_identify_model(imx);=0A=
>> + =A0 =A0 =A0 if (ret) {=0A=
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(imx->dev, "failed to identify mode=
l: %d\n", ret);=0A=
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto err_power_off;=0A=
>> + =A0 =A0 =A0 }=0A=
>> +=0A=
>> + =A0 =A0 =A0 pm_runtime_set_active(imx->dev);=0A=
>> + =A0 =A0 =A0 pm_runtime_enable(imx->dev);=0A=
>> +=0A=
>> + =A0 =A0 =A0 ret =3D imx908_init_controls(imx);=0A=
>> + =A0 =A0 =A0 if (ret)=0A=
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto err_pm_disable;=0A=
>> +=0A=
>> + =A0 =A0 =A0 imx->sd.flags |=3D V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDE=
V_FL_HAS_EVENTS;=0A=
>> + =A0 =A0 =A0 imx->sd.entity.function =3D MEDIA_ENT_F_CAM_SENSOR;=0A=
>> + =A0 =A0 =A0 imx->pad.flags =3D MEDIA_PAD_FL_SOURCE;=0A=
>> + =A0 =A0 =A0 ret =3D media_entity_pads_init(&imx->sd.entity, 1, &imx->p=
ad);=0A=
>> + =A0 =A0 =A0 if (ret)=0A=
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto err_hdl;=0A=
>> +=0A=
>> + =A0 =A0 =A0 /* Share the ctrl handler lock so s_ctrl can access the lo=
cked state */=0A=
>> + =A0 =A0 =A0 imx->sd.state_lock =3D imx->ctrls.handler.lock;=0A=
>> +=0A=
>> + =A0 =A0 =A0 ret =3D v4l2_subdev_init_finalize(&imx->sd);=0A=
>> + =A0 =A0 =A0 if (ret)=0A=
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto err_entity;=0A=
>> +=0A=
>> + =A0 =A0 =A0 pm_runtime_set_autosuspend_delay(imx->dev, 1000);=0A=
>> + =A0 =A0 =A0 pm_runtime_use_autosuspend(imx->dev);=0A=
>=0A=
>Ideally this should be cancelled with=0A=
>pm_runtime_dont_use_autosuspend() on error or remove.=0A=
=0A=
Ok, I think I'll move to devm_pm_runtime_enable() so the manual =0A=
pm_runtime_disable and the dont_use_autosuspend cleanup both go away.=0A=
=0A=
>> + =A0 =A0 =A0 pm_runtime_mark_last_busy(imx->dev);=0A=
>> +=0A=
>> + =A0 =A0 =A0 ret =3D v4l2_async_register_subdev_sensor(&imx->sd);=0A=
>> + =A0 =A0 =A0 if (ret)=0A=
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto err_subdev;=0A=
>=0A=
>I think this has left the sensor powered up. Don't we want a=0A=
> =A0 =A0 pm_runtime_idle(imx->dev);=0A=
>here?=0A=
=0A=
Ok. I've reworked the probe PM. Probe now takes a =0A=
pm_runtime_get_noresume() ref after set_active and balances it with=0A=
 pm_runtime_put_autosuspend() after registration, so the sensor=0A=
autosuspends instead of staying on. =0A=
=0A=
Thanks,=0A=
=0A=
Lachlan=
