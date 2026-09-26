Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD0936165E
	for <linux-media@vger.kernel.org>; Sat, 26 Sep 2026 18:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790448042; cv=pass; b=qNtMeRFKgLHKeUnvy/S6GBCutWgrLT66/15KmIbHUeHwQpvqzgFiDpjzDXzzhwTR+Xu8cMbqmAaRoLK+QvqJwc9vIa+hj4SqwqJBoqCA4EX5rlzaSRL7RsdG7x4ipfE1dp92SC2kJea3UzxBbpabx3Pa4qklYEKxBaf0Xwy6Hi8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790448042; c=relaxed/simple;
	bh=M3nlaT3i7/r69WEHgeWcSxub1p1lj3ONSOirpahJcBI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ND1eWqFLX0OKP/wU+Bt8Zyaxgk04/XYmZTNc4JYSKx2Q1fkj1OGqRXgOJKG6SxSUSmJNBjv0K1+ZXfFrkjEbuChYEL+K4V+xr4z9QhIa6unNhlq+Ws3ijXCkz6cdjw+a2wU/8NODrVj+v8HWQ+IkSJgtbTfVcCDWBQQzmXRkY50=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gTVklCbL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z0P8pxQj; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gTVklCbL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z0P8pxQj"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68QGxQL83167929
	for <linux-media@vger.kernel.org>; Sat, 26 Sep 2026 18:40:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=YDMsqZuuxwsgxKD8S0rjlnvTctu70wqMTJY40/NHwEE=; b=gT
	VklCbLGlsR8PPgLyl9EewSUX+gASolwObCNZrmi2lje0j7Wsezgk9/3vYoPbR2tr
	WYTvbP4Pvl6AOrTnmwSWuIyEvUAIqGUHC2uBzwAssVg1Tczc21eLWUrhTQEj/LvJ
	ijNtU+D+Q4u2SmHcaAXm7Bpjj6aoM/gf/9fYmqN1X+nRYoPn5NI3JE9tGM7i1dFS
	uv/AcW7t1WXQS5tk5ts0XB/YLBRjGpCaE1+4E1B5bGPSykVyxIiI56FsX6PK4r8O
	zmrOwgFb4vW+A1w60cX8fU5awfqi+S6kKtUuHvEBlWhjfrtCsbZdgtdjYJXgmnwj
	rw4PO3AUGXOg8tTY3X1w==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx77jsddr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 26 Sep 2026 18:40:39 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-46dade0d7cdso2309160fac.1
        for <linux-media@vger.kernel.org>; Sat, 26 Sep 2026 11:40:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790448039; cv=none;
        d=google.com; s=arc-20260327;
        b=JuhnvGzW1LQzpjcSUzKubmHOA17J1vDh6X7gTripsPnceyd72uZcx5xd9Sr9xc7c3n
         M+DC5Tb3p78SxeAEbtWw1aK+XvLq2GG+2YILxIEoItm3CLmtD2znmtoVhtjRIT35q77B
         Uu2RTOq4TK7MOiM0SFC3pDi6Zc04hhRfELt9COM4wOVxqeVJ1sQRDJks5xQCjn4bIEE6
         ESsyMCmhV0PnWlMFoqCWj0OybVKOuRwtc4uC/vwCgkJ2cxjwvvRtS7cHmHChIPYc0wBj
         lFIMPf8pPTr14Mo0xRP5yodNxGZR0IKxUgA8Wd0pWHm5wM6n1CAr3Kl+mUOk9cDnbY7g
         tfYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=YDMsqZuuxwsgxKD8S0rjlnvTctu70wqMTJY40/NHwEE=;
        fh=lRkId/rnF+0G8a5KCblOfKN8r3NuPT6atv4adU5Z6Tk=;
        b=S8SvdszLItB+2OfrXWV7IlgyYZJI1Q7IAmpHiPysHcqZB1qt8Nj8ixLeVvt8Q6Sy9O
         ly/MFKuNq3bUjF7iOh4+VRGRrndLOs2/syUAtZtE2g5wOWQh5I0cV4YSn5g2GxfTOsXH
         t22KTitwAjPmvmr2KUNqht91Kwjgn5OqYJjfPI98T2UOhpToYy/u/rShtITUNywQY49P
         /ZtuyUCVWGbaMXWppzOHCrUI4k166d8vrWYV7gl5fwtbG1JaE5qit0gtm58EU9pCsn7H
         OjzMnp3AlVERcEenNKeHkzcpir6sBHtSZrFU6yF8elSND2yBV5j9iIjc2SSMtI3i5vuv
         9c4w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790448039; x=1791052839; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YDMsqZuuxwsgxKD8S0rjlnvTctu70wqMTJY40/NHwEE=;
        b=Z0P8pxQj07Q0eU89tIDWxmP/hhURy89ZLXGMJluie4qRG925jxODHTDizYhGaX/y5d
         pREXhH4v9+8vYCsz0ME/WosaHjTr9uqljQf1gQrki3nPwNggugfDTz0F6rGUumvX5jl2
         bLLX1efv4uaKNVIFzcuWdyZcBB2uJkuFYuxJyoy6z+22DL6inTnDP9ag3usj7wzOh7Jg
         doi64JY1A+eDcoJ0bCQxgn3TSxvrX/DjV2eb7AxzRq2n/q0xF1iM5kNnzpIV1wLXtfX7
         gRcygto1ptDBiN6zscVFnVNx9QMUqvxfprAwY2CTwoZT5y/IXa3fstQfkbt03KeK8s3K
         JIew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790448039; x=1791052839;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YDMsqZuuxwsgxKD8S0rjlnvTctu70wqMTJY40/NHwEE=;
        b=wTfEy6RFvbUtjgfgvsgTb10hnwspp87g8w05HKeOuM/2sP/dFSS+AcdZRM2LCrzOkO
         o2uy5Xe6of+sg/51FKK+wW9irci+LiYyLq3x3PqoD+E/FCDf/DOuLWPGWC+JT6E2U/8h
         XwKvYQ6Z9nprh+o6gxaYT1oz6lCMfw/Jmw17gZIEmbRvsaL0baMWVqMHsmZHXypXOLxE
         uN/+OA90edpNLNBf9JBBVuTKZ4z1u63Ha/b5iY9Jxexo//WyOUpdXICdiDHFlv2KTg4h
         Abi98NzhZ5tjVskHSsRBxRP1ZRUmAc2zBhlycGqZEKWiDrJrsra1SSGksB6OJEN3Z6Fy
         Dgtw==
X-Forwarded-Encrypted: i=1; AKwUvBwc+RkpFs0lP104udcyQzr8QGlAd4sNqHJYgQRnMH4R98w/EM8NHuy3nPK6xk8cvVuZScIqkYQ5QQAbGw==@vger.kernel.org
X-Gm-Message-State: AFq9FYLpgBmOtFEF9guHTZJ02oWNCvuq/PMiqgwNoaefN393qt0Z3kjV
	ScNagc6743kaR7UsQ3EAuMFsUUPI1E2MwtQ+or5Wn9Lcby8h7Vivwo3Q5oT1iZerJAdmBRNfxmy
	t2UVNPv5/DONCorwVACKppZMtNqxOPod0Gqsf4ohvXdYl6pEnFWJrAUN1wN+nuXUQO5JZh8oLAZ
	Ed+ATh/yrqOq4HpIaOCuT10JaNXCiNYW7DLWtN/g2Q
X-Gm-Gg: AYBFou0W2NOKvDSyugviGB/JZOedd8bWNK7s4jRJt6X4GU0ObkAoUDKv3Ox7SXqAdtx
	iJLK/7KivlNdJRMU74aJfRExuvASxsiyNNv3u8cKn2cU/P+PZ/5yBkn7UwKGjg9vLqoLOQ4dW3J
	l9oGQBSPAGuyx3SqK6fztS5jz2x5iiXCL+hC4bGN8Yq0SwyheSZvGQm3Dz
X-Received: by 2002:a05:6870:658f:b0:490:ccdf:1931 with SMTP id 586e51a60fabf-491e79675e6mr7629108fac.55.1790448038808;
        Sat, 26 Sep 2026 11:40:38 -0700 (PDT)
X-Received: by 2002:a05:6870:658f:b0:490:ccdf:1931 with SMTP id
 586e51a60fabf-491e79675e6mr7629097fac.55.1790448038374; Sat, 26 Sep 2026
 11:40:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260926022026.10539-1-liujianfeng1994@gmail.com>
In-Reply-To: <20260926022026.10539-1-liujianfeng1994@gmail.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Sat, 26 Sep 2026 11:40:27 -0700
X-Gm-Features: AclHuK8ym8-acg312rqWr-pMv-9ORiLGe39RqXxyk_EMaZQOc4Be3_B5fffQ3PQ
Message-ID: <CACSVV00iE210xVONVT+XpuqmCn6E_RBrtBW2KkAB5YRP5DuZiA@mail.gmail.com>
Subject: Re: [PATCH] Revert "dma-buf: Make DMABUF_DEBUG default to y on
 DEBUG_KERNEL kernels"
To: Jianfeng Liu <liujianfeng1994@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        "Bryan O'Donoghue" <bod.linux@nxsw.ie>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Karl Mehltretter <kmehltretter@gmail.com>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI2MDA3NCBTYWx0ZWRfX0j5LAITLOqbN
 yKnuUwjK/jQAYzpuXBhq9SrRypmQES6Eqwjvf1hSN6ZQ+GAdo18FgOdM8wFp3tWdDhA5xnBchhR
 QVmNJhIdhIIGV8pT4MB1Rh7lKifZhhs=
X-Proofpoint-GUID: le81Sxwgd_sZskdli5j2PQyPBHhWDqDm
X-Proofpoint-ORIG-GUID: le81Sxwgd_sZskdli5j2PQyPBHhWDqDm
X-Authority-Analysis: v=2.4 cv=J8U/fwnS c=1 sm=1 tr=0 ts=6ab811a7 cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=zd2uoN0lAAAA:8 a=KKAkSRfTAAAA:8 a=tFjpUJO89rSOa1QXy2UA:9
 a=QEXdDO2ut3YA:10 a=1zu1i0D7hVQfj8NKfPKu:22 a=Vxmtnl_E_bksehYqCbjh:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI2MDA3NCBTYWx0ZWRfXxWNvHVe6xdHU
 35VZyhft2UBFgMRhr7d0foGtqKHII7yGKZSlyszx/V0nqgxzm2zYlcDb210GAoDXy3HdmP+1ZEb
 fFYPsnHtmSraJghS8rKs+eKPY5v5VmMSnnvMYSiik2KCFcA8OFhhDOMJIvbukYnB0cmagjKKydy
 ojjF7S4Eqw1WduPAtBOTlaw6MDVB9Dh0HbFqirf3AvbAS4IBQ7xTMjh0Qj9r5CTL7IC4jhhV2n7
 KYnE3OTwvnkw/+oggEevwAdSFnKEM3JfuCC88OmBu4NLScAwUFy7Ax1zgIHUcX05Mi/fZ6//4aE
 /u3U6rSfWYy//cBZKw9XvaRC25Cbg5VI3KtKe0xg5IkrTTTYV0tLp9cvDvJFNG/qgWGt6oAWq/z
 tQBo0YRFJkQMiTqpMBarTw+dxDEKDcjRdmsYipeBmojsMrm7kyl4L1hk7VsQ/JZ1t0tUgVpNV5o
 MP0LdrfDf8r0IeD0RKQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609260074

On Fri, Sep 25, 2026 at 7:20=E2=80=AFPM Jianfeng Liu <liujianfeng1994@gmail=
.com> wrote:
>
> This reverts commit 143755bdabaa96776c24f878014608e9cb44f930.
>
> That commit fixed a dangling reference in the DMABUF_DEBUG default
> and thereby enabled the option - and with it the page-stripping
> sg_table wrapper that dma_buf_map_attachment() hands to importers -
> on every kernel with DEBUG_KERNEL=3Dy, i.e. virtually every distro
> kernel.
>
> drm/msm is broken by the wrapper.  Both of msm's map paths consume
> sg->length and sg_phys() of the attachment sg_table:
> msm_iommu_pagetable_map() for the per-process GPU pagetables, and
> iommu_map_sg() (via iommu_map_sgtable()) for scanout.  The wrapper
> zeroes sg->length and strips the page pointers, so mappings of
> imported dma-bufs silently map nothing, and userspace observes
> arm-smmu translation faults from UCHE, e.g. during hardware video
> decode (clapper, chromium) on Adreno systems:
>
>   gpu fault: ttbr0=3D000000088a889000 iova=3D000000010741c000 dir=3DREAD
>   type=3DTRANSLATION source=3DUCHE
>
> Bisected on a Snapdragon X1E78100 laptop as v7.3-rc3 good,
> v7.3-rc4 bad, culprit 143755bdabaa9.
>
> Switching msm to sg_dma_address()/sg_dma_len() is not a trivial fix
> either: those fields are only valid for sg_tables that msm has
> dma-mapped itself, which native non-MSM_BO_WC objects' sg_tables
> are not, so the conversion needs more work.  The msm maintainer has
> therefore requested restoring the previous default for v7.3, to be
> revisited once msm no longer consumes struct page and sg->length of
> imported sg_tables.

I sent a series[1] to remove the remaining (direct) use of pages for
imported dma-bufs, and remove use of drm_prime_sg_to_page_array() (so
one less caller of the deprecated function).

This on its own won't solve the problems with CONFIG_DMABUF_DEBUG.
There is still the indirect dependency on pages when mapping sgt's.  I
won't have time to work on that until after XDC, so it won't be a v7.3
thing, and _probably_ won't be a v7.4 thing at this point.  But
hopefully I can come up with something for v7.5.  Until then, please
apply this revert.

BR,
-R

[1] https://patchwork.freedesktop.org/series/175045/

> Link: https://lore.kernel.org/linux-arm-msm/20260923074256.9357-1-liujian=
feng1994@gmail.com/
> Suggested-by: Rob Clark <robin.clark@oss.qualcomm.com>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: Karl Mehltretter <kmehltretter@gmail.com>
>
> Signed-off-by: Jianfeng Liu <liujianfeng1994@gmail.com>
> ---
>
>  drivers/dma-buf/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/dma-buf/Kconfig b/drivers/dma-buf/Kconfig
> index e4f078a326a41..7efc0f0d07126 100644
> --- a/drivers/dma-buf/Kconfig
> +++ b/drivers/dma-buf/Kconfig
> @@ -43,7 +43,7 @@ config UDMABUF
>  config DMABUF_DEBUG
>         bool "DMA-BUF debug checks"
>         depends on DMA_SHARED_BUFFER
> -       default y if DEBUG_KERNEL
> +       default y if DEBUG
>         help
>           This option enables additional checks for DMA-BUF importers and
>           exporters. Specifically it validates that importers do not peek=
 at the
> ---
> base-commit: 93f51579e7df248780214094418f205253383cc5
> branch: revert-dmabuf-debug-for-7.3
>
> --
> 2.47.3
>
