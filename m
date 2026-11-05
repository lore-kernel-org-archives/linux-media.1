Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793891522;
	b=DYj3xIxto1EZdq9Qwoh28YOWWm7MicMzUTR7gjd1Rde3d5SoIvMNePSlcyaQpPoRe036
	 UJKyMMeZPTmXGv017zHxGdfKoH6LVbAH6Hug3Lfmw8S0CCRh8zFTn2o9z8hba8VBfahaQ
	 dRdrG+hA9zfetUiOkWj3l2DMINw2YqHPG5r8vXkSGnvboa2YaG9aV6KlXMdBi024NrUBH
	 Rp4304bSTSb8pgYeowicTN79e6Mj1w6ssr0s2jNT95QI4UFOlvt+UAlmJsYmqjGJPRAkk
	 DURFV3Cgl28uafC3INnT7R93p2gr3u3ir7E0FUyGUuNV+GZN13LmXiV4YXgga047fqg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793891522;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=NMveQ7/yT5IkErQUuJiGEeH/rHIZjVK+NolGDNiwJPU=;
	b=cikpmX/D+PEWzp4MeKFUhhcnfb0xXEQwcGIMH+KLtWp74kXy4AiQtV7yld4PBpYyXNUW
	 NHOODldQ1mt9P/4ASONbJHA8XB9PSmKjLR460Nlh+5gg4U2iuv/0z1fx6TsDQcviQ4UJA
	 3qHZyN+E4PgK/x2zyXob1HA1aHtLndRrLqLj5En6/jR1Y52tYQcWLcFpT8dbBiddfFFhg
	 ULAa9PBHU6Te6vEvoc+jdPQtrWCFV0kPlF1OkAMTe3+kPJeBnhvi+OTu05ENq0MNpwv/A
	 /X9jScWYNTSqBA1syqS4Xlnda5l+qZl2CIGzXpWe9JPCFjwU5diFffQdCENWDUPhLDg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="QjCI04V/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Uqrun6Ix;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28428606D822
	for <linux-media@vger.kernel.org>; Thu,  5 Nov 2026 15:12:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28428606D822
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QjCI04V/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Uqrun6Ix
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5EQlUt2006487
	for <linux-media@vger.kernel.org>; Thu, 5 Nov 2026 15:12:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NMveQ7/yT5IkErQUuJiGEeH/rHIZjVK+NolGDNiwJPU=; b=QjCI04V/kzMoCcbD
	nekpPVtwFjBdQ8hWq0FVWTb484XTF9yuHiaAljr4ep+hJeBVMXvndSz5iJKXpUGp
	iVzHuFmxS6SDeYx+HWPcxC4pTQpda1yhcKtzGXnpgRtxl0fJIPVxQGe9YVrKj8OY
	BQzvGgHzkiahBTxj9QltoX2/ghoV1QPB9PhoGkF+yivJR/5iTy20Nu1yI3DjAA5/
	S0tfGhtqMRNBzrycN8SL+aXDAp2hvFy0n236eH1fmfhl+mnaDs85Ofo/kQRHWkOY
	xuZB5Uor3dr/KUvYZLzV7JvLfFimGepBJxfUeXQJFTEnsexUC8/sCXKO4I+9DYkS
	PR2SUQ==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrqpd19pt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 05 Nov 2026 15:12:01 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-5641cd2cc13so2100867b6e.0
        for <linux-media@vger.kernel.org>; Thu, 05 Nov 2026 07:12:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793891520; cv=none;
        d=google.com; s=arc-20260327;
        b=j+o3sMkoHD7oETvrdMu/FeSit6RIahRGaEptZwt5hrC6f9QxtTkucAGk8uuDHmRBOo
         jhFQz1Mvp44BArbf/nLtDFKik/ajX2SVnXJVAuGiV1xKqfgVCjOreQ6gEo+v22OQvLJ+
         EFnQwnOIwRVjOsJzBBZ4ZnYJ3gCFmUFEL26WPeiAWVdPYFKuGlkO1AX7wLNMKA7wUWV5
         aJOGHFdWPm0l4XOCLW3thiAV6TtVCzw9Dr+r8G5LAXOqTXItxX7VRpIpv/7R1bly6RPG
         KzmsLdmtM5UR1opnnOG6HTtbotr2tFhB4AL0vzd3BfjRATL/J+vMhohFD3osLPAvlJt/
         CdFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NMveQ7/yT5IkErQUuJiGEeH/rHIZjVK+NolGDNiwJPU=;
        fh=BIoARsNRk/PK5HjStZZvOVR2uLzrJ5la8ODJpyLlFos=;
        b=bNVKpvmZhdm7N8+DYBxMLABnuwNvhfGHGNSSFLx3Z2/wwFC2CxFHNNX9Ce6KUBRj1/
         BHB3AGGT5SNIack9AjFrbpFbMeceTf+DC9hesR7+vntsLucz16OzNaIrtcMKdVJoKREH
         CDNp5/j2uC0PMOqcg7oEb1bBIGzs6DpAHE99tl2+9ENTAMXtCptpdO+TbxuNSnR/LHMx
         2Ch4NzXD+poxfu0cClW6nCRwWREzuJGqcRT/z5avzLy/Sz3NFN/TYFWADNFD8a629TFV
         LBCnZW6qPU4Jao7EBHlwVFL3D6vVAJOmnq/PijtatFT7LSfJSErsCJQuskqZxVGnB5TI
         SZmQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793891520; x=1794496320; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NMveQ7/yT5IkErQUuJiGEeH/rHIZjVK+NolGDNiwJPU=;
        b=Uqrun6IxhC8z82jKCS7j24xYh56LGmKUVLXynD92LSti3DFa6+gGmxY8xv1FiYapyf
         aEA1amQuEgrwJR/S/8yBpiva4oG70lnaT2QML/kbAcxMhRYzpqDLyvfEbJf69UtzBWl8
         ub9Cd8kkVccsQpPgDTkH64+sXNRCfyfJZy3La9x3wEzq9RY7OepdNE1D96Wqij+aoBgK
         C764rwdNPM46gln/DxznxBFNozVm8YFMcgQOrotb1uF6goMjxw5POBVKpsSkWXyuJHB9
         yA7izqCkDI5VeE8fAUgu45/mLFQc8ym6iZSSaEj/07/FnC808FJlIeKU9I+euz92kkge
         6VVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793891520; x=1794496320;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NMveQ7/yT5IkErQUuJiGEeH/rHIZjVK+NolGDNiwJPU=;
        b=OZlQ9YRXFuvCVLjgbDnLmujQ0v8EXT5g0t3QkG9eUxGK7mGJYAhvb+jvWaLHkOlwE6
         lK8D7CeKP3Mvi8bj1hOj5g4K/PenHOR2zR+ulaDCDQF+dq3DNu9dJquqptSIzR1iue8t
         UTrx2SYYE5fkg0LLzrqXMkO4F7N1c8FfhHzEHYyqMGG1+oCELKSYsq0wOQ+2DZq8g4h3
         LoY8aWsn13mVcGiFL6EREc8v74WO9Uebmz14U+uB5pozdaHz/A+yUl4LS/ZMtXOCj4bd
         S8AEgO9X0lWrYJyvFxodxNSHWkWpFKRrHWEppnplq0TvoUJcX4iIaz3mh2DspwhX1U3i
         X7qQ==
X-Gm-Message-State: APuU4Z+LjchkgYEuBf2JUzl+iB8f/0uW15HJSpuh45z3pywinjXmZmge
	g79zy7FLpwjqzq9ADq0MJZNJpR/QBZTrS4A71/ChcK4u2kVkBttF+q3VW0LFbHEa1fZnG57/N/S
	PnxGPHlA5rL7/942NH4iXaVQvTeWyu1Kb/Drlch4zyvnneOJKbuVDysEwxoVJUenqS10Vw2IzFb
	UKYAbGxHq+SFrT0sjYcI3qcNuESxJNjrTdatSOB9d7M1lBN2sFlRA=
X-Gm-Gg: AYBFou0ad8t/z38SG2e9emLTAUV10fB3CMu4C2PL6LApkZRXwxHK0Eda8ZsIv3y3zM7
	zWOzDBpXd511O7HqQG21P7NzCEWKFHWi7UOW+qstzgNFD+jFBhwKXQpmtAH8203J8iGoFWGwDP7
	vS/H0eJiEN/070z4lM64G7GoC9RHccMu8oioXpMGCFwcasxe4BZ/BA0y4S/TKP+VbhX//6wkZql
	t6qJgHb/XL0+2z6WQhr5zoUn5nDwNSBC52BK4IfHiRCbtXhuRXhtoNG8lTGVXdB9Ah3RiYNTFs=
X-Received: by 2002:a05:6808:3206:b0:522:1ac7:a573 with SMTP id 5614622812f47-5640dddbb38mr15160684b6e.43.1793891520399;
        Thu, 05 Nov 2026 07:12:00 -0800 (PST)
X-Received: by 2002:a05:6808:3206:b0:522:1ac7:a573 with SMTP id
 5614622812f47-5640dddbb38mr15160662b6e.43.1793891519949; Thu, 05 Nov 2026
 07:11:59 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105-camss-fix-dma-v1-1-74e9ec56e518@oss.qualcomm.com>
In-Reply-To: <20261105-camss-fix-dma-v1-1-74e9ec56e518@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 16:11:48 +0100
X-Gm-Features: AclHuK88d_-DIiFJPT3VE6CsjWU_UolOKHe_xA6uaq4HpdexcKU8842YSMzPGiI
Message-ID: <CAFEp6-3yTi8tnoO_W_2pZZds03qL1TMVX2S3H2xbU=LALtgy5A@mail.gmail.com>
Subject: Re: [PATCH] media: qcom: camss: Use contiguous DMA buffers
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Todor Tomov <todor.too@gmail.com>, Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Allan Siriani <allan@fatecpompeia.edu.br>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA2MCBTYWx0ZWRfXxlSPhyGpfCID
 JcYflqJpgcB88XNAvYxNsxMbZ0YHKzTbqZig16eEOpT0H7zE/N6qyu6yF5kK3DC78dheSkJX9f2
 6ga4vZM+nkQJKTd1Dq9sjryjBeHUue4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA2MCBTYWx0ZWRfX2OJ2FOYk0uza
 vR1tOxX4VNvMgoVMhMlLPaX+eX1/8FG1LsUFmyX26PO7XFSR9wAz6TK+7Ax2JA2IB32S2G3laI8
 KwmJFwSPTl3Gsa1RLQWQlwQV0IgPBusAm+lmArK/+RfXHtrgp37uoVGdbnmvVu3zcU+qBhHHQS+
 rvytMTB+hzYt1r2+tBswRs0B0MK76TtVscvNmra0Glz/gMLEsBvSQYveXzz+fld8o57hT4r/NrX
 /H+TBI9uuX4pfq8UsJVR5kg9nW3A3FYmWlAiXBkKkTG+jZKBxX0/uGXfArY8X+DCSA5gVq74/Vw
 psLcQ2FTAaKD6aUivdNMlwjBqQHicT4nT6hOCuXpgCVTxGOT01cfudSTHHfOOH/baLmia4EIUzm
 s/X6A537U0ELTPiCXo0w2YKxwsvpb2GGR03U0g2um8TrIidnqtXR6TXc/h2rvrEGtQzwAdRcCek
 WzFZBWSCWUKuoHwKq/Q==
X-Proofpoint-ORIG-GUID: ICpxoawtvg-7F0HrcY38ziVPXmbiQB_V
X-Proofpoint-GUID: ICpxoawtvg-7F0HrcY38ziVPXmbiQB_V
X-Authority-Analysis: v=2.4 cv=Y5JtIReN c=1 sm=1 tr=0 ts=6aec9cc1 cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=i_ZfCgqcnrk0lUYW26IA:9 a=QEXdDO2ut3YA:10 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_04,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050060

On Thu, Nov 5, 2026 at 4:08=E2=80=AFPM Loic Poulain
<loic.poulain@oss.qualcomm.com> wrote:
>
> The VFE write masters are programmed with a single base address per
> plane and then write the whole plane from there. video_buf_init() took
> that address from sg_dma_address() of the first scatterlist entry of a
> vb2_dma_sg buffer, which is only correct when the whole plane is mapped
> as one contiguous range in the device address space.
>
> Neither the driver nor the hardware can handle a plane split across
> several DMA segments, so scatter-gather buffers were never really
> supported here. The issue stayed dormant because vb2_dma_sg gives no
> IOVA contiguity guarantee but still tries hard to keep the number of
> segments low, and with an IOMMU dma_map_sgtable() usually maps the
> whole table into a single IOVA range. The mapping therefore almost
> always came back contiguous in the device address space, so reading
> only the first entry happened to work.
>
> Where that does not hold, the write master runs past the first segment
> and writes the rest of the frame into memory belonging to someone else.
>
> This recently surfaced as patch proposals enforcing contiguity in
> camss itself, walking the scatterlist to verify that the DMA segments
> follow each other, which amounts to re-implementing what the dma-contig
> framework already provides.
>
> Use vb2_dma_contig instead. It guarantees that each plane is mapped as
> a single contiguous range in the device address space, one IOVA range
> when an IOMMU is present, physically contiguous memory when there is
> none.
>
> Fixes: 0ac2586c410f ("media: camss: Add files which handle the video devi=
ce nodes")
> Reported-by: Allan Siriani <allan@fatecpompeia.edu.br>
> Link: https://lore.kernel.org/all/20261104202313.72494-2-allan@fatecpompe=
ia.edu.br/

Feel free to review either this version or the one Allan plans to
send. The main goal here is to provide additional context and
rationale for the requested change, rather than to get ahead of
another revision of the patch.

Regards,
Loic

> ---
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/camss/Kconfig       |  2 +-
>  drivers/media/platform/qcom/camss/camss-video.c | 14 ++++----------
>  2 files changed, 5 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/Kconfig b/drivers/media/pl=
atform/qcom/camss/Kconfig
> index b51745c942c9fd71a95d09993213bde4b7e877e2..e1967bc20cf03ea1b0b159c51=
75294eeb40fe1c1 100644
> --- a/drivers/media/platform/qcom/camss/Kconfig
> +++ b/drivers/media/platform/qcom/camss/Kconfig
> @@ -5,7 +5,7 @@ config VIDEO_QCOM_CAMSS
>         depends on (ARCH_QCOM && IOMMU_DMA) || COMPILE_TEST
>         select MEDIA_CONTROLLER
>         select VIDEO_V4L2_SUBDEV_API
> -       select VIDEOBUF2_DMA_SG
> +       select VIDEOBUF2_DMA_CONTIG
>         select V4L2_FWNODE
>         select GENERIC_PHY
>         imply PHY_QCOM_MIPI_CSI2
> diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/me=
dia/platform/qcom/camss/camss-video.c
> index 0852eb6f13154cfae7147ce39d22de64d14a5cba..5de6ff5ecc76a2863e536fca1=
c40ae6b2de6dc0c 100644
> --- a/drivers/media/platform/qcom/camss/camss-video.c
> +++ b/drivers/media/platform/qcom/camss/camss-video.c
> @@ -13,7 +13,7 @@
>  #include <media/v4l2-device.h>
>  #include <media/v4l2-ioctl.h>
>  #include <media/v4l2-mc.h>
> -#include <media/videobuf2-dma-sg.h>
> +#include <media/videobuf2-dma-contig.h>
>
>  #include "camss-video.h"
>  #include "camss.h"
> @@ -154,16 +154,10 @@ static int video_buf_init(struct vb2_buffer *vb)
>                                                    vb);
>         const struct v4l2_pix_format_mplane *format =3D
>                                                 &video->active_fmt.fmt.pi=
x_mp;
> -       struct sg_table *sgt;
>         unsigned int i;
>
> -       for (i =3D 0; i < format->num_planes; i++) {
> -               sgt =3D vb2_dma_sg_plane_desc(vb, i);
> -               if (!sgt)
> -                       return -EFAULT;
> -
> -               buffer->addr[i] =3D sg_dma_address(sgt->sgl);
> -       }
> +       for (i =3D 0; i < format->num_planes; i++)
> +               buffer->addr[i] =3D vb2_dma_contig_plane_dma_addr(vb, i);
>
>         if (format->pixelformat =3D=3D V4L2_PIX_FMT_NV12 ||
>                         format->pixelformat =3D=3D V4L2_PIX_FMT_NV21 ||
> @@ -699,7 +693,7 @@ int msm_video_register(struct camss_video *video, str=
uct v4l2_device *v4l2_dev,
>
>         q =3D &video->vb2_q;
>         q->drv_priv =3D video;
> -       q->mem_ops =3D &vb2_dma_sg_memops;
> +       q->mem_ops =3D &vb2_dma_contig_memops;
>         q->ops =3D &msm_video_vb2_q_ops;
>         q->type =3D V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
>         q->io_modes =3D VB2_DMABUF | VB2_MMAP | VB2_READ;
>
> ---
> base-commit: 8b7179210b22f8e48a82c5ceacb9d56a9c4cfec4
> change-id: 20261105-camss-fix-dma-c32288664dd2
>
> Best regards,
> --
> Loic Poulain <loic.poulain@oss.qualcomm.com>
>
