Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021125.outbound.protection.outlook.com [40.107.51.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88CEC3D1CCA
	for <linux-media@vger.kernel.org>; Fri,  9 Oct 2026 06:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.51.125
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791529083; cv=fail; b=NtMbHXdp4F0x2kt5QvEAQKBwxv0UpboeHzqgAv8iFXYRxbXjFmky5OWps2wsf/QRG5psF9cg+zwKzElLaNtjVWQwUHNRd1CedNeDiTltnw1ly/7a517XS44OzH759ZK0FcDvlHLiBAKORFSM+m1vcLV6Hwos4sy8eiI8Gm84LmQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791529083; c=relaxed/simple;
	bh=riRg6iGJM9vqRVDvrrUmvrRo9+zciI0tQKz8I8swg7A=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=PU3f9YRJ5+dY6g23FcQUdAu3BW9xpqQO0L7FEc10KZbjqVSV0N9kqK8myknT2ih1Us+/swmke6HwJdO+fb+JKjQq3/pi/qNyWwWfmpR52AOs/RfQrFnwR94O1ZhZgvAXYLKivwfHyI53pRV7+SaR27Wf9ZkaE3ZXN3GP6rCrCmw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=VWdwX3zz; arc=fail smtp.client-ip=40.107.51.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="VWdwX3zz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lLnwq1F0+SsdFROc+mzf59DrI2+LQvSOk+zdYAZyhE624M5uZeHCjIey1X4ShHmzPyVPB28hGHIBr4/YutpAAJ1ukMQvR4gAffzWLMdkOU3Jz17+P0UpbqCyY84bYMBS02Qhvn1vsnKAwvZFJLUmrpIQ3pQtZdXDYOlKLCLzlWy723EPeqRvNPoE/6sfVydp08Ne1qWvluNPvOi9POXPwSgq77DacjPCNEZKMeOc6rWuvmnWwyBTTFJEC8KdEdOz6kOgKIZ1fDu7sGGdYwNGWJgwZ/Z4PbnSLGnTCnJ8CDPF4MSuAsgmuPwpW6ECu5/2u1SJEQrhDjOjLH557C6mJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qMfu0fqo81A25raqGIZtMVpPBuu7juNF4RH1cjYwthg=;
 b=igC2rvBt9oTfWtWGzPLC+2eFIzUZr6aoxM8gfWzslpcQ6OdZejOC10/iVVVofIOlBbCqRofmE/eDHz0SLXROtHvTGSyB6xxS2TBrHa2lo88kYOuCE+pCCIbIoQacQ1K3cjtO03RuiJ7Xu6z0EOOX0+uCk4mErmP0k+VPsRVvLolRRKXEVfer7VKAq00Jl68haiumAEJ0DyEZyOBzRDrhF3HvdamSYx2pRY0Yzr0f6AK0NqfC3CU6WlPOrYaKTmFGOmZatpKhpTXWlYP0Exuk4+VdPRsN8Qr+n6fDtJzrBSjFzXdnAJY1RkfOfAPAhVf74aw0hPw2jn9CE2iSxBITvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qMfu0fqo81A25raqGIZtMVpPBuu7juNF4RH1cjYwthg=;
 b=VWdwX3zzQeZEayU3ukMaWoeQjRNYpRl9y4ZypUAYBj652J/BBUGykwymq1r4Zp1njb0c3EDxGNMK7W1GDXKpFa1MgNJhjQ7Xzw0e1CxIFzSe3stEuIgvY9Z/zaaoXQRhQX77rK+V8r9AY1AYzCuwrH03zgjQ23AJqKIb61CU6an3TdP7wi5QhxSZaZLu+uQEMkMrtX20eWcork5gK1rU1PhUMv9Hm6+PA8Tluuz5WxntFlp8Tt7t4bcGPRe/pAB+Np5zB3uQQQwA7W6a6TRNEcghwRvjbnbD8d/BZXFyGCKZy8BesPwzjm+Kv9O5B4fHIFqFzojyOrW5nPZ5l7sq1g==
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by MAUP287MB5153.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:1c1::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Fri, 9 Oct
 2026 06:57:57 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%3]) with mapi id 15.21.0496.015; Fri, 9 Oct 2026
 06:57:57 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>
CC: Antti Laakso <antti.laakso@linux.intel.com>, "hao.yao@intel.com"
	<hao.yao@intel.com>, "dongcheng.yan@intel.com" <dongcheng.yan@intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>
Subject: Re: [PATCH 3/4] media: ov05c10: Power management fixes
Thread-Topic: [PATCH 3/4] media: ov05c10: Power management fixes
Thread-Index: AQHdV2kWZGhgFmAzZEWw5mHqxkTGvbb0w+Gf
Date: Fri, 9 Oct 2026 06:57:57 +0000
Message-ID:
 <PN3P287MB18299D33CBBCB0F99F098AD58B922@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <20261008210503.1878442-1-sakari.ailus@linux.intel.com>
 <20261008210503.1878442-4-sakari.ailus@linux.intel.com>
In-Reply-To: <20261008210503.1878442-4-sakari.ailus@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|MAUP287MB5153:EE_
x-ms-office365-filtering-correlation-id: afa329ef-9169-45f4-0c0b-08df25d2a68b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|38070700021|4143699003|56012099006|10067099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 lPnoDzg5tXwspUn3PLDZ7TRvzaI5QokGwbAA373GLgrzds4+RjOU5xEkbmgIqaEa1wqrs99vHuCIqfKP49vAPgfCztTDN4SLHfvgCYo5EA751VExEtd/wdWZCUHGHamo6FJrG1LqZNuqTyFJB2QP0dfAAUgkfNLiF7j4DRfNJbtq14kXa+Qt8FN2mLVach6zJAIkmj0kZZVKBdVrbDP9KoQCkUA9hs+ci5u9hgDIjwslYJ1NWGIi9Lq07k5aey2oFRfLGHDJdkMv0+wMFBALBtG2xenR55xquPBQt+gMbeDDdPiLwH1ZPMya1UnyTjmKTPidSebL+IqEom9Pxt0dOrKBqcN7r0PZkQLnQXAXVWy7/FRE7r2ZcKAoYth1zMSoVMIykEXB0XDSX8elnkpG1rJWS/dISWc8rYbgiMKL+pEeHX+KZxcBtt0ACyKkuy8CIWgxWfHewl51HoqZ+hk2cwJgmdxvlQ5viqgoX1+earEC5w8WenD3eTNib6gh8U/zp5vM/TM5ie8mj9qIYWYoxYl/UNC4gcX8bw4SrocX+WVzJuJC/dFdor32wC3auvN8TS1QLIaFQKiq9ibv9kBHtNClZvlPbM3h7vl+PLx+10u92UPi9XEUpN53N54cgjbjiqCZqC0zYpMvmNcFZizXBelUI8TAtH+50hMM2a2szQ7GlcnY8M1TSYCWcm9nzweVlCjxnKF+drFdYA/9AZJ7ukjM2HgPZSqdL6zMug79ERI=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(38070700021)(4143699003)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?kdoUcbScJDv9+WHwA47QyfmtWoPxTQnlaV41/KVzbMI4Ac5LCCaJIukMpb?=
 =?iso-8859-1?Q?nFXPW0xs+OmPAc89jvRjesbxDUinJBrVMlLg0OOutAvKF+35/3IYMtiGyb?=
 =?iso-8859-1?Q?Hu4SIsMXhOfPTq1TF7WXHk013IOYOHK5tvAMS+z1KJzkt6Nv6NFdbGxBBs?=
 =?iso-8859-1?Q?iivI4sCGeSvN0P9bwBCW2jegI488zTDCN2lq/z0po0qcgGVXWZ5GUz8h5R?=
 =?iso-8859-1?Q?+SSj0YftF2hrDvAyZ371xL9DddMtSqyryjRnugtf8AVfcXxYAE6RXYDfId?=
 =?iso-8859-1?Q?SWCZhPP77VC2BumK3aAzV6z4kmNdSNKnW/RTy2ItXgcUpGCTubRHtkZ235?=
 =?iso-8859-1?Q?qSaPN4BzMezIF3Q2ifW5lxqF0VldImFikcMPTc8ifn5b1W8rjG+sUC/tyF?=
 =?iso-8859-1?Q?XoRaEpVrnfG6/YYxCqNofETIgujd3xb4Dn9po5kOxxAX2YBaSU20Kk7sDT?=
 =?iso-8859-1?Q?DkC+1iRemp2rPqe/+v4NNGINByDVRKO5woB9AyghKNqnWAdDxKb+BR0K1I?=
 =?iso-8859-1?Q?q1hOGWyXo9FErxoqcToN34UyBZ+pDC/Gcc6gQW6RBqzRKVOpXFbaGaiICL?=
 =?iso-8859-1?Q?s/vMZXXWBjlWvTk7VFPeBh8UsYZ6iWbGYgrdbuT2h4cB7law+nabZUzjP1?=
 =?iso-8859-1?Q?hlZJQRz3t0nB4Izq1SfZX855N8DCicDU2PMDt6p6+w2jHGXPkCEAF4InhO?=
 =?iso-8859-1?Q?UILDFv7gJoXdVjFdyVwpE6nWnQs0u/BRGcAxAu2CpN1LLuyN54k4NGXfaZ?=
 =?iso-8859-1?Q?FxpC7NyNbrIy2yHMLacK/hxz7Og/h2Alq1TWBfYJkJuApDUKz/tjfvEHW/?=
 =?iso-8859-1?Q?AH2DEMYljyPbuHY2HJ7IyxWhvZr07ydjsheUI4BZ2/vWdlHU2ZkMlM5fa8?=
 =?iso-8859-1?Q?uxTNFoDskR4ZqUv7AL7FV8fINn3HpFU0KIz/jJ9tlIlydoQxEsSGtUtzmv?=
 =?iso-8859-1?Q?B4EoMRd7FqbNWIdkYKfg6tjYd/5M9490XeJbIWHpL5PkcO6pA9ACe/PQl7?=
 =?iso-8859-1?Q?L0vfiwwiCgSJNq1AdlxoiYkncntMLBLIFL7YNV3HCmR9rPRNCLhRORWK3i?=
 =?iso-8859-1?Q?Za7guHBIhi63XUnCk/btAXXt265YzO85BmpLKXu1cqjs1zsliq0IariwUe?=
 =?iso-8859-1?Q?kTY6sQZEYJjUPSrT1Rmhok+ZG08rQbX2idIYmQ2vS+0JHEgQonFmZx8b6m?=
 =?iso-8859-1?Q?jRv3IuyV2WJYxTjd74hM1RcPtAhooy9BxfWWDPX2RU1AgWBQD3OpFOvbzK?=
 =?iso-8859-1?Q?T3TD4wpl3p9uWiW6blTtoA8cyiqaDgQf3jpi+3uSY6pqz0KQyAnbSg6Q7h?=
 =?iso-8859-1?Q?iuaKlg4PyXhimfS3yy/nYzVqBLaXkADzC6Sqc3Y7oQVqdjHVwOU78EcGHN?=
 =?iso-8859-1?Q?gESOfSyp3+m27MYEGxxizl2sLhjXWIDIqKvY9THCmQ05eTgY+Ki8lwdUQU?=
 =?iso-8859-1?Q?MmrhEAfil3sOOzJZwWZhiE03wu0U2+YtagOg+Zx2im96sbFn2B+6U4kawT?=
 =?iso-8859-1?Q?qf366IJiVUXZEN2C/Umx9m5j2p4LDEwpdCM/jIbWATkkswYA+kFrh4jyGn?=
 =?iso-8859-1?Q?GlRuP+wNwwa02bjFw9VloKFUmV0Abxmk8nF6N5AaSs+aIBM/3jfClT62SG?=
 =?iso-8859-1?Q?yOa0Yfb3kxVDh+IgKjsOfy9/QC1xRcnouOdYDIJeolPsXiRSvGNAaAZS2B?=
 =?iso-8859-1?Q?5OZZL/Z1y68ylzgWJTwh4gdVUDOyp2xsMGwlCGShXSiwQa5qv+8rQbEN3R?=
 =?iso-8859-1?Q?NdtLwgvS5Sjg9v+YEbuclQ/P1yQfpo+0Yavu/6mj0+OPGg4VL6QM9h0Z7B?=
 =?iso-8859-1?Q?A9Pm/1BrhIiLd6Q+X3jdB9VxL+jAj3I=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: afa329ef-9169-45f4-0c0b-08df25d2a68b
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2026 06:57:57.7298
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fWJ3aUVcdjDjtqE4hV2gDriKyPu27C31S3jTZ8ScHiDiiObW0tuwRNPVV93m3SDQl551kN99rK3erhi2hc3h5bTCzDtWW3cEYm5MvhXCvOs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAUP287MB5153

Hi Sakari,=0A=
=0A=
> If the device wasn't powered on in probe(), probe failure led to it still=
=0A=
> being powered off. Fix this.=0A=
>=0A=
> Also disable autosuspend in remove().=0A=
=0A=
If v4l2_async_register_subdev_sensor() fails when full_power is true,=0A=
the runtime PM status remains active while the sensor is powered off.=0A=
=0A=
Should we call pm_runtime_set_suspended() in probe_error_rpm, under the=0A=
full_power condition?=0A=
=0A=
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>=0A=
> ---=0A=
>  drivers/media/i2c/ov05c10.c | 4 +++-=0A=
>  1 file changed, 3 insertions(+), 1 deletion(-)=0A=
>=0A=
> diff --git a/drivers/media/i2c/ov05c10.c b/drivers/media/i2c/ov05c10.c=0A=
> index 900aa84ddbc3..cd64a621ff48 100644=0A=
> --- a/drivers/media/i2c/ov05c10.c=0A=
> +++ b/drivers/media/i2c/ov05c10.c=0A=
> @@ -920,7 +920,8 @@ static int ov05c10_probe(struct i2c_client *client)=
=0A=
>         v4l2_ctrl_handler_free(ov05c10->sd.ctrl_handler);=0A=
>=0A=
>  probe_error_power_off:=0A=
> -       ov05c10_power_off(&client->dev);=0A=
> +       if (full_power)=0A=
> +               ov05c10_power_off(&client->dev);=0A=
>=0A=
>         return ret;=0A=
>  }=0A=
> @@ -934,6 +935,7 @@ static void ov05c10_remove(struct i2c_client *client)=
=0A=
>         v4l2_subdev_cleanup(sd);=0A=
>         media_entity_cleanup(&ov05c10->sd.entity);=0A=
>         v4l2_ctrl_handler_free(&ov05c10->ctrl_handler);=0A=
> +       pm_runtime_dont_use_autosuspend(&client->dev);=0A=
=0A=
other than that, LGTM.=0A=
=0A=
Reviewed-by: Tarang Raval <tarang.raval@siliconsignals.io>=0A=
=0A=
Best regards,=0A=
Tarang=
