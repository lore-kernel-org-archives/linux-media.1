Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F9CB4483BC
	for <linux-media@vger.kernel.org>; Tue, 28 Jul 2026 14:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785247880; cv=pass; b=Xv6nahbuWaOAlKXEPbb092dgG9ZuJ4vrD+mkUDaiNY+5P4GcWdyr4ZCse13pFMKyIskR2MbZwiiZ200dn0VRnkeajqT2ATgFvhFm07W/SoSu5azyu1UFLE6JphyXGhptwArFr9k9shnUy3sOktBwHe0/e8mbnXwZdPbHjgsxP40=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785247880; c=relaxed/simple;
	bh=gitP+7fBgHg1QSb30V4MdG7ID1IrvJ/KqrgsFUY69xM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=guUVq5cvSqn+/5Z2ofvwFzSyVXkSlCQ5Cwm8VRVRuW9Ars9VuGQAtYpLiLH/D0jenxyj3FZmBp0Nx6H1AtgPE95VfiSPwAHVoAbsbClVpVsB/mcX8QUO/npEnmKyUMP/YEKqOndreX23QKgWldV/WB+QKjxJkpSANmycLcQgK2s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LyoTOcl4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fw+H9Aee; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LyoTOcl4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fw+H9Aee"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SDPNeb2898741
	for <linux-media@vger.kernel.org>; Tue, 28 Jul 2026 14:11:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pXYzj8wUxZawxdlqOG9JD6vCCnLWpF0jT2NKjRsE0M4=; b=LyoTOcl4+5hL+KLq
	xoha+jRqy2J2DdVQkvKYJ1DhmF+DlrXPJYqBs6coJdxrj/Ls+DwYS4UoIVtj4Wpb
	kFZakPjJW9CUkjPM6lJNgomLjFo5+RX3wF7x5JdPW+0BKq/wePrvIOyIP880SUGy
	3JBrSONKh4JIMtHgABwnyg7Gxilf3Yf0/oLCINXDHGff4nbCBI3ow432r7L5BIt8
	XXya7NI8uCCme9vSPcvqWYhL/13KjhCYQP1snWCln/nOSufHL08BKXGWXJUwXnKn
	KPLxda8Qvlg81geufLWXqTvWXT2R6DdEqR2XyBe95ZrqYyiCtiX/pQmIVMQDR2Bm
	90jNXw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpn19je0h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 28 Jul 2026 14:11:15 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93106d8af18so361282885a.0
        for <linux-media@vger.kernel.org>; Tue, 28 Jul 2026 07:11:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785247874; cv=none;
        d=google.com; s=arc-20260327;
        b=RiWvCdrcwHUHFVO2dt3B5LvdU+B8/Gw/rmIXPsTzfOqKES0vAnL6D3WIawN426PCQm
         5wekJWpQnw55SMYa7k10stkB/f/hiAb3RL9WsKjrVvfHydOE+1gAbGpesRbp0JobYeGd
         eJmVvo9tOwjsRPmRG89aUlbEp8PdG1nVwXyi0rktc6Hnn+s9PDHd3yChgXrB7I2dUYiP
         EN9+z3m6WXcN6UUMF2Mxi5CUOi4AtsAXD70jwCQ1Vsalq4Cuc/X0a1a/AlKlYlEXBCMS
         gsag+mWk8ewCjHggwsV6dEGZfdRz/SKQ6/lv94M7PbwjF+htUJF6om4gK4a6eWsEoakL
         q1vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pXYzj8wUxZawxdlqOG9JD6vCCnLWpF0jT2NKjRsE0M4=;
        fh=6DEMOn4a5/nIxExRRLEGhXhZINJIGFwLRh7aovFbeOg=;
        b=quVJLHr4H+MGJ45rmBrW86RY5xu/3kjBp5Y1EiN8xuZ6kjEqa6n/1spkJvZ2nResfO
         rPnL38EwD+WxEHImJ0jSpqRJXpowRKtOOzlL+4b0hxxhPDr4kmdPTmPh3tGf7fI+WmjJ
         zclb3WBkzol4YyDi5pOdoDk7ky0O89u09n97i3wGJnl9F4axXHzfrS4gja0lK9K1inoi
         lExZO+pRJPGgx7V0TvWiUvb8PtLY8NokTYVpSdzA/1fKZz2gV+38CNWNYRx2KXzSG+VL
         RecDnd65Vc0Pnk8Qu2cZUGZx7WwK/66XeB+/NsJ0v3K8a1O9ScJtkA2jhL9H2+K/a09U
         6NhQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785247874; x=1785852674; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pXYzj8wUxZawxdlqOG9JD6vCCnLWpF0jT2NKjRsE0M4=;
        b=Fw+H9AeePcwxLlhAt6septVjYqzo5/av0jmACV+v6PIoWp1/4UKd1fffm6oUHTUwsm
         UZ4ozhH0uxQInGbKYcQoByJuGJR2mXXuBjxfZcPyXOC0aXab/e4mIVgfxfOQTxp8xD/R
         8iHBT/DfjcJ9Qyc8LIBJPFJYqnJOFYlao6sHOFsHogfOS7b618DngyrDFIhwtHd6Rj2g
         sU50B2GJiRCI0Rk7uJYPOwSRCqzjR/24ImME6v8noalIaAm0MIFIWZ1Qjj3T2Y9Xlw1R
         m24WqjHf03gTaPn/rbkllNv44eO6tqXdOlHXOtGKDCkR8HcOPmGFf42sEWYqLoazVnkI
         MshA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785247874; x=1785852674;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pXYzj8wUxZawxdlqOG9JD6vCCnLWpF0jT2NKjRsE0M4=;
        b=eVdIoY3VAXQbRrDDjnPzQCh9UySNvZNBy8pqBD8j912K/osqmsN//O4pQGn3ZGqs7g
         7eJduhYktU6ANJk7lvtJfqHunVqcjDgZYZ9DgCkv2j4HPHGQ3vykuGpk8t7RbbPgQyWq
         jlF27HrhLn66GwPbpcE5ms1x9zUDl3KEaVQZiyNIOdA7cfbHnErkImiJZAFPZy6jzgBr
         /NxWm4NZ5FT5z6rb5NKQysWZxnBGUXHPKChnoF+gCywwLja6CGLFj5frg2kUVbQjxt7o
         WA6k4gXrj+3deKGZQQUW9uwdyDKMMYTP7oxx6tVW8UIJfCPSZEujq6TxMn9GsXrtMHf9
         CbRA==
X-Forwarded-Encrypted: i=1; AHgh+RryFZf4PVfQNkw7Dh4drdt41I84EvkkbWq0WYTtWKYQUnjMksFsfkVyAGubAvmkbA0n25Y+LSWjSR20yg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzCabgy4XwRHSZxxO8BxUFc3ZUYvfaFw61JOCNZmCz6dMaGzi9I
	W50odvjoZGGC5e/hkUMrHW8aTVfoqX9iMILz6+4eS/xtjdzWwVFO1ljD6vyaVpiwIxqYXWSNa4f
	GXGntlEH0EWqr761Q9GK0cbMMdA8U7GCvcQP2hMYHZxp2pb0PX0Dm+UtSAPDUbcJkpHzn7bBV3m
	FrkFmKT0WYRmFi/iyjB1sYKGwTY6fzz63vQ+H1yrrV
X-Gm-Gg: AR+sD13JbViOSMC/G/P67ppS0pVepJ4FXj3jqtWLHf5kh8EKF/HKtOGeZ45QzY0dgK5
	vkHhNX9E/hEyqCnvL7nqgxX9CHMYAD5ApHsHIv4onhvPN/v2YIoCJ43w1yKulaMRxtEQS7tf8yk
	+9V3d2Is9R8D4cCRCPu2MWimBpQsglQu2onxJ4eO1ln9tQIzj08pVpkz0bQ7UuDEou48Vb37l5l
	USMuCDlTH5D7/yrmzTwlPP6MpAZEKP9A3kzY0WRDACDRua5pNy71va47RpWZof6aDvjw12cdI0=
X-Received: by 2002:a05:620a:4155:b0:92e:c117:5ed9 with SMTP id af79cd13be357-933027b2503mr237090685a.89.1785247874362;
        Tue, 28 Jul 2026 07:11:14 -0700 (PDT)
X-Received: by 2002:a05:620a:4155:b0:92e:c117:5ed9 with SMTP id
 af79cd13be357-933027b2503mr237081385a.89.1785247873683; Tue, 28 Jul 2026
 07:11:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260728-isi-v5-0-1d22ab91602a@oss.nxp.com> <20260728-isi-v5-3-1d22ab91602a@oss.nxp.com>
In-Reply-To: <20260728-isi-v5-3-1d22ab91602a@oss.nxp.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 16:11:01 +0200
X-Gm-Features: AUfX_my42PvyrS3FcaDcQHI7hGXphBJTiNAhLBmqhh3UWN-wDUMcyOhj5-Qtq_8
Message-ID: <CAFEp6-33my_MgEJBmwpaAmACzpx-HoF2bXesGr5e6ojRhq9yew@mail.gmail.com>
Subject: Re: [PATCH v5 3/4] media: nxp: imx8-isi: Add 16-bit raw Bayer format support
To: guoniu.zhou@oss.nxp.com
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
        Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=TJV1jVla c=1 sm=1 tr=0 ts=6a68b883 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=8AirrxEcAAAA:8 a=P1BnusSwAAAA:8 a=EUspDBNiAAAA:8
 a=6g14dlwTP8NX5ZwT2TAA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=ST-jHhOKWsTCqRlWije3:22 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDEyNSBTYWx0ZWRfXxrNbIUDd7cCY
 WGNTUG70ZWLpddiURNUnTIocO9kfDmwdUBGdJpexkUMmCLxCyBwHE3AihafDizi1vGKZ2yO01FU
 bez6nr8i219j11TWunKZ4acFMMS/wZmWBxmjiXLlyIzjc8jUl5si+TjhnSCJf5zlCdotTHjrvZD
 ym+HYInYZA/jHFeb9wK7wjcbMI7HVNsqW+4JplQ9intk/9sQqEKak9U3vRomNrc/dEyJ738DaOa
 zkN6Qm+G1/fTm4MAczu4zzsRu4mOa9KBER+KF89lgV3rDq1AUfAcUDSDQKzAUvgkUf7L+1vR8+I
 EtrZL3oih9zF0DIUwgOS9Foj2sv+XYboUmtdKwMyJnpRvvoSGQmuqRk+65Y7dXqP1Bro4Ibn4Zx
 U0nEr8fheKXOQlrSyNku9yvY/KyYh0KneJDSoOsJc6TjxWKL7YOKNfAKcblVR06Xu0Rs+kfZ2Sz
 kxhf7L85MotjOdKZesg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDEyNSBTYWx0ZWRfX3uWHRlCSqC9B
 5Zt5u7WPlXF6eCQuavHFgk88bLYkLIp5vxkBfk70LFk4oCjU6mzA43gJa7LujYVtkNLlDMHbywB
 JIYtGSJvYPFCjEJolBGzjl+4/dVaIMM=
X-Proofpoint-GUID: X6eGPdiLt7QpKS1nmqNzzIggPDPnjqq7
X-Proofpoint-ORIG-GUID: X6eGPdiLt7QpKS1nmqNzzIggPDPnjqq7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_03,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 spamscore=0 impostorscore=0 bulkscore=0 phishscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607280125

On Tue, Jul 28, 2026 at 8:55=E2=80=AFAM <guoniu.zhou@oss.nxp.com> wrote:
>
> From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
>
> Add support for 16-bit raw Bayer formats (SBGGR16, SGBRG16, SGRBG16,
> SRGGB16) to both the pipeline subdev and video capture interface.
>
> These formats are used by image sensors that output 16-bit raw data,
> enabling the ISI to capture full dynamic range from such sensors.
>
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
> Changes in v3:
> - Remove "high-end" from description as RAW16 is common now (Laurent)
> - Add Y16 (16-bit monochrome) format support (Laurent)
> - Add Reviewed-by tag from Laurent
>
> Changes in v2:
> - Add Reviewed-by tag from Frank Li
> ---
>  .../media/platform/nxp/imx8-isi/imx8-isi-pipe.c    | 30 +++++++++++++++
>  .../media/platform/nxp/imx8-isi/imx8-isi-video.c   | 45 ++++++++++++++++=
++++++
>  2 files changed, 75 insertions(+)
>
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c b/driver=
s/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
> index c0ec59856374..934f7b356258 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
> @@ -83,6 +83,12 @@ static const struct mxc_isi_bus_format_info mxc_isi_bu=
s_formats[] =3D {
>                 .pads           =3D BIT(MXC_ISI_PIPE_PAD_SINK)
>                                 | BIT(MXC_ISI_PIPE_PAD_SOURCE),
>                 .encoding       =3D MXC_ISI_ENC_RAW,
> +       }, {
> +               .mbus_code      =3D MEDIA_BUS_FMT_Y16_1X16,
> +               .output         =3D MEDIA_BUS_FMT_Y16_1X16,
> +               .pads           =3D BIT(MXC_ISI_PIPE_PAD_SINK)
> +                               | BIT(MXC_ISI_PIPE_PAD_SOURCE),
> +               .encoding       =3D MXC_ISI_ENC_RAW,
>         }, {
>                 .mbus_code      =3D MEDIA_BUS_FMT_SBGGR8_1X8,
>                 .output         =3D MEDIA_BUS_FMT_SBGGR8_1X8,
> @@ -179,6 +185,30 @@ static const struct mxc_isi_bus_format_info mxc_isi_=
bus_formats[] =3D {
>                 .pads           =3D BIT(MXC_ISI_PIPE_PAD_SINK)
>                                 | BIT(MXC_ISI_PIPE_PAD_SOURCE),
>                 .encoding       =3D MXC_ISI_ENC_RAW,
> +       }, {
> +               .mbus_code      =3D MEDIA_BUS_FMT_SBGGR16_1X16,
> +               .output         =3D MEDIA_BUS_FMT_SBGGR16_1X16,
> +               .pads           =3D BIT(MXC_ISI_PIPE_PAD_SINK)
> +                               | BIT(MXC_ISI_PIPE_PAD_SOURCE),
> +               .encoding       =3D MXC_ISI_ENC_RAW,
> +       }, {
> +               .mbus_code      =3D MEDIA_BUS_FMT_SGBRG16_1X16,
> +               .output         =3D MEDIA_BUS_FMT_SGBRG16_1X16,
> +               .pads           =3D BIT(MXC_ISI_PIPE_PAD_SINK)
> +                               | BIT(MXC_ISI_PIPE_PAD_SOURCE),
> +               .encoding       =3D MXC_ISI_ENC_RAW,
> +       }, {
> +               .mbus_code      =3D MEDIA_BUS_FMT_SGRBG16_1X16,
> +               .output         =3D MEDIA_BUS_FMT_SGRBG16_1X16,
> +               .pads           =3D BIT(MXC_ISI_PIPE_PAD_SINK)
> +                               | BIT(MXC_ISI_PIPE_PAD_SOURCE),
> +               .encoding       =3D MXC_ISI_ENC_RAW,
> +       }, {
> +               .mbus_code      =3D MEDIA_BUS_FMT_SRGGB16_1X16,
> +               .output         =3D MEDIA_BUS_FMT_SRGGB16_1X16,
> +               .pads           =3D BIT(MXC_ISI_PIPE_PAD_SINK)
> +                               | BIT(MXC_ISI_PIPE_PAD_SOURCE),
> +               .encoding       =3D MXC_ISI_ENC_RAW,
>         },
>         /* JPEG */
>         {
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c b/drive=
rs/media/platform/nxp/imx8-isi/imx8-isi-video.c
> index 056603055c81..a6e044056762 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> @@ -212,6 +212,15 @@ static const struct mxc_isi_format_info mxc_isi_form=
ats[] =3D {
>                 .color_planes   =3D 1,
>                 .depth          =3D { 16 },
>                 .encoding       =3D MXC_ISI_ENC_RAW,
> +       }, {
> +               .mbus_code      =3D MEDIA_BUS_FMT_Y16_1X16,
> +               .fourcc         =3D V4L2_PIX_FMT_Y16,
> +               .type           =3D MXC_ISI_VIDEO_CAP,
> +               .isi_out_format =3D CHNL_IMG_CTRL_FORMAT_RAW16,
> +               .mem_planes     =3D 1,
> +               .color_planes   =3D 1,
> +               .depth          =3D { 16 },
> +               .encoding       =3D MXC_ISI_ENC_RAW,
>         }, {
>                 .mbus_code      =3D MEDIA_BUS_FMT_SBGGR8_1X8,
>                 .fourcc         =3D V4L2_PIX_FMT_SBGGR8,
> @@ -356,6 +365,42 @@ static const struct mxc_isi_format_info mxc_isi_form=
ats[] =3D {
>                 .color_planes   =3D 1,
>                 .depth          =3D { 16 },
>                 .encoding       =3D MXC_ISI_ENC_RAW,
> +       }, {
> +               .mbus_code      =3D MEDIA_BUS_FMT_SBGGR16_1X16,
> +               .fourcc         =3D V4L2_PIX_FMT_SBGGR16,
> +               .type           =3D MXC_ISI_VIDEO_CAP,
> +               .isi_out_format =3D CHNL_IMG_CTRL_FORMAT_RAW16,
> +               .mem_planes     =3D 1,
> +               .color_planes   =3D 1,
> +               .depth          =3D { 16 },
> +               .encoding       =3D MXC_ISI_ENC_RAW,
> +       }, {
> +               .mbus_code      =3D MEDIA_BUS_FMT_SGBRG16_1X16,
> +               .fourcc         =3D V4L2_PIX_FMT_SGBRG16,
> +               .type           =3D MXC_ISI_VIDEO_CAP,
> +               .isi_out_format =3D CHNL_IMG_CTRL_FORMAT_RAW16,
> +               .mem_planes     =3D 1,
> +               .color_planes   =3D 1,
> +               .depth          =3D { 16 },
> +               .encoding       =3D MXC_ISI_ENC_RAW,
> +       }, {
> +               .mbus_code      =3D MEDIA_BUS_FMT_SGRBG16_1X16,
> +               .fourcc         =3D V4L2_PIX_FMT_SGRBG16,
> +               .type           =3D MXC_ISI_VIDEO_CAP,
> +               .isi_out_format =3D CHNL_IMG_CTRL_FORMAT_RAW16,
> +               .mem_planes     =3D 1,
> +               .color_planes   =3D 1,
> +               .depth          =3D { 16 },
> +               .encoding       =3D MXC_ISI_ENC_RAW,
> +       }, {
> +               .mbus_code      =3D MEDIA_BUS_FMT_SRGGB16_1X16,
> +               .fourcc         =3D V4L2_PIX_FMT_SRGGB16,
> +               .type           =3D MXC_ISI_VIDEO_CAP,
> +               .isi_out_format =3D CHNL_IMG_CTRL_FORMAT_RAW16,
> +               .mem_planes     =3D 1,
> +               .color_planes   =3D 1,
> +               .depth          =3D { 16 },
> +               .encoding       =3D MXC_ISI_ENC_RAW,
>         },
>         /* JPEG */
>         {
>
> --
> 2.34.1
>
