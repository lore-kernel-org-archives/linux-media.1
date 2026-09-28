Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADC03497391
	for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 10:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790591790; cv=pass; b=rRXMc5YtvAhTqvr2vfIaqx77MyevO4ADjs8s4ykazQFXFj/yOkdBLDwFQyRMhYAQh7JKTH+ly4fjRYnTkqkwO7Sl/ng/oQqmH8bbyqlEzA7Aw+icEFMvrLY3ExdItYgysNVWh2dVHBw8SKE1Mjir9iBrT3mXWxUZ8V1ok+c6fNw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790591790; c=relaxed/simple;
	bh=D/BH9J1ogEsqsPYvMEQyOsTnVDH9r/FOH7C5pHSp/vw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iw7mJaGry45zyvo8Zu3C+kzKx2Np1oGoCwwyXsYDHqyve0hm8dhowPnB8mHIqk/v9iWqgJXyjyhDyMmQhw2/skAnHooRQ5V6ttFcEvNC/2Krrjzd+yiFbGVOzEELH5CZ1E9kHXCs/HA4dLzEe7+VYnWuoKi8irbPQm8keAIzhsg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UEKMa3ws; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WFgBZYmW; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UEKMa3ws";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WFgBZYmW"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S9M6is1603482
	for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 10:36:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=5r3bF3DAcBScXo0yMOsFEJMrNwU9r04sHzpC0amVEsQ=; b=UE
	KMa3ws2snyhkw/6ZrN6eFwze15N5bLPP+jLQo2iuE3sWa2PaR9WXWTk/4iWFZ/1T
	t7kxob5iPGt93hQyAEiD3QR37tn/nTs3eEuNESGwev3eEBmdy0I0+kC0baYEPoMn
	sWQi7Y/scF8Eh7bJxV775bljLnWIzXJaJZfK5nVyx3HedurVRSUisYcToZpOvQDj
	/bnToE4XqGDiXuCyyuz8ppoizsytQt+IDuvzpBMvQNDuj76F/Lv5SrB3CZi5t/is
	aXATBeJi8XPsnEAGTOWXxNkuO2l+iucmddi2oD2BHTBTVasfVyxClbv7VW8wojhQ
	R7hlCBi04bPw5lNbB2aw==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gynb6gapq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 10:36:27 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-46509ab0149so3374711fac.2
        for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 03:36:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790591787; cv=none;
        d=google.com; s=arc-20260327;
        b=DeLrefOSlS9/ajS7R3b2kXNFmDvDEuiJLcfF6TR+PxKsyWmxEQRCijPkGk+gy2Fi1f
         46tcxxH9tR6/GZZZt9ysknq39/vls16ickGX0roC8MP6V7LlG8iFKwy6PmIP5Dq30rwo
         gfdwVm626YG4/z+Ou72jpDbJBNIIQlUkNnTCtSaIzGM03Oe7ieDu/wC5Fs1g5xcRuT/V
         hNcobcfQ3SeJ9ANachumI8GIhKuRk/oZis9YfCsh7fju5iT5vdZwzMe87dgwkFGTXlJG
         jHFFJ686kH1eLMyi//yY2AMjXNUX1+4wJp8SETzAwlNLuj8p8YLu+WqKUl7to0lkIQ4F
         Jn/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=5r3bF3DAcBScXo0yMOsFEJMrNwU9r04sHzpC0amVEsQ=;
        fh=bY405BiK8P1+6rvebZ9sjNl6wRX/dwzBtZuJuRgZ9G0=;
        b=B3tXWj5WdGPyTRMRzj3wHxdYqcNzTDXGYv35NaQH6/d0GZKdE0y6hTHpckSIZ519kd
         tgbZDPigZnt0GTmS90NtPbNXPbXm5u2a8ypwJa0GzE8HlPtV093aFPo/brVqXoWUAJv2
         nM3OvjNCKPmsGgsLbTxvTh2slKa2rshnRZF1YCxR1ygSeIl6cQZMeHZUFM5kJg+OFgl+
         xsBROux4lK3Wkr8TTF4tR7zyPorXXFP81qYF999ct9FUwvLzjMuRe5K1H5L4MOQ/7Qpw
         uV+tMO+ce0Pz2AqZZCBocAuvZDlFNgFAAvFaBOzTu9T+qDhB6JfbhlEoYjq/G8mu6MOc
         J2Ag==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790591787; x=1791196587; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5r3bF3DAcBScXo0yMOsFEJMrNwU9r04sHzpC0amVEsQ=;
        b=WFgBZYmWnkDPb3zfw4Og6qIze+kKh8zx6eTONOLwAe6yrij+xQtSb/tpVXwT9LiVH6
         yd+z7o3pgtaYKWBfdQXqkIWax/mdnbcTO1N2nIrzfmR9gH9AbauMkEopjpYtjfEDGLAG
         BIce0HC2mUIo4+RrXlTTjbZ4/1i9qyP2ItrbWlFMaHTHIi0G/U+Garu6c7cFU9p0jvr+
         TzYf/easKbfkxkbk8rQ2zkePQQzcUBIp42f8RFbDxuiH2Tes4z7bHjYSJe9GRbGLF+9J
         RWQJCVbwh+f4ivvFROnsvXBe0Qj1WJPNzkLvfANTVow0ohBssO1rKob95Lem50vlMQtg
         ieSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790591787; x=1791196587;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5r3bF3DAcBScXo0yMOsFEJMrNwU9r04sHzpC0amVEsQ=;
        b=g0ybstO44lNR9HYrgZeOjAEu+P83PxNpsL257VsjJq/yEY1LAJhn85AN+tNJs7OYlS
         IZVP769/Pzh01Ta0RotmFR2HPD3lvytVaayK1m9i527PkGCnHIeICpIvMc/GA8jlyyzo
         Ruzv2Uw7Lfik9k93lmmzfJFt5lRzTXilB2HjbHpnLNORbHGGyR1SGHKeBHaKciqzlS2c
         VVppgM053Ne1aOO69R7uiS/66kJoEH8AEjf9sRmfqYsu1Stn5woY70cYrrIasD2qHw4y
         xU4uy7GA3I1POcqY0J30+OZJfZ8lg1El7f7jEAoQF7AF4GpXvmygsPk/5Ut3qfu1C4XM
         5sXw==
X-Forwarded-Encrypted: i=1; AKwUvBzJMB6TUz8poRzlD2uCriWdBz6a21S6fyOiqEd42BNfY4yPNsobLAgDKwVgxMiAjsiYjIl1vrdndDhy+A==@vger.kernel.org
X-Gm-Message-State: AFq9FYKFtCC4R3KNRaAcXMqkitE5PYFYn3gmV99ZC5hwVKemDZZ53H1Q
	zLGCGs21aAXHWxoW3aIauRLhF7WvZGnWLOUZbI2NkONmWFtpsu1FhPITsPDwmHGS6t+VStTSqlq
	uH6syjHwyhIYja9YufUi8JCTG2UKEcSmYa/9rFyUeOMd2N5VtenkvUWfBCGUnK43+9pmHEaFOPY
	stO93jo8J34+oO8frVos1wfL+vt37Jf41Wu9pp+2cd
X-Gm-Gg: AYBFou1aIZYtWqF/nL1OFCJK3zMf1xtM7Ma8eHeBT24KTvxOlDJseYKmONZFUIWjrQu
	yT1MubFpqBiGco48aR38+8M/Xf5A+t5ykVmKPDA4hWG5z0WuYgB03L8kuldJvD+sDSmgBV/jqKn
	FHNC2KfIaZCVCeRYZty/DUJXiGHQXIoG3QqZNKKNxAWxsT3PeZ6ePbXLxY
X-Received: by 2002:a05:6870:4191:b0:459:2c03:6302 with SMTP id 586e51a60fabf-491e7c8558dmr10994502fac.11.1790591786830;
        Mon, 28 Sep 2026 03:36:26 -0700 (PDT)
X-Received: by 2002:a05:6870:4191:b0:459:2c03:6302 with SMTP id
 586e51a60fabf-491e7c8558dmr10994490fac.11.1790591786402; Mon, 28 Sep 2026
 03:36:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260926022026.10539-1-liujianfeng1994@gmail.com> <17bf71c6-2442-4eaa-847d-29ef625870bd@amd.com>
In-Reply-To: <17bf71c6-2442-4eaa-847d-29ef625870bd@amd.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 03:36:15 -0700
X-Gm-Features: AclHuK9OFDOKbtyMdVZk9UcNKkIrCoCtIosFdiGWTbBmrYE1uul2FMwD-M7M8cs
Message-ID: <CACSVV02WCQwQy9BpUUqziQTtKV7QyJruiM+iTiLE_SEVKtpVNQ@mail.gmail.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA0MiBTYWx0ZWRfX3NHsRg68ymvH
 /WHr5UENYcztsbOTzqOAq01l7L2MLLjvM0pOkNJ6iSICdn5rRD8BVP7qWlrPm84Favi7mBNYEw/
 4ZsqEOxolMJzUrnlH1MZOBqfvK9qz/SoNsrfqZYF9Snx+IKLWwTuM78PT1zu/SiPlwLSEgrsM6q
 FBgesuDKw3EDcwUzMm7ID43CHadfo7i2JqsXNEWop/U0BvwIn1AAprsico7yyQn6N0O/3hqvF53
 cWG992FWGFSKLyxZdt9MscvTJdvx1ZLKu3s7qgXizCOQ2hKYsrFtjH/f3WQFjtVyzo+JM7XXd06
 mK0EqZ5Do+xqPC//gtIosolVqgc+gTSaF5pdLe6sibVIjRKmFJaBCRRQHiqj5kX8wI9kaawjJgC
 NcMpIDRtr6xrkAoe4VQrk10az4XUPWQQerUouDmWtCmbnxZu2vx/GfmxoTMjxvBunhVpaDeIgRN
 +gdJALgV5rk3DLZxhBw==
X-Authority-Analysis: v=2.4 cv=K+e3jCWI c=1 sm=1 tr=0 ts=6aba432b cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=zd2uoN0lAAAA:8
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=yt45555V-HXmRlmp1V0A:9 a=QEXdDO2ut3YA:10
 a=1zu1i0D7hVQfj8NKfPKu:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA0MiBTYWx0ZWRfX8JFCZKgoyv6q
 WBzueC5khTKjFF1DOlfvw++r0Fh2U9jJ0ZqPlsg17OiiB3LjAEkrUdzadmMYz1IREx0IqJKAQZT
 j4iDeO0BdRXAqJiSNdU8KOijX5tDFzU=
X-Proofpoint-ORIG-GUID: eEaQJ87otncjXZ9DQ-naxEVesFrNmcqM
X-Proofpoint-GUID: eEaQJ87otncjXZ9DQ-naxEVesFrNmcqM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 spamscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280042

On Mon, Sep 28, 2026 at 1:19=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> On 9/26/26 04:20, Jianfeng Liu wrote:
> > That commit fixed a dangling reference in the DMABUF_DEBUG default
> > and thereby enabled the option - and with it the page-stripping
> > sg_table wrapper that dma_buf_map_attachment() hands to importers -
> > on every kernel with DEBUG_KERNEL=3Dy, i.e. virtually every distro
> > kernel.
> >
> > drm/msm is broken by the wrapper.  Both of msm's map paths consume
> > sg->length and sg_phys() of the attachment sg_table:
> > msm_iommu_pagetable_map() for the per-process GPU pagetables, and
> > iommu_map_sg() (via iommu_map_sgtable()) for scanout.  The wrapper
> > zeroes sg->length and strips the page pointers, so mappings of
> > imported dma-bufs silently map nothing, and userspace observes
> > arm-smmu translation faults from UCHE, e.g. during hardware video
> > decode (clapper, chromium) on Adreno systems:
> >
> >   gpu fault: ttbr0=3D000000088a889000 iova=3D000000010741c000 dir=3DREA=
D
> >   type=3DTRANSLATION source=3DUCHE
> >
> > Bisected on a Snapdragon X1E78100 laptop as v7.3-rc3 good,
> > v7.3-rc4 bad, culprit 143755bdabaa9.
> >
> > Switching msm to sg_dma_address()/sg_dma_len() is not a trivial fix
> > either: those fields are only valid for sg_tables that msm has
> > dma-mapped itself, which native non-MSM_BO_WC objects' sg_tables
> > are not, so the conversion needs more work.  The msm maintainer has
> > therefore requested restoring the previous default for v7.3, to be
> > revisited once msm no longer consumes struct page and sg->length of
> > imported sg_tables.
>
> Yeah as I said before the problematic part is MSM here. We have enforced =
correct driver behavior for over 5 years now when that option is enabled.

The problem is bigger than MSM here

> What we can do is to mark MSM as broken and/or give a warning in MSM when=
 DMABUF_DEBUG is enabled and you try to import a DMA-buf.

sorry, no, we can't mark MSM as broken.. we can mark DMABUF_DEBUG as BROKEN

BR,
-R

> But making the check not default to enable on debug kernels is not an opt=
ion. This check here is exactly to point out broken drivers and you can man=
ually disable it.
>
> Regards,
> Christian.
>
> >
> > Link: https://lore.kernel.org/linux-arm-msm/20260923074256.9357-1-liuji=
anfeng1994@gmail.com/
> > Suggested-by: Rob Clark <robin.clark@oss.qualcomm.com>
> > Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> > Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > Cc: Karl Mehltretter <kmehltretter@gmail.com>
> >
> > Signed-off-by: Jianfeng Liu <liujianfeng1994@gmail.com>
> > ---
> >
> >  drivers/dma-buf/Kconfig | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/dma-buf/Kconfig b/drivers/dma-buf/Kconfig
> > index e4f078a326a41..7efc0f0d07126 100644
> > --- a/drivers/dma-buf/Kconfig
> > +++ b/drivers/dma-buf/Kconfig
> > @@ -43,7 +43,7 @@ config UDMABUF
> >  config DMABUF_DEBUG
> >       bool "DMA-BUF debug checks"
> >       depends on DMA_SHARED_BUFFER
> > -     default y if DEBUG_KERNEL
> > +     default y if DEBUG
> >       help
> >         This option enables additional checks for DMA-BUF importers and
> >         exporters. Specifically it validates that importers do not peek=
 at the
> > ---
> > base-commit: 93f51579e7df248780214094418f205253383cc5
> > branch: revert-dmabuf-debug-for-7.3
> >
>
