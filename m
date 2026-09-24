Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED60E37FF40
	for <linux-media@vger.kernel.org>; Thu, 24 Sep 2026 14:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790258520; cv=pass; b=BnCK5rL8Cy8saQ3aTwaXYObM8q6sVYHdSR9jGdNsNTWPyiytuRNJHeuRTxAfGv6xtnjlnTgGwa0EUuX4kuA5pFCqaH/0Y6oT49fkxUc9GZirUMsuwCQc7WjiLSxf6Lc+Gk0uEdPoVmKyhIKd0ZGvVPE8R8UoVV0NzSO58NXjai8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790258520; c=relaxed/simple;
	bh=tdJyJTnBDHp4ZjjlmGWLTbMPtruRmMD9xWxDu8H5VaI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZbJrFB7WGyJT7869bM+0GSdlY0Btoz9+RBwPmJB/NVcckf2rBTcIbrphgc5BEBgdqKoFX5F7sIzHi3I49bFJ1XtwsGVz95IeSPt9Kvw2a/+cRoWQbqR5cNRhA/5MeasaofeC0Z19xb7XHhFUEYDOBZ1VHryPTzvhGoC7JXMhkNI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BlgJG9IT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cqPf2Ee5; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BlgJG9IT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cqPf2Ee5"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OC4bHV3134162
	for <linux-media@vger.kernel.org>; Thu, 24 Sep 2026 14:01:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=Y+5dXl8x9fmntpeFxM19iIhvgt0k/LL7dD1+C5hddi8=; b=Bl
	gJG9ITL1KLa26czRDWH5FL6HTQZiUh4Aayd7GRzDH2YRHWbWFm1y19lHI2EbF023
	PKSHxZgkQPGZ57OxZ1T2cL7yOcpxC6JnLtFYMvh6/ls22YixeU2YCkFaYt+J7OHt
	qyhMk+nOQMnDctXoHdlUT62K/omXSESpdyysD7EglnJND1UBo3YfbZ5MJXq5tq/3
	ec7Q2Q7dP+7rIvVXBFG9wHD6NQnDxGrFfqfPAf9cSzMhPMgAL13rZomlnjTtklEV
	YlRQXY198PYemdgOzz0CQZyy26LPjGK/RjQfb0wflZ5jYjkB+xdgfRjXyPJLhyio
	kCBh18+ANf6JOpdp9uvg==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1ragxte-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 24 Sep 2026 14:01:57 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6bfcf73dcd5so2722898eaf.0
        for <linux-media@vger.kernel.org>; Thu, 24 Sep 2026 07:01:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790258517; cv=none;
        d=google.com; s=arc-20260327;
        b=XJjjcgz/VEKy2KQBBuO2BzCVgiABNAbQqPMy2c1CMRgs7loX+FqVZTSFgHLzKP5BUM
         eKi5vtR3b3GuP/vwnTAGAAzrNaQSKuiXeFulQQ9Y5cDPjsEKeg+2+COzBDd1UFGETKqH
         DSNH7ci8jMDgbWl6QGai0MqsC3TDbaAjm1y0zo65LLdFc+ZI8pvHkFA2YAf580Vd6f6a
         kKGDEuDW4cITLgmALh110ZquiVF0fVRVfCATXIMKGyuAhzQ1vgGWxXIITKooPP+bCscS
         Y0EIJXC5OOGss3XPRagitXbYTmbp1zFjtQdHaSFQ39TT2pXDKWleT46zIgFMrUokD+nm
         VtXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=Y+5dXl8x9fmntpeFxM19iIhvgt0k/LL7dD1+C5hddi8=;
        fh=H4s8/ypVQyinMO991crn/hiwBiGFC4c6GxAOrlowmVM=;
        b=d6s+chwOkRj+L0tTO7rtd8UGGijkdn0abxzhLmDocAUZUdaO8PcGPbVptIUeaqn37k
         SKNGc+fRGAkL1wEWiPc7GOKsjfZesEStR0ript2tem6YceQSQ892/MZSVp4+BA89CWpt
         A4pzEt/8+X20PrU2TcW4hsFPDDZRv07HWaYoA5dV7G+kUEcc5nPsjhvgEJOXLn2Uflop
         xV5Xekwk0CNhicAs/37QZES4K5PbzvbF5ATpgRW28GLHIpaXzxumE4L+a43o8jqayapQ
         bk98Px6ynqnzaDuDYIcXJol9TI0FXn/vD76WD+dJUykGTEnhUQII6uW8xeAWxLEElRYa
         AAKA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790258517; x=1790863317; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Y+5dXl8x9fmntpeFxM19iIhvgt0k/LL7dD1+C5hddi8=;
        b=cqPf2Ee5+CLD9+TxVVClg7Awkyd4kUp2oDi49jWs86Xq2JV3U4qKjTmbIwovazPs1t
         2OfNaAP0pD0dwTmfoSu879bXaT97NQspOBKilL1BCVsPO5zIe8Oa4+ERuH8ONxFHxDwv
         OUcPBoi+vgLkbD5I16Bgpx6Ky54HsndDZJ1lmKX+MiRtCBobhzKHQhZf+3RDCpAx5DP+
         fjflEtFC35Cjk2iHt3ijqsWMHnPOpVqnIvYtRtLb30HAXMK/nTgyF/Em4cpf0TTci+zJ
         /D2qDXJBX9pJ4q+vJgWv1iCwRq/1GilMyRp/vkp4onNGfehEpvC/0rvZqYYf1UJLvKiN
         HjJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790258517; x=1790863317;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y+5dXl8x9fmntpeFxM19iIhvgt0k/LL7dD1+C5hddi8=;
        b=NXiH+aPPc1Q6heg01igsVOnV1NnBiShHy9dPe+P6EPMpvShsZze1gKM+WK1tG6SW45
         x0oOU7Qj3gN6RQflst9yhz08Y9LWjnOeZbarqrRltm5CG5P0FCQQ7kWUljQKF6EfpBIK
         Pcz+rXT11dEofBM12aD45sxF5xpdDM1plpeFXjgOWudgXSWGdL1ERp+XAesJC5AoSZOZ
         X1qFWaKCN1UEMGyDcAjfNUaYrDHiIExcaskv92wc7N326rZiboPT4j1UZSULLmgdJ+qt
         3ExhJlXQXRmiuKR+yzG4O3610vrQBLPIZMFAd19U1djpAGZq7Te+fNDfz4PNJbApzvW3
         b2SA==
X-Forwarded-Encrypted: i=1; AKwUvBz5qKSUPf8r3N15Q7XJmiWQD0a1CJrrf+6wn2ufrJraIYxP2+z8xiVWk7D64gs8QWIl7ydvQRMVzPBYMw==@vger.kernel.org
X-Gm-Message-State: AFuF++mTdxwfQ5itQhRKZjdoJ1NQRKcuoCv6uvOgYkaKcKTKEEIMJt4C
	U4VXjh9/F0nXNTJouSEe6gOhu55DfLfXc9f9oUu+1eVY1zbZAU9ssrnghAMr48VRDCLeDQ0OTTe
	ft8Jyn828uNQtx42h4pygolxedf3t1BPTLZNO2fD6X9Wfah4OYzzklA1iMlNIgTyoQ4H9aZ/JuP
	Gyox7+6O0mJOBPKLc8FYDqojKuTar69ne4vxpWjy/O
X-Gm-Gg: AYBFou3rRJHhCSNtpr0K/zvwtvUyM1PbecdCVVMnnXZKB/ToGl4A28zIhLlRok8GUka
	Mabiw4B9aNpJFzRgTf+73lrYXFOpIxJiJ0ir8O10yQS7fzT8LRZwI5wB6IsadqwB9NE3SIwlOnn
	uZaaJ4DFJ2QRjk5Nb9e9/Y4MN48PbgG7ly1tdGO1fHjVfY3hYQviROicdc
X-Received: by 2002:a05:6820:180a:b0:6cd:3fec:de81 with SMTP id 006d021491bc7-6d441e6d077mr2471542eaf.87.1790258516928;
        Thu, 24 Sep 2026 07:01:56 -0700 (PDT)
X-Received: by 2002:a05:6820:180a:b0:6cd:3fec:de81 with SMTP id
 006d021491bc7-6d441e6d077mr2471495eaf.87.1790258516334; Thu, 24 Sep 2026
 07:01:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923074256.9357-1-liujianfeng1994@gmail.com>
 <20260923074256.9357-2-liujianfeng1994@gmail.com> <fe3a4297-f300-451d-9763-0b3016706111@amd.com>
In-Reply-To: <fe3a4297-f300-451d-9763-0b3016706111@amd.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 07:01:44 -0700
X-Gm-Features: AclHuK8PCKMtH5RJ_KGTSVVtHj2pbRynhRsLbl6BgMXL5O4KYIi_8g5-kxz9ApI
Message-ID: <CACSVV01NZROH9U5Qjd1TSDu+BPyyPLC9pFByqSfrxXrPJV+wZQ@mail.gmail.com>
Subject: Re: [RFC PATCH v1 1/2] dma-buf: keep DMABUF_DEBUG off by default
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Jianfeng Liu <liujianfeng1994@gmail.com>, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Jessica Zhang <jesszhan0024@gmail.com>,
        Sumit Semwal <sumit.semwal@linaro.org>, linaro-mm-sig@lists.linaro.org,
        Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>,
        freedreno@lists.freedesktop.org,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Karl Mehltretter <kmehltretter@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA1NyBTYWx0ZWRfX8nLNiF4KZOjR
 zBxgGoRS5Y4CklVuGnU3P1KtDz5cHtjQ+0N2bhzgQo/Hpii9xumUtXCHJkmf4I3+lxOrEsPzYQF
 LzDipcKOja/XcrCcKkaUoM7+UzNaBHqDb4xhfWD4Ok06jtjOF7pX+UfhdQFwwZo1WX3Z8/eQCVZ
 n7JF3FwOOOMWyQ/0BD0GGuyVAvrjtmW8TCAzuFlLofWuwn6EMLvHcuDzAXsKKjIHlZ456taN9TH
 MZ5yqD+2MmCFjfb9gNXKQWTJWpJirC1QN3xSUVsfMHros7LMlgljA2JD0bqT1+HCdtXZ4knFuZL
 tZafREj4hxmaSO238ZscdvIb/ABDFSIBPlK+SUEvo5L2/Fxntq1J+BEHTEF8aHe0AiTsIrR2LCD
 brfr9qLEr/IvULS497l/GhndSIPnqaHSROwY6C5MapzuTmHgy8sWYj1HNOgd+d8WGVT1gJj7y1f
 3tTjSX0iFfBk43ywjdQ==
X-Proofpoint-ORIG-GUID: 277SLPcHwS63PtfbK0AS0oI9DZTtkvlU
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA1NyBTYWx0ZWRfX0qscwrmUh4wJ
 DKwS8i/ygeSwVhfrUNvXo/TTXoxexO+E8wgj7D/I7uM0H/J/GRxmUPmBvCAOrUyh1n26UbSivma
 0ZauM/ZEwYAPg5Uj3/BwY8f+e0hom5E=
X-Authority-Analysis: v=2.4 cv=fvpJ914f c=1 sm=1 tr=0 ts=6ab52d56 cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=_EeEMxcBAAAA:8 a=zd2uoN0lAAAA:8 a=pGLkceISAAAA:8
 a=KFY_g6KMpv9GzmgDfC4A:9 a=QEXdDO2ut3YA:10 a=ejeoeQMvoq0A:10
 a=czjwGCTIUPoA:10 a=rBiNkAWo9uy_4UTK5NWh:22
X-Proofpoint-GUID: 277SLPcHwS63PtfbK0AS0oI9DZTtkvlU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 impostorscore=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240057

On Wed, Sep 23, 2026 at 1:03=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> On 9/23/26 09:42, Jianfeng Liu wrote:
> > [Sie erhalten nicht h=C3=A4ufig E-Mails von liujianfeng1994@gmail.com. =
Weitere Informationen, warum dies wichtig ist, finden Sie unter https://aka=
.ms/LearnAboutSenderIdentification ]
> >
> > Commit 143755bdabaa9 ("dma-buf: Make DMABUF_DEBUG default to y on
> > DEBUG_KERNEL kernels") fixed a dangling reference in the DMABUF_DEBUG
> > default, which had the side effect of enabling the option (and with it
> > the page-stripping sg_table wrapper handed to importers) on every
> > kernel with DEBUG_KERNEL=3Dy - i.e. virtually every distro kernel.
> >
> > drm/msm is broken by this: it maps imported dma-bufs into the GPU's
> > own pagetables with iommu_map_sgtable(), which needs the struct page
> > of the attachment sg_table, and it fills the GEM object's page array
> > through drm_prime_sg_to_page_array().  With the debug wrapper in
> > place both silently produce garbage (the wrapper zeroes sg->length,
>
> Interesting point, we should probably change that.

So the assessment of what is going wrong looks pretty wrong..  VM_BIND
should never lead to iommu_map_sgtable() (which is never used for gpu
per-process pgtables), for example.. but is used for mapping for
scanout.  And pages are never used for mapping in either path.

However there are a few places where sg->length is used (in iommu code
and msm).. AFAICT dma_buf_wrap_sg_table() zeroing out sg->length is
what the actual problem here is, rather than any use of struct page.

(And yeah, I should get rid of use of drm_prime_sg_to_page_array()..
but that cleanup that I haven't found time for shouldn't be the
problem here.)

BR,
-R
