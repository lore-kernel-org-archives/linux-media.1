Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C5639A06D
	for <linux-media@vger.kernel.org>; Mon, 17 Aug 2026 05:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786945489; cv=none; b=iO7XKFA5b10dEUfXuEWsg8EzXgpuwD+ObQ7ew7xHcFWA+3UfWSTX06Snw3fhuiSlzxr4Mh/ejYOifsZCdOphK4o7aEITdXlwr6VYaB7cLp65LbKwqKe3BTGiNM+IauA4vvHYMto2kx0Ne0xE42v9Y2oR4m4xCV8FXcRQ7vnRT6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786945489; c=relaxed/simple;
	bh=BOsWlzsNjRjW+LGvfzEBsGi7iZHKZ6oJ+OnpFU+/UbQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W4sQYLLpoMe//W04x7IeyTNE8GlusASPqDf2Jc7WzbXrQNmVUEHW6QNAr8dQburnRp1y6Ux23GW1U3IQO/TkMI1wX+gQDQac6dMojRJVQTHbznMC2ivMtoXlkru1LcM+Rj4w2gZ3l64pdW9iJdeJQPmTDMXfW1PPKhynUhK4X+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZB+O1Wf5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fNVJTFwu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZB+O1Wf5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fNVJTFwu"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67GLDNOa4059807
	for <linux-media@vger.kernel.org>; Mon, 17 Aug 2026 05:44:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DxIV54bZW0mbknxQlawpAwW+
	cPAeEoPsp3aYvzyr9hY=; b=ZB+O1Wf53eu36mBtTwPud49KO9hQowP2gfnqPgwE
	2shvJmDSi8qJt95K4SnQn+tyaY45tCdf4ZJzHSb/H62tfWwBX/py+yXLoG1Aq1ze
	vrGICIKVmH2QZGLg3CXfySNST6xBwDI1l4E+6lOz8Uq6kjDJ1I8iZzMwp7E/CtSl
	notJcVzkiYG0MEc1Dmjezk/FlFAmf47khwLJA9xeJLp1hnS+cPQ94KNNCiY9c0oC
	U7U/GsExkWKnkQvDcRF0aZqXTv7GfOkm4wgsmUtmSp9zk9IUmdQY4Z61fR9b+4+N
	TYENKCzlYJXUcJ6Ub0KcwZ0FD3fYl+H++JFzkgr4z3sLKw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g2hd7w6xw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 17 Aug 2026 05:44:46 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52cd0374265so64441751cf.1
        for <linux-media@vger.kernel.org>; Sun, 16 Aug 2026 22:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786945486; x=1787550286; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DxIV54bZW0mbknxQlawpAwW+cPAeEoPsp3aYvzyr9hY=;
        b=fNVJTFwuKMSoRVveah3JrO8CTqdzT/eUTuPLpxSJtHXQqCsS1J1l58zw2A4xDiqg7H
         wVGAWQKQlMTyV8hjRkM7mFE9qro1PmDGmavOm8mh1oFpA79wFcIGbJE68xhfBb4qwnsz
         DrBm3nSIcaH5WeTnTz3hP9SELNwTGb5Ps/Tl17mr2lSZ/80VGaUeH36/Svb8GW3tKRLF
         g6rizOOluUXTxdvuHwxsW0/sgp0FGTa0zjLvkrCuBNKiP+e+QKdIoauYcksNVYYX5oHq
         euL5frECSZbJZjPWuqzhj/8vjKLIHCPjqerYPmi2lo/je3sa1mM1hUZ5A4s5MhuFXRNE
         4r4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786945486; x=1787550286;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DxIV54bZW0mbknxQlawpAwW+cPAeEoPsp3aYvzyr9hY=;
        b=B1pnsIvNeZUPkl/vhyQ5fnx4IBHlIIlaBOQQlas4gTOxu8WFtKv4+mLI2dBPg0GzlL
         S1GnvIg+OT+uqG5caRBP2rFDgomah3J/emAeuEDZMzrLgl7a56uuYn4woJbnu6HFTW5t
         6mPRMr7iZ9BpBhLscn8ZFeFodsc8h9PPYyGMuCyh3e2BxVjXdLb1CVykUfVQ6v/poQX2
         CZFCqV9jaorZSeW8nbgtL2iBZiS5ATlkl52NFG9AC39puUlGYILYZRccY//412wm/Gt6
         pm9CAU/fHVhq+KnmgCG+EvJvHEODsdjJLSi3I/IYi4Iq+2CiBBYSWBhI1257JW7YWD3h
         QOWw==
X-Forwarded-Encrypted: i=1; AHgh+RpaUhpRE8YfC3mWQHXB3lho6rRJnazcjOg2boKu7eWP0nNgit1JAdII6J3mMB+mUl2grsm6dhPOTo4UUg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzm5kbVipREP4ZuFwqL4Z94pzQQO1rSjO2FZyDyysjtsJeFVWrY
	j/06cip0UMDzIlYg14eIBAYgtl72kYtgUBinOYWHsTVD/t9yhOdRtOhyb+1fXvLl4y1pzLJShHy
	EDvq2M0vd220XpVXFEpX62Ea/gxCUZmT4g69cFMeSvGWe0YKEfhp8fE0fnAx68JX6CA==
X-Gm-Gg: AR+sD10GMbTmY8tQifiSDzi2BfLpjd0NXEz9I8cbGnd7+Vjhn5FEIHqVEV35w9viEpr
	OlUFIEHFGNaTzizFGuWw1wVKHrQmfW+eUrunHT/YrYwqVToWx50NG4oI9qOy/sOQSn4CXJG5lns
	FW2r+bd3t9WB/SnGa65qvXkIhZvhvASEu8cIsddGl9RlAT0aAk5Cx05B+934XXUdpm1Mx1pfQlf
	G6UYKXwldUCOpBiOwmu+b6fvryxcbBG5t6bBAATPlfMJLgLlrg3mj0TSACR2PY7yDCtkXKXpQOr
	BrUFoB/92BDHZ9AbHNISSdtJ7/SeZDvRUFA2T4MrLVa7ZG2M6wyoUYh3WYsdnV7gqwhbtxjWLr0
	tv8n63Q0XgTclS0T6m1q8NTZRtVS2vmgDaNE7tBXsyCMcZ2zGbz//Dfe9qxa2ccMYub8jECG1gs
	LCneNgkxqU6DcF
X-Received: by 2002:a05:622a:8451:20b0:52d:882e:4986 with SMTP id d75a77b69052e-52d882e4c7emr139157231cf.4.1786945485936;
        Sun, 16 Aug 2026 22:44:45 -0700 (PDT)
X-Received: by 2002:a05:622a:8451:20b0:52d:882e:4986 with SMTP id d75a77b69052e-52d882e4c7emr139156871cf.4.1786945485468;
        Sun, 16 Aug 2026 22:44:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b46cffea7bsm89313e87.50.2026.08.16.22.44.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 22:44:43 -0700 (PDT)
Date: Mon, 17 Aug 2026 08:44:39 +0300
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
Subject: Re: [PATCH v2 15/15] accel/qda: Add remote memory unmap from DSP
 address space
Message-ID: <6k6ogbosxx4z5bh7uriu4fnj24ycuakylq6g2gnuwsbckl2zww@e66jgj5xo52o>
References: <20260817-qda-v2-v2-0-757ab8ed2f64@oss.qualcomm.com>
 <20260817-qda-v2-v2-15-757ab8ed2f64@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260817-qda-v2-v2-15-757ab8ed2f64@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDA0MCBTYWx0ZWRfXxbSLwFCcSU4k
 ApJcPbuoEQMWWX7LD+/4Ca2JgNaQFJ1lYy7V7FEdHQBtBMQm+zxQBwxrRNfenAorwe+VwPTBr/K
 qMsuuGlSNYaRYdwLcViHHQf/PydXD0Pfv8NgX2o5/r0YzXFotCpdOQ+eY1mW2z3Hm6ANHXcIhxB
 AeUCjtMzgSY0euO04x/6feGmJa02I8qzv+VXG6UodAaWFEv+KzoNx9NtrLpzo0Y86daWf56/AEj
 0Z9d1fcGpUlsLXm16GqdmNgvaHTiuKrI5RYXkGDw2i2p5wFeOtz9CpUP7aT6uAJ8LQw81vOx5Qo
 6HeGqDS0cHp9PMtNWveNDBX+ZskwXUgdWOw7EtgLI3UGANYLIymqCybEJGyKN36OSTXzEO350PK
 OebUxK/UaDODBqXOe6Mdx5JsrCWSyEY0y25fVieDhUmHEkmw25tlr72IKofmgdVn4DQu62wOCu8
 YDzINi8fr7vtTPtkytQ==
X-Proofpoint-GUID: lVIrMqoavrtDCVemtJCBkiCsb8SGxBCU
X-Authority-Analysis: v=2.4 cv=Ja2Ma0KV c=1 sm=1 tr=0 ts=6a829fce cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=Fyn7aR8NovT3rRngz-oA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: lVIrMqoavrtDCVemtJCBkiCsb8SGxBCU
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDA0MCBTYWx0ZWRfXx9qKgZ0Loc6t
 CTiUkLce8yPoXkr4Aq2jTbHfQAdfMYcbNn7hYSB4UqJ4nZSrVaq24YCWPvKuM7GRJIhdqOvb14L
 BCMzTYTMFn6gWwH+IMP/LREVh0urkgg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 adultscore=0
 bulkscore=0 impostorscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170040

On Mon, Aug 17, 2026 at 10:38:45AM +0530, Ekansh Gupta wrote:
> Add DRM_IOCTL_QDA_REMOTE_MUNMAP, which removes a mapping previously
> established with DRM_IOCTL_QDA_REMOTE_MAP from the DSP address space of
> the calling process.
> 
> Mirroring the map path, the DSP exposes two unmap operations, both
> reachable through this IOCTL and selected by the request field of
> struct drm_qda_mem_unmap:
> 
>   QDA_REQUEST_MUNMAP unmaps a region by the DSP address that the
>   corresponding map call returned. It uses the vaddrout and size fields.
> 
>   QDA_REQUEST_MEM_UNMAP unmaps a region by buffer identity, using the
>   GEM handle, the DSP virtual address and the size.

Why do we need two different operations? Can you just pass the GEM
handle to the IOCTL?

Also, what happens if the buffer is still in use on the DSP side? Will
the DSP crash? Will the whole board crash?


> 
> Each request type has its own argument builder in qda_fastrpc.c,
> documented with the packed argument layout the DSP expects. Unknown
> request types are rejected with -EINVAL.
> 
> Assisted-by: Claude:claude-sonnet-5
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
>  drivers/accel/qda/qda_drv.c     |   1 +
>  drivers/accel/qda/qda_fastrpc.c | 119 ++++++++++++++++++++++++++++++++++++++++
>  drivers/accel/qda/qda_fastrpc.h |  34 ++++++++++++
>  drivers/accel/qda/qda_ioctl.c   |  22 ++++++++
>  drivers/accel/qda/qda_ioctl.h   |   1 +
>  include/uapi/drm/qda_accel.h    |  39 ++++++++++++-
>  6 files changed, 215 insertions(+), 1 deletion(-)
> 
> 

-- 
With best wishes
Dmitry
