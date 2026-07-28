Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013043.outbound.protection.outlook.com [40.107.159.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 008D5282F14
	for <linux-media@vger.kernel.org>; Tue, 28 Jul 2026 01:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785202255; cv=fail; b=H/0Yr8gtsrOdifBtUAlpDMUuPdvXgqcMHCegLOVTk5u/HYM5dASA+c32fY3UzyP0uQlOw7d1TDHS/XtUL9A1YZM7oghf0AViF5gU3BxBKlWFIxmagI0P3Vyz5Bx1poHSf1wzCHSeXTC5I2fQaZqXqM9oeIPivX+X5bKyeQOCj9Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785202255; c=relaxed/simple;
	bh=BEXRpl2p4G1g6XR2dfls2U6xZCF5ifjywxi71HdksPo=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=qAMCqWzf2GC8urnvMzBtTk78gx6dJT6ZBKIJOuxTixY7ik1G09jUyLhdLrWUehGj1DkGhPRCkVhik/vsUM8XeglYDOnH8RxIzbr2/8dFor9vDBp68MwraF7WwJww7oxV/JWTg26mAlRxSqoLmz8p5Rij0vStELvIEKeUIK+EvGI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Fvt+wYk4; arc=fail smtp.client-ip=40.107.159.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Fvt+wYk4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A4YvHnn6BOPavy+HnhqN723bTgZwCkhPVplL1bXWTrQBl7aPaNhl0a2BNXiRDj6ry4F+W1FJmQ6XYKoGDU6zcCha2/fOZppwpFFB6shE80Pv2rmzrh1ajGM4kDuLpayxRXWupy95ehfRD69cAvIPPhL15F5m6AveNhwUqQw0c1L+4w1wuO7PYYDHG8pRJPCHA+hIHIlFVxdURvO5SJib0EyhkNeqBPsCumJusgRvfijBSdp31PH1KZB7pu/SfjQgg4lPbcNyRM/vKbkPLMYn1TXEAvRm9fHSSp7GWRby9bI3v7DuSOI2gv0qN+07I23ZzcggRDRrRNd0mUH3KjM8OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mHiIe57MHadA6UesFM0ANzhDQCkg4BFQbTcSGAv+/TA=;
 b=vrz2mhKvWJGGrmBAMoWtkJEuotZowSPEdRbDUKToknAAtERbx2mhTaUKOxyZaMws910d7D3JNU8R1Jl+1w8A5f76DZuqjbtNfB1CsnFp0Q0DwUZUl/FJ4cDXwkFW3SzhIvGH2Cj830oTht8uf43Xwsabm5EaF4Dl86rgT+MLXPtKgCY/hnea0kbQ8XqbvMhCd2nSYbQ3rrhIgBdDjRCnwtuAdaIHeVl2m8zWfrN7/DKKMzJMoKHEJpVKoqbdbYRfaDAEUYRIGhCInHrJ1KM5VW9xvmk2NyWz4zRgpC0EtqR2cw47IZGKBjjlV6TG+qg4JoA6e3tqUGL847OIqNNW1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mHiIe57MHadA6UesFM0ANzhDQCkg4BFQbTcSGAv+/TA=;
 b=Fvt+wYk44Z+wYR6lUnbp5DP9SOM8cVNljgbGJrb5QOhnMe4c8NUCCnGRExuifaR+jC12bdEJ4B0SOSNzQCH0cxdbDImYUBe1nir1bAoHEi6zzIun/VolWSnLoUEV1Q5/kQbwD/irgMjXc32WJrLJgHOinnDldBE+HrftCu/+rE8svgZfz1Hl2pwQs2CbLctIuMgCidW/Hi3D9NrLUd2W4SF/MS+Xhfchy4ySDVYQ7kX6E9mr6y/jyKbWSxhUh37iX+6V2pWP9vhmxp+DG2iD5JjT+ebSgD80nQXwGYkBuld8lfWesj+5e/2T7dtaepEffrSK44cNL/yNSyJWW8ZCHg==
Received: from AS8PR04MB8563.eurprd04.prod.outlook.com (2603:10a6:20b:422::14)
 by ZR6PR04MB424962.eurprd04.prod.outlook.com (2603:10a6:910:dc::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Tue, 28 Jul
 2026 01:30:49 +0000
Received: from AS8PR04MB8563.eurprd04.prod.outlook.com
 ([fe80::3f00:4490:e559:74a4]) by AS8PR04MB8563.eurprd04.prod.outlook.com
 ([fe80::3f00:4490:e559:74a4%4]) with mapi id 15.21.0245.012; Tue, 28 Jul 2026
 01:30:48 +0000
From: Ming Qian <ming.qian@nxp.com>
To: Hans Verkuil <hverkuil+cisco@kernel.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>
Subject: RE: [EXT] [PATCHv2 07/19] media: amphion: drop unnecessary
 vb2_queue_release call
Thread-Topic: [EXT] [PATCHv2 07/19] media: amphion: drop unnecessary
 vb2_queue_release call
Thread-Index: AQHdHcn9u1OZQwewQk6I/bEwpchRP7aCJZgQ
Date: Tue, 28 Jul 2026 01:30:48 +0000
Message-ID:
 <AS8PR04MB85631561359B356E267C5639E7CB2@AS8PR04MB8563.eurprd04.prod.outlook.com>
References: <cover.1785157986.git.hverkuil+cisco@kernel.org>
 <ad98713850b578c4d304f2635a2c0a248a1ffb91.1785157986.git.hverkuil+cisco@kernel.org>
In-Reply-To:
 <ad98713850b578c4d304f2635a2c0a248a1ffb91.1785157986.git.hverkuil+cisco@kernel.org>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB8563:EE_|ZR6PR04MB424962:EE_
x-ms-office365-filtering-correlation-id: 08b733b0-22ad-4705-3fc9-08deec47da5a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|19092799006|11063799006|10067099003|22082099003|18002099003|56012099006|4143699003|38070700021;
x-microsoft-antispam-message-info:
 4yT1Q5rLod9NTDpBiqo5I9bo5j62zKyxtuSQo5v8TdR3mkP4Ql78us0SCaf/1OMvyWtKmw1U0TZ0XRiFqc/wWww5PJto62Id+Sp/LmLBo4d0+PONyHpOG/+MQNpnjKUNhIFSUhQYcMJcqkXyLYqnvs5BaaapA8+IiXbeX+UDWy4tPTLyMbaMybP8VntRbtZVk1B9r7kNNCeeWOc9FpSFvqq0jmoSEcA8UFMYZBIV+xFMZNFM/IldDobtMIv2/kUyc5ZsBJUFXBdyF9hTA0B0kboICbTjrO65CjH/lvsQluj8DrhXpsmzYki3KpwGg7Xk2iCUEvkr/ZPHtyglj6ZI3aIlggXa0yihIm6dKtw9kBlaOaYZn25k/NbOyMeALKparN93ilNcYrOcyjBF0ffNMfQyVd3saxMhjxYuF8vAzTa0IKiAdDuGIs9IP97Z0rpsVnesvMyENUZCZ1JlRlZGlun4VY9dSW+GRHaaLkNTXHihEMopjX5/svgxFsjXnR0TNZNr+1OHiu/fFZ5sstph7D4CWLA7p0S1QYC+CVcZOSYndEIF0OLIPSE2jVNaQ1TTUVkMmcz3z2PbAeUgOYEadmESXiv4bHEH6DqDF7DeWdbuCwiopSF/ulxJGdaAbifc+rNU03MLTo5GMAWdNi5vZC+CNiiCrdmWqwZ16It0z9c3tZyqhm8tse11WYehxrh5OhDitXLD+wZDbbTV5fiqrZ2zGoY6Zzrt/p4WTW087Ew=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8563.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(19092799006)(11063799006)(10067099003)(22082099003)(18002099003)(56012099006)(4143699003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?VVeZip4ZTdB2tCTANnlW0rxrmC/TMRkHF9W5b77ORx5k882lOfLpZlJZCUnE?=
 =?us-ascii?Q?9wFULjJ1rH2nujLewMA5uAVn4ksYyJ/GqlHqUG8HCDVbf+9KT6jf7R5m6Esw?=
 =?us-ascii?Q?xLIOgEF9qixw8gAqJEQ+toqpQtUERovnzmARAdMlgYOUJCxwKnVGWcyaUMJT?=
 =?us-ascii?Q?s5rOGkqy6krn87U53SvrTSIikpQM5upTyIHGtLJw6C3G8YlC5GnKOWkylvPZ?=
 =?us-ascii?Q?UgYYr9v37NFoLfMoCfoQv3IcMQUS0V78IBdJxsFp6mr/bXmquknZVfbP5cIB?=
 =?us-ascii?Q?RiFyE9aqPuGAKLc+tnDwlvzbzE73kkXxwT55I4Treyq6s0EWdlCfMYPSgXVY?=
 =?us-ascii?Q?Ph+TS2x0puii47Vc6oY4ZlaDcvm1Naa1IxG6f0io0ID0SDSwWbMkn6hTHdj0?=
 =?us-ascii?Q?CyzXSRCwOOj2NuvwwmMBmtW3j+a3JwIJqIZ+Dk6Htmhl9Mn4OfL2Rzs1JGfX?=
 =?us-ascii?Q?HdGe2LcZD2P79DPE7TdhkYJegIwfpcygqXcuzMkTPvvyQSe7q68Dt4Z+vKhU?=
 =?us-ascii?Q?XfzZJSTInZQOgQBUGLiGidn6QpjFmHyreRvATFpE+YOus6hz72viwm/ySlgG?=
 =?us-ascii?Q?LiU4QQ7c/DTT8+mQjUc2ePzSXb8znFXpOf9r941P8amPNT8kWvmy6dvtcbCd?=
 =?us-ascii?Q?To6BGN7o3PLyIJskvMhu8vRs+m0omUyMD2yw4+mDNpG0XULWt0GTsEpkB177?=
 =?us-ascii?Q?8DN1wx79YDhIXOrpPcBoihGOh0u/n3bndVwcu1qF7PkCzp1cdEMrWMSZS7Mc?=
 =?us-ascii?Q?IhIkL6kCZF7ejZ8guW2Appqe5viiRypBf2hYLnaMn5ICHWfnBmioBw5hbCz9?=
 =?us-ascii?Q?iH/3EU8uRb6jkEycPMRs+PQCuMMLboWD3oqyTN22lt5vyVSUIMB5S15tQtD5?=
 =?us-ascii?Q?nkOuWO5y1UaEjmGamwz709tvhTPOu2C2pEZqtm1bG6ynR/afFR8KqidoSnei?=
 =?us-ascii?Q?re+BVSltBJQZg1bBSSajbHfeaQaf0kfGteUmex6Od8cJFoHmJVofn1g92CnO?=
 =?us-ascii?Q?NfEs1PlTWkSZrpGcTVrbXJEKavyvhkxJ2LYt3T8JGrJxDTmPuvM6bnpVpZMz?=
 =?us-ascii?Q?jQ/PLUc/lBkUP76onCbWVFAOB2QeKkcjykxVo4LaSwycjywPCuXyrwJGNOeP?=
 =?us-ascii?Q?fyBtXcwZDpLCks6vLgCshOUbT/9zOrtprTlhWD8DbEdt5DImJVIiT24Gnj5s?=
 =?us-ascii?Q?WgTFqOfgPprr6Gjpr+EZUbIeLnhLxulj43cb4cQQTNUdaWrFDnzCKXOryyCv?=
 =?us-ascii?Q?rYcioBDg+JZg2ZZft7k3COfc3tZv5cU2o6Dxdc3fOMcR8ldDuvJFibuFPuvv?=
 =?us-ascii?Q?zTItf3VFB3flOiPRbdC4AqJNjnkmmS6dqDaC5qtgyCrngsqLkIjLvGAWlusT?=
 =?us-ascii?Q?LK5LdWal2sl7t1wjEkWqGqH6T/9YvT4pdtnyh/mgdXT9HLXjE41FmfrmfikK?=
 =?us-ascii?Q?r0buNUXP8WhJZOiu5JtnM0AN7KcM6TnoBeM0iiU/LoHoRcjxQozFGInIZIlI?=
 =?us-ascii?Q?nZ9U35y4XHIBhjefvf4tmTvD1ZIotahnnmrufXSoR/4V6GZLQ/67rt/QfvaI?=
 =?us-ascii?Q?uDmz7iKoFrELQpCi9snstcz5duuWntxzJaFxi+rI+0ZAOnHUJzVXaQc1Miw5?=
 =?us-ascii?Q?TOBChhdx4Gu2IHA09+PQPyvxjH16D0ShtNXHw346tHwGCOJzE2uJEqnfufHc?=
 =?us-ascii?Q?nLFN6YXcKkC4c8OoTjWIFjuKAijrrCV5byBLLjd5Xu5HhtZb?=
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
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8563.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08b733b0-22ad-4705-3fc9-08deec47da5a
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2026 01:30:48.2728
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zCw5EmdzJp0IcbGUVna72LIS9wIDLN9wu48GA98v4Wnp3DO1aAgJytW3S2rJHlE7J+HCSnc61rwR0I/x8MpxOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR6PR04MB424962



>-----Original Message-----
>From: Hans Verkuil <hverkuil+cisco@kernel.org>
>Sent: Monday, July 27, 2026 9:13 PM
>To: linux-media@vger.kernel.org
>Cc: Hans Verkuil <hverkuil+cisco@kernel.org>; Ming Qian
><ming.qian@nxp.com>
>Subject: [EXT] [PATCHv2 07/19] media: amphion: drop unnecessary
>vb2_queue_release call
>
>Caution: This is an external email. Please take care when clicking links o=
r
>opening attachments. When in doubt, report the message using the 'Report
>this email' button
>
>
>If vb2_queue_init fails, then there is no need to call vb2_queue_release.
>
>Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
>Cc: Ming Qian <ming.qian@nxp.com>

Reviewed-by: Ming Qian <ming.qian@oss.nxp.com>

>---
> drivers/media/platform/amphion/vpu_v4l2.c | 8 +-------
> 1 file changed, 1 insertion(+), 7 deletions(-)
>
>diff --git a/drivers/media/platform/amphion/vpu_v4l2.c
>b/drivers/media/platform/amphion/vpu_v4l2.c
>index 7cccc994fc50..af03cb82e9d5 100644
>--- a/drivers/media/platform/amphion/vpu_v4l2.c
>+++ b/drivers/media/platform/amphion/vpu_v4l2.c
>@@ -684,13 +684,7 @@ static int vpu_m2m_queue_init(void *priv, struct
>vb2_queue *src_vq, struct vb2_q
>        dst_vq->buf_struct_size =3D sizeof(struct vpu_vb2_buffer);
>        dst_vq->dev =3D inst->vpu->dev;
>        dst_vq->lock =3D &inst->lock;
>-       ret =3D vb2_queue_init(dst_vq);
>-       if (ret) {
>-               vb2_queue_release(src_vq);
>-               return ret;
>-       }
>-
>-       return 0;
>+       return vb2_queue_init(dst_vq);
> }
>
> static int vpu_v4l2_release(struct vpu_inst *inst)
>--
>2.53.0

