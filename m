Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F0AB33B6F4
	for <linux-media@vger.kernel.org>; Tue, 18 Aug 2026 04:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787028269; cv=none; b=Lm+b0zycLrht0+sPiP91ETr2PwtK8dLmW6ThFif1Ybe9ncGJKq1Edb0spjQJMRo5c0Hxr0/ZkDbLW5GCU2ripDU527+NHWXEtJZ6yJB3SIzvi3CFs5atRtjxhit/z3BxjUm6XAiG84PEd6sADoq38/I0J4z7+dZJClURBgvgg+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787028269; c=relaxed/simple;
	bh=tnGp3Kb5DzPKO0lPgp+14Gr0e21tr30Rqzq+JOih/a0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hqfROHaOjqB6ICC9X8ThXepxfmt8NDU/0F3V5VMPyFseU43jrgxpkKV6CfrDo8Qlf0VaLgpGdannwIha6h9WRzpcvczrujiZm+3/0KDpWwT96KIIJ3j1UNvDIyHkg6KSVtnK1q+XGRabBvMxigCEuKuAjDcAIRFB50DI4XcZdFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d4g3Sp8T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fRfZlMTC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d4g3Sp8T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fRfZlMTC"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67I2YO5I3761806
	for <linux-media@vger.kernel.org>; Tue, 18 Aug 2026 04:44:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+VhAlrPJjjcR4cgApAcBunef
	pIwGteIoKexT12Xm+PQ=; b=d4g3Sp8TrzXwJwOmUupLetOfSkAkAbo3IrH/0X7V
	r3RDpHZbFTvySya4aXBJnQUmP+pBb2cvATh7XjTLYAcWMLpwH9utxAIHDXTmSX41
	oRqtN7i6d+8Ct+J5ZW4/2BtU1Vdh85Q4dvQu741YawaaKupuGuwMY46MC4/I7fMK
	yYqgnIkTuQ5G4+s5I8NIOYtyeRrHm9VhVPkLX+m2C4MPRCYfeUbbJ7umMSrcfxso
	rFX6Yewbr5nyQeNd579dtQ5ECqTmjPflnYD/Odh9PoiNxQLlhmKJKHUVs6UqZgVs
	ZcvkGP4SDFalGkSrYKy3lFXwEGbXpSMVuHtvq6WEAo8nWQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4eqtrejc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 18 Aug 2026 04:44:26 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52cd0374265so86195041cf.1
        for <linux-media@vger.kernel.org>; Mon, 17 Aug 2026 21:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787028266; x=1787633066; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+VhAlrPJjjcR4cgApAcBunefpIwGteIoKexT12Xm+PQ=;
        b=fRfZlMTC9HIj05/JsqOH0ibeeYV9tgCm6Yw2n5lbiblKNO8dinRhr3C4yBffxOOciG
         1+7m/huDdD9rayNmGQe+lxUVOZJIgrJJpIRbFLwx0kc7AOVs3sAXmUNUCgHzijIbbFR2
         lgyCQS2E5EBZdM04LaB7XsOKRXccYep5F2aOQVb/GpbQLGDI8Ye+PZmE3ZaQtYowA00c
         F1y31XNUMnXneaeh36kV4J2CnUG/Jk5ogLPTHekLE5nzF3IJSSplKHYGzhjwrJhy7jEO
         AqPOZ6lgZH90SAyW822+P4/EUr2Q0OfIIyv+xB5SugkSs8Zr8A0KeSksjStgCBYviPR1
         4yfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787028266; x=1787633066;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+VhAlrPJjjcR4cgApAcBunefpIwGteIoKexT12Xm+PQ=;
        b=jr+iplmcPO6eGCSKRkv+Hg2ChQHpafHxpJkL1xjXVJeJcB8pg9m0sVWy9g9qkWwFAy
         trxBkmzc5f6bv2flxPVooRL6QiXFYbMbFPeTlwixibrFNwF04Y0aouiV/FuQMJAkN5JY
         +KbNWCATxTsuGkzCj05VyVW514SaicZYDOn/sl2ZQKIjPaLh5EJnatsRe/LBStiHk5m0
         bS7GTTILawml6wwoPp/UVzXJrCC2Jr0FVhnqib3JVQRm3JN3DD2n1wbn0JX5gNUJ9n2i
         SvMta3jAXIFHF8UR7B/qjpsv6cXRGF1YjqaUSfCHwTpxqYS2rMus6grpcwLNe+hyJMZA
         rWPA==
X-Forwarded-Encrypted: i=1; AHgh+RrTRlM2WA94cNdQe4B2hTOjQlKF1yjP12cJ+3IlMTo823/BZRUiAMxWpyNdmBqSx4fL+Csir5mwKezeBw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyPp9WJzZ68vF5PLTFafCmIoitiNhg5xFcKc5Qr7097upU6ISOQ
	f6KBMpjdEaQ78YvgqbELqJ1pQwsTEX9gTCUdVpBWsUoNhUuchstfdBnp8eJ6yTD8Z2YuDWxuZJ+
	lLeX502Tkd11wubAGZ8wOm3C0xc60c/74pgHijG59gmVoz8WFcBhMl5nLAXSbRaE5DA==
X-Gm-Gg: AR+sD11d5RW0hzrFkoU3lPNpFv4VWEZ6iqNbiVg+Pc5m4HFVcmStd3GU+q2xo4eCVYF
	nwOjYrwowPt+q/xbliDUSUIiDlLs9uenO00J/DFPHiFxs3IutF8yszms4oKAI/6T4Lty0ZICdAJ
	4Jr49gRHAUIA7+Fiiupzy9ksmiarKVB4YJn7CLXjAg+Uur1WgJCoTJZ9ahMLJi870HcMml1sqxA
	v0AcQ++Rz7HbnfXxEAtdFHh9KVdlgcClDn7UZreoCD+oJs5bRAmIDT6tdHR1vtIEuhaKEsuPktI
	/oQ7zKkzNLhGkzQG0V952+ny9jiYuitGjrtcwxN80tfVohxyXW1d6KLwrV4Y3CKOh/oqMjunDRP
	m92K+yDlCtrIthpJ5kP3Ls0CptQmJwdI9aLAtAbkBOhSxcrqyz3KR39pho6+JVKfiPwfZgWP6+r
	JTGXKn/7i8TqET
X-Received: by 2002:ac8:58c5:0:b0:52d:771a:23f1 with SMTP id d75a77b69052e-52d853cb033mr315816421cf.14.1787028265570;
        Mon, 17 Aug 2026 21:44:25 -0700 (PDT)
X-Received: by 2002:ac8:58c5:0:b0:52d:771a:23f1 with SMTP id d75a77b69052e-52d853cb033mr315815811cf.14.1787028264997;
        Mon, 17 Aug 2026 21:44:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b46d01a74dsm880330e87.73.2026.08.17.21.44.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 21:44:23 -0700 (PDT)
Date: Tue, 18 Aug 2026 07:44:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
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
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        srinivas.kandagatla@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, llvm@lists.linux.dev,
        iommu@lists.linux.dev, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v2 07/15] accel/qda: Add memory manager for CB devices
Message-ID: <phiwowaf74wgykqrvkvu2s3ya6eln72jolngpstadjb4vbbdrb@p7j7j2kc33su>
References: <20260817-qda-v2-v2-0-69a02e9090d4@oss.qualcomm.com>
 <20260817-qda-v2-v2-7-69a02e9090d4@oss.qualcomm.com>
 <wt2pdo3m3nlhvyofuvbsqnvggywx75ucs65vjt3dzrxkrpgztz@xwwlhq2iuiun>
 <c4820424-eff0-4c28-ba77-5b595ed09a4e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c4820424-eff0-4c28-ba77-5b595ed09a4e@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDAzMiBTYWx0ZWRfX2iqaKGvlOW32
 ubcEVjELne+KYt9qmDu7Mz6PDsAX7WvwH5JN7I3HZKWNcdeQyvlqNae4cf17RpA1ai2gwke2cws
 KnNw9J8NAWiXNUdu0TGI8alp0rcBnws=
X-Proofpoint-ORIG-GUID: WQ2rg0zGLqunsG0Xj3XdwXuDOLnepSt8
X-Authority-Analysis: v=2.4 cv=UfFhjqSN c=1 sm=1 tr=0 ts=6a83e32a cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=kDtCMvKoDeDWkizO3CQA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: WQ2rg0zGLqunsG0Xj3XdwXuDOLnepSt8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDAzMiBTYWx0ZWRfXy5Y6BkxiqTfz
 McmJlBTiZcgI2ZwG/E/1M3/do1Y4PGWanLDwX8+bLQaXOzGjWxqCmySLIXPt7+9+TEZn+OQTmEf
 UuXbXaKXiFngqmTt784ofNWU7cebiNHeP9SVFjbKJJIb7eH9buxDJ3jBifyL4oI/Ylxuk0WA9QV
 N7FfzgWvpDVgzi35P+L+wLqyfZ/oh0HWx6c7zaR5PQTO10a2uepsLegarigJmW1RTfoYwwqcdzO
 tuIu/XGpplKdJfAuSwtuxMslH8/5ciMAixk0jC0i+lD+oJ7mTWjQRMpm6Jm7iW0jYlNrUmIvwje
 TZo27KRSIfPpA1sWN5Ncp6nNgBkm1BedxyfzSQPHpGGzz+KDy4FVT1i8zhul3ZLYnUz6ixsJyxK
 nz94YQUujzBkbl+X6mMCTXal39r4p5scdSDeBCrm0tiDL3XUUieyUT0s1bK9w8VbT2ZNSxIgAYf
 mKvj6Z7BcxOV52cIZqQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0
 spamscore=0 priorityscore=1501 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180032

On Tue, Aug 18, 2026 at 10:03:56AM +0530, Ekansh Gupta wrote:
> On 17-08-2026 12:22, Dmitry Baryshkov wrote:
> > On Mon, Aug 17, 2026 at 10:17:42AM +0530, Ekansh Gupta wrote:
> >> Introduce the QDA memory manager (qda_memory_manager) to track the
> >> IOMMU devices that back each compute context bank (CB).
> >>
> >> Each CB device registered on the qda-compute-cb bus is wrapped in a
> >> qda_iommu_device descriptor recording the device pointer and its stream
> >> ID, and stored in the memory manager's registry. Later patches use this
> >> registry to resolve the IOMMU device a session should allocate from.
> >>
> >> The registry is a plain array sized to the number of
> >> "qcom,fastrpc-compute-cb" nodes present in the device tree: the RPMsg
> >> probe counts those nodes and passes the count to qda_init_device(),
> >> which allocates the array in qda_memory_manager_init(). The memory
> >> manager is created before CB devices are populated and destroyed after
> >> they are torn down, so no dangling descriptors remain.
> >>
> >> qda_cb_setup_device() is called immediately after a CB device is
> >> registered on the bus: it allocates the descriptor, registers it with
> >> the memory manager, and stores it as the CB device's driver data so
> >> that qda_destroy_cb_device() can unregister and free it during teardown.
> >>
> >> Assisted-by: Claude:claude-sonnet-5
> >> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> >> ---
> >> Changes in v2:
> >> - Replace the XArray with a plain array sized to the device tree's CB
> >>   node count instead of a fixed 16-entry table (Dmitry Baryshkov)
> >> - Fold the init_memory_manager()/cleanup_memory_manager() wrappers into
> >>   qda_init_device()/qda_deinit_device() (Dmitry Baryshkov)
> >> - Drop the pr_debug() calls (Dmitry Baryshkov)
> >> - Use goto labels to unwind probe failures instead of open-coding the
> >>   cleanup at each error site (Dmitry Baryshkov)
> >> ---
> >>  drivers/accel/qda/Makefile             |  1 +
> >>  drivers/accel/qda/qda_cb.c             | 39 ++++++++++++++
> >>  drivers/accel/qda/qda_drv.c            | 26 +++++++++
> >>  drivers/accel/qda/qda_drv.h            |  5 ++
> >>  drivers/accel/qda/qda_memory_manager.c | 98 ++++++++++++++++++++++++++++++++++
> >>  drivers/accel/qda/qda_memory_manager.h | 55 +++++++++++++++++++
> >>  drivers/accel/qda/qda_rpmsg.c          | 23 +++++++-
> >>  7 files changed, 246 insertions(+), 1 deletion(-)
> >>
> >> +
> >> +/**
> >> + * struct qda_memory_manager - Central memory management coordinator
> >> + *
> >> + * Coordinates memory management across multiple IOMMU devices. Maintains
> >> + * a registry of devices in an array sized to the number of context banks
> >> + * described in the device tree.
> >> + */
> >> +struct qda_memory_manager {
> >> +	/** @devices: Array storing registered IOMMU devices */
> >> +	struct qda_iommu_device **devices;
> >> +	/** @num_devices: Number of registered IOMMU devices */
> >> +	int num_devices;
> > 
> > What for? Is devices array to be looped up to num_devices or
> > max_devices?
> num_devices is to trace device registry with manager, it grows on
> register operation. I'll improve the comment.

If it's a loop counter during device registration, make it a loop
counter. Don't store useless data.


-- 
With best wishes
Dmitry
