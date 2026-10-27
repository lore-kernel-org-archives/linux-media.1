Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793099169;
	b=AWujo9/tdbpNQT89Vr4qrmraHwhP/bATOtY6+vyrwqosayo5b+EiuVdy6yZitBxUjaLz
	 4ZeWs0Z5guPNSV8gkcCvJZGb+gy9no/gQQ7PaWr+uc3CzBbOrObr/wF7vc2cZM5zh8W0b
	 EN+kqfY4sF4HJoNnAoXNQNMCueafyWbigeULj6mMYsmRBXxXjWv+YLypGlV7FhrJei1SM
	 5YPMmIioegHp7qLLaG1ZxBpPegzKCY+tFrOWM3ZlSCPHckmhAGRIrT8sw2o+3Yxmyvv+a
	 I3bHTtAPihlq6GyaoQ2Q8sSFVxJBsbq3Dq8S4/3yuk3RnEdMgWo1a5OTXt5eHRhw4Fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793099169;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=wIT2c8ssR3PQ2F/Yil9tuvb8L0yquFHB256Wm1sk66s=;
	b=cngAWQ6nFPogziuPnTVdblKZLnD2pU+gMhZmbfez+9w1qWtzmLqz/qOiWgkD3Fp4Y7dG
	 oe653ILw0HKOxrySzsBgPRYwnzMyLKfIastSYtWiOVsRFPkMocU5/xRTB6lQpRTlnqXBH
	 BCURXE8ckUXGIqq4JQ18sJkpkUmEoQu5gl3ekxL82PEvUiXg+0hnbyqihjxggNkxJnLgW
	 CFJEZ37wMP6cY3qHzHuWnSocL/1KtDsYKlS0MF4UUWEk+sNrTbCr8vFqWW1A8mEKjLVUP
	 +uh+qyWDG60ZtMqHvkGbhxm3BUIRVrhpXpiTOFIuui94qh/IhQFm+sMmRWtthYdirhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WGeU6VH+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UniBw6lV;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBFF2606A31E
	for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 11:06:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBFF2606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WGeU6VH+;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UniBw6lV
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAe9Wt894501
	for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 11:06:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wIT2c8ssR3PQ2F/Yil9tuvb8L0yquFHB256Wm1sk66s=; b=WGeU6VH+oHYBNPf7
	0Ij+Cxgo2XNvYPf+VLXcpOpPN2fUSuGYLGKC7jjXf9ujHoTB0J7pTH1b2l9AK+h2
	ymZTBqCAy60wzTmwLuzyaKLKMBu0rEJfAnJV4igTynzjEFS+iHcrrcYq2xiJS2im
	AukZyKxr6fiszdE28FPrBCqOtWOEWogV1vvRNA+GL23aHgJEgkTiwwnKkM9tjUvS
	Ei8Ev0bhF+dpQ89uxH5yNw+ZC5TKGx9xdeUhObayvni3oFD8EeIUKU3B5l9FS5hC
	IsEJCKh1AtDF49KEoKKv86QJceB5ZnKumMn1n60KyNeoRh2w6zCAdx0NoE34l/Wz
	nVcs1A==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj8smv53c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 11:06:07 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-988b86c66e5so761281241.0
        for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 04:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793099167; x=1793703967; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wIT2c8ssR3PQ2F/Yil9tuvb8L0yquFHB256Wm1sk66s=;
        b=UniBw6lVpQFU+I8Xsa9rgKS0Tui2RvKLJfjY3/VnmLXwp3lJ/J/PHl1LBNlZsZAKAB
         ixhr6GOw1z1eNatMqh9Y/q0DxP2YHTto3mHh9cSFEG67WKFThjC1UHd29RAJULmgWHuj
         VUK8vvxMHNyWdz8+enBM7lPzsev0MAzoVbRQnczlcZ4nisHd13f5hTMB3ijAH4+pi1cS
         CjPH4fUQrXJwZ/chOCcM7eK8wCYkHiI5qgdc5PEoXjV5DDOOdcVwq/Ig9D0wZ8ucUQoJ
         BP91A9LKvYLBBel86BMnYbq2UEp/sb2Yy6Rk1pxTg7qpuFBGY+8L8wQGwgkBOa/9ZF6w
         X76w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793099167; x=1793703967;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wIT2c8ssR3PQ2F/Yil9tuvb8L0yquFHB256Wm1sk66s=;
        b=v+qGkySHhrdskFenv8aMTSotCHDSp2I5ALhXZ/rk4wXI8CX/MojYpJzem6NSRPjWOj
         1NC5Y/BMLimEg+UxM8nl4uzOmjHtJXxs1hjTd9I8ELCmRZ3Ckfm9mYLEvXzDh7Gep+Vz
         eRiRt5kZqNFF4ZQ9WukMIywDhjBPo3KONO5xRmEJ57FAvMT6At+ZR8+hzrvKmw9djsbT
         vLIm75rUCF/X7MR0nUFfblHmiqM3O0bgXCJq9sKjJVRDkGOJQRRb4kSMhmZgv5QCebJA
         DtmQT4c+5TW0zW8av2B9Vdy4XzRZUn33osqTLY17XbUCv4/E/cmv5rrkoQrIbwUZvIJI
         ySug==
X-Forwarded-Encrypted: i=1; AKwUvBwYS9rEmLOi0dO8/gQm/e8TxEn8xeoHthQrO6UEp0c+DA8+O2xcaYjxf+oJjcNds9hseji2zkOoWOYO1Q==@vger.kernel.org
X-Gm-Message-State: AFq9FYKewQhcuLDKTwSD2eVXrB53HMhpiiVS3WE9+Hr/iL/XqS0smo1k
	LL+3BZugFQqqPRENfbbwqvmu1p7QZqHTEc+vrHYyYi1AYvpExToWTE6HL5v7SdM2xopMMHZa4dO
	5tQUgYisDnVv1EpceCgg21qRHvzB0wg7ZL7kXOuDoo/wOXBunK3hnPl2mdbF8Vcx3rw==
X-Gm-Gg: AYBFou1YfiBhIUgzAp+rH7lSOJWDrowPtnK5Sr904kJdZx1LHCAkhT6SEJQhrOTe0db
	QPL60WzfHG+DLu051oimXKEGSok0rlrI/wiMedBb/D0/APi69Ly9oFtsZrovyuD0moAWIhIyM5K
	1oh+E3kYCt0EHifsFQfUAT5G4An0t9qxyUxFiz8Q/7CTDqJnG7asdSyXvMnBJaN0FAFQmypZES0
	GuiG8/LkUNaegBDuYyUEI7BKnz3HK7mn9WmXbA8RRP3nWzsJvUjur1U8CbBHvkjPXl8TG0TQ7X3
	yWIBu/lCu7mPZpWQbQ4gC+TgSQKZy5gPA5LAPqfNclMc5FPFAGl9naVDgHPyur1lUdKBvivID0F
	QIlS/E0HwTaT6KIMq0z72NCWNPZaZ2axQxHF0VuVj5Faj02SzXSDrPQMVZefV65VFWWMWL6LzcR
	QayXqVPHB6y6IR
X-Received: by 2002:a05:6102:2910:b0:78a:4dff:7b3e with SMTP id ada2fe7eead31-7cea1474628mr693714137.15.1793099167059;
        Tue, 27 Oct 2026 04:06:07 -0700 (PDT)
X-Received: by 2002:a05:6102:2910:b0:78a:4dff:7b3e with SMTP id ada2fe7eead31-7cea1474628mr693707137.15.1793099166585;
        Tue, 27 Oct 2026 04:06:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a9ea71sm2034967e87.81.2026.10.27.04.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:06:05 -0700 (PDT)
Date: Tue, 27 Oct 2026 13:06:03 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <rob.clark@oss.qualcomm.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        Antonino Maniscalco <antomani103@gmail.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 2/2] drm/msm: don't tear down shared VM mappings on
 handle close
Message-ID: <xa6erwmfju7xmrsmg3vsafwhdhwvyqqwjsgq35hb4ecoiwffau@r2fb6ft223vl>
References: <20260822-msm-fix-export-v1-0-917b3cbedd43@oss.qualcomm.com>
 <20260822-msm-fix-export-v1-2-917b3cbedd43@oss.qualcomm.com>
 <CACSVV00sJmmRqpTJUD4AfB5-LJRCtzdWDTKVCQwH+y-uYYYMbg@mail.gmail.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACSVV00sJmmRqpTJUD4AfB5-LJRCtzdWDTKVCQwH+y-uYYYMbg@mail.gmail.com>
X-Proofpoint-ORIG-GUID: xAKi4QF990OSU3_zfjzJ-vHtrpuB-BqV
X-Authority-Analysis: v=2.4 cv=Sfti5fRu c=1 sm=1 tr=0 ts=6ae0859f cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=g5l33MZIfMJ3XeZK2UMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-GUID: xAKi4QF990OSU3_zfjzJ-vHtrpuB-BqV
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0NCBTYWx0ZWRfXyKy1YaUJeRjk
 Bw+R67D2LSFdewDuAuelHJijI34EycMcZVOCSwlv3u+45noAuS24cqtoaRdCUAGz4TMypToMjMx
 WPSTF/pVA3RAzyODxCB6N4uWQfneWNI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0NCBTYWx0ZWRfX3b70f8H1C3qT
 rEO1Dbarab3Wi4hMCYmZIZQmGWvBmXanosirN3T0TuRID8hPaM9KEmHAcWffMGtkzwo1xIpEJ27
 8nPuVgCvRXulXttZFsFipHBYPXoOIRTjFB096qYS9F9loWLmXaOZsy+bVqWeq8VW2JgyBiMwRqv
 EfVAGvuJtrlxJOmopLhWE2x2tyNpB3cjK9ShkePLkoWM+iUfF1WC32l9lcVf5V1in5ICLO7hOOK
 bboDwFne1NILCmr3+vBVsgqzRPwzuo1AgHgxTA5wa+UL2SKDOhs427eox8nDtQc4TtgLG8UaPJs
 yJOxjRLac/cL6PmHzw8vgDcZ/0bHrDO3z35A9yccY86tg51Xqb0alR5Mpz+2dcfOeMQqSW/wMYK
 6qzg2o9uZfFLoDf0Zo8BpEu3QNALdodhaE8tzLLp6YjyFhRW99Hm1XPF6ZpyCIMbuNDYjokNf7N
 Foo8ze9fgqtTCCAiLZg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270044

On Mon, Oct 05, 2026 at 07:54:32AM -0700, Rob Clark wrote:
> On Sat, Aug 22, 2026 at 1:49 AM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > On targets (like A530 / MSM8996) without per-process pgtables
> > msm_gpu_create_private_vm() uses the global VM, so all DRM files share
> > one GPU address space.  msm_gem_close() unmaps the object from ctx->vm,
> > which on those targets pulls the buffer out from under every other file
> > that still has it open, and frees the iova for immediate reuse.
> >
> > A dma-buf imported into a second file hits this as soon as the exporter
> > closes its handle: the importer's texture keeps sampling the old
> > address, which the next allocation has taken over.  On a530 this is
> > every ext_image_dma_buf_import sampling test, reading back all zeros.
> >
> > The VMA teardown a shared VM needs is the one already used for kms->vm
> > -- defer it to the @vma_ref drop, when the last handle and dma_buf
> > reference are gone.  That restores the pre-drm_gpuvm lifetime without
> > reintroducing the reference loop, since a BO with a live vma_ref is held
> > by userspace anyway.
> >
> > Fixes: 111fdd2198e6 ("drm/msm: drm_gpuvm conversion")
> > Assisted-by: LLM
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/msm/msm_gem.c | 13 ++++++++++++-
> >  drivers/gpu/drm/msm/msm_gpu.c |  4 +++-
> >  drivers/gpu/drm/msm/msm_gpu.h |  3 +++
> >  3 files changed, 18 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
> > index d27d54bdb7a7..7722776e9129 100644
> > --- a/drivers/gpu/drm/msm/msm_gpu.h
> > +++ b/drivers/gpu/drm/msm/msm_gpu.h
> > @@ -223,6 +223,9 @@ struct msm_gpu {
> >
> >         struct drm_gpuvm *vm;
> >
> > +       /** @vm_shared: Has @vm been handed out as a context VM? */
> > +       bool vm_shared;
> 
> nit, this seems unnecessary, just check if vm == gpu->vm

msm_gem_close() already checks if ctx->vm == priv->gpu->vm, but most
msm_gem_vma_put() callers have no ctx: the last put often comes from
msm_gem_dmabuf_release() or the fb cleanup. The teardown can't be
skipped there either, as the VMA would keep the BO alive. The extra bool
looks like the easist way to determine if the driver used a per-context
VM or if there was a fallback to gpu->vm.


-- 
With best wishes
Dmitry
