Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74C4E23909F
	for <linux-media@vger.kernel.org>; Tue, 28 Jul 2026 14:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785247999; cv=pass; b=TP6k6dfdxyHEM2N9q6pjqfkE5Lqb64EFipLvzlfB6vF/hafwhUcXBwWt7X30ah29uTnq8Q6M5dY+nsse+hvq8mGexaXnsCe4y+wNARsQHdBgD2OI1xnbEcpeZzwl/MqwCJB0imFhm6i969JZayNX0A7xY+TZ5Eic2cQQz2vCUBo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785247999; c=relaxed/simple;
	bh=h8d4kgoPUy936dNy9VMAz9CIjn1Ek+lRxupFJuz3LxY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ji10QDWNSvNdhI0qJIVozpzF3lIvxni3LhgG2c48gq+zlpHJ5YxaguXWgQh8VMAKS20FIlGf92nS0DncHYjwnUoKZ2tx/LXTOBe9szoXgiTUjyalxoaQU5c2+IqMZ3cjw9HJYYdano5RngNNfT+0DHklAe3N/A4WR0JJozX6n7Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O+PRf6Q1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OKIlFXjE; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O+PRf6Q1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OKIlFXjE"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SDOUJM2773183
	for <linux-media@vger.kernel.org>; Tue, 28 Jul 2026 14:13:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dXyemsWnZ3q9NF+uPWcOp+prjYyPZwTFCjD45rA2xa4=; b=O+PRf6Q18rVeH3gY
	Uqkrus2jVtV3oQufriVv9zWcJYn/SoAR8gAygIFWUsnAykxqY3vVLF1sm0gUjS7o
	AyY2f+mkCOlxeFH4WBC9dJvdTWHIY9gdQelpzzjA8ETR7kOW8ag7/wHOW3RD9brZ
	MnF+p07UPtX9d6TMbcukCuE/ru8WReKLW3rZfo1kJRYJ30xrzy7VrRaeye9XBMcj
	IS1As90XUQoOvLkQ8dv1Rcg79maqZSKrkWP+hDObgIQcjMsnmJ1c/JgtzUSuCo3d
	XTTVOF+y92D03yOh+qD5PSZ9hKTWrVU4Nna9a2kVtHDov80g3W1vTU7f5RKW5hiy
	MvdUVg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpw730880-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 28 Jul 2026 14:13:17 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-9077b4c35c5so87628576d6.2
        for <linux-media@vger.kernel.org>; Tue, 28 Jul 2026 07:13:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785247996; cv=none;
        d=google.com; s=arc-20260327;
        b=OtDwqT0PPm3tXOhWnx7Xks/o9d4pmSv+RrFaT8ZXOMsrm20Kx+z0oNXOXuk/jgdzbn
         FzX7+pijc5FUKWTDv2d1LqDpewKHoAfK387Yfu8MsEJJuiyxyRgxNr57/bQpZV1VutgW
         mhmdyd9c09RhMg1KQmgZ6fdZOV6e5FK72e3b4Rw69mAp/XywZ3EMvYM5DyLKHuMIl0yF
         2jqluIf4MLxsCOKzoBBimoyV8FIhME5wzvdasTpzwsKAGdDQip6mP3PHTExZZ2H3IEdh
         9Nh3Km1YmdPcfMf4MaZPn/sADgMNzvlUdgqHVrijCltTwD94QRFSihIjDLRN+bEK8w8S
         q3yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dXyemsWnZ3q9NF+uPWcOp+prjYyPZwTFCjD45rA2xa4=;
        fh=BkK1kkxKTXf6LgPWtF8pNfRti7g0MEFEIO+vqQNGsSQ=;
        b=UOWhmvePb3sucnsqYzPaZk0SQnJ+z+XAtsIjgcN6HIBn3IU3sjrpEmNcAohshPDqpw
         wBz+XMVqjyfwzmvlZ+OUg3VkbehdwtKJ11GasoS490tU36RFAWDCzeLV3k8SER832lX+
         M2OGl8egr9u2ZiqYxV2lEiAcDjZw33RCC0dNe1GEa18Tbb75Ktg+5lZGqO8sMsLqks1Q
         ma4QhCggX+2s9p7W0X+hkvn7Yl4NYtk6mAoFO2qef1mfdaGsL04yauv2zm/+/JrVCsLN
         y6UO7t443i6nBPsP0x7WdcB/iYePfH/xGLNt9mfQlMUJpyH1ebo/Y4nkvsPf2s+5qPpZ
         HY/w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785247996; x=1785852796; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dXyemsWnZ3q9NF+uPWcOp+prjYyPZwTFCjD45rA2xa4=;
        b=OKIlFXjEBEZNAh83HfwNs0J6jj8l3KXuy+zSPd0oRXep2/70fvPgLsDxaqiJPtELCB
         QJ8CF/1KH/1ZOE/6DP4f2jxaD3pV2XFbTe+Lb5A9f5XuZ6B08GavticKXIl64XKVUDNS
         EWN0fkwbWhupvmWA50XyBwpJhkD3+AsNODVuErz98jMZIz7/MK4oaUsFZ/08cckKjNbM
         7MjkddkwL4ZJvHEbOYJGgEfW2+X2vPVL82vLhJ/DhhExJMAtxNuGdH9nIa/OGD3qYtmL
         NIQMd7znTPSDdtsJqrTb9Drc5VL9Iva919nUGfcivQNhJ5uZsRQ0pJLi6QuzzvU800OL
         HV7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785247996; x=1785852796;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dXyemsWnZ3q9NF+uPWcOp+prjYyPZwTFCjD45rA2xa4=;
        b=jU+w8xrnUIXbuBpho9AnrHB6iOkSXYK8bhMGFWGsPhTwPMxJgRiz+UM/T1DNCd5KPk
         dCg0H0YixVucoRYaPU9jDOkmBkH19XP+hIRsl59FWrH6hY4XdQaDYDEsU4et0YDji87i
         EL+BMiyUFWnLMoO8+knn8U2RsmZyVFrPOITC1ctfuYwpju3Suyfgyo/e7TBL7yoilCjY
         pW1A1vxhtL0E3JwVNH9pZReTEezCKNraNPN3kei2fxMXIUohi0AOZrjm5b4FqwbRi1uI
         XKg8ynAmXgpWpXS7F9sMU7m6+/Vu+2sBNTGyOF1LPiZvUFO4CwOJiRECjEc8B1M4I/S1
         ipyw==
X-Forwarded-Encrypted: i=1; AHgh+RqAKx1A5XdtJptgAuOz94xehiU/m/08M0WEyOs/xVZWinGoPqdPrjnrJhuXWD1/BBmqOXplt+TRBnXi0w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzZu+m3cLYqKXyqv3X1OVw0mbggzBCCYMtsQcTFmHbejEuuhOYs
	EEFHSyBAyj98Z9bMIoIZzlNMAQY11cn6PKcDMmKAK5I6eVK0l9lvxoh5M3fdp2KEwSwWSMR5avO
	CosC5JsR86PF948ADY3Z+RKjM9Yd4+GdXqRs8xy6KUkeL288lHF9nzCUrW0xv4h55Q+19RPXtqF
	6/6a3hCvwV+GbprtWBJjxJV7N1Ziz0XvTUB7QKgof4
X-Gm-Gg: AR+sD11b8BW9HXL5f23X4i8HU0GKTgMGvYAU4xppzj0dLIy/+3kEraeqEvZ+nMkv/ux
	92/L53fdv3NxBMYDcGC0prXliLQedkaVEguXtMBF4/KXmOZzsb+Gc1LWG79T9QP4+jsRwqnSsgK
	ObIVMMprlt1RgzOZ2COOjfi77a9cWmXI8kheovA59q80z6YcwzbsA7OgxboXdEzEjr41+9dc5pD
	Uel1ZXmEeFjLuOmIoBwq9bzcMgH1xyOJygTF5LNWzw87Ef5tR4S4c9QqvlDHn98ftoFxS6hNbc=
X-Received: by 2002:a05:620a:4154:b0:932:f1ce:9a1f with SMTP id af79cd13be357-93302730834mr223456185a.56.1785247996428;
        Tue, 28 Jul 2026 07:13:16 -0700 (PDT)
X-Received: by 2002:a05:620a:4154:b0:932:f1ce:9a1f with SMTP id
 af79cd13be357-93302730834mr223449685a.56.1785247995855; Tue, 28 Jul 2026
 07:13:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260728-isi-v5-0-1d22ab91602a@oss.nxp.com> <20260728-isi-v5-4-1d22ab91602a@oss.nxp.com>
In-Reply-To: <20260728-isi-v5-4-1d22ab91602a@oss.nxp.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 16:13:04 +0200
X-Gm-Features: AUfX_mxRAoOnuuKFN9kfgl1STgWBnsdv1V9nVK68cViEsTLyUdBDzyYhHSFuho8
Message-ID: <CAFEp6-3MR3v_+3rMhi3wFRCPn70e_=fXp9o4tQ5oE0RuWEHSfQ@mail.gmail.com>
Subject: Re: [PATCH v5 4/4] media: nxp: imx8-isi: Add additional 32-bit RGB
 format support
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Christian Hemp <c.hemp@phytec.de>,
        Stefan Riedmueller <s.riedmueller@phytec.de>,
        Jacopo Mondi <jacopo@jmondi.org>, "Bryan O'Donoghue" <bod@kernel.org>,
        Dong Aisheng <aisheng.dong@nxp.com>, Guoniu Zhou <guoniu.zhou@nxp.com>,
        linux-media@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Robert Chiras <robert.chiras@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDEyNiBTYWx0ZWRfXxyCsdzCFBvWy
 bL3Wj22ihzPxjE6I9WaWPhxdzXqXSfTG9jN23JkIgtv4eV5jo5XRyXSjlKQuWkcT6wbK0DWY9e3
 DHXN0lYptWttHOdndheu6BFzkRLKIcs=
X-Proofpoint-GUID: Elwam225Clzvs9-V5NFFL2Slo75GRBDn
X-Proofpoint-ORIG-GUID: Elwam225Clzvs9-V5NFFL2Slo75GRBDn
X-Authority-Analysis: v=2.4 cv=NobhtcdJ c=1 sm=1 tr=0 ts=6a68b8fd cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=8AirrxEcAAAA:8 a=P1BnusSwAAAA:8 a=EUspDBNiAAAA:8
 a=TKf_yFmVHvvbg1ESzF0A:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=ST-jHhOKWsTCqRlWije3:22 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDEyNiBTYWx0ZWRfX0n/JTp4bAiQG
 55XFhbiwja0FWmhbX0E3aWya5iL+MuPO0DVSDXm12e4SScMKltT+Wx6vol6c2RByYQY+cEH7psM
 NVB/FtGVIJks8Lr8lykAZAikTrcNxfbj+C0B+iK4J9KZewdLYKV65np/7iSiQHJX2gaZZDuC8bh
 nG912h7uwJetweaJhKlXJI+O4pJIPGN8vMPu2xOu4XLZeNtt2TqwcU3YK+fNp5tNS/Iw32GF7Pf
 8bOqhpLsNQpB+hA+evQSbGYSG9X9iNEfgTNGmt7GzpnlKdJTwcFvvHjICHM0qlVI/xJAB8g3DFV
 1Hi/qKQARRY2ohjhkPuyqMcVszwZ1zRdlclWPm4zacxPShToiV1tE5zNWLRKLn8t56ZyQpsJx43
 nE9QrWy/JidDSmXjBoIUPLQOwoFUnDDW5N1qh2ce9nWdQVu5rpZbtRjqBPfyd21hLAtu4a2eYI0
 yuJ97yZhy6t3SoCKkAg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_03,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607280126

On Tue, Jul 28, 2026 at 8:55=E2=80=AFAM Guoniu Zhou <guoniu.zhou@oss.nxp.co=
m> wrote:
>
> Add support for additional 32-bit RGB pixel formats (BGRA32, RGBA32,
> BGRX32, RGBX32, ARGB2101010).
>
> Formats with alpha channel (BGRA32, RGBA32) only support capture as
> ISI ignores alpha bits when reading from memory.
>
> Signed-off-by: Robert Chiras <robert.chiras@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Tested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>


> ---
> Changes in v3:
> - Drop M2M_OUT for ABGR32/BGRA32/RGBA32 as ISI ignores alpha bits (Lauren=
t)
> - Remove Android requirements from commit message as alpha formats
>   cannot be used as M2M input (Laurent)
> - Add Tested-by tag from Laurent Pinchart
>
> Changes in v2:
> - Add Reviewed-by tag from Frank Li
> ---
>  .../media/platform/nxp/imx8-isi/imx8-isi-video.c   | 51 ++++++++++++++++=
++++++
>  1 file changed, 51 insertions(+)
>
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c b/drive=
rs/media/platform/nxp/imx8-isi/imx8-isi-video.c
> index a6e044056762..f45c2aae59ce 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> @@ -166,6 +166,57 @@ static const struct mxc_isi_format_info mxc_isi_form=
ats[] =3D {
>                 .color_planes   =3D 1,
>                 .depth          =3D { 32 },
>                 .encoding       =3D MXC_ISI_ENC_RGB,
> +       }, {
> +               .mbus_code      =3D MEDIA_BUS_FMT_RGB888_1X24,
> +               .fourcc         =3D V4L2_PIX_FMT_BGRA32,
> +               .type           =3D MXC_ISI_VIDEO_CAP | MXC_ISI_VIDEO_M2M=
_CAP,
> +               .isi_out_format =3D CHNL_IMG_CTRL_FORMAT_RGBA8888,
> +               .mem_planes     =3D 1,
> +               .color_planes   =3D 1,
> +               .depth          =3D { 32 },
> +               .encoding       =3D MXC_ISI_ENC_RGB,
> +       }, {
> +               .mbus_code      =3D MEDIA_BUS_FMT_RGB888_1X24,
> +               .fourcc         =3D V4L2_PIX_FMT_RGBA32,
> +               .type           =3D MXC_ISI_VIDEO_CAP | MXC_ISI_VIDEO_M2M=
_CAP,
> +               .isi_out_format =3D CHNL_IMG_CTRL_FORMAT_ABGR8888,
> +               .mem_planes     =3D 1,
> +               .color_planes   =3D 1,
> +               .depth          =3D { 32 },
> +               .encoding       =3D MXC_ISI_ENC_RGB,
> +       }, {
> +               .mbus_code      =3D MEDIA_BUS_FMT_RGB888_1X24,
> +               .fourcc         =3D V4L2_PIX_FMT_BGRX32,
> +               .type           =3D MXC_ISI_VIDEO_CAP | MXC_ISI_VIDEO_M2M=
_OUT
> +                               | MXC_ISI_VIDEO_M2M_CAP,
> +               .isi_in_format  =3D CHNL_MEM_RD_CTRL_IMG_TYPE_RGBX8,
> +               .isi_out_format =3D CHNL_IMG_CTRL_FORMAT_RGBX888,
> +               .mem_planes     =3D 1,
> +               .color_planes   =3D 1,
> +               .depth          =3D { 32 },
> +               .encoding       =3D MXC_ISI_ENC_RGB,
> +       }, {
> +               .mbus_code      =3D MEDIA_BUS_FMT_RGB888_1X24,
> +               .fourcc         =3D V4L2_PIX_FMT_RGBX32,
> +               .type           =3D MXC_ISI_VIDEO_CAP | MXC_ISI_VIDEO_M2M=
_OUT
> +                               | MXC_ISI_VIDEO_M2M_CAP,
> +               .isi_in_format  =3D CHNL_MEM_RD_CTRL_IMG_TYPE_XBGR8,
> +               .isi_out_format =3D CHNL_IMG_CTRL_FORMAT_XBGR888,
> +               .mem_planes     =3D 1,
> +               .color_planes   =3D 1,
> +               .depth          =3D { 32 },
> +               .encoding       =3D MXC_ISI_ENC_RGB,
> +       }, {
> +               .mbus_code      =3D MEDIA_BUS_FMT_RGB888_1X24,
> +               .fourcc         =3D V4L2_PIX_FMT_ARGB2101010,
> +               .type           =3D MXC_ISI_VIDEO_CAP | MXC_ISI_VIDEO_M2M=
_OUT
> +                               | MXC_ISI_VIDEO_M2M_CAP,
> +               .isi_in_format  =3D CHNL_MEM_RD_CTRL_IMG_TYPE_A2RGB10,
> +               .isi_out_format =3D CHNL_IMG_CTRL_FORMAT_A2RGB10,
> +               .mem_planes     =3D 1,
> +               .color_planes   =3D 1,
> +               .depth          =3D { 32 },
> +               .encoding       =3D MXC_ISI_ENC_RGB,
>         },
>         /*
>          * RAW formats
>
> --
> 2.34.1
>
