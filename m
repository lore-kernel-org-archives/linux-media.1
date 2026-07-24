Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazon11021075.outbound.protection.outlook.com [40.107.57.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E24E3EEADE;
	Fri, 24 Jul 2026 09:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.57.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784884119; cv=fail; b=XfJiGM4LrEb4RgCbLThFTRRenWduJlFh6CFVb4CcHFnzJNFjLcW5MypqrsowpKd1T/1VkL77fjnX8v+fDGcyiipXGR31yYPuKZ+UIyFy4dOSoceA6he7ja2VhJfwMpp4pmviR7WnwgXTL3ezivmLzL3QKu133tRI24NkyuMbFH4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784884119; c=relaxed/simple;
	bh=70U8cCIYKB6GrvmfxzNP3RN3NuC0fnz1oMzwic/8L7U=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=oiqY83iiLi7JIaCqtc014uMFfzd/1MD5CRc2c84YDm0alt5B07uoDPop+neTg22DPANLBcTWMJrLmrJhN5kkJNWz1xUfkL35ZTZmrmmdBzG7aIH4pvBXzONuwhgUBRqFFjA83T1PpojL4hX6Vyju3/c+h0xKG3BWigs5C5HiGLs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=fail (0-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=g5g8wXg6 reason="key not found in DNS"; arc=fail smtp.client-ip=40.107.57.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="g5g8wXg6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I8G6/05gTOJuTqcTvvXoY7+SEB5wMWaq5oj8O6M5nJoJz48j5zBrihdad7kzjnWDAIpKjxiblbwtY58UryP15h38tctoV72m3qmm/8JWbCbbMySo8hlgXpOip05p14tTM4LfkVUX6icxYfjv93+2Bnfgq6UlPq8FiNzO9TRNj7r67iy6hGU6TKFuKBIK3+s1C2/ljIONgPbxhq+jFWE530Hbw61pIItcv5Vaaongcgfa5kEoHqvFYrCKELRiK8243C5qz48sv3BpVknPAeR9AXTrMrv0mjXBof9GlhSdUO7J/8IaOXf+JybrsUJ9LmWODZLopHhzBqc7vGHcWzx4bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PpXAuSSgtEDq5M0TNMKMymHCk7LkVQFIZz8fM3s0UFM=;
 b=x4D36w7AJNmr4qFTerx3lWm4apEEOBwoJ3N9QWaAGrolK3LTaRXWHAMDcKpsNaWAI5bszoToO9x5ztCEGdeh05IaiiTdOn3tp5hEj24wYfpsadIJqLQjQrfdliJYJD490QHFl2r6f1lwSH9lURw1WMDNqLSKwWOW8+6/1EkStFsXIGD68iOBBqLyYku1gILdmRVG1kooT60riUGdeqPiuL+gc1xga+59trWS3FGUdVZV8r+svwu4HYrq8mZhpNqx/IFoAYkgfBnHFnEzmYSxZMjUwL6QFNI8NAQR0AwLGpztj3fFPAflc+h8VTpii0+2u22BS6UGFaiUc5IQGwIjdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PpXAuSSgtEDq5M0TNMKMymHCk7LkVQFIZz8fM3s0UFM=;
 b=g5g8wXg6sJDCTiyY81gVThtZLYhliTZUv61iCckkxFCEY6SfNB93DVqWgqPg3eGz+1zAljiHQ/OkMEg9vqE4+adLs4E3wa0ik1ghNg+1RnptcbFJIQxAPNHZBbyQ0S4/kwsnGNhFnKvokBYmcgXsecmo0R+MaeWR5Wb+ptTx6iRCqlW56N/hiwq3R/QvbRR/X98YCUddi8f8V8pKGR8fhiKw5sCuvaNC6N2wL7DAanZVg3W7/TZR3COMPi/gETx64PFDbugrH6o/qKR2zaW2JUX3XLg6zdlkiCPk1iz1OQ8takth/wZHAY+mjwIlQy5Z8mV2bnzq/JeV5kg+bkUM9A==
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by MA5P287MB5244.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:1c7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Fri, 24 Jul
 2026 09:08:32 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%3]) with mapi id 15.21.0245.010; Fri, 24 Jul 2026
 09:08:32 +0000
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
Subject: Re: [PATCH v3 09/17] media: i2c: os05b10: update pixel rate on
 10/12-bit mode switch
Thread-Topic: [PATCH v3 09/17] media: i2c: os05b10: update pixel rate on
 10/12-bit mode switch
Thread-Index: AQHdFvGH+FjGj7mpvEegbmNW2CIr37Z5FcCAgAAAcQCAA1ElbA==
Date: Fri, 24 Jul 2026 09:08:32 +0000
Message-ID:
 <PN3P287MB1829C388BB3CF7B9C78FD31A8BCF2@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <20260718200912.16001-1-tarang.raval@siliconsignals.io>
 <20260718200912.16001-10-tarang.raval@siliconsignals.io>
 <178470106909.3005206.2322043808025262811@freya>
 <178470116466.3005206.11839379637753408198@freya>
In-Reply-To: <178470116466.3005206.11839379637753408198@freya>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|MA5P287MB5244:EE_
x-ms-office365-filtering-correlation-id: df588f62-124e-4c3c-f0bc-08dee9632288
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|10070799003|23010399003|4143699003|3023799007|56012099006|18002099003|22082099003|10067099003|38070700021;
x-microsoft-antispam-message-info:
 T3XtcMBEHD/14URJTRnQLpSL5R5Zy3cvG5FjKQ78xKD8Ltc7nUz2AbnuJOLZvFqJhaYruMUGNGSvOkj1dlb/M3fkEZFuSwZ7Qrx+G33dWGBmZGtKxnu8b9JbhshV2XALXqL40rS9v6xAEyryPj35dryiJtWyHZrtZPxQ12kS9eXhIQU57EMrTKTKQwJmogxUQpqhQinwLsq/1ra1ZRwE4BJihxijysHGHaFS/vYMGLSnL669ohj7H+BGkNa01moxjZGYimKfqvP6WesTBbAzTskWeu/ZSj70pcMPbREYvNGTyRO3oF2Rguy/M0KWaxPVTqOea0l6fxtZbAHGVgCgOLPTZcorwRla08mQR+arxv0bFm5QNKLXPtxRdXDVRYzj+mImXZ/eH9TUpHQkmBwKAflu3s7KuJsVNdW3VinMX134IqD1ur4bYehxF8WM1XPv3lCGPObSfFcJYgRNymucJbzZW+AmCaHhttIePiwr8adeum9GjSs07VS7764/8g9ab++br5c/Ln1sEUurEH5x4dOTMQ4oPSeCEtrKsxOXoMzvnR6prU/CdYXkvmakzTSI9Sk8qUmxbLckhCHEEZCcfzbVj+nVJcaItxI0CJVKYqz1X4QvMCwm3/mS8Ptcv15NQ53K3jVD218neMnq8jSobaDPS91d9jzvDri+LBr6LpHts9+PwKM2wAri97qd3FyblfTH+sECmnYJ5PUG1PYofya6DeXVuYPK6YHK9chsiyw=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(10070799003)(23010399003)(4143699003)(3023799007)(56012099006)(18002099003)(22082099003)(10067099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?2v9J1OYzyZeRYzsPoPPK3yJ3LrXepx6uGAq8Wpa1zmFDdXkgGngGvntTSh?=
 =?iso-8859-1?Q?SgqZYBjttDEJcuPgmWQqSCKr7+TYWr+MydKrhjoTgWbE9d5pu3FNalHZZc?=
 =?iso-8859-1?Q?PN7TszPjTqBZqbPDEMKlW37asVU+0U6b3syoa7CWumbtTHCIJUDJq+IbM8?=
 =?iso-8859-1?Q?hwj4bHsxRnnRH4wusyk+6HlPjvjTkO7MPSakopVPqYb6P9IjrNdJBDfCQg?=
 =?iso-8859-1?Q?ar4RM6m77MLDOJ4LZzO8Yz6UwQ69y5yBaYfLfDw0OVPiUGgyKVK7J52bde?=
 =?iso-8859-1?Q?VB+HLLnTZ0i0GkJT1D0Ey6Qux5hHRUdWAXd2hehas0nn41vQqOz//YOMOM?=
 =?iso-8859-1?Q?Ofqf6Qnz6BPLhrk/SXEVs66bg09yi9ejKEpg0hj4CJRECDkPOJYj3W2gG5?=
 =?iso-8859-1?Q?ymIdSj+FrtzVl61ysXlNI0DMb53DpqAs2bQFMUsHXL1qkP2zZweMTiJoXi?=
 =?iso-8859-1?Q?U9TN9FtxKfuWp8Cw9xCx9GyJvezKtG2I3obOal1Hpo4UxB5/aY2OjpqsdL?=
 =?iso-8859-1?Q?8nYpkQD7V+mpescLzpw+k+NEaaxolnBkOGATYzP7E52xISXHVEHqQtxc+E?=
 =?iso-8859-1?Q?vs48isKG5P4CWl/N2eFtNP3PcFFxREhj2+WNnsmxbdKq9X1spcnV3hnhCq?=
 =?iso-8859-1?Q?VUcc2Te/c0exlnzvXPb1v49ULylo1MSadmYmLMMVHIZME9bXs+H7Ni+4cD?=
 =?iso-8859-1?Q?b/gMKjvAbi0TsevttvlVClyEWr+dlQtDpeFsqpYnVH/z7InIoaPlJjHnxK?=
 =?iso-8859-1?Q?U/+Nu3ynYCNtSJDgOZL/UMKfB4HGXchiRuawO07PTufhuRV6ORPkQa7C3w?=
 =?iso-8859-1?Q?pAIdEnGqqI6ZIIcwuisoA3HV+sK0EmU7vWlfxEQIPJFwwQDfroSF7ZHvDf?=
 =?iso-8859-1?Q?dTUeMKwHhk+qM0z9AmOEdLcwlMrBQ7LLT2ERaU42ufOxfQUYyEcOFVV3ux?=
 =?iso-8859-1?Q?6NzxDMNzXjqkY9WVjIlVoB2uvrM4Fkh7afTgv3Ulgs3ep6EQByJhNUSjNJ?=
 =?iso-8859-1?Q?jY/MfoIygqALLVWdvYvHNtvWv3umob4zaq0kFo7SdJ3KdmvfrUf5M3ztLF?=
 =?iso-8859-1?Q?Z3aK1a7XImqCwR3HDk3gZs8ouUdHpxN5t4vLUWr1xqv4cWFGGhoDRXnmyz?=
 =?iso-8859-1?Q?SNbBl/zZR7qfLEAsYS28S0CkHXP8RzrHDfyv5cuHasaoeMHLr9y+iBwmiA?=
 =?iso-8859-1?Q?0Pq5a+Oeq0PZFlxXOmjZX5VC2ifHhpt8m06GasryxSukN3UQa7b0suuQOd?=
 =?iso-8859-1?Q?Z7AAQ+DD8Ob51dIo2704WC0sSWXPALEgTBqYlkn2bNew6Q2SfpctdU1lzw?=
 =?iso-8859-1?Q?VunFXTCGhUHH/bUx9Ndb7Yth2Y46pRZHibZQCIdMV5vgnK+W+b6PZV42E7?=
 =?iso-8859-1?Q?JScb50zcxq4mCRFA9HB7Lg2nRxiFbsIuHhPyJHlUAc3iD5u1c9qnbj0gWj?=
 =?iso-8859-1?Q?+MngqdzMwSAoMtVmhgo1cbdO6tvTgQsTx22I+ypPr20FxWFvWUFgUYT+wN?=
 =?iso-8859-1?Q?bMNsDnJRWP5kcEBSI0LNOydNQ451xWHq21zyZesdPTAT3R8dNiia99OpLM?=
 =?iso-8859-1?Q?ZlZAdJy2m+3xnB9XB1MXuuX5ujlweRLuq/x8B+gFr+wyOVsBKNRtytvjNE?=
 =?iso-8859-1?Q?dw4doBdK53o7RO1u0I8M//BKqHDVNTQ3lLWIR4ItKT/06S0Sg1YY03FdKS?=
 =?iso-8859-1?Q?gqityp2Lm42E5cm67k+OhjRqLsTdwxa863PQxk9q00JyFRn+1wqj3uDdcs?=
 =?iso-8859-1?Q?R4sHYQhX5yUtbwTnDje8ylLRZx6z6P6aj5CFdK/hHhnG+dYXHrSWItVw15?=
 =?iso-8859-1?Q?unNmnyD+pOImyGOKGwd6pXTxkxDHVUTBCHTbuzLcc/ysIns6/Fq7R2Uxu3?=
 =?iso-8859-1?Q?Pt?=
x-ms-exchange-antispam-messagedata-1: fAF4bSWtGZFLV0zMpq4/ZDmPpHyVa1SFyc0=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: df588f62-124e-4c3c-f0bc-08dee9632288
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2026 09:08:32.2825
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cGhjCsNPw7nwOXUKpOlEVOXmgY3OhthpsrS35DyhdwY7eiGLMySfZh63wxGJ+KEFjcOkZ+S/zR9wZbxoP+WLsQ7cY0y876CjKkWD2u7uY24=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA5P287MB5244

Hi Jai,=0A=
=0A=
Thanks for the review.=0A=
=0A=
> Quoting Jai Luthra (2026-07-22 11:47:49)=0A=
> > Quoting Tarang Raval (2026-07-19 01:39:00)=0A=
> > > After adding 12-bit RAW support, the pixel rate depends on the select=
ed=0A=
> > > mode bpp. Store the V4L2_CID_PIXEL_RATE control pointer and update it=
s=0A=
> > > range/value when the mode changes so 10/12-bit switching reports the=
=0A=
> > > correct pixel rate.=0A=
> > >=0A=
> >=0A=
> > Link frequency (output bus rate) and Pixel rate (sensor internal readou=
t)=0A=
> > can often be independent of each other. It would be good to verify that=
 in=0A=
> > the sensor documentation.=0A=
> >=0A=
> > A quick test would be different bpp and the same HTS/VTS and frame size=
=0A=
> > registers if you get the same frame rate, it's likely that the sensor's=
=0A=
> > internal PIXEL_RATE doesn't change due to bpp.=0A=
> >=0A=
>=0A=
> If this sensor indeed operates on different pixel rates just because of t=
he=0A=
> output width, I would suggest you squash this to the prior patch which=0A=
> introduced the 12 bit support.=0A=
=0A=
I ran the quick test you suggested.=0A=
=0A=
Both 10-bit and 12-bit were tested at 2592x1944, using the same HTS=0A=
(shared register list), and I explicitly forced VTS to be identical=0A=
between the two run=0A=
=0A=
Measured actual streamed frame rate with v4l2-ctl --stream-mmap in both=0A=
cases:=0A=
=0A=
  10-bit, 2592x1944, vts=3D2006: 30.01 fps=0A=
  12-bit, 2592x1944, vts=3D2006: 30.01 fps=0A=
=0A=
Frame rate is identical. So it looks like the sensor's internal readout=0A=
timing doesn't depend on bit depth at all, HTS/VTS alone determine the=0A=
real frame rate, and bpp only affects how pixels are packed onto the MIPI=
=0A=
bus, not how fast they're read out.=0A=
=0A=
Best Regards,=0A=
Tarang=
