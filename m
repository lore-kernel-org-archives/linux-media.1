Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793825461;
	b=T+0SCqSlzcPFLQ9rtpqJRvGh52DgzciCZ2xlm/JLL9aHduYG/lWNL9xMxJ4xK9CFSx6t
	 NGNzhqNBUnAjEK6g2j6kNWqr9H0oRUEtHx7rLTceG7YMJnerJcirnqxySh2zS/P/qzWf5
	 17aUVsZETVTJWdx8AW6/10xfr06i50dTEfa3/Qim5xgcEefJT83eo1nwfMzOE56tE5DUl
	 Kh1g2kP2Wtb18iDE40nB3y78kyq2O/qinidaysudnI0BfpS/wXiVtPplNV67w43hsOwj6
	 39EbbLeLJfwss2yKIIcUVoRD1NlyGOruLj49KxBvWJHvEuHrgK9of0XqcY3L9MwvnBQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793825461;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Dy3s9iPy9F/4F8sHpe8RfCoMVfmCXpgucUf2KCFc8og=;
	b=an3m0sBDZykcQOor46wuUYKkfkd8TJf9zC1aOSOVtfNsUlvi3Oy9Y0g5MxfRYx9AD/ae
	 xlYADKjnl63ZRBTPTCYPaJLkJZQL0r+Q8bF/ZeF/USNsVkhlS85K/8gwfafIB7v3eJsWd
	 HN+2CMe/CbzAIp2AkUq1IwSop2+v0FX0LkOHLzNQnEBlk7iiR0vVWeACt4O3qbMtvWL8W
	 JcFi8fLB1ZaTqiPyEUUjSmES9hRkA9TCwQzCd4eu6fa4Im93/UOTNwEkNeOJrcNpVull0
	 HXzaaMo03s+suwmVaN1C/3DTRe9qo8+EDflUGNLbCIZGIsO+sp5rAyU1h04hZSuTfWQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FPLzKSct;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KpWlJfa9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE455606C59C
	for <linux-media@vger.kernel.org>; Wed,  4 Nov 2026 20:51:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE455606C59C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FPLzKSct;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KpWlJfa9
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4FjDMc2244235
	for <linux-media@vger.kernel.org>; Wed, 4 Nov 2026 20:50:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Dy3s9iPy9F/4F8sHpe8RfCoMVfmCXpgucUf2KCFc8og=; b=FPLzKSct3sUcfTZ8
	0xnibdGxfA2+0iv9nFEMefGkAQ/b8bDmVmsSuTwhZQVDFRXpDYGmTpMDNdGcOnf3
	3H8tTOSbkj8Hdkb1kZdLWOINxKTHijahCufgv9hkFMv7qRht+ht0FkQRQcfkkfaX
	eEcBNnCmxZ957XwzlvGcZMocunCuUOe3RZ4zyR6x1KX31ZO6zI9Gxq84urR/zx6p
	DLb7Tx8z0/stK69+/y6VIqTpX3r6XBfCVW5LnRk6bQojqOZ7gdKJ5JFq97/RxGep
	fCTXhFUSAR7TC45bZeDndgBvZSApG1ryXInJMbT6BIeYzihVrh4/QMRzlxJBShRF
	a0eKRQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr3pyjc14-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 04 Nov 2026 20:50:59 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-943e8ff02d0so126860785a.2
        for <linux-media@vger.kernel.org>; Wed, 04 Nov 2026 12:50:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793825459; cv=none;
        d=google.com; s=arc-20260327;
        b=SWx503cj5it1JdhgQbMXbphjk54pMuYuqnLs6dXBvbLG/OjireCs9AkdwSsRLHADgK
         WiFklKZU64iEDkzP2rosI9j+9SF8EgI7vbEppc8Y/4+ONkUeNX09WZ1hnWsd9UwSAp5Z
         M54wW55DUWvYnyow93Lrzpnbk51Fad3bScFuyGIiGi6BmrcV5Hwi2FEbOaaiNPHD/pls
         dTCmmqX5uneCPwzV112aMf+T8VbrdmX1i3MAmEPGc44Lk6lhzTTR9BypbfNU4xkVDlY2
         EqZDM4WRBsjtiQS5fxO2C6oQIrZXsz5HQJjNwVkxATQoax67ABZQVbmxtglR4XBfqEEe
         0sSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Dy3s9iPy9F/4F8sHpe8RfCoMVfmCXpgucUf2KCFc8og=;
        fh=UXbti1LD07R5SDIlpuHT4kTI8wVcrd2kaUT3M5lH+yM=;
        b=ioTU9AMQ50f+hRaDG0ZgdWPIFw+CQugndrNNZcEJh17ll2c2lj6lFd+U6HxpzveHcj
         hQl4q8FKKGXrd/5+yJ3X/QYC1b5bV8n+5FbGnWJ4jv+wIEil3UhAlGNlFSndbutSKCDg
         c+4m9+hDgkRahXnYOPMqnGpyIrR6meDEC5hT/SCft/othRet0e+0nsu7s1PR1MEku1Og
         fbFVLYme5staiCp3UrFOp6NbWL+6tZYSScGNS/akpCH73/tP8JVItfqsSWiCgn0r6H5h
         imy7vx4hieRd2rliDL4R2tEO11Wo6syuaCSm+5kpHM7jdCfMHXEOLABBG4475Wm3p3Vl
         AnjA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793825459; x=1794430259; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Dy3s9iPy9F/4F8sHpe8RfCoMVfmCXpgucUf2KCFc8og=;
        b=KpWlJfa91E9oH2uLWXhGgcxztqpHeAUHj7rXFbOQHNJr7IxU8tbDBVH3lMmH7HWxw3
         d41BDai6xOR9xgqlWFcekrM89XpWNMFK3brcTCzFIij56q2VFwFTfhysc+6CCBPfMv4e
         qUnMNKypYF6rRqJXkilBdisRn30xVUzZIkVV6L3ThOgzvESV3+3aKGgoS1fcQ+4nH9te
         bVRSH5qAD4zuOx42QSCS4bg4GTyanwrv/EgL7Fu49gbCCLrj2o0mnCiUSWW5a0QV2Nim
         nFVaAHLze/YW9iPXinVgGIKf5zqwBpkKt0PjOH+zXvWgIwTKkCaxQ+ubPQbbfs5CpGYz
         rTiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793825459; x=1794430259;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dy3s9iPy9F/4F8sHpe8RfCoMVfmCXpgucUf2KCFc8og=;
        b=BlexH7bozmMs90emELDGyurA1W6vBTSUDKM6gL54bTOlL1tkJNdS0PtVV3PSQhI/w0
         61hOIYiyGq3ZqxYmRZUPJ/0lbWQNmeXeJmS0QmuZek/qibTRKoC7d1EqhncW41lxBWkH
         1jgoOL+HwbETkSy8G169kcogJ+BBgh6pEoHMLar2QVC6XoobhmpTnbqcUwXinl0wI22W
         miiz7j9A40WphhzyLhK+JMj82Cbb+F+h8dbpPbfbtN2BI5ipjPwrFm8QXupc36b2X3aJ
         BBEi8tOIosamywO3etAqoP2bBhCxErPurBFGzrecNfjc8mrdxHBCRE6fKChtBPHXuNKs
         2R7Q==
X-Forwarded-Encrypted: i=1; AKwUvBwzHo6bYjtjd35aMlclDJGm2ydMVHXCelEQdKVyUMjzJSKsMs6K3vOcojJrSmh27B+Fcv4xQcwMXSyHgg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+OK+rJPmsZQhOJniepZEj7mNrW8MupxHng6pLcyRmeRVGKq7YH
	tbMjerDdtqCD8PY7u8vYaOmvIIhnhUoH9JbQpNBX0Crud+t+KWF9Z5iC2UjOgXHWWsMzAp84aaY
	zvwKpfkgvskn1w9Lv9pjT+8x5woxhZt/kYRft//PQCJ/0NXlHjxKx54Z8RB+EBiaJ/4uz5cIoMp
	fcqrvkn4p3kAnSeOKI188VJLLsiFurlW8u8fusC3vH
X-Gm-Gg: AYBFou2BytFD4YcpZkt9nFd6H54jp5C4la4wzveATEBdaDedFS2CakerrQupC6ry6ZA
	EwJQW/qMVGeBCaEpFkGIMQX6KLETAmJOGuEalWEEnasrn0xTWjArolazc/0927ZJ+9N6iOryw0a
	e8g/9MP2X9ZpMp465C+5tSPPeVp3pG26X4Gyl6jMsALSD6kPMTrqWFboP5Uu6wfazMnGG+tfcv4
	toQ8U84NG+IQQvy75tUf6HTdydgcGs872NkvKxwVVtOrKxx8ah2kcY288K2qLItsz7jMCYMxwg=
X-Received: by 2002:a05:620a:3188:b0:943:ff70:dc00 with SMTP id af79cd13be357-9442174fc9emr2806223685a.56.1793825458720;
        Wed, 04 Nov 2026 12:50:58 -0800 (PST)
X-Received: by 2002:a05:620a:3188:b0:943:ff70:dc00 with SMTP id
 af79cd13be357-9442174fc9emr2806217785a.56.1793825457949; Wed, 04 Nov 2026
 12:50:57 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104202313.72494-1-allan@fatecpompeia.edu.br> <20261104202313.72494-2-allan@fatecpompeia.edu.br>
In-Reply-To: <20261104202313.72494-2-allan@fatecpompeia.edu.br>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 21:50:47 +0100
X-Gm-Features: AclHuK_Rxl7cbdoRg_QDod4L7B3ML4GWx5ddvnZ9Bihe2VqguDfQzrrRuv7GEjQ
Message-ID: <CAFEp6-0aVDpJUcBc1TD7NXjszKcb_LUEm92mZCKc0dL2dqnzdQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] media: qcom: camss: use contiguous buffers when there
 is no IOMMU
To: Allan Siriani <allan@fatecpompeia.edu.br>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=ZbmIpcVA c=1 sm=1 tr=0 ts=6aeb9ab3 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=HVCkNrGJQQosrJJkAP4A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA4MyBTYWx0ZWRfX1E75smgA5sUU
 uXdhODLQJs/LFCSAAEw5+jwrhT9te4OLFF5rxSfMC0+F2G7l/FDmKDFg7MMeev90xoFypzHr9BJ
 AskAskV3TQ4gNO9nvZAMSpECBZcb9uoK8fb6+gU3G4kSQyvBKU+32vbBBdM73ZPMpHKVEMn39k4
 QlsDNq5MB2fO5oQVpVVmvsTocriA7rMwabAwi4Fzhs+PfVnqBjsZufSAlPZ5VTsd6KlSIo8kkwg
 7kcEyFLKtmEvBQgFAdiQpAQsYNlE0LT24JgcFT8f7nu61LHn2B4AW9vW3eiBDy1AyAw7FKI+hzx
 3eyLQ+KpPgmxNYLbVVJCEoOSu5pgmV3J+IEgwEp79hRe0CR8lxGvJQkORdm+oVL3IxgveLMQj3P
 xh5kGWI8O8tEVSy5JFlcaWCRwQR5dtS890m8Wb6tnDg+fEuGyL1+ehXL0IXo2oWt9rMZo9y7+/M
 DiO9mg+jGWGJ7oCu8MQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA4MyBTYWx0ZWRfX3mQL2SaCSvIF
 FuFp2ZVTlO9cuCKx01jBaIz7i9F9A8p0NBm/vGZX5Z0gASstB3HBl55K96fIJS6sQzJuCTtyzjw
 PitrPns5yKEXs4uUUjC914Zlf8q/sUY=
X-Proofpoint-ORIG-GUID: RCrPQV7T3dtd9FAKaSIorvYeU4VMA-gH
X-Proofpoint-GUID: RCrPQV7T3dtd9FAKaSIorvYeU4VMA-gH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040083

On Wed, Nov 4, 2026 at 9:23=E2=80=AFPM Allan Siriani <allan@fatecpompeia.ed=
u.br> wrote:
>
> The VFE write masters are programmed with a single base address per plane
> and then write the whole plane from there. video_buf_init() takes that
> address from sg_dma_address() of the first scatterlist entry of a
> vb2_dma_sg buffer, which is only correct when the whole buffer is mapped
> as one contiguous range in the device address space.
>
> That holds when the CAMSS is behind an IOMMU, but not on SoCs where it is
> not, such as MSM8226: there vb2_dma_sg allocates scattered pages, the
> write master runs past the first segment and the frame lands in memory
> that belongs to someone else, which quickly brings the system down.
>
> When the CAMSS device is not IOMMU mapped, use vb2_dma_contig instead,
> which allocates physically contiguous (CMA) buffers and checks that
> imported USERPTR/DMABUF buffers are contiguous. Keep vb2_dma_sg when ther=
e
> is an IOMMU, but refuse a buffer whose DMA segments are not contiguous
> instead of handing a partial mapping to the hardware.
>
> Signed-off-by: Allan Siriani <allan@fatecpompeia.edu.br>
> ---
>  drivers/media/platform/qcom/camss/Kconfig     |  1 +
>  .../media/platform/qcom/camss/camss-video.c   | 64 +++++++++++++++++--
>  2 files changed, 58 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/Kconfig b/drivers/media/pl=
atform/qcom/camss/Kconfig
> index b51745c94..3d3555b55 100644
> --- a/drivers/media/platform/qcom/camss/Kconfig
> +++ b/drivers/media/platform/qcom/camss/Kconfig
> @@ -5,6 +5,7 @@ config VIDEO_QCOM_CAMSS
>         depends on (ARCH_QCOM && IOMMU_DMA) || COMPILE_TEST
>         select MEDIA_CONTROLLER
>         select VIDEO_V4L2_SUBDEV_API
> +       select VIDEOBUF2_DMA_CONTIG
>         select VIDEOBUF2_DMA_SG
>         select V4L2_FWNODE
>         select GENERIC_PHY
> diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/me=
dia/platform/qcom/camss/camss-video.c
> index 0852eb6f1..2c15546c8 100644
> --- a/drivers/media/platform/qcom/camss/camss-video.c
> +++ b/drivers/media/platform/qcom/camss/camss-video.c
> @@ -7,12 +7,14 @@
>   * Copyright (c) 2013-2015, The Linux Foundation. All rights reserved.
>   * Copyright (C) 2015-2018 Linaro Ltd.
>   */
> +#include <linux/device.h>
>  #include <linux/slab.h>
>  #include <media/media-entity.h>
>  #include <media/v4l2-dev.h>
>  #include <media/v4l2-device.h>
>  #include <media/v4l2-ioctl.h>
>  #include <media/v4l2-mc.h>
> +#include <media/videobuf2-dma-contig.h>
>  #include <media/videobuf2-dma-sg.h>
>
>  #include "camss-video.h"
> @@ -146,6 +148,48 @@ static int video_queue_setup(struct vb2_queue *q,
>         return 0;
>  }
>
> +/*
> + * The VFE write masters take a single base address per plane and write =
the
> + * whole plane from there, so every plane must be contiguous in the devi=
ce
> + * address space. Without an IOMMU the buffers come from vb2_dma_contig,=
 which
> + * guarantees that. With an IOMMU the scatterlist mapping may still be s=
plit
> + * in several DMA segments (max_seg_size): accept it only when the segme=
nts
> + * follow each other in the IOVA space.
> + */
> +static int video_buf_plane_addr(struct camss_video *video,
> +                               struct vb2_buffer *vb, unsigned int plane=
,
> +                               dma_addr_t *addr)
> +{
> +       struct scatterlist *sg;
> +       struct sg_table *sgt;
> +       dma_addr_t next;
> +       unsigned int i;
> +
> +       if (video->vb2_q.mem_ops =3D=3D &vb2_dma_contig_memops) {
> +               *addr =3D vb2_dma_contig_plane_dma_addr(vb, plane);
> +               return 0;
> +       }
> +
> +       sgt =3D vb2_dma_sg_plane_desc(vb, plane);
> +       if (!sgt || !sgt->nents)
> +               return -EFAULT;
> +
> +       next =3D sg_dma_address(sgt->sgl);
> +       for_each_sgtable_dma_sg(sgt, sg, i) {
> +               if (sg_dma_address(sg) !=3D next) {
> +                       dev_err(video->camss->dev,
> +                               "Plane %u is not contiguous in DMA space\=
n",
> +                               plane);
> +                       return -EINVAL;
> +               }
> +               next +=3D sg_dma_len(sg);
> +       }
> +
> +       *addr =3D sg_dma_address(sgt->sgl);
> +
> +       return 0;
> +}
> +
>  static int video_buf_init(struct vb2_buffer *vb)
>  {
>         struct vb2_v4l2_buffer *vbuf =3D to_vb2_v4l2_buffer(vb);
> @@ -154,15 +198,13 @@ static int video_buf_init(struct vb2_buffer *vb)
>                                                    vb);
>         const struct v4l2_pix_format_mplane *format =3D
>                                                 &video->active_fmt.fmt.pi=
x_mp;
> -       struct sg_table *sgt;
>         unsigned int i;
> +       int ret;
>
>         for (i =3D 0; i < format->num_planes; i++) {
> -               sgt =3D vb2_dma_sg_plane_desc(vb, i);
> -               if (!sgt)
> -                       return -EFAULT;
> -
> -               buffer->addr[i] =3D sg_dma_address(sgt->sgl);
> +               ret =3D video_buf_plane_addr(video, vb, i, &buffer->addr[=
i]);
> +               if (ret < 0)
> +                       return ret;
>         }
>
>         if (format->pixelformat =3D=3D V4L2_PIX_FMT_NV12 ||
> @@ -699,7 +741,15 @@ int msm_video_register(struct camss_video *video, st=
ruct v4l2_device *v4l2_dev,
>
>         q =3D &video->vb2_q;
>         q->drv_priv =3D video;
> -       q->mem_ops =3D &vb2_dma_sg_memops;
> +       /*
> +        * Without an IOMMU a scatter-gather buffer is physically scatter=
ed and
> +        * the write masters, which only take a base address, would run p=
ast
> +        * its first segment. Use physically contiguous (CMA) buffers ins=
tead.
> +        */
> +       if (device_iommu_mapped(video->camss->dev))
> +               q->mem_ops =3D &vb2_dma_sg_memops;
> +       else
> +               q->mem_ops =3D &vb2_dma_contig_memops;

So I think we should simply use vb2_dma_contig_memops in all cases. We
don't appear to support scatter-gather buffers properly anyway as we
only program a single address per plane and neither the driver nor the
hardware handles multiple DMA segments. We've likely been lucky so far
because the DMA mapping ended up as a single segment, or as contiguous
DMA segments...

>         q->ops =3D &msm_video_vb2_q_ops;
>         q->type =3D V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
>         q->io_modes =3D VB2_DMABUF | VB2_MMAP | VB2_READ;
> --
> 2.43.0
>
