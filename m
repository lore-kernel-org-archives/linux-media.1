Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43D644A7CBA
	for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 11:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790594519; cv=pass; b=lUxH/8Eky//TJAY+LQ9k69nyet/C04VQP5OxcWpalWUHmtFIFNIO7scawFHBNdfMm+8OyNHj3V3o+f3pSGi0etbKWMShrM3334ctPqNQ4jCVofOE8kXzi8WDZ8AY7me3pN2vxc1mLOxrgVDIprlSS1vtMp8taHCVeAWYbUjho3w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790594519; c=relaxed/simple;
	bh=Ocd9zXXDgFZ+AJQPS0jBNgJx6ox6aU5Dl7QmVCaZbwo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cFzJiCiDrHTGfMvsX6WgiFTW8fg0t2hhV5c0sJDJYFhGh6ZbGiv9v/5zk1reHDqjlHFMUNMrCvn+SNQ4XTmFB6YAURSeNZlzyEolsi4ACrtt03Er2OaO4lKvTejg1YRkRGTTPs/2knSA1NjOup/KV6jwBxHDm6QcbkEOZMGVUDk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ce7c9O47; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JToNP96K; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ce7c9O47";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JToNP96K"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SBAMji2294758
	for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 11:21:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=vEol6TW939SVBwS2LYfyS9kRHzntWvKw1rsJmaCbjOQ=; b=ce
	7c9O47R9GFrf2ufQeGLAslfvXpcTqCG+8Hf7/gz0tgFPwUvUitVHwn2oG2jcRdVX
	P1yBiO91/Co8apRbEwazCRUPcXwmK6ohEvpMijxp/dzEg3r2EXLB5MKVYyDiWb16
	0kszagorsBZDn/qVYBsknXcitxsksB2PK5Rj0WCz8n9oNTIM9aIxs/leeOCOnPcK
	clzHlmw0xoyYrXmCKkggJZsN1tBvBu2J6Ye08K5HJ68WzwVJUyjveY/9mOjV6hKb
	NZcxyUsBdrvhYK8fID8WeCx6wZB7I4TBCwZCt/e/mcf+4Ufb7NWS5Fxhyrx2kwBD
	AoRJBJnrPHzdXRETckZg==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyhubh9q5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 11:21:53 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-817f33fa37fso5571620a34.0
        for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 04:21:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790594513; cv=none;
        d=google.com; s=arc-20260327;
        b=UQzxSbzExi+xNqGdPS6ALsTiRxlTOrB8tkYCTucrXtOZ4O95H/6lBMllh+nybOhDkE
         HilP6xoYf3mi06J4WQpCbwBd46dj9vq3h0ghMtlhV4BZ4689ZXWY9d3evrfREgo0kq7f
         UQnRJCLBDghv8fzBdfI1MMFKRt3mN/y3QnzNPtYZhF75kZjJcz0Os0LTv1gkVGc8yjZ+
         N3H68XneoZ8t9R2dCQV6/ufI1m9B1vyIU/RstucN6th/gsUVf37gLyD+NJmECjhLSBi4
         WKZvr2Pra3LnXmBIwWntBXCuxcTigUQQDKRJbPHotwvBcjAP6WfVdmCbFgqorQBDpjuk
         uM8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=vEol6TW939SVBwS2LYfyS9kRHzntWvKw1rsJmaCbjOQ=;
        fh=59Z1ccUppGjHovPIOU6ydS1ASs1XLdBb+Kcl8ZMtnA4=;
        b=oMmZh0geaYwFK/wnqrTkOOLTfTiR2jErma1IBGyWDqqUDch43jxcGQSvifTcx2rx38
         YjsNGrHTuqhCZDTHucSE47TMMAkYE+pZtwlI9Gy973O83zOMaMWhaSyAtafHJawmpafe
         U/DGrQA8Qw82tCZTLD67/ehIBqeeXIgbBTaSESAnwgKdaVeQUnxvC6TxBSNgmFzelzZb
         W9pzaL0idGCRwZobPHP8nTCyDMJbaxE/Wqp7rkIPlW9kp6QrRTHAKyYUR+DFTUqLYkfL
         On96LjjlHzwvSvctmLyBLrIu008ke3aPZ0sc3/reD+u1CBD8f3v5YLu6CiXdSv0WR5B/
         JQiA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790594513; x=1791199313; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vEol6TW939SVBwS2LYfyS9kRHzntWvKw1rsJmaCbjOQ=;
        b=JToNP96KhFdTw3mOwrNg52zSHijm2vE3xckBuk3H+toWAbyafZU0FnR/EQxDExVSPU
         kksozqz33ok7Hml+wLchCaKk9BiSlIYDnV3max5sAPc02oTXN7EQEjosfUhwwuXt5ggZ
         xXFG4Ewwif23hZao13+WkFK+lvm5sb0ZOzniBCFRe6XJOQ+b4LkXFPDYjjHhwxhUyw6O
         MJStz7vR15Fn8viDI9gKeMF0oeBggmvg3JH2vEToDkz/ClzWyrHwmozt2z6kxCGXGBwc
         IBkIkU0zuiT214pEdj01qHVfUolMZ88g2kEcz0UED33LuiyWLALaSBsziFSRGw0XbPLT
         PuoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790594513; x=1791199313;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vEol6TW939SVBwS2LYfyS9kRHzntWvKw1rsJmaCbjOQ=;
        b=e3cKGGSqbEKM4VjAF+SkXin5LU5HzD34b87OZ1KaFyugPp4QFcPHgNodbvLiaB+nR5
         b2ZFA/usA8fqlz0B+FAMo9eAjGk1WTjW/wWsyFFlvx7w+Gyz88ffcW2QeRbC2k0oaavp
         EP9ArT6S/MlGIRBthaZJbGkdxlB9nUcwToC+4NwQEGbGjIAqCjsT+YnNq74M4qhS8w+G
         CBfE6bUSfghcuIAqTA9CzXmRKAQTrm68uRaJENSRmcv45Y6D6ZBZSwSIZZ5sMDQjZoq7
         sGYf9256oS4b1jZg1jutvZCUduZDVVLpK3V7aIrpI/7l1VYSa99PzOP4GiqROzVs/v2g
         5WZw==
X-Forwarded-Encrypted: i=1; AKwUvBzeWL7l9ikKXRdNrveSSX2l1/wQ3UQv5pUBqnq14mTkvOlX81ZE1Bw9hVr3NYQ6R+mk0vzNZQunEiDCNQ==@vger.kernel.org
X-Gm-Message-State: AFuF++lJ25lMWNjLz+/R5teYSZyiYOVtYDb38P9AuYfksBIQFIHSYYk6
	AlNsTVMsvSVQB2NFZRwVTPg9NOfQf/joj/u+i7fyw5OD7CQ32pjIzjbbgHR4cT/5b5xbia0Wq+o
	FZXT5hglev1ehK8sRJ//iQLJwExiXESSch5Wl4Omfj6/8LhFIuM7tbnLNAw9TsD7UHSNraazSyw
	3q19MBQ9jI3y16TRpJYPJMg+n9FACS8fD+dP4r+rPB
X-Gm-Gg: AYBFou0GgAWtBdeOPcYkuhNJjuhMLmUmi+ztBJM9UvVOOob1QRBq39EBzjVoXHQwhPJ
	nFVfVapR2HrYRbQdOaC1Vm7CVtkh2CuT7AObPrbbAfcvCV/mySw669Q9ab6yGyTpMJgdvQFKNo/
	qTZiGKFh5CJM870YqlWg04uaVxBCHu8lzvmLd9uuhC/pDHulHe2Mhx724a
X-Received: by 2002:a05:6820:859b:10b0:6d7:4142:8b78 with SMTP id 006d021491bc7-6d741428fe0mr3459525eaf.6.1790594512828;
        Mon, 28 Sep 2026 04:21:52 -0700 (PDT)
X-Received: by 2002:a05:6820:859b:10b0:6d7:4142:8b78 with SMTP id
 006d021491bc7-6d741428fe0mr3459516eaf.6.1790594512410; Mon, 28 Sep 2026
 04:21:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260926022026.10539-1-liujianfeng1994@gmail.com>
 <17bf71c6-2442-4eaa-847d-29ef625870bd@amd.com> <CACSVV02WCQwQy9BpUUqziQTtKV7QyJruiM+iTiLE_SEVKtpVNQ@mail.gmail.com>
 <50a9c1f1-6889-4bd5-b4f7-0500d30d3dd9@amd.com>
In-Reply-To: <50a9c1f1-6889-4bd5-b4f7-0500d30d3dd9@amd.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 04:21:41 -0700
X-Gm-Features: AclHuK_NwDQDsbrMuZGC8NlkccTPkeI6CyUHvdugPvoIb7ACoIyYXlrPqpyu7j4
Message-ID: <CACSVV02BPHGeGFo0vs8-Q2JvcvQ_gw_xe4kZj_nuzk8n6sW7kg@mail.gmail.com>
Subject: Re: [PATCH] Revert "dma-buf: Make DMABUF_DEBUG default to y on
 DEBUG_KERNEL kernels"
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Jianfeng Liu <liujianfeng1994@gmail.com>, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sumit Semwal <sumit.semwal@linaro.org>,
        "Bryan O'Donoghue" <bod.linux@nxsw.ie>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Karl Mehltretter <kmehltretter@gmail.com>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: 07snAj4SittLqRom-aQk6IChJcmeU7yj
X-Authority-Analysis: v=2.4 cv=C7F8WgP+ c=1 sm=1 tr=0 ts=6aba4dd1 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=zd2uoN0lAAAA:8
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=jDRU7hdYw16n41J9DU8A:9 a=QEXdDO2ut3YA:10
 a=EyFUmsFV_t8cxB2kMr4A:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 07snAj4SittLqRom-aQk6IChJcmeU7yj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA0NSBTYWx0ZWRfX53O44vVR15Lb
 iOMfxaCa85ZDVGqSuXaZcYcMcdotqUlBLaAamNcSsAdEoIqFC1PxJZhri4iGj0oyQ8/JuZZ8ZGn
 Bh7HEPVOho0A1tcBv2H0ynxgsTNdVTq849ahb+OLKxUbBg1e8yYYRtHz3dBV4NzQ/hj/UCRIDzB
 /5YrjmmqyTrziYov1gr9wHilvMhtPNNJR5zqah7NNQNSC6z3uF5fTsT/RC0yxJvm0H8Kv3fqLqW
 dwssnXm3IrOWcNgldM+DgEA1eHy3OX9/k4BAF3qSBsBGd1bp3W9TKuxSSaBKp0q8mySD6LcR47c
 xLF1ZNcnYMyXMS/nv4o4ygVHg2vgG1XbD2+ElYfP52kwl71GDFVeshJp/N1JgcDb3Yd1G5kb1Wa
 xnG3dZcktd+XKKsVVXZq96DmiD/8uJwHcn3TvOz6u+GOqQ4ps8gwTFZZ2ydKojN8lcKzJDfBYVV
 2azMf/KxAFlu1EfpNRA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA0NSBTYWx0ZWRfXzjD/Aq6o6oU6
 1RfE1lQp++6fko/Eo6ZuuqIjcE4lCvS5pKQoCqt8a7EeWu+tupdlFavbAnKJGPg6DDh3FCaR+wD
 xo+EakQMRKPFaBbs4vd50EBF7aILMZE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 adultscore=0 suspectscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280045

On Mon, Sep 28, 2026 at 3:48=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> On 9/28/26 12:36, Rob Clark wrote:
> > On Mon, Sep 28, 2026 at 1:19=E2=80=AFAM Christian K=C3=B6nig
> > <christian.koenig@amd.com> wrote:
> >>
> >> On 9/26/26 04:20, Jianfeng Liu wrote:
> >>> That commit fixed a dangling reference in the DMABUF_DEBUG default
> >>> and thereby enabled the option - and with it the page-stripping
> >>> sg_table wrapper that dma_buf_map_attachment() hands to importers -
> >>> on every kernel with DEBUG_KERNEL=3Dy, i.e. virtually every distro
> >>> kernel.
> >>>
> >>> drm/msm is broken by the wrapper.  Both of msm's map paths consume
> >>> sg->length and sg_phys() of the attachment sg_table:
> >>> msm_iommu_pagetable_map() for the per-process GPU pagetables, and
> >>> iommu_map_sg() (via iommu_map_sgtable()) for scanout.  The wrapper
> >>> zeroes sg->length and strips the page pointers, so mappings of
> >>> imported dma-bufs silently map nothing, and userspace observes
> >>> arm-smmu translation faults from UCHE, e.g. during hardware video
> >>> decode (clapper, chromium) on Adreno systems:
> >>>
> >>>   gpu fault: ttbr0=3D000000088a889000 iova=3D000000010741c000 dir=3DR=
EAD
> >>>   type=3DTRANSLATION source=3DUCHE
> >>>
> >>> Bisected on a Snapdragon X1E78100 laptop as v7.3-rc3 good,
> >>> v7.3-rc4 bad, culprit 143755bdabaa9.
> >>>
> >>> Switching msm to sg_dma_address()/sg_dma_len() is not a trivial fix
> >>> either: those fields are only valid for sg_tables that msm has
> >>> dma-mapped itself, which native non-MSM_BO_WC objects' sg_tables
> >>> are not, so the conversion needs more work.  The msm maintainer has
> >>> therefore requested restoring the previous default for v7.3, to be
> >>> revisited once msm no longer consumes struct page and sg->length of
> >>> imported sg_tables.
> >>
> >> Yeah as I said before the problematic part is MSM here. We have enforc=
ed correct driver behavior for over 5 years now when that option is enabled=
.
> >
> > The problem is bigger than MSM here
>
> Well, so far I have only heard about MSM.
>
> But yes I mean the config option is doing exactly what it is supposed to =
do, pointing out when driver need some work to get this fixed.

It served its purpose, to expose some bigger issues.. but sadly those
are beyond just msm and not something that can be fixed quickly

> I also agree that we shouldn't have allowed driver to touch that stuff in=
 the first place and better document how to do things but yeah I can't chan=
ge the past I can only try to fix it now.
>
> >> What we can do is to mark MSM as broken and/or give a warning in MSM w=
hen DMABUF_DEBUG is enabled and you try to import a DMA-buf.
> >
> > sorry, no, we can't mark MSM as broken.. we can mark DMABUF_DEBUG as BR=
OKEN
>
> As I wrote the debug functionality to enforce not using struct pages has =
been around for over 5 years now, it was just not enabled by default.
>
> What I can offer is to set it to default N for another few month to give =
you more time to fix things.

If it is disabled by default in distro kernels, that sounds fine.
I've cleaned up the remaining use of pages in msm (which were not load
bearing, but I should have done before to remove use of
drm_prime_sg_to_page_array()), but the problems extend further and is
a bit complicated because the hw uses SSMU in a way that dma-mapping
doesn't consider very well.

BR,
-R


> Regards,
> Christian.
>
> >
> > BR,
> > -R
> >
> >> But making the check not default to enable on debug kernels is not an =
option. This check here is exactly to point out broken drivers and you can =
manually disable it.
> >>
> >> Regards,
> >> Christian.
> >>
> >>>
> >>> Link: https://lore.kernel.org/linux-arm-msm/20260923074256.9357-1-liu=
jianfeng1994@gmail.com/
> >>> Suggested-by: Rob Clark <robin.clark@oss.qualcomm.com>
> >>> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> >>> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> >>> Cc: Karl Mehltretter <kmehltretter@gmail.com>
> >>>
> >>> Signed-off-by: Jianfeng Liu <liujianfeng1994@gmail.com>
> >>> ---
> >>>
> >>>  drivers/dma-buf/Kconfig | 2 +-
> >>>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>> diff --git a/drivers/dma-buf/Kconfig b/drivers/dma-buf/Kconfig
> >>> index e4f078a326a41..7efc0f0d07126 100644
> >>> --- a/drivers/dma-buf/Kconfig
> >>> +++ b/drivers/dma-buf/Kconfig
> >>> @@ -43,7 +43,7 @@ config UDMABUF
> >>>  config DMABUF_DEBUG
> >>>       bool "DMA-BUF debug checks"
> >>>       depends on DMA_SHARED_BUFFER
> >>> -     default y if DEBUG_KERNEL
> >>> +     default y if DEBUG
> >>>       help
> >>>         This option enables additional checks for DMA-BUF importers a=
nd
> >>>         exporters. Specifically it validates that importers do not pe=
ek at the
> >>> ---
> >>> base-commit: 93f51579e7df248780214094418f205253383cc5
> >>> branch: revert-dmabuf-debug-for-7.3
> >>>
> >>
>
