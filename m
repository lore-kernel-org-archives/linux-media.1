Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D5336B90D
	for <linux-media@vger.kernel.org>; Mon, 24 Aug 2026 15:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787584083; cv=pass; b=EVBxdsWunxCBg77GTkU27y0fTcWefFAe72Y2o4PdFqJYS7Fqp0LpqPeJSahwVCCoXwKZuuqHmcVn36pPOuxELPMfxmgLc51psQqbPeL980lBq4yXBQV6NIX55Hpox/bBovMkM6SpzB2iqfI9qLdU4YwanC0OgwrIjI1k3tgUqxY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787584083; c=relaxed/simple;
	bh=kx3NaihLsZMc9mXR33QLt1ZgY0XelCuXCVP1l5iABiY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TqxMZUXI1MHHDwqisHMZl/T2sgLRb92ZsZwxlq4aAeECY7VHBj4+09iy0WGoemGzKZnRwQ2U9C4FyvIHw6FVkCwtkc7msXMWURTZRSSuYbyWYpcNgCRswoQAm7GFpMendVEdXf1vcN39YtYQCIF4XB6my6WV0ZTLlZxnsnmTRgY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fgy0aiJT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VMePT4Ck; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fgy0aiJT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VMePT4Ck"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OCuoPx4077588
	for <linux-media@vger.kernel.org>; Mon, 24 Aug 2026 15:08:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=Hyle+U8D28MC5G69uxudHerMnPCZoLVIe9KmF6dXIWY=; b=Fg
	y0aiJTpQixkyZPO2b2itaeD3NUAs8YOuMxrQsMwRWBVti1gbwm8Vr3MXZKRyI+tK
	i9ILfA6NvJl3KHdavmTVMMPtGLGQXXVUpuFzH+pKpxygR/yzDqtTBR+Yzg6G5gBG
	QlyKLbt+yUDPdTg49mBgMCfC7IsnD9poLmlSexGfLoPKkV2FVSrfXIRUd5jdd1aj
	2LQ6S05wqOhojN17K68WK2Ow0FOYD6ThnIcDQtjbJ+lpT2nUuhH282VnLj2jXuR8
	PqBdLyG6vpLrfBFqtmwdch6YQCGYBfCNP7QQ+p8WU7DD12GfYr6pdScNVovDHPvg
	WOagOogdwgfm6bL+8gsA==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g88jpkg0g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 24 Aug 2026 15:08:00 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-451acf33124so7171649fac.0
        for <linux-media@vger.kernel.org>; Mon, 24 Aug 2026 08:07:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787584079; cv=none;
        d=google.com; s=arc-20260327;
        b=D6yAN68DSvAhSuV63WBytgnbQ1H5FktgZAD1i40iY9dZ3l9pXWBzUPU9jmvptg4+Um
         aoDr6uS2ftxr1Lk+oMfwST4XA17yscHuol5o4swDTYpcLP/Ak3oM10ZoVyiXOoznSsam
         r52A7DisSv+JmVYgN2GPHOZtxVnVxW3kFWc4ENzOTmNDWavKFpN7uQoAIboG1tVmHNjK
         VP6DPZPFpgoOoiWdZmSql/FDQEpCk07Efv77HYfiDArGFD6sSnNTB6CzmGvJGjD6UBpD
         vOO8HT6fLLIf3yHc3YFVGhtJ5QiGQgcAHHlapaUftLPktA9RRN82yVNAVWVNWURTdYSU
         HSFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=Hyle+U8D28MC5G69uxudHerMnPCZoLVIe9KmF6dXIWY=;
        fh=/0Y30MonHoou0WwHpAMzqzSUmxuN/CEiGDqcekJW3ug=;
        b=mUK8nUhXG9MJN4+dKHrzeWdar74dhcRklpl8HOoXrsyOBt2VwA6/koVTqyh09yIeWr
         2hpuwJB3w2PPSHCoDMsKojYO7N+YXknZP2zWZmnU18+dzxbZc5kyUyz9LJHSMgzgNPdq
         helVOpJ50dSA+vS+sbRRZQtdHv7bTVXLbJ9TvjL1bXHOvGnSuooQQGujDSJrbWJWGrB0
         41pdIyUsaBiTdUzBf8txVBIY2PtWDLu7X3Gm6/sTB4/QqL7hHyQ4jFH5B55Pvn36qAOT
         OYglDB+z51oqr835sePzPES4ygtzIP5AHyJGOHN+Ry/yam3ikUSJPod9xfEEqyLjHMun
         la9A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787584079; x=1788188879; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Hyle+U8D28MC5G69uxudHerMnPCZoLVIe9KmF6dXIWY=;
        b=VMePT4Ck4cUWKoToLDFAXR3DLdbQeQXJO2s4rSF9ZUGn/jDa+xijyE2himd6aWUe+G
         ctEHgLalqT9XwPQW1q/NddQSnGGVCSLYR0ondggrs7EHibzMrKWb9N83x8eR/UqTy6nH
         /JOOjAv7A92QrrEn5t9Yc96twUucEhHzNxhmEksShfl2UeHLFDghoefcdRlFwalClBTf
         te+igekCNmG8CxYCcGKErpM4/8FJSXaOKPuF07C0HZyXHD5LOqzxJxKp9nk2vm0ijG7r
         4Wd9I4qfR3DFzeBRkkdJlan0B4iRwwKE5SZOGSsUDt2isU5cq7M8emqCOn3C4/gA0N1N
         HCMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787584079; x=1788188879;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hyle+U8D28MC5G69uxudHerMnPCZoLVIe9KmF6dXIWY=;
        b=YOkWPrfUkD/RLByYbXEVNrmENy2B3/sW3rlEZ6xyuhFN33pMQ0sZTUQzobOuwOw9LA
         wGQLI+p5LnPxlGRK1xJpAsfHKmFdQ9J/UOUj9ETkghRQo8sgvGCHlnm4yj6RaJQYpE6y
         6TPD4v7LrXc4QMfzoErshuOEwM1nQONMYbCsVe0JKuhTZK+Jqc5pT7REzIj4Nh9BDvwh
         jl7AH0Cw3Y3bIOkMgAO40MRXVFyV+CywHDLCwTAOTl9/o+pZZe0/54Y4YO0HCAaB8Kx2
         IFX3MwOE/xlBf2K6hiF+95pWO202Ean2NHpW4vbUSqMYfstzvcsPijWzasr+ccZU05cU
         2lkA==
X-Forwarded-Encrypted: i=1; AHgh+Rr1FW6/zRkaX9ClU8L4JlmU9YrPJp+4wOA5z7kVhqPXql4uuyq2/FcCBronsGHVAlUoHvHCwogLEDrzyA==@vger.kernel.org
X-Gm-Message-State: AFuF++lcRKASjxpnEudpNFnHGsbM4P+QD2O072dfP0WjpENbtzbfuDT2
	eVQxBu5NWMnuiYtGbODUAtFXC1OwoQTD7X7qp8bwO6CX+it/o85yAaAVkoRd+6m6svAw8rBnkwW
	cG81eizAEL11ggkAXyChjJC/5IIrRn07i4oFpwjUEjr81XSkdYi8RHE6vQAcaFLQ+sUTftinUi0
	Ol0xhDf5eWlfiBJ/UWAn4HJHU9QaBS1WfIXYpdVQ9d
X-Gm-Gg: AR+sD10P6uwaxvEARi08R2fyR2dpkXd4Ln8F00JylUIedJpTIhO3zc5nT/Lc52UUPfC
	mIuxveV531njz9lki108z5VfqSdLtG0XZ15LAZCrOwgKVa1pNrvLsb3J8G4S984uvK2dLqmN+uK
	a2salOFEf2x9C9OtnTVUCe6R2lVNfFhOV0x2pDRh2Ht7Ns4DDVdunEOkzt
X-Received: by 2002:a05:6870:b017:b0:430:7c2:9a30 with SMTP id 586e51a60fabf-463514647d1mr23964533fac.15.1787584078933;
        Mon, 24 Aug 2026 08:07:58 -0700 (PDT)
X-Received: by 2002:a05:6870:b017:b0:430:7c2:9a30 with SMTP id
 586e51a60fabf-463514647d1mr23964465fac.15.1787584078339; Mon, 24 Aug 2026
 08:07:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260817-qda-v2-v2-0-69a02e9090d4@oss.qualcomm.com>
 <20260817-qda-v2-v2-9-69a02e9090d4@oss.qualcomm.com> <7030a8f8-f320-4b09-b2de-2c8e897409f8@amd.com>
In-Reply-To: <7030a8f8-f320-4b09-b2de-2c8e897409f8@amd.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 08:07:45 -0700
X-Gm-Features: AcwNN1VFbqhhiJLvWH1NFcU6NtrCPGMII3xv7bbLUyQcFEp8F3pgy2kkKFrRtdE
Message-ID: <CACSVV00MubttbkVJgMommPMorf67yqn7D1kfwpxVUZ0t-6au8Q@mail.gmail.com>
Subject: Re: [PATCH v2 09/15] accel/qda: Add DMA-backed GEM objects and memory
 manager integration
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        srinivas.kandagatla@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, llvm@lists.linux.dev,
        iommu@lists.linux.dev, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDEyNyBTYWx0ZWRfXx//MgXcKS2PV
 Pl08aJbGnh805cZvl9HA7Em0Rg7tXMvAXxhZopcu39gB4KAocMDKMJFm5BrNQnOHNZpNDi2JmjD
 SyOyBoiS0PEnhIZ8rMyKpxPzWgxIbD3qnXxgmI2FrnRXT3k1Ow5YjQzrTx7cgUue1deLmNBawb+
 s9OHG7udYDXWcGS71xSIn8rtT4OZr0HaiOZXMqFZGhlzcBZa6B2lCvP3wZBDN/h/FJ0Tt7DWmYz
 BiKzjCWbI/+S23/d4CiC+MZa5djM0DiUV5o3G6SMZ4Vg8LKesIKEU/sQGUfXjt+/nvGhz/zurL8
 2t5oEQ5i3Eydq2MeH4KQbA/tOgi4fkucJQWdgUu8WTlTeozMNxZZ9xtYiPyp+Wt0ZkgJo6Gk1yx
 /hKi3LFUUZ4nG/yFnJaHwQbC0t2PHCZxrC1nE647KtEMcQCYEvqPYD14bH9T0cOCERLN8YrY+Uy
 k2gobboOdTYsafvCO0Q==
X-Proofpoint-GUID: UNiQXPnWw8xDCZ4rVpeM9XiZqrAFEKzR
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDEyNyBTYWx0ZWRfX56niNLDHTP/6
 a/55aQku5uGw3j0vZhzdsCBqEqCt/FRQ38xiFT9eksvciUYP7pllkqytrqlk5C3ZiJTQJDk7iu8
 EmkgA9VTrj3KvedlIKU/1IeK57myjUw=
X-Authority-Analysis: v=2.4 cv=Xey5Co55 c=1 sm=1 tr=0 ts=6a8c5e50 cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=zd2uoN0lAAAA:8 a=EUspDBNiAAAA:8
 a=ABG8zexEJSlfSB4JGioA:9 a=Me1utG3SuDqcFyGJ:21 a=QEXdDO2ut3YA:10
 a=1zu1i0D7hVQfj8NKfPKu:22
X-Proofpoint-ORIG-GUID: UNiQXPnWw8xDCZ4rVpeM9XiZqrAFEKzR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_04,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240127

On Mon, Aug 24, 2026 at 7:31=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> On 8/17/26 06:47, Ekansh Gupta wrote:
> > Introduce DMA-coherent buffer management for the QDA driver, wiring
> > together the GEM subsystem, the IOMMU memory manager, and a DMA
> > allocation backend.
> >
> > qda_gem.c / qda_gem.h
> >   Implements the GEM object lifecycle for QDA buffers. Each buffer is
> >   represented by a qda_gem_obj which embeds a drm_gem_object and
> >   carries the kernel virtual address, DMA address, and a pointer to
> >   the IOMMU device that performed the allocation. The .free callback
> >   delegates to the memory manager, and the .mmap callback uses
> >   dma_mmap_coherent() via the DMA backend.
> >
> > qda_memory_dma.c / qda_memory_dma.h
> >   DMA coherent allocation backend. qda_dma_alloc() calls
> >   dma_alloc_coherent() on the CB device and encodes the stream ID
> >   (SID) in the upper 32 bits of the returned DMA address, following
> >   the Qualcomm FastRPC convention for IOMMU address space tagging.
> >   qda_dma_free() strips the SID prefix before calling
> >   dma_free_coherent().
> >
> > qda_memory_manager.c
> >   Adds process-to-device assignment: each DRM file (process) is
> >   assigned one IOMMU context bank device for the lifetime of the
> >   session. qda_memory_manager_assign_device() first checks whether
> >   the process already has a device (reusing it with a refcount
> >   increment), then falls back to claiming an unassigned device.
> >   qda_memory_manager_alloc() and qda_memory_manager_free() delegate
> >   to the DMA backend after resolving the correct CB device for the
> >   calling process.
>
> Oh, stuff like that is usually a pretty big NO-GO now.
>
> AMD has made the same mistake with KFD and it resulted in a massive chaos=
.
>
> The DRM file is the driver context your process uses and even if there ar=
e multiple DRM files for the same PID you should absolute *NOT* share anyth=
ing between them.
>
> The general rule of thumb is to not attach anything to the process using =
the DRM file descriptor.

A couple other things to keep in mind:

1. drm device fd can be passed across processes
2. virtgpu/virglrenderer drm native ctx is a single process that opens
the drm device file N times on behalf of N guest userspace processes.

All that to say, Christian is right here.. drm_file is your context,
pgtables should be attached to the drm_file (potentially via
drm_gpuvm.. which you perhaps want to use).

BR,
-R

> Regards,
> Christian.
>
> >
> > qda_drv.c / qda_drv.h
> >   qda_file_priv gains an assigned_iommu_dev pointer and a pid field.
> >   The .postclose callback decrements the IOMMU device refcount and
> >   clears the process assignment when the last reference is dropped.
> >
> > Assisted-by: Claude:claude-sonnet-5
> > Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> > ---
> > Changes in v2:
> > - Adapt to the dynamically-sized device array introduced in patch 07
> >   (kcalloc'd from DT node count, replaces fixed QDA_IOMMU_DEVICES_MAX)
> > - Protect register/unregister with the process_assignment_lock mutex so
> >   the device-assignment and device-registration paths are serialised
> > - No functional changes requested by reviewers on this patch
> > ---
> >  drivers/accel/qda/Makefile             |   2 +
> >  drivers/accel/qda/qda_drv.c            |   4 +
> >  drivers/accel/qda/qda_drv.h            |   4 +
> >  drivers/accel/qda/qda_gem.c            | 134 ++++++++++++++++++
> >  drivers/accel/qda/qda_gem.h            |  52 +++++++
> >  drivers/accel/qda/qda_memory_dma.c     |  82 +++++++++++
> >  drivers/accel/qda/qda_memory_dma.h     |  17 +++
> >  drivers/accel/qda/qda_memory_manager.c | 239 +++++++++++++++++++++++++=
+++++++-
> >  drivers/accel/qda/qda_memory_manager.h |  30 +++++
> >  9 files changed, 559 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/accel/qda/Makefile b/drivers/accel/qda/Makefile
> > index b658dad35fee..a46ddceecfc5 100644
> > --- a/drivers/accel/qda/Makefile
> > +++ b/drivers/accel/qda/Makefile
> > @@ -8,7 +8,9 @@ obj-$(CONFIG_DRM_ACCEL_QDA)   :=3D qda.o
> >  qda-y :=3D \
> >       qda_cb.o \
> >       qda_drv.o \
> > +     qda_gem.o \
> >       qda_ioctl.o \
> > +     qda_memory_dma.o \
> >       qda_memory_manager.o \
> >       qda_rpmsg.o
> >
> > diff --git a/drivers/accel/qda/qda_drv.c b/drivers/accel/qda/qda_drv.c
> > index e1fd8bfa12d7..2b14dab95507 100644
> > --- a/drivers/accel/qda/qda_drv.c
> > +++ b/drivers/accel/qda/qda_drv.c
> > @@ -21,6 +21,7 @@ static int qda_open(struct drm_device *dev, struct dr=
m_file *file)
> >       if (!qda_file_priv)
> >               return -ENOMEM;
> >
> > +     qda_file_priv->pid =3D current->pid;
> >       qda_file_priv->qda_dev =3D qda_dev_from_drm(dev);
> >       file->driver_priv =3D qda_file_priv;
> >
> > @@ -31,6 +32,9 @@ static void qda_postclose(struct drm_device *dev, str=
uct drm_file *file)
> >  {
> >       struct qda_file_priv *qda_file_priv =3D file->driver_priv;
> >
> > +     if (qda_file_priv->assigned_iommu_dev)
> > +             qda_memory_manager_release_device(qda_file_priv->assigned=
_iommu_dev);
> > +
> >       kfree(qda_file_priv);
> >       file->driver_priv =3D NULL;
> >  }
> > diff --git a/drivers/accel/qda/qda_drv.h b/drivers/accel/qda/qda_drv.h
> > index 690a833d732b..2fe58f3efec0 100644
> > --- a/drivers/accel/qda/qda_drv.h
> > +++ b/drivers/accel/qda/qda_drv.h
> > @@ -24,6 +24,10 @@
> >  struct qda_file_priv {
> >       /** @qda_dev: Back-pointer to device structure */
> >       struct qda_dev *qda_dev;
> > +     /** @assigned_iommu_dev: IOMMU device assigned to this process */
> > +     struct qda_iommu_device *assigned_iommu_dev;
> > +     /** @pid: Process ID for tracking */
> > +     pid_t pid;
> >  };
> >
> >  /**
> > diff --git a/drivers/accel/qda/qda_gem.c b/drivers/accel/qda/qda_gem.c
> > new file mode 100644
> > index 000000000000..66e78013a726
> > --- /dev/null
> > +++ b/drivers/accel/qda/qda_gem.c
> > @@ -0,0 +1,134 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +// Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> > +#include <drm/drm_gem.h>
> > +#include <drm/drm_prime.h>
> > +#include <drm/drm_print.h>
> > +#include <linux/slab.h>
> > +#include <linux/dma-mapping.h>
> > +#include "qda_drv.h"
> > +#include "qda_gem.h"
> > +#include "qda_memory_manager.h"
> > +#include "qda_memory_dma.h"
> > +
> > +/**
> > + * qda_gem_free_object() - Free a GEM object and its associated resour=
ces
> > + * @gem_obj: DRM GEM object to free
> > + */
> > +void qda_gem_free_object(struct drm_gem_object *gem_obj)
> > +{
> > +     struct qda_gem_obj *qda_gem_obj =3D to_qda_gem_obj(gem_obj);
> > +     struct qda_dev *qdev =3D qda_dev_from_drm(gem_obj->dev);
> > +
> > +     if (qda_gem_obj->virt && qdev->iommu_mgr)
> > +             qda_memory_manager_free(qdev->iommu_mgr, qda_gem_obj);
> > +
> > +     drm_gem_object_release(gem_obj);
> > +     kfree(qda_gem_obj);
> > +}
> > +
> > +/**
> > + * qda_gem_mmap_obj() - Map a GEM object into userspace
> > + * @drm_obj: DRM GEM object to map
> > + * @vma: Virtual memory area to map into
> > + *
> > + * Return: 0 on success, negative error code on failure
> > + */
> > +int qda_gem_mmap_obj(struct drm_gem_object *drm_obj, struct vm_area_st=
ruct *vma)
> > +{
> > +     struct qda_gem_obj *qda_gem_obj =3D to_qda_gem_obj(drm_obj);
> > +     int ret;
> > +
> > +     /* The fake offset is only used to find the object, not to index =
it */
> > +     vma->vm_pgoff =3D 0;
> > +
> > +     ret =3D qda_dma_mmap(qda_gem_obj, vma);
> > +     if (ret)
> > +             return ret;
> > +
> > +     vm_flags_set(vma, VM_DONTEXPAND | VM_DONTDUMP);
> > +
> > +     return 0;
> > +}
> > +
> > +static const struct drm_gem_object_funcs qda_gem_object_funcs =3D {
> > +     .free =3D qda_gem_free_object,
> > +     .mmap =3D qda_gem_mmap_obj,
> > +};
> > +
> > +/**
> > + * qda_gem_alloc_object() - Allocate a new QDA GEM object
> > + * @drm_dev: DRM device
> > + * @aligned_size: Size of the object in bytes (must be page-aligned)
> > + *
> > + * Return: Pointer to the new GEM object, or ERR_PTR on failure
> > + */
> > +struct qda_gem_obj *qda_gem_alloc_object(struct drm_device *drm_dev, s=
ize_t aligned_size)
> > +{
> > +     struct qda_gem_obj *qda_gem_obj;
> > +     int ret;
> > +
> > +     qda_gem_obj =3D kzalloc_obj(*qda_gem_obj);
> > +     if (!qda_gem_obj)
> > +             return ERR_PTR(-ENOMEM);
> > +
> > +     ret =3D drm_gem_object_init(drm_dev, &qda_gem_obj->base, aligned_=
size);
> > +     if (ret) {
> > +             kfree(qda_gem_obj);
> > +             return ERR_PTR(ret);
> > +     }
> > +
> > +     qda_gem_obj->base.funcs =3D &qda_gem_object_funcs;
> > +     qda_gem_obj->size =3D aligned_size;
> > +
> > +     return qda_gem_obj;
> > +}
> > +
> > +void qda_gem_cleanup_object(struct qda_gem_obj *qda_gem_obj)
> > +{
> > +     drm_gem_object_release(&qda_gem_obj->base);
> > +     kfree(qda_gem_obj);
> > +}
> > +
> > +int qda_gem_create_handle(struct drm_file *file_priv, struct drm_gem_o=
bject *gem_obj, u32 *handle)
> > +{
> > +     int ret;
> > +
> > +     ret =3D drm_gem_handle_create(file_priv, gem_obj, handle);
> > +     drm_gem_object_put(gem_obj);
> > +
> > +     return ret;
> > +}
> > +
> > +/**
> > + * qda_gem_create_object() - Allocate and initialize a GEM object with=
 DMA backing
> > + * @drm_dev: DRM device
> > + * @iommu_mgr: Memory manager to use for DMA allocation
> > + * @size: Requested size in bytes
> > + * @file_priv: DRM file private data for process association
> > + *
> > + * Return: Pointer to the base DRM GEM object on success, ERR_PTR on f=
ailure
> > + */
> > +struct drm_gem_object *qda_gem_create_object(struct drm_device *drm_de=
v,
> > +                                          struct qda_memory_manager *i=
ommu_mgr, size_t size,
> > +                                          struct drm_file *file_priv)
> > +{
> > +     struct qda_gem_obj *qda_gem_obj;
> > +     size_t aligned_size;
> > +     int ret;
> > +
> > +     aligned_size =3D PAGE_ALIGN(size);
> > +     if (!aligned_size)
> > +             return ERR_PTR(-EINVAL);
> > +
> > +     qda_gem_obj =3D qda_gem_alloc_object(drm_dev, aligned_size);
> > +     if (IS_ERR(qda_gem_obj))
> > +             return ERR_CAST(qda_gem_obj);
> > +
> > +     ret =3D qda_memory_manager_alloc(iommu_mgr, qda_gem_obj, file_pri=
v);
> > +     if (ret) {
> > +             qda_gem_cleanup_object(qda_gem_obj);
> > +             return ERR_PTR(ret);
> > +     }
> > +
> > +     return &qda_gem_obj->base;
> > +}
> > diff --git a/drivers/accel/qda/qda_gem.h b/drivers/accel/qda/qda_gem.h
> > new file mode 100644
> > index 000000000000..afd7c9b49549
> > --- /dev/null
> > +++ b/drivers/accel/qda/qda_gem.h
> > @@ -0,0 +1,52 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +/*
> > + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> > + */
> > +#ifndef __QDA_GEM_H__
> > +#define __QDA_GEM_H__
> > +
> > +#include <linux/dma-mapping.h>
> > +#include <drm/drm_device.h>
> > +#include <drm/drm_gem.h>
> > +#include "qda_memory_manager.h"
> > +
> > +/**
> > + * struct qda_gem_obj - QDA GEM buffer object
> > + *
> > + * Represents a GEM buffer object that can be allocated by the driver
> > + * or imported from another driver via DMA-BUF.
> > + */
> > +struct qda_gem_obj {
> > +     /** @base: DRM GEM object base =E2=80=94 must be first member */
> > +     struct drm_gem_object base;
> > +     /** @iommu_dev: IOMMU context bank device that performed the allo=
cation */
> > +     struct qda_iommu_device *iommu_dev;
> > +     /** @virt: Kernel virtual address of the allocated DMA memory */
> > +     void *virt;
> > +     /** @dma_addr: DMA address (with SID encoded in upper 32 bits) */
> > +     dma_addr_t dma_addr;
> > +     /** @size: Size of the buffer in bytes */
> > +     size_t size;
> > +};
> > +
> > +/**
> > + * to_qda_gem_obj - Cast a drm_gem_object pointer to qda_gem_obj
> > + * @gem_obj: Pointer to the embedded drm_gem_object
> > + */
> > +#define to_qda_gem_obj(gem_obj) container_of(gem_obj, struct qda_gem_o=
bj, base)
> > +
> > +/* GEM object lifecycle */
> > +struct drm_gem_object *qda_gem_create_object(struct drm_device *drm_de=
v,
> > +                                          struct qda_memory_manager *i=
ommu_mgr,
> > +                                          size_t size, struct drm_file=
 *file_priv);
> > +void qda_gem_free_object(struct drm_gem_object *gem_obj);
> > +int qda_gem_mmap_obj(struct drm_gem_object *gem_obj, struct vm_area_st=
ruct *vma);
> > +
> > +/* Internal helpers (also used by PRIME import) */
> > +struct qda_gem_obj *qda_gem_alloc_object(struct drm_device *drm_dev, s=
ize_t aligned_size);
> > +void qda_gem_cleanup_object(struct qda_gem_obj *qda_gem_obj);
> > +
> > +/* Utility functions */
> > +int qda_gem_create_handle(struct drm_file *file_priv, struct drm_gem_o=
bject *gem_obj, u32 *handle);
> > +
> > +#endif /* __QDA_GEM_H__ */
> > diff --git a/drivers/accel/qda/qda_memory_dma.c b/drivers/accel/qda/qda=
_memory_dma.c
> > new file mode 100644
> > index 000000000000..7072ed8edf0b
> > --- /dev/null
> > +++ b/drivers/accel/qda/qda_memory_dma.c
> > @@ -0,0 +1,82 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +// Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> > +#include <linux/slab.h>
> > +#include <linux/dma-mapping.h>
> > +#include "qda_drv.h"
> > +#include "qda_gem.h"
> > +#include "qda_memory_dma.h"
> > +
> > +/*
> > + * The DSP identifies the IOMMU context bank from the upper bits of th=
e address,
> > + * so the stream ID is folded into every address handed to it. The DMA=
 API only
> > + * ever sees the plain 32-bit address, which is why the context bank d=
evices are
> > + * created with a 32-bit DMA mask.
> > + */
> > +static dma_addr_t get_actual_dma_addr(struct qda_gem_obj *gem_obj)
> > +{
> > +     return gem_obj->dma_addr - ((u64)gem_obj->iommu_dev->sid << 32);
> > +}
> > +
> > +static void setup_gem_object(struct qda_gem_obj *gem_obj, void *virt,
> > +                          dma_addr_t dma_addr, struct qda_iommu_device=
 *iommu_dev)
> > +{
> > +     gem_obj->virt =3D virt;
> > +     gem_obj->dma_addr =3D dma_addr;
> > +     gem_obj->iommu_dev =3D iommu_dev;
> > +}
> > +
> > +static void cleanup_gem_object_fields(struct qda_gem_obj *gem_obj)
> > +{
> > +     gem_obj->virt =3D NULL;
> > +     gem_obj->dma_addr =3D 0;
> > +     gem_obj->iommu_dev =3D NULL;
> > +}
> > +
> > +/**
> > + * qda_dma_alloc() - Allocate DMA coherent memory for a GEM object
> > + * @iommu_dev: Pointer to the QDA IOMMU device structure
> > + * @gem_obj: Pointer to GEM object to allocate memory for
> > + * @size: Size of memory to allocate in bytes
> > + *
> > + * Return: 0 on success, negative error code on failure
> > + */
> > +int qda_dma_alloc(struct qda_iommu_device *iommu_dev,
> > +               struct qda_gem_obj *gem_obj, size_t size)
> > +{
> > +     dma_addr_t dma_addr;
> > +     void *virt;
> > +
> > +     virt =3D dma_alloc_coherent(iommu_dev->dev, size, &dma_addr, GFP_=
KERNEL);
> > +     if (!virt)
> > +             return -ENOMEM;
> > +
> > +     dma_addr +=3D ((u64)iommu_dev->sid << 32);
> > +     setup_gem_object(gem_obj, virt, dma_addr, iommu_dev);
> > +
> > +     return 0;
> > +}
> > +
> > +/**
> > + * qda_dma_free() - Free DMA coherent memory for a GEM object
> > + * @gem_obj: Pointer to GEM object to free memory for
> > + */
> > +void qda_dma_free(struct qda_gem_obj *gem_obj)
> > +{
> > +     dma_free_coherent(gem_obj->iommu_dev->dev, gem_obj->size,
> > +                       gem_obj->virt, get_actual_dma_addr(gem_obj));
> > +
> > +     cleanup_gem_object_fields(gem_obj);
> > +}
> > +
> > +/**
> > + * qda_dma_mmap() - Map DMA memory into userspace
> > + * @gem_obj: Pointer to GEM object containing DMA memory
> > + * @vma: Virtual memory area to map into
> > + *
> > + * Return: 0 on success, negative error code on failure
> > + */
> > +int qda_dma_mmap(struct qda_gem_obj *gem_obj, struct vm_area_struct *v=
ma)
> > +{
> > +     return dma_mmap_coherent(gem_obj->iommu_dev->dev, vma, gem_obj->v=
irt,
> > +                              get_actual_dma_addr(gem_obj), gem_obj->s=
ize);
> > +}
> > diff --git a/drivers/accel/qda/qda_memory_dma.h b/drivers/accel/qda/qda=
_memory_dma.h
> > new file mode 100644
> > index 000000000000..99352a99dc33
> > --- /dev/null
> > +++ b/drivers/accel/qda/qda_memory_dma.h
> > @@ -0,0 +1,17 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +/*
> > + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> > + */
> > +
> > +#ifndef __QDA_MEMORY_DMA_H__
> > +#define __QDA_MEMORY_DMA_H__
> > +
> > +#include <linux/dma-mapping.h>
> > +#include "qda_memory_manager.h"
> > +
> > +int qda_dma_alloc(struct qda_iommu_device *iommu_dev,
> > +               struct qda_gem_obj *gem_obj, size_t size);
> > +void qda_dma_free(struct qda_gem_obj *gem_obj);
> > +int qda_dma_mmap(struct qda_gem_obj *gem_obj, struct vm_area_struct *v=
ma);
> > +
> > +#endif /* __QDA_MEMORY_DMA_H__ */
> > diff --git a/drivers/accel/qda/qda_memory_manager.c b/drivers/accel/qda=
/qda_memory_manager.c
> > index b1a80ee77c35..d47c7419e11d 100644
> > --- a/drivers/accel/qda/qda_memory_manager.c
> > +++ b/drivers/accel/qda/qda_memory_manager.c
> > @@ -1,14 +1,26 @@
> >  // SPDX-License-Identifier: GPL-2.0-only
> >  // Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> >
> > +#include <linux/refcount.h>
> >  #include <linux/slab.h>
> > +#include <linux/spinlock.h>
> > +#include <drm/drm_file.h>
> > +#include <drm/drm_print.h>
> >  #include "qda_drv.h"
> > +#include "qda_gem.h"
> >  #include "qda_memory_manager.h"
> > +#include "qda_memory_dma.h"
> > +
> > +static void iommu_device_free(struct kref *ref)
> > +{
> > +     kfree(container_of(ref, struct qda_iommu_device, ref));
> > +}
> >
> >  static void cleanup_all_memory_devices(struct qda_memory_manager *mem_=
mgr)
> >  {
> >       int i;
> >
> > +     mutex_lock(&mem_mgr->process_assignment_lock);
> >       for (i =3D 0; i < mem_mgr->num_devices; i++) {
> >               struct qda_iommu_device *iommu_dev =3D mem_mgr->devices[i=
];
> >
> > @@ -16,9 +28,215 @@ static void cleanup_all_memory_devices(struct qda_m=
emory_manager *mem_mgr)
> >                       continue;
> >
> >               mem_mgr->devices[i] =3D NULL;
> > -             kfree(iommu_dev);
> > +             kref_put(&iommu_dev->ref, iommu_device_free);
> >       }
> >       mem_mgr->num_devices =3D 0;
> > +     mutex_unlock(&mem_mgr->process_assignment_lock);
> > +}
> > +
> > +static void init_iommu_device_fields(struct qda_iommu_device *iommu_de=
v)
> > +{
> > +     spin_lock_init(&iommu_dev->lock);
> > +     refcount_set(&iommu_dev->users, 0);
> > +     kref_init(&iommu_dev->ref);
> > +     iommu_dev->assigned_pid =3D 0;
> > +     iommu_dev->assigned_file_priv =3D NULL;
> > +}
> > +
> > +static struct qda_iommu_device *find_device_for_pid(struct qda_memory_=
manager *mem_mgr,
> > +                                                 pid_t pid)
> > +{
> > +     struct qda_iommu_device *found_dev =3D NULL;
> > +     unsigned long flags;
> > +     int i;
> > +
> > +     for (i =3D 0; i < mem_mgr->num_devices; i++) {
> > +             struct qda_iommu_device *iommu_dev =3D mem_mgr->devices[i=
];
> > +
> > +             if (!iommu_dev)
> > +                     continue;
> > +
> > +             spin_lock_irqsave(&iommu_dev->lock, flags);
> > +             if (iommu_dev->assigned_pid =3D=3D pid) {
> > +                     found_dev =3D iommu_dev;
> > +                     refcount_inc(&found_dev->users);
> > +                     kref_get(&found_dev->ref);
> > +                     spin_unlock_irqrestore(&iommu_dev->lock, flags);
> > +                     break;
> > +             }
> > +             spin_unlock_irqrestore(&iommu_dev->lock, flags);
> > +     }
> > +
> > +     return found_dev;
> > +}
> > +
> > +static struct qda_iommu_device *assign_available_device_to_pid(struct =
qda_memory_manager *mem_mgr,
> > +                                                            pid_t pid,
> > +                                                            struct drm=
_file *file_priv)
> > +{
> > +     struct qda_iommu_device *selected_dev =3D NULL;
> > +     unsigned long flags;
> > +     int i;
> > +
> > +     for (i =3D 0; i < mem_mgr->num_devices; i++) {
> > +             struct qda_iommu_device *iommu_dev =3D mem_mgr->devices[i=
];
> > +
> > +             if (!iommu_dev)
> > +                     continue;
> > +
> > +             spin_lock_irqsave(&iommu_dev->lock, flags);
> > +             if (iommu_dev->assigned_pid =3D=3D 0) {
> > +                     iommu_dev->assigned_pid =3D pid;
> > +                     iommu_dev->assigned_file_priv =3D file_priv;
> > +                     selected_dev =3D iommu_dev;
> > +                     refcount_set(&selected_dev->users, 1);
> > +                     kref_get(&selected_dev->ref);
> > +                     spin_unlock_irqrestore(&iommu_dev->lock, flags);
> > +                     break;
> > +             }
> > +             spin_unlock_irqrestore(&iommu_dev->lock, flags);
> > +     }
> > +
> > +     return selected_dev;
> > +}
> > +
> > +static struct qda_iommu_device *get_process_iommu_device(struct qda_me=
mory_manager *mem_mgr,
> > +                                                      struct drm_file =
*file_priv)
> > +{
> > +     struct qda_file_priv *qda_priv;
> > +
> > +     if (!file_priv || !file_priv->driver_priv)
> > +             return NULL;
> > +
> > +     qda_priv =3D (struct qda_file_priv *)file_priv->driver_priv;
> > +     return qda_priv->assigned_iommu_dev;
> > +}
> > +
> > +/**
> > + * qda_memory_manager_assign_device() - Assign an IOMMU device to a pr=
ocess
> > + * @mem_mgr: Pointer to memory manager
> > + * @file_priv: DRM file private data for process association
> > + *
> > + * On success the caller owns a reference on the device and must relea=
se it
> > + * with qda_memory_manager_release_device().
> > + *
> > + * Return: 0 on success, negative error code on failure
> > + */
> > +int qda_memory_manager_assign_device(struct qda_memory_manager *mem_mg=
r,
> > +                                  struct drm_file *file_priv)
> > +{
> > +     struct qda_file_priv *qda_priv;
> > +     struct qda_iommu_device *selected_dev =3D NULL;
> > +     int ret =3D 0;
> > +     pid_t current_pid;
> > +
> > +     if (!file_priv || !file_priv->driver_priv)
> > +             return -EINVAL;
> > +
> > +     qda_priv =3D (struct qda_file_priv *)file_priv->driver_priv;
> > +     current_pid =3D qda_priv->pid;
> > +
> > +     mutex_lock(&mem_mgr->process_assignment_lock);
> > +
> > +     if (qda_priv->assigned_iommu_dev) {
> > +             ret =3D 0;
> > +             goto unlock_and_return;
> > +     }
> > +
> > +     selected_dev =3D find_device_for_pid(mem_mgr, current_pid);
> > +
> > +     if (selected_dev) {
> > +             qda_priv->assigned_iommu_dev =3D selected_dev;
> > +             goto unlock_and_return;
> > +     }
> > +
> > +     selected_dev =3D assign_available_device_to_pid(mem_mgr, current_=
pid, file_priv);
> > +
> > +     if (!selected_dev) {
> > +             drm_dbg_driver(file_priv->minor->dev, "No context bank av=
ailable for PID %d\n",
> > +                            current_pid);
> > +             ret =3D -EBUSY;
> > +             goto unlock_and_return;
> > +     }
> > +
> > +     qda_priv->assigned_iommu_dev =3D selected_dev;
> > +
> > +unlock_and_return:
> > +     mutex_unlock(&mem_mgr->process_assignment_lock);
> > +
> > +     return ret;
> > +}
> > +
> > +/**
> > + * qda_memory_manager_release_device() - Release a process assignment
> > + * @iommu_dev: Device previously obtained from qda_memory_manager_assi=
gn_device()
> > + *
> > + * Drops the caller's reference. Once the last process using the devic=
e is
> > + * gone the assignment is cleared so the device can serve another proc=
ess.
> > + */
> > +void qda_memory_manager_release_device(struct qda_iommu_device *iommu_=
dev)
> > +{
> > +     unsigned long flags;
> > +
> > +     if (refcount_dec_and_test(&iommu_dev->users)) {
> > +             spin_lock_irqsave(&iommu_dev->lock, flags);
> > +             iommu_dev->assigned_pid =3D 0;
> > +             iommu_dev->assigned_file_priv =3D NULL;
> > +             spin_unlock_irqrestore(&iommu_dev->lock, flags);
> > +     }
> > +
> > +     kref_put(&iommu_dev->ref, iommu_device_free);
> > +}
> > +
> > +static struct qda_iommu_device *get_or_assign_iommu_device(struct qda_=
memory_manager *mem_mgr,
> > +                                                        struct drm_fil=
e *file_priv)
> > +{
> > +     struct qda_iommu_device *iommu_dev;
> > +     int ret;
> > +
> > +     iommu_dev =3D get_process_iommu_device(mem_mgr, file_priv);
> > +     if (iommu_dev)
> > +             return iommu_dev;
> > +
> > +     ret =3D qda_memory_manager_assign_device(mem_mgr, file_priv);
> > +     if (ret)
> > +             return NULL;
> > +
> > +     iommu_dev =3D get_process_iommu_device(mem_mgr, file_priv);
> > +     if (iommu_dev)
> > +             return iommu_dev;
> > +
> > +     return NULL;
> > +}
> > +
> > +/**
> > + * qda_memory_manager_alloc() - Allocate memory for a GEM object
> > + * @mem_mgr: Pointer to memory manager
> > + * @gem_obj: Pointer to GEM object to allocate memory for
> > + * @file_priv: DRM file private data for process association
> > + *
> > + * Return: 0 on success, negative error code on failure
> > + */
> > +int qda_memory_manager_alloc(struct qda_memory_manager *mem_mgr, struc=
t qda_gem_obj *gem_obj,
> > +                          struct drm_file *file_priv)
> > +{
> > +     struct qda_iommu_device *selected_dev;
> > +
> > +     selected_dev =3D get_or_assign_iommu_device(mem_mgr, file_priv);
> > +     if (!selected_dev)
> > +             return -EBUSY;
> > +
> > +     return qda_dma_alloc(selected_dev, gem_obj, gem_obj->size);
> > +}
> > +
> > +/**
> > + * qda_memory_manager_free() - Free memory for a GEM object
> > + * @mem_mgr: Pointer to memory manager
> > + * @gem_obj: Pointer to GEM object to free memory for
> > + */
> > +void qda_memory_manager_free(struct qda_memory_manager *mem_mgr, struc=
t qda_gem_obj *gem_obj)
> > +{
> > +     qda_dma_free(gem_obj);
> >  }
> >
> >  /**
> > @@ -31,13 +249,21 @@ static void cleanup_all_memory_devices(struct qda_=
memory_manager *mem_mgr)
> >  int qda_memory_manager_register_device(struct qda_memory_manager *mem_=
mgr,
> >                                      struct qda_iommu_device *iommu_dev=
)
> >  {
> > -     if (mem_mgr->num_devices >=3D mem_mgr->max_devices)
> > -             return -ENOSPC;
> > +     int ret =3D 0;
> >
> > +     mutex_lock(&mem_mgr->process_assignment_lock);
> > +     if (mem_mgr->num_devices >=3D mem_mgr->max_devices) {
> > +             ret =3D -ENOSPC;
> > +             goto out;
> > +     }
> > +
> > +     init_iommu_device_fields(iommu_dev);
> >       iommu_dev->id =3D mem_mgr->num_devices;
> >       mem_mgr->devices[mem_mgr->num_devices++] =3D iommu_dev;
> >
> > -     return 0;
> > +out:
> > +     mutex_unlock(&mem_mgr->process_assignment_lock);
> > +     return ret;
> >  }
> >
> >  /**
> > @@ -52,14 +278,16 @@ void qda_memory_manager_unregister_device(struct q=
da_memory_manager *mem_mgr,
> >  {
> >       int i;
> >
> > +     mutex_lock(&mem_mgr->process_assignment_lock);
> >       for (i =3D 0; i < mem_mgr->num_devices; i++) {
> >               if (mem_mgr->devices[i] =3D=3D iommu_dev) {
> >                       mem_mgr->devices[i] =3D NULL;
> >                       break;
> >               }
> >       }
> > +     mutex_unlock(&mem_mgr->process_assignment_lock);
> >
> > -     kfree(iommu_dev);
> > +     kref_put(&iommu_dev->ref, iommu_device_free);
> >  }
> >
> >  /**
> > @@ -80,6 +308,7 @@ int qda_memory_manager_init(struct qda_memory_manage=
r *mem_mgr, int max_devices)
> >
> >       mem_mgr->num_devices =3D 0;
> >       mem_mgr->max_devices =3D max_devices;
> > +     mutex_init(&mem_mgr->process_assignment_lock);
> >
> >       return 0;
> >  }
> > diff --git a/drivers/accel/qda/qda_memory_manager.h b/drivers/accel/qda=
/qda_memory_manager.h
> > index 7e38c8a18284..0949c0c213f6 100644
> > --- a/drivers/accel/qda/qda_memory_manager.h
> > +++ b/drivers/accel/qda/qda_memory_manager.h
> > @@ -7,25 +7,44 @@
> >  #define __QDA_MEMORY_MANAGER_H__
> >
> >  #include <linux/device.h>
> > +#include <linux/kref.h>
> > +#include <linux/mutex.h>
> > +#include <linux/refcount.h>
> > +#include <linux/spinlock.h>
> > +#include <drm/drm_file.h>
> >
> >  /* Forward declarations */
> >  struct qda_dev;
> > +struct qda_gem_obj;
> >
> >  /**
> >   * struct qda_iommu_device - IOMMU device instance for memory manageme=
nt
> >   *
> >   * Represents a single IOMMU-enabled device managed by the memory mana=
ger.
> >   * Each device can be assigned to a specific process session.
> > + *
> > + * The object outlives its registration: open files keep a reference t=
hrough
> > + * @ref, so a device can be unregistered while a process still holds i=
t.
> >   */
> >  struct qda_iommu_device {
> >       /** @dev: Pointer to the underlying device */
> >       struct device *dev;
> >       /** @qdev: Back-pointer to the parent QDA device */
> >       struct qda_dev *qdev;
> > +     /** @assigned_file_priv: DRM file private data for the assigned p=
rocess */
> > +     struct drm_file *assigned_file_priv;
> >       /** @id: Unique identifier assigned by the memory manager */
> >       u32 id;
> >       /** @sid: Stream ID for IOMMU transactions */
> >       u32 sid;
> > +     /** @assigned_pid: Process ID of the process assigned to this dev=
ice */
> > +     pid_t assigned_pid;
> > +     /** @users: Number of open files sharing this device */
> > +     refcount_t users;
> > +     /** @ref: Reference count controlling when the object is freed */
> > +     struct kref ref;
> > +     /** @lock: Spinlock protecting concurrent access to device */
> > +     spinlock_t lock;
> >  };
> >
> >  /**
> > @@ -42,6 +61,8 @@ struct qda_memory_manager {
> >       int num_devices;
> >       /** @max_devices: Capacity of the @devices array */
> >       int max_devices;
> > +     /** @process_assignment_lock: Mutex protecting process-to-device =
assignments */
> > +     struct mutex process_assignment_lock;
> >  };
> >
> >  int qda_memory_manager_init(struct qda_memory_manager *mem_mgr, int ma=
x_devices);
> > @@ -51,5 +72,14 @@ int qda_memory_manager_register_device(struct qda_me=
mory_manager *mem_mgr,
> >                                      struct qda_iommu_device *iommu_dev=
);
> >  void qda_memory_manager_unregister_device(struct qda_memory_manager *m=
em_mgr,
> >                                         struct qda_iommu_device *iommu_=
dev);
> > +int qda_memory_manager_assign_device(struct qda_memory_manager *mem_mg=
r,
> > +                                  struct drm_file *file_priv);
> > +void qda_memory_manager_release_device(struct qda_iommu_device *iommu_=
dev);
> > +
> > +int qda_memory_manager_alloc(struct qda_memory_manager *mem_mgr,
> > +                          struct qda_gem_obj *gem_obj,
> > +                          struct drm_file *file_priv);
> > +void qda_memory_manager_free(struct qda_memory_manager *mem_mgr,
> > +                          struct qda_gem_obj *gem_obj);
> >
> >  #endif /* __QDA_MEMORY_MANAGER_H__ */
> >
>
