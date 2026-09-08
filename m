Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EC4B39794E
	for <linux-media@vger.kernel.org>; Tue,  8 Sep 2026 23:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788908458; cv=none; b=a3Awii0dpPA3jJl7qus3VCDlxxKmfdZ1daK+AWvyB37IrOQviWZLQdDc8RbWWiE45NhT9tY9PTbyUJe73bUW89ijflgFEPJBVDBU5TJmui7uvBezuZ9HzhUY/YbJWuQQlamE4MKV9DIrLFScoWhdTbWJxmd/MtXJBucomtErgTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788908458; c=relaxed/simple;
	bh=fptwP/Jn4YXbmICetcoRZcNAlXOMSlSzrap5v02zqEU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=saRhX9Yf6pSLb4qm7A5YM8D6vCBcPOawnX/EpIAurcK1FOERhf0lGMG2t3eU7Pnj0Yhj4dk3SEH1BilkoU1hKUvjtGurxGt8ac6mkga4GKfDf0XoojGyWR40pxFUh/HCK7vu+JsirSSyzmI3LE+UOEWn2UBbqUSM+XL5QeEwxCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZsD2llIY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZkpGMpgC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZsD2llIY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZkpGMpgC"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688MgZRB130521
	for <linux-media@vger.kernel.org>; Tue, 8 Sep 2026 23:00:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ihPYqdrPGXWVbmFBzBhN4BZ9
	OU7yUZppyNtH0Hlwg+k=; b=ZsD2llIYuQgi0sjhlL9VY5XcKD05Cms4T5S7p32D
	FuZh1o86KtTVKXDXy29YuSCtOVg0XQsdeqjUwl3YZHk4UMDPzCMcpWvef5UXgQgx
	dXjRk+QsQ1nBTKve3ACVZmUnOcdjZVSfdH6j0S1/EwF6ZTjj404E27H/9vvG43LE
	f8FN4kFyozAONXPxHSpm3CDpypkUp9G3QV8VdiFYAP968Y5m2uUNAFPSJ4oi6PbF
	SRDP/uXQEdFmFRIpfHKG4hbLplTqPsThnhw1njeIGCiwKPGdyzsjdWjiatKKadND
	guHN7bu/fd1w2rPO2rZyD+U6kW5VQMOJM6fYSFXJPrK8EQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjntphnhm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 08 Sep 2026 23:00:55 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-78b27e0280aso606400137.1
        for <linux-media@vger.kernel.org>; Tue, 08 Sep 2026 16:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788908454; x=1789513254; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ihPYqdrPGXWVbmFBzBhN4BZ9OU7yUZppyNtH0Hlwg+k=;
        b=ZkpGMpgCDEEU2w2OQ1i83Q7tNf8ngZqYeeovlTmcCnOjZoR10/jEbaJhlnCDzBAVTZ
         f4pKitFRv1yaMQKGSBR/Hkmny8vXplIc85Y/MuOGk1P8N/Emh2f/NnuDovBqp1KMl11P
         MWE4UBHMlz1aFCzDBcpnQHCDpnTB+dGTCY8asACaBA3WNGgWsZOLx0qvwR1WpjO49gUV
         T3XvAITPzb5tbGFttg/iN5rGXc/zfUMESlQaJrA4/GmITTusLfEXWXFZMl+yiAzrNrXH
         bX3KAiFQAUaOPElUz7TndcBeWPToPtcxgR9BIEOQPDEJurPaL4qLq+9KgW1BYFqfRFkL
         RN5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788908454; x=1789513254;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ihPYqdrPGXWVbmFBzBhN4BZ9OU7yUZppyNtH0Hlwg+k=;
        b=ER5rwiiDUXnGtVa6h9wXkYOS9HzNkvCVLnsJDdc+9mMa1T00InAHyoj18ZneWeI2Vn
         /EL6Gtc/fcbUfnTWCJG05DPVYfvQ3tUwCeKv4a3eSNoa+oyPT+YeYf7pysQGLdnmlaIT
         DBeKK2AYf2hMyXShAx3zQMup5qg3gXp2FrWEbMS4s0z/JCUhsrmecrLAxAwZn78/mLF9
         O4uNrl+PKO7f6ggsFVKAaDYf0w3qkLPeQtOgOP2omKs47Z5pnYyuoMGYyBOOoXrRAQsC
         K0GOsRabeZqJZYtLqYWGqDveNdlUmACnt533xfUbjhvEkHT/MWSad1pQl4GSKH4/U3Tz
         hjgg==
X-Forwarded-Encrypted: i=1; AKwUvBxywLXHjhjRrsNF8mBJGgRUDtdgQzyN7+wCiTgFt3z1cVf3vi5jdC2hUA0g931SqE3OZuFPgzy0GF/C7A==@vger.kernel.org
X-Gm-Message-State: AFuF++lWPUQ0I09013SbO22XjMIy3nxDNRDy4vWn+UEQH8E/b/W+x5Vw
	Q7VPbPvPaOHkd0GUngLH+8rwCNXUErI1SOkP3XCibZkCJ4fIFao8K5ezFPUwcX5Xvj7biYIqYLu
	osgtn6aGsmQoGXTwlm+Asb63DJs0RvYJs8Dw7FccBDo+b/pMIrU57N97jNY9iUxFVLA==
X-Gm-Gg: AYBFou1ehoreCfNrmbuba7sXvNrCZYEbENJybjYnFrl8IwhRJMy2jLKrj2/Qks1NgPC
	+/bxVFwVq04RaJWyyPZ9z6IAswF/IRgJIY6sDRbuYzEK+74/gLND+4oxZiYNq89/2Wxz447Jz96
	RwoZCb7HFXGeDxFmc7lJjklFG9yprsE+Cy3p34eraU3dpO0Ibh050AlWceVocNxIovdpysa4KGN
	9C21pHKYSc8BrPu0qOWn6oCNjVrD+QEecTdh6SHgM1SSeyTBTu3FlE1ZJKyc/CE49M5g2dPDXK1
	PvYCTTUV6l1d6fLOs2d4R8HO/ve9G7CvhtY0tOQkyHr5hfirpoIVYSPN9bORoSpe3L4sINQQhWv
	6y5FcPCpiIlnEbnKUmtmKZxhOVlY6nI0WfuxfP7yGkUVwCNtdqfuDUw5bw25qKOW4YBMlC/q7wv
	JhATH4z+CaODdj
X-Received: by 2002:a05:6102:5e90:b0:780:d949:663f with SMTP id ada2fe7eead31-78f73e27b69mr1092832137.4.1788908454542;
        Tue, 08 Sep 2026 16:00:54 -0700 (PDT)
X-Received: by 2002:a05:6102:5e90:b0:780:d949:663f with SMTP id ada2fe7eead31-78f73e27b69mr1092766137.4.1788908453845;
        Tue, 08 Sep 2026 16:00:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b6166fbe6fsm3317542e87.41.2026.09.08.16.00.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 16:00:52 -0700 (PDT)
Date: Wed, 9 Sep 2026 02:00:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: rob.clark@oss.qualcomm.com,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
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
        srinivas.kandagatla@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, llvm@lists.linux.dev,
        iommu@lists.linux.dev, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v2 09/15] accel/qda: Add DMA-backed GEM objects and
 memory manager integration
Message-ID: <iviywddjpdvfx6qcsj7ki2ketbljkzqvkcmwfeop3ur5z2x3dl@fqicfxi5shh7>
References: <20260817-qda-v2-v2-0-69a02e9090d4@oss.qualcomm.com>
 <20260817-qda-v2-v2-9-69a02e9090d4@oss.qualcomm.com>
 <7030a8f8-f320-4b09-b2de-2c8e897409f8@amd.com>
 <CACSVV00MubttbkVJgMommPMorf67yqn7D1kfwpxVUZ0t-6au8Q@mail.gmail.com>
 <2febead3-0f0c-4e0d-b11a-8c61ec027f44@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2febead3-0f0c-4e0d-b11a-8c61ec027f44@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDI1MCBTYWx0ZWRfX0F9XaWRnf85f
 //Y5SsPfbEXF7eaqH3gim8P6iJ6xkZjUpMoxq9Q/RqdCjm1hX1LbSSc0FbRqEPB04b6bOxXv7yR
 2tGni65z5m+bM4VNYtZ8P6XrHPB0TKvfuRsS7ywDWQPf9ysUnI9Xi09b+Q3gFizrp5qFxr84JxN
 5DYqdstHqp9WBGWxoo76FQtXtelTKx7VGv6IgNAzijsLi3hhOr0UtV4dFADjV/CXkXXxxuXKYRj
 AIUGZVWrmB2439B7FQ+elfmGlKpF21d0QN0oRvYFZhr1f9fFW4EH0dPapvlfVMVnmg0XuNQsw0Q
 uDaNrhgWawtNJItCwNyvVxQx9F2wza6oQ2DwdGQIrQn3/LLfA9EvTg4c65AP+VeDAI89REyQEpi
 rJkVsC7kQ59Ycb2m0siUVz2ex14SC9kmXlP2nquvBHOlqdycCQ9hm1xdWc/+06AEPgnbz9/hIPs
 NIkZnV/G8Fy7dLHn17w==
X-Authority-Analysis: v=2.4 cv=N+AZ0W9B c=1 sm=1 tr=0 ts=6aa093a7 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=sLzL-2GVjjNmCx-rav0A:9
 a=CjuIK1q_8ugA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: -LMkGy5i9QT-fawxbwjHPk2h3-YGMT9R
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDI1MCBTYWx0ZWRfX0Ema+amSKfGg
 jvJxHhpl5KlD/Aqqa6IPeHMd4rEkCJSo6J9RRLFAoZ77CoUVjG1V5ZRr131d8hfyox3Im4rIbxp
 MRgqXiFkCmpPHsEUgIJJrqrBdWEwies=
X-Proofpoint-GUID: -LMkGy5i9QT-fawxbwjHPk2h3-YGMT9R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609080250

On Wed, Aug 26, 2026 at 07:15:07PM +0530, Ekansh Gupta wrote:
> On 24-08-2026 20:37, Rob Clark wrote:
> >>> qda_memory_dma.c / qda_memory_dma.h
> >>>   DMA coherent allocation backend. qda_dma_alloc() calls
> >>>   dma_alloc_coherent() on the CB device and encodes the stream ID
> >>>   (SID) in the upper 32 bits of the returned DMA address, following
> >>>   the Qualcomm FastRPC convention for IOMMU address space tagging.
> >>>   qda_dma_free() strips the SID prefix before calling
> >>>   dma_free_coherent().
> >>>
> >>> qda_memory_manager.c
> >>>   Adds process-to-device assignment: each DRM file (process) is
> >>>   assigned one IOMMU context bank device for the lifetime of the
> >>>   session. qda_memory_manager_assign_device() first checks whether
> >>>   the process already has a device (reusing it with a refcount
> >>>   increment), then falls back to claiming an unassigned device.
> >>>   qda_memory_manager_alloc() and qda_memory_manager_free() delegate
> >>>   to the DMA backend after resolving the correct CB device for the
> >>>   calling process.
> >> Oh, stuff like that is usually a pretty big NO-GO now.
> >>
> >> AMD has made the same mistake with KFD and it resulted in a massive chaos.
> >>
> >> The DRM file is the driver context your process uses and even if there are multiple DRM files for the same PID you should absolute *NOT* share anything between them.
> >>
> >> The general rule of thumb is to not attach anything to the process using the DRM file descriptor.
> > A couple other things to keep in mind:
> > 
> > 1. drm device fd can be passed across processes
> > 2. virtgpu/virglrenderer drm native ctx is a single process that opens
> > the drm device file N times on behalf of N guest userspace processes.
> > 
> > All that to say, Christian is right here.. drm_file is your context,
> > pgtables should be attached to the drm_file (potentially via
> > drm_gpuvm.. which you perhaps want to use).
> > 
> > BR,
> > -R
> > 
> >> Regards,
> >> Christian.
> >>
> 
> Hi Christian, Rob,
> 
> Thank you for highlighting this.
> 
> I'll rework the CB assignment to be per-drm_file. Each open() will get a
> CB assigned from the available pool (find-first-available, not
> find-by-PID). The assigned_pid field and PID-matching logic will be
> removed entirely.
> 
> The hardware has a limited number of context banks that serve many
> sessions (on fastrpc, via the DT "qcom,nsessions" property), so multiple
> drm_files may end up sharing the same underlying CB due to hardware
> constraints, but while implementing that also, I'll ensure that the
> association goes through drm_file->driver_priv, never through a PID scan.

I'd strongly suggest to implement a simple case and not to implement CB
sharing for now.

> I'll also look into drm_gpuvm for the longer-term address space
> management as Rob suggested.

Nice. I think I've beeng trying point it out, but maybe not very
explicit.

-- 
With best wishes
Dmitry
