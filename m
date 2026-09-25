Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF273E49D7
	for <linux-media@vger.kernel.org>; Fri, 25 Sep 2026 17:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790356726; cv=pass; b=k2JTopyx7/I3aOK4r79CLEYSXAYupl3JgRSb2WRdmP9BnEGFOgJpsbc4729R+geEcD6S5C3xbvckz69U3FIHjOSEp7r4izmSmDeuzf1JU6c41/tiWWGnBVLXhR9pBjhD0En/Wjkzv0kSRhE8N3gKEF8y0gtA6wCE6TjDM78t5ko=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790356726; c=relaxed/simple;
	bh=qo0Pvlant2tqAkK0E4yhyM6y0yWPa88IF+SZ5h2MERQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o+TCvmReDX+QNQoVB+3f5xEMQCzAbxK/qGeY6nfTR5K6XcJ1IVs+Emcs4LAtPSeMbYXn2DBEPfq1bn4a1dS1gzZEXolKU4uJkXzWZeY8vrzsjKFuJTVfrwPBFp00DPZKeEehC/nlCdm6H/PjU11QlVlgaSDSnTFeJmmjci3gkbg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QCiX7juX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YPSmyVoz; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QCiX7juX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YPSmyVoz"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PG0YmU170064
	for <linux-media@vger.kernel.org>; Fri, 25 Sep 2026 17:18:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=wlPheSorNXC3rOtR6BddKKv8TdJJ+ajZdWoaUxUSYcY=; b=QC
	iX7juXbh2Qhd4o2YIlA2o1bVApnsTTUkzsnv15kJAoUxv8RNuRFEx44kbww0qe7g
	NULoYGNVCFTJDkbi9DSJrvV/W5g9ebMAeZ8zq1ce02qeiGEaRKDaqPZ1nUC5JS1P
	R/Z8VS3VBCj7QOI38+eIEbJVfIpJ0FzwNnZgB7eu+OEHzp/v25pFfwg6lS4seFHh
	dlHWgFD4l7a0B7WOBkfDZX+y3GcpMMRudxC7bcuzNKiuwAttpAlWHSPpRYMKWCjL
	3VX4zSKjYdu4vvOlKp83ue7WK02cgzakMWkWeZzydIcm+X0XtbXM/GDok2eP0YSx
	jCOdpIfBZrSi5r9XciYQ==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwhm52jgx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 25 Sep 2026 17:18:33 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-451d80641efso1858557fac.2
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2026 10:18:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790356713; cv=none;
        d=google.com; s=arc-20260327;
        b=evVS08LoBupmf/7LkmEoEC9hFd1BOmOq7D9KH50GPN3ClLgOHAnjCpFSUuwysxkVJd
         80cSXI6lMsI1/GQ/DATUAaxcackjwufqQuIVmTtIn98rmiiLNrnVjwL7LY+2gv+94hZU
         dC+HPfAFxDMP1PkFc6BkVj9uYsROQEiw5eiYfsDKKwQeXzlZdXwTV4quD3Ryn0SBE2l5
         iMD3Ak37ytU47IJi4AsFgveJv+vrGuWf9sGh9jc7lnU9PSKXvHxh7gdLQohP8KN91VBz
         gRyLnZHme8VJ9UMeLLXEfHG14FY9zJWbNCuHPd8TvgOzUH5vVKkRwcVmCOIRXZwW7BqZ
         f9JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=wlPheSorNXC3rOtR6BddKKv8TdJJ+ajZdWoaUxUSYcY=;
        fh=T5VQDSe53HjuAKPxLIlOu6pAuQLa0XMbcyelg25cizg=;
        b=mRGup80xi1EO//w7SHE6ueIPtALWhXDsRLGAtp4/BqkcrKm58s4SNTdRM0gfI+QO/f
         7nIxSy1h8ddWaU/SBm57rvqd8aoYwInp+8KStN8TQJSodY7XshxHLLbynYa+uNYGQn8X
         G63EBYQrOSTUROKSNvNDaCOO6G4fUFKuq+ib61JZS7jx6ufndfAFsTSmFzCUsBQFKfsB
         nGbj0QsFsx1a4lUlfRrPlI2B6EUbk/H4XnsvX+wYjwNBolq0/mD3Gefjy1QbiCepkQWK
         kN0oMscXA03iUcVjspaBkHyZzONyNXDE1GKg4AVQdc1soZFLVdavzkAD2csRUQNGGRtU
         UvAg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790356713; x=1790961513; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wlPheSorNXC3rOtR6BddKKv8TdJJ+ajZdWoaUxUSYcY=;
        b=YPSmyVoz15DoKXtVFqz1aJnzZVrtEnnQVzU86/7vbvHmyKABrZ7TJjvdopdOaUiZxA
         GjYENShPjbqA7jZ/ccKKJzCYVMmeS8zVAP6wjFI6K0fFZLoo5waxGD78sGMfd/dBrG5s
         bbI314lljWl9gUzntCgrASaXeyZO72NPWIW+vLMS8A1Khd7CX7aKr8Y09FfrNFwpnJiv
         IE3S0j/OFDXN+Nwj4EhZinChZi906Sykl9NGnhSXYKg2wE9AxBI40tcOlEwFAFy9H2Wx
         C/Ua/O7XHR0PzuEd9bcbJqW16IYqbo11bMjt70cXk2WE/vTS0JJ8Y/NDtgL7AZbYfW9/
         taSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790356713; x=1790961513;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wlPheSorNXC3rOtR6BddKKv8TdJJ+ajZdWoaUxUSYcY=;
        b=lEnwnqp+4fwidna+8PkYboYKcZ9VuW1btXqvgs5lrjXFV6i9HrFp4vh1EgcSA91Qiu
         2qtQjSG9Oa7edh7Vx1AakcEDdKXmBfFX1RZMav00L4wplpQg4fbK3Z4rNH6f67ctqyke
         jvn4Tq6Q6WmNSy/D2VE3ilMgY7irvO5C4LOn6PUKCPNuh6/7kxiAqrkYUTPvXgAPui0m
         8PbiUaAGqdZncmU5KsjhcrWIQhW5Tk+QaI/NgzcZkISlE23yR4IsgITEd5vwT5R7Qd97
         OZh+68fSRG2mN6pXeKVzaMq+HHCH3oPTB5FetRcrvnJsMN3s+RjdHaQk9flV4kyGT9He
         uvtA==
X-Forwarded-Encrypted: i=1; AKwUvBw/EFbXoS1KMZjjzqvozfb3PqoCdvyqJGdjKliFapaze9oGcmWF7HqlH8793Xf47aF4rmlfZjDVDjUpHg==@vger.kernel.org
X-Gm-Message-State: AFuF++mwBv+/PqQzJ26Fiy3vE2onGt2qCWoFAjgc4nvz+jgszUIRJoWx
	PP9X8jeV5ZNXNdOcG1/b+VnknqsAzQ9DYQijxpNHAZzRFOQdZ/AE3Yw6/Gvx2wIl6rYXRYrWQkJ
	5IB6Plbst6EAkKSnr4HpUZkG7yGscVtnFdq3y0RC/rm+yRO4RzysT/6bzlRFdA3Wv3M/Db/hCHV
	Lcfuto2t9IKY82YlMMdscG6iMfbVTc9yxVnH+DYM93
X-Gm-Gg: AYBFou2N18aNdGFpiMEotxl84nTp/5G80iVzE3BXTsS1mxflhQl8RwWoCVoExr8UlIW
	zefI4qEIp7IMBtqCclNxlvdVF8geO0kgUpi8VUGXindGyYrFI6zF9P5oeXzxI+kdoa0sLFf9SSc
	4dHJquI23vfnbMWw4OHUFEqHEAgRuToMqn0RQp9xNj651hEFNXc0AL2hnD
X-Received: by 2002:a05:6870:3453:b0:475:a153:2dc3 with SMTP id 586e51a60fabf-491e9fcab5bmr6173612fac.25.1790356712457;
        Fri, 25 Sep 2026 10:18:32 -0700 (PDT)
X-Received: by 2002:a05:6870:3453:b0:475:a153:2dc3 with SMTP id
 586e51a60fabf-491e9fcab5bmr6173571fac.25.1790356711799; Fri, 25 Sep 2026
 10:18:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923074256.9357-1-liujianfeng1994@gmail.com>
 <fe3a4297-f300-451d-9763-0b3016706111@amd.com> <CACSVV01NZROH9U5Qjd1TSDu+BPyyPLC9pFByqSfrxXrPJV+wZQ@mail.gmail.com>
 <20260924145419.47354-1-liujianfeng1994@gmail.com> <CACSVV00tYa18fijNfSSwzE8tgYVqHK5yp4zohwdTgvyNK8SREQ@mail.gmail.com>
In-Reply-To: <CACSVV00tYa18fijNfSSwzE8tgYVqHK5yp4zohwdTgvyNK8SREQ@mail.gmail.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 10:18:20 -0700
X-Gm-Features: AclHuK9fSyAIzoBNFWcWUoZ2puEB8-AtVFFp1mUdAjt1DjbWKFPGlOaH2m00xXw
Message-ID: <CACSVV01wPhaVPUtYCwHyQ8M_Egy2O_P6gPhGkoS04S2+FABSrw@mail.gmail.com>
Subject: Re: [RFC PATCH v1 1/2] dma-buf: keep DMABUF_DEBUG off by default
To: Jianfeng Liu <liujianfeng1994@gmail.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: "Bryan O'Donoghue" <bod.linux@nxsw.ie>,
        Dmitry Baryshkov <lumag@kernel.org>, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: SADlepIJpqHxs7B_pULzq4Cc8-Zm2-Zb
X-Authority-Analysis: v=2.4 cv=QYnzLcbv c=1 sm=1 tr=0 ts=6ab6ace9 cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=qnjczsnmBfoytaMDzuAA:9 a=QEXdDO2ut3YA:10 a=y8BKWJGFn5sdPF1Y92-H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA2OCBTYWx0ZWRfX4BEHe8M4i1u+
 8Azoave1H4SfvSpCHEE+ZEPptMRa7cBVP+tajBvl9dFJ9mMZ+HqGgNt0+DXv4hvd8Jg1SHhgpPM
 2zt1nxWZdsBwWD85ZJ9zHBXGIE90/q8cFUOVzcg+HTpsRQaQo1e92IXa6iqZ0vI/FBp+9mASW6w
 VTxRWsnyQtLisuTyMoEFDyWnc+TE550KCMessK+FkG/brPHT6GVyf0PFZmtS9ZnBns8P4UrCowE
 ank+SQXktCqsEdpgcfjkYfv2dsIy59vSyxQs28u0kE2+iuttzGpoerQNEkZ/ER1ahL/rYN5bmEm
 qb22p9qSwAd0axMD8ikJtEs5U8+W0V9grPWLtHu7d8N6E0klUzaksMn55t8g8MjSL5dxH0zzx6U
 ZEpLJ0HOgtE9E8DevcrP4HzRHRatcb9DF7C1KLU1U6ZmOx0+71MmyINrnkFL3i06EkkYL9yiLiq
 dKwzeL+P+Y2VNm9SuWQ==
X-Proofpoint-ORIG-GUID: SADlepIJpqHxs7B_pULzq4Cc8-Zm2-Zb
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA2OCBTYWx0ZWRfXwDXccXgcHaQY
 PkH6F8WcUiMRQzpgAGy+SIN+EkUIVwdJrJko1jpLeLNaTNUKxaedOfZ04CXlz60V/d8KS0MKfK8
 OYXMqsaJX2+2IIFa/nRn0tVPKbSSzsw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250068

On Thu, Sep 24, 2026 at 8:23=E2=80=AFAM Rob Clark <rob.clark@oss.qualcomm.c=
om> wrote:
>
> On Thu, Sep 24, 2026 at 7:54=E2=80=AFAM Jianfeng Liu <liujianfeng1994@gma=
il.com> wrote:
> >
> > Hi Rob,
> >
> > On Thu, Sep 24, 2026 at 7:01 AM Rob Clark wrote:
> > > So the assessment of what is going wrong looks pretty wrong..  VM_BIN=
D
> > > should never lead to iommu_map_sgtable() (which is never used for gpu
> > > per-process pgtables), for example.. but is used for mapping for
> > > scanout.  And pages are never used for mapping in either path.
> > >
> > > However there are a few places where sg->length is used (in iommu cod=
e
> > > and msm).. AFAICT dma_buf_wrap_sg_table() zeroing out sg->length is
> > > what the actual problem here is, rather than any use of struct page.
> >
> > Thanks for the correction - you're right, I mis-traced the GPU path.
> > The per-process pgtable mapping goes through
> > msm_iommu_pagetable_map(), which walks the sg_table with sg->length
> > and sg_phys(). With the wrapper zeroing sg->length it iterates the
> > entries, maps nothing at all and still returns 0 - which explains
> > the UCHE translation faults without any error anywhere, and is a
> > nastier failure mode than the async-bind-failure story I wrote in
> > the commit log.
> >
> > With that corrected picture, DMABUF_DEBUG=3Dy breaks msm in the map
> > paths themselves: msm_iommu_pagetable_map() for the GPU and
> > iommu_map_sg() for scanout both consume sg->length, and
> > dma_buf_wrap_sg_table() zeroes it, so every mapping of a
> > page-stripped sg_table silently maps nothing. On top of that msm
> > also uses sg_phys() in those paths and
> > drm_prime_sg_to_page_array() for the page array, so even with
> > sg->length preserved, page-less entries would map garbage
> > physical addresses instead of failing loudly.
>
> oh, ugg.. I overlooked that sg_phys() uses the pages under the hood..
> I think using sg_dma_len()/sg_dma_address() instead should be fine in
> msm.
>
> Otherwise, (other than the fault path) obj->pages is mostly a proxy
> for "is backing storage allocated".. we could just use obj->sgt for
> that instead.
>
> > So it looks like this needs work on both sides:
> >
> >  - dma-buf: preserve sg->length in the debug wrapper, so
> >    sg->length consumers at least fail loudly instead of silently
> >    mapping nothing. I think that is what both Christian's "we
> >    should probably change that" and your "zeroing out sg->length
> >    is what the actual problem is" are pointing at.
> >
> >  - msm: stop consuming struct page and sg->length of imported
> >    sg_tables, i.e. build the GPU and scanout mappings from the DMA
> >    addresses, plus the drm_prime_sg_to_page_array() cleanup.
> >
> > Is that the right split, and is there a preferred direction for
> > the msm side?
>
> On the msm side, I think we should be using
> sg_dma_len()/sg_dma_address() for the immediate issue.

Hmm, so sg_dma_len()/sg_dma_address() are zero for page backed sgt, so
it isn't quite so simple as I imagined.  In theory, it needs
dma_map_sgtable() but not really sure that is going to dtrt with the
way iommu is used on our platform.  And I'm probably not going to have
time to dig into this until after next week.

Please send a revert for commit 143755bdabaa9 ("dma-buf: Make
DMABUF_DEBUG default to y on
DEBUG_KERNEL kernels") for v7.3

BR,
-R

> Maybe we can just do the same on the iommu side, but not sure what
> various sharp edges might exist with other iommu users.  We could also
> just stop using iommu_map_sgtable() and inline our own iommu_map_sg()?
>  It looks like there are a few other drm drivers that use
> iommu_map_sgtable() so it might be worth at least trying to fix this
> in iommu.  Presumably if there are issues with that approach an iommu
> maintainer would speak up.
>
> For the longer term cleanup, I think we should use msm_obj->sgt
> instead of msm_obj->pages for "is there backing storage", and allow
> msm_obj->pages to be NULL for imported dma_buf's
>
> Given the late stage for v7.3, the immediate thing we should do is
> revert the CONFIG_DMABUF_DEBUG change IMHO, and try again once we have
> sorted out what to do about the iommu_map_sgtable() path.
>
> BR,
> -R
>
> > > (And yeah, I should get rid of use of drm_prime_sg_to_page_array()..
> > > but that cleanup that I haven't found time for shouldn't be the
> > > problem here.)
> >
> > Agreed on it not being what produced the faults - but it is part
> > of the same contract problem, see below.
> >
> > Also answering Bryan's review of patch 2, which is in a different
> > branch of this thread:
> >
> > On Thu, Sep 24, 2026 at 10:36 AM Bryan O'Donoghue wrote:
> > > Why is the fix Adreno specific ?
> > >
> > > Shouldn't this function be ammended with
> > >
> > >  > +    if (filled !=3D npages)
> > >
> > > instead ?
> >
> > It isn't meant to be - msm_gem_import() is the shared GPU/DPU
> > import path. And putting the fill-count check into
> > drm_prime_sg_to_page_array() itself would indeed be the better
> > generic version of that guard; I checked the other callers
> > (etnaviv, omapdrm, vmwgfx, xen) and none of them expects a
> > partial fill either. But with the corrected analysis above, the
> > page array isn't what produced the GPU faults, so neither variant
> > is a real fix. I'm not asking for either patch to be merged - the
> > series is a bug report with code attached, sent to get exactly
> > this discussion going, which is also why it carries the RFC
> > prefix.
> >
> > > This very much looks like an LLM generated patch - the commit log, th=
e
> > > large comment in the code and TBH the solution too.
> >
> > Sorry about that - the patches were drafted with LLM assistance
> > and I should have declared that up front. Any later version will
> > carry a proper declaration.
> >
> > Thanks all!
> > Jianfeng
