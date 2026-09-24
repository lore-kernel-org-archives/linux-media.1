Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 013514A3F2E
	for <linux-media@vger.kernel.org>; Thu, 24 Sep 2026 15:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790263450; cv=pass; b=hEiZvl4Osrwg9+Pz1L+Lm3pHroNDpYVrM10HWL2BHweJ6wj3oa8gDp3ef9r92d7mflta6oEm+rgeZ03i6/fdnSaQiTg//tab8ymAHq1TL9tCsyag7FZjslJICoN7StJaeZhvRnvTzTevUtZQ+eXm/p5ypGF6UAfd5gH+NxeKWS4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790263450; c=relaxed/simple;
	bh=1m8e2wOsqMrgDPaj/O0eKa9TALGEmusZLoP/vnx03i8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ao2ejVHkh+qBN7vn70BzLEAjofYWAZABZ3BqLmlKADlDNgSbXbzR20zjeHueSMyQcOBtcdqFsa40kYDUBtPEduM+NSpJvYEGHPpC/82V7nc6mbMBy6aUz67rYq/CiXoddTtDNHxGHKqA6FxwgTI1kUXjBlojXfWzuBbnD86+PUg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BKFiGTAa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WF+dx1bq; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BKFiGTAa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WF+dx1bq"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OClOq22225156
	for <linux-media@vger.kernel.org>; Thu, 24 Sep 2026 15:24:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=iSJGEOaWnOQsAtOO7cFRQJIYsioL8PCNRmlmGKoYK+c=; b=BK
	FiGTAaK7AiaGU4i0w/nY558Yucoas9ghxuei1filSjCk6bNgn7VSxk2s8K2gH58H
	Fezr0EOweVAJviAX0+Oo6RBjjBi6R/0jnght5FEMDJRgS9jappmj4c1ienF9LAHg
	ofSOb2yngGblENDPZ9o7j9yEaxR7MloOVi5BbEZ+Lw7Xvaf++2RL4coYqyHhqL4L
	KOMcjg5UGz893ArL05LZcEQB+UxlDd6PbnWDcxAXjF9vyxTiyutrIbQc8sAcBASe
	4Jhr40/h/G8dCvkTw8sUe9vOjzMkT9X7I3KZxGiXooob8zZO8cFfXO63QwL9hc5G
	bafdE1KzaSgKLiBOyEzA==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw4650ne5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 24 Sep 2026 15:24:07 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-44899f99756so3432390fac.2
        for <linux-media@vger.kernel.org>; Thu, 24 Sep 2026 08:24:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790263447; cv=none;
        d=google.com; s=arc-20260327;
        b=s+xhjNjNky33FQEcxuGhHCq1ekhtcLMYKu4Ra8i2uEWkyZfK/Yo948TC7htFosZ/CA
         XPgl7X07wMSTwAETWUfp5DfIECWLYaVczBEnYpC2Ne73oRlTNxLjK0YD5q4eWWBF3fKY
         sapnCFSCByeqvxZ35UiLAxqSGmQN8Vrw10WM6SpCKsPbxtgX//ysXusvemSLxL8Bew3R
         Kp20ej4VuUrrc9LnRxxE4+91tW+mSCcX/arRigWD3EgxbgUQERY94fay51NcP4D1Ks+7
         v0XYQR/RhBbcXPm/MH1S5wRxfJbIVwwek2/9Qmx/xodrrMSxI/Ekhst7lq1/PrIUU3WD
         MTWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=iSJGEOaWnOQsAtOO7cFRQJIYsioL8PCNRmlmGKoYK+c=;
        fh=jGvaNdcuHr1Ke5zp6bnEC2KO/HDURFKSZE7auO9pABY=;
        b=CCoAN1Mr0h+RTxUn724PKJtO+0fy3veU6bCY4fmeqcZTwEVQFecPbzY3Th0CUn7F9V
         Qqf7d6m7KxCFMufC60ZmJ5WLOKNQty6PpIR+GaPqnqlBFbf/YUdn414WckksNtwYSEtR
         L/P/1/EgKNMgsEyD6bE1r5ygy0XJwVCDNMB0/+ldz8lC3A10+CZ1iLJiixTVBDrhYpjU
         P29wlKMeoEd6zogle/ldMMOFtt6PTgm3qRsxerpGAG0WOXo677OeAeX1RgKEjSmOSMb2
         ScDVQQccqs5RPeV6G3fw60Jha7jmczKjLGt3F9QyGTND+TDeJyI9AOCBN8q27dHOkarL
         /Vmg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790263447; x=1790868247; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iSJGEOaWnOQsAtOO7cFRQJIYsioL8PCNRmlmGKoYK+c=;
        b=WF+dx1bqnN9ArGrO/OHg9+/NsTkV35+aRnnoORvRCK6B+UEaqOT61E4rqDIlLtXfKu
         YAAoJH4gQ/YEooxe17S2D2Ou4zMmOIg+qbb5YeoEWgJ9lk7c6+1NUq7wJ+YUlCA7yLLY
         TvLFDTfj5kU3fGgz2VP49xOkZBbZzuauyQzEB7FgU+dVO7IrxsDl8QoHdPA84ZXze7t8
         5TDHnRpABlngowmsthTWW6kK87iH7WzW9rjfNw5Zg5cJZ5lLe36XrAgnjq/ugXSV7A19
         ll2FMkRYlJNV+pstNY8tyve1d2YW6BxazRDwN6BAqlexpim2GJO+SpWRHiACgDRG0fq6
         5MYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790263447; x=1790868247;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iSJGEOaWnOQsAtOO7cFRQJIYsioL8PCNRmlmGKoYK+c=;
        b=oEM7PpNJ1a0jZRCXSn/T96XDCLL2b74jeJ1ndy1HB2jJHvCdK6VFZdV0pbXYIHX27K
         qUXWgA+UGXavX29YQKILbg3KRtGChWwzHdG473w8uG0sMRcplKiVJqx2EhXSqJ0ZnKKC
         PnwBI9M9A6QpxkCzlcmogUSpl46QO7qIyoHUk7m4AfNUHx0owoVg3/fj9p5CHbjKs/8a
         CfNLRDmPNCW3YzANHbQ7EGvxhbDen2b0cfS32XNIDjLBIJ+BiUmG0n02aiKGX1tfybzN
         EAwrjTDszVmdyY14VWcxJttS6jc12hcwAlqRTcfym2UruYzaSpm2ovLDSTQey3n5ffdn
         oqsA==
X-Forwarded-Encrypted: i=1; AKwUvBye7ua80vQQZZX8UAN0+FRf6XyfOoX8LYNJnarmwSQKIii7pJiH9bkZ2tjdqMz5afBwXWQqSJslJznh7A==@vger.kernel.org
X-Gm-Message-State: AFuF++n3q8W1SaCPOtvbbj45oh/xty2o+PL7OmHnRW3IT0QDFN8ShbzE
	km0loprTPZY1bXSrh9BHH4irb5o7JmtRqDX76YfqZIFp0JrZ77hQKyvmS7uWIbzJhPesdRqYw/I
	t9O/n8NojG0hs37LSQxTKQPsBBbpUB/DQiu4fc2H6qOl/fSoiHJDThQO2sEipLNtXt9/SD46IHi
	W2lyFmjMolLuwGclLgCThU0euurJDYNAuL3fTq41JJ
X-Gm-Gg: AYBFou0nsfY1TxzKtn3vQCmHrXAJ9Cx+0kvpVxziT6toH8mU31BX/OlmoDKhTiUIiTi
	3otYWWAQjpWEXIO0MzfnlVItCj/Tp9zflyR/AMIDO7TTo080DfWmOuaw2DMNK+EgGDsyLXJh8rG
	gQYy552mZBi6s5Tx20+88YzUVGUX/p0InefdDJYiYCpstoVkj9cfV7M8kh
X-Received: by 2002:a05:6871:7c04:b0:475:e235:8ff with SMTP id 586e51a60fabf-491e6ded9a1mr2702861fac.29.1790263446448;
        Thu, 24 Sep 2026 08:24:06 -0700 (PDT)
X-Received: by 2002:a05:6871:7c04:b0:475:e235:8ff with SMTP id
 586e51a60fabf-491e6ded9a1mr2702840fac.29.1790263445947; Thu, 24 Sep 2026
 08:24:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923074256.9357-1-liujianfeng1994@gmail.com>
 <fe3a4297-f300-451d-9763-0b3016706111@amd.com> <CACSVV01NZROH9U5Qjd1TSDu+BPyyPLC9pFByqSfrxXrPJV+wZQ@mail.gmail.com>
 <20260924145419.47354-1-liujianfeng1994@gmail.com>
In-Reply-To: <20260924145419.47354-1-liujianfeng1994@gmail.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 08:23:53 -0700
X-Gm-Features: AclHuK_WRAYAvS2UWB0hTgewsu2euKPCpECh3qJVYbGPrKE7NCVbxLwrzOLrmGk
Message-ID: <CACSVV00tYa18fijNfSSwzE8tgYVqHK5yp4zohwdTgvyNK8SREQ@mail.gmail.com>
Subject: Re: [RFC PATCH v1 1/2] dma-buf: keep DMABUF_DEBUG off by default
To: Jianfeng Liu <liujianfeng1994@gmail.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: "Bryan O'Donoghue" <bod.linux@nxsw.ie>,
        Dmitry Baryshkov <lumag@kernel.org>, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=Wrq+otfv c=1 sm=1 tr=0 ts=6ab54097 cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=pGLkceISAAAA:8 a=ntJSuBRzbTKlmYc5m18A:9
 a=QEXdDO2ut3YA:10 a=y8BKWJGFn5sdPF1Y92-H:22
X-Proofpoint-ORIG-GUID: FInoXUOB2TfLKs7g1P_C7MvfN2m-5jJD
X-Proofpoint-GUID: FInoXUOB2TfLKs7g1P_C7MvfN2m-5jJD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA2MyBTYWx0ZWRfX3IMxncnNlJkd
 VzvWv4PF0H/lflECyRDV1G1ac7TYEChajQ06Vj/VUfBCj0wdYvA7lUkfwWuvAMSIujJXnLZtxn9
 maShWS+ClxJwElCEej5IU7P33509jU5VeiKsB6Wpw6BgCKN+tnjFZn6yhQjulVHxnvW11akgIU2
 qnVL1aTSF5Z2gJsLO004VHK5QygPkJqI6uiZG+M4tJ4cZZJIfa5flLlHWuI77j4RXE+fy5jyZFU
 hdZ1sOIE0rkPYFx0l89g67rgrscK+LLCCl37yLspWa6XOv+dHVoe9g6tr2k4kmL8ODpAQgrmKOJ
 R/cIVE3ebUqh+NCn8WqQXSZUlmeYafXcXo0lYHwash3hxs7cNc4ZKjbEeCZPQsGLrlbmIArwy3T
 0trbewt9n+/nKLa2AyZ8zov85zrMHGPPWStVNQB4pzkRRdrePtfaMUqkapG4aXY4RVJRw6kiCsN
 Im01lyuBjdqlSx8dKtQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA2MyBTYWx0ZWRfX9FdAwVT8WOAT
 LDcSzcF3r1AiP7vFvC9TzTrD20Uk4l9hXDSKrw1Jb1TgbcIhJPjeLfPmGcPA7a/NPDw8A4/9bP1
 B4pscvpyVtt5tabI8EV5T6PteYCCe7s=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240063

On Thu, Sep 24, 2026 at 7:54=E2=80=AFAM Jianfeng Liu <liujianfeng1994@gmail=
.com> wrote:
>
> Hi Rob,
>
> On Thu, Sep 24, 2026 at 7:01 AM Rob Clark wrote:
> > So the assessment of what is going wrong looks pretty wrong..  VM_BIND
> > should never lead to iommu_map_sgtable() (which is never used for gpu
> > per-process pgtables), for example.. but is used for mapping for
> > scanout.  And pages are never used for mapping in either path.
> >
> > However there are a few places where sg->length is used (in iommu code
> > and msm).. AFAICT dma_buf_wrap_sg_table() zeroing out sg->length is
> > what the actual problem here is, rather than any use of struct page.
>
> Thanks for the correction - you're right, I mis-traced the GPU path.
> The per-process pgtable mapping goes through
> msm_iommu_pagetable_map(), which walks the sg_table with sg->length
> and sg_phys(). With the wrapper zeroing sg->length it iterates the
> entries, maps nothing at all and still returns 0 - which explains
> the UCHE translation faults without any error anywhere, and is a
> nastier failure mode than the async-bind-failure story I wrote in
> the commit log.
>
> With that corrected picture, DMABUF_DEBUG=3Dy breaks msm in the map
> paths themselves: msm_iommu_pagetable_map() for the GPU and
> iommu_map_sg() for scanout both consume sg->length, and
> dma_buf_wrap_sg_table() zeroes it, so every mapping of a
> page-stripped sg_table silently maps nothing. On top of that msm
> also uses sg_phys() in those paths and
> drm_prime_sg_to_page_array() for the page array, so even with
> sg->length preserved, page-less entries would map garbage
> physical addresses instead of failing loudly.

oh, ugg.. I overlooked that sg_phys() uses the pages under the hood..
I think using sg_dma_len()/sg_dma_address() instead should be fine in
msm.

Otherwise, (other than the fault path) obj->pages is mostly a proxy
for "is backing storage allocated".. we could just use obj->sgt for
that instead.

> So it looks like this needs work on both sides:
>
>  - dma-buf: preserve sg->length in the debug wrapper, so
>    sg->length consumers at least fail loudly instead of silently
>    mapping nothing. I think that is what both Christian's "we
>    should probably change that" and your "zeroing out sg->length
>    is what the actual problem is" are pointing at.
>
>  - msm: stop consuming struct page and sg->length of imported
>    sg_tables, i.e. build the GPU and scanout mappings from the DMA
>    addresses, plus the drm_prime_sg_to_page_array() cleanup.
>
> Is that the right split, and is there a preferred direction for
> the msm side?

On the msm side, I think we should be using
sg_dma_len()/sg_dma_address() for the immediate issue.

Maybe we can just do the same on the iommu side, but not sure what
various sharp edges might exist with other iommu users.  We could also
just stop using iommu_map_sgtable() and inline our own iommu_map_sg()?
 It looks like there are a few other drm drivers that use
iommu_map_sgtable() so it might be worth at least trying to fix this
in iommu.  Presumably if there are issues with that approach an iommu
maintainer would speak up.

For the longer term cleanup, I think we should use msm_obj->sgt
instead of msm_obj->pages for "is there backing storage", and allow
msm_obj->pages to be NULL for imported dma_buf's

Given the late stage for v7.3, the immediate thing we should do is
revert the CONFIG_DMABUF_DEBUG change IMHO, and try again once we have
sorted out what to do about the iommu_map_sgtable() path.

BR,
-R

> > (And yeah, I should get rid of use of drm_prime_sg_to_page_array()..
> > but that cleanup that I haven't found time for shouldn't be the
> > problem here.)
>
> Agreed on it not being what produced the faults - but it is part
> of the same contract problem, see below.
>
> Also answering Bryan's review of patch 2, which is in a different
> branch of this thread:
>
> On Thu, Sep 24, 2026 at 10:36 AM Bryan O'Donoghue wrote:
> > Why is the fix Adreno specific ?
> >
> > Shouldn't this function be ammended with
> >
> >  > +    if (filled !=3D npages)
> >
> > instead ?
>
> It isn't meant to be - msm_gem_import() is the shared GPU/DPU
> import path. And putting the fill-count check into
> drm_prime_sg_to_page_array() itself would indeed be the better
> generic version of that guard; I checked the other callers
> (etnaviv, omapdrm, vmwgfx, xen) and none of them expects a
> partial fill either. But with the corrected analysis above, the
> page array isn't what produced the GPU faults, so neither variant
> is a real fix. I'm not asking for either patch to be merged - the
> series is a bug report with code attached, sent to get exactly
> this discussion going, which is also why it carries the RFC
> prefix.
>
> > This very much looks like an LLM generated patch - the commit log, the
> > large comment in the code and TBH the solution too.
>
> Sorry about that - the patches were drafted with LLM assistance
> and I should have declared that up front. Any later version will
> carry a proper declaration.
>
> Thanks all!
> Jianfeng
