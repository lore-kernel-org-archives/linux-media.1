Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21DB7392C4B
	for <linux-media@vger.kernel.org>; Tue, 18 Aug 2026 03:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787024547; cv=none; b=upEuACfB2tfF4gqfbI/KUSzr8dWN5FMdkFIZgndOCba0oLBfkXPHstQgr713/pJKogzEy/fkrVxGgoBhtMqfq83HdjC2XPij2fUrUgtKGZRtIp5+oXoR2cQ0hB8okuuAx9NdxCB0SCjih80+r574aahESYzflarkyX1PVaUgM4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787024547; c=relaxed/simple;
	bh=og0nH85CYCCGni0xB/xCMYW1Oun84u73xVvU8oPwK0I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q6kycXOVO1TJwCJypQEgtWDklaegEXlgpg1QsA0QrGXnD+KMSPXXrQJY4gHAosre59lG7gRar+pYl1dyet3eUF1im4/RePNJIJqrA2KfHaoto+VtZoc0Prirj24FENXzNbR0pGZkE741K2FaxYwW35W8iwCEq0yw3nZ008PPPfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R1GwYAHq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KIC8qF15; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R1GwYAHq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KIC8qF15"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67I33vls3298661
	for <linux-media@vger.kernel.org>; Tue, 18 Aug 2026 03:42:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MaABp0/faTANtVcerTDacDQd
	lb7pXZWcETU4q2gt11c=; b=R1GwYAHqL8EDVwyhfRXBq4LeLrPDpen8Be1zsRaX
	XWcXJhOYiY3/auiFO2HbPN7yF4/QJ1KCGEOCw2iLndJ8FVKA+nADhGeo6qst9tCw
	P3bFDv8C6VafbPcV0gPjV9IFpHGN3JqVvHk9x+IhhVNlqKzMiJIBVw+35KXmZDnc
	/Wx9GiURAGiOU2T/DDfWSEXxjbRe/D0ZLTE7nOlkauAXfJpsBi0ykiRwhQ94ayEF
	2sh/eLmcHZLqo1qTPNCjzDlHIoNoiHOgAFOVi/ywV0oMHnIaeQnoNg1nOZr/gTEb
	NLwXlJSaHoGkw7VVmcznRBUBZ1IazoywpwY9OO42hEllTg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4f5pr3uh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 18 Aug 2026 03:42:24 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52d8243f1bcso5822091cf.1
        for <linux-media@vger.kernel.org>; Mon, 17 Aug 2026 20:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787024543; x=1787629343; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MaABp0/faTANtVcerTDacDQdlb7pXZWcETU4q2gt11c=;
        b=KIC8qF15MIxxZIw9q9iBol6oFzTNq3PVmSDcMlxrxi4ray1UNTG0g1aLG4OZyjzTwK
         X00q99C1eis7sddKPpHiedaS11CcAhJfJs7lxsfIKrcWFiY04ik29MysYsx30fx5H/NU
         f3VghiJN/AARBu6dvZnlsIY6rFWTKNlfUlLIgSnpFCt2pfEabv7Gavfg0TGDJY1oaeqn
         SpBbuUG8vhEqbGhdWFLEtjEfpg76ktNKIVkAsp1Ja/YVjmh8cs8IMrcvAXLG0LkiJ152
         kOECx857D+jHcVOjqgFM9YARgl0qpVTPwln+p3icA3qmbAtACxLWghb5r+IMjWScqFSG
         GGEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787024543; x=1787629343;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MaABp0/faTANtVcerTDacDQdlb7pXZWcETU4q2gt11c=;
        b=dv2LL+klQtSP+5GsXzI01nUDJ7XeoRkhTA6t9Sa3d41JRf5MBs+etosUiYKiRR2Xa1
         iPcqaumfBSjmVwR0nwqqbEMk3JzlonN02p6Awzp11lWL+t5oWFgzTZ5Tbwp5hMuEaZuy
         HK/5lBHNQVdT2Iahi+kaz5ldr3mQm/Tct/IzJthSyhOnIsQaq9veexB+5gK4fbuCikhA
         7eODH3q0K6aVLUQR/4W7pvgD2I41KZHnjskxXEgKdQFmUUCKztRZ339ZpWev3Daxy2zz
         B/bZy4TcqJZJXmKoNW2JzvF84i/sLr4O5ghL8Gjbxnif6Oy9+a99jGHfoXjEptr5uMSS
         BmkA==
X-Forwarded-Encrypted: i=1; AHgh+RpWT1q0uL2+PEOHJ35z6V55AKjbOynf9Ex8EJTGr6cO01I6INd8sL1bkTmHmy7K0nUPklYagAtmcaj0pQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwuMDGexmhqDTN38u/HTFGyDp0rZO3Hc4D9kmkbXrwI0msJU6/Z
	6YpAGb4cRf2cKUQ08aaytHomDXPUTLhlRctmWPtaKijyRfQdO5cEQYrhiBLxH82iSrGwh7Nz4E5
	qZVoa2cAlSzcj8DkQpRn3JrqolYIG91GbFFLdm8yGa0Nk9C9v/7fz0z8xs8/TG2fkvA==
X-Gm-Gg: AR+sD13xgoBfXzcb7fn5ftq+XjS/D6PkyTFoSdoNQLEmHBkKaxTpwOUXzsvuWj1ogLs
	bRNptyc8hKQcbnFz0Y4JxLfAGTcFB2Ll8w2VD69KlXhhOBWFMyemGXHGnmHvf0ozfiSlBeye57R
	i3BfQi2PnnrGBf7YovphvnwE6Z+6MLIvbCz1i8b3BbkB5z6imECPZqRsUUoUljBXytRoZEg+5mh
	iDiO4oHRsWAof7mm0oqk5/XmOsuIk4rMeYciCPBfSj4AEPbcoJH+VZ8zO+xmk6c7skwgbnA1y3j
	lSC0HtlRlSfpDTb0FGWVNnrkBHizjocJzd2Lv9LRLhukOTJMVCRq7NjYuE19DCK8smjTb+vhPgE
	Z8BydidtQpy88OIp0DIKScAAJK4lsQEnklNMeLxin6+nrCl9Fn3dsnjY1eiIu9qlNdiwHKndVSf
	E3lj2ymv3lIt8D
X-Received: by 2002:a05:622a:5592:b0:528:ce0:e9f8 with SMTP id d75a77b69052e-52dbecc2fbcmr42319021cf.3.1787024543135;
        Mon, 17 Aug 2026 20:42:23 -0700 (PDT)
X-Received: by 2002:a05:622a:5592:b0:528:ce0:e9f8 with SMTP id d75a77b69052e-52dbecc2fbcmr42318371cf.3.1787024542626;
        Mon, 17 Aug 2026 20:42:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b46cfa1811sm866041e87.30.2026.08.17.20.42.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 20:42:21 -0700 (PDT)
Date: Tue, 18 Aug 2026 06:42:19 +0300
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
Subject: Re: [PATCH v2 09/15] accel/qda: Add DMA-backed GEM objects and
 memory manager integration
Message-ID: <g3dkltejtlzrrelv77kjteqbkny6vhedyuet7d6b2p7yfix3ys@sop7vjvpdvzb>
References: <20260817-qda-v2-v2-0-69a02e9090d4@oss.qualcomm.com>
 <20260817-qda-v2-v2-9-69a02e9090d4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260817-qda-v2-v2-9-69a02e9090d4@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=S+/pBosP c=1 sm=1 tr=0 ts=6a83d4a0 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=BBVwHIhhcn0rA1_HgMAA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: SZDnGqyml6EqVLvvfVDMu3CSvXOIY126
X-Proofpoint-ORIG-GUID: SZDnGqyml6EqVLvvfVDMu3CSvXOIY126
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDAyNCBTYWx0ZWRfX6tpwNx6RdnT+
 3XUzT/PQa30ul8kyuSN9K6VOhu2u/++b/BCVfOPEhJqiE95b6/91GcXM8XSS4jOHY8qKAFDUL8e
 25Ji+PGdzUAHGBtPNWMlSFTvEtU26mbSXM/wsJBMxiFx4p12t4SobWcqDxdaz/4j58mWvZgd/rH
 KSUHx5qjSATORPe3eYoFlVFwx/pGhPf87AhVytKyhp5o+wbB6p77ieZFSCyAsrK1L/M+dR2eCMC
 KwNjFFR+DsY6KNIV/JpWdhV5PbtomjgCZt2jyqrWxq1K6jSqatzu6Erh5MnHan6s/FuRzsloWuo
 Bv4AuDYO5LAaqxa72Y7ZXUXzNW6nbh5AKpDb6XfZM6nJuy/qu+wYu/L0GDEYX59YIAYfwEFP2K7
 aEwURo8rVAB+Uh5JsTjRoTXt2OOhFPDLib5BINxBg5dYmtu+3xJwW6zHDQv5hilCaPYH15LDHrr
 LRV6yl4BDUh4OAPyMlQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDAyNCBTYWx0ZWRfX+TIH6+LRziJv
 J64c+9Gm/DzkNOE+eyKmfMR1hZVdNm8+J9l+DEAmabqlMtDNC1uoN+vVjUg1o2rGVnR4YhziHZA
 RXuCrTlzMHpxsaSmWy3FZXvsO3dj1sg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180024

On Mon, Aug 17, 2026 at 10:17:44AM +0530, Ekansh Gupta wrote:
> Introduce DMA-coherent buffer management for the QDA driver, wiring
> together the GEM subsystem, the IOMMU memory manager, and a DMA
> allocation backend.
> 
> qda_gem.c / qda_gem.h
>   Implements the GEM object lifecycle for QDA buffers. Each buffer is
>   represented by a qda_gem_obj which embeds a drm_gem_object and
>   carries the kernel virtual address, DMA address, and a pointer to
>   the IOMMU device that performed the allocation. The .free callback
>   delegates to the memory manager, and the .mmap callback uses
>   dma_mmap_coherent() via the DMA backend.
> 
> qda_memory_dma.c / qda_memory_dma.h
>   DMA coherent allocation backend. qda_dma_alloc() calls
>   dma_alloc_coherent() on the CB device and encodes the stream ID
>   (SID) in the upper 32 bits of the returned DMA address, following
>   the Qualcomm FastRPC convention for IOMMU address space tagging.
>   qda_dma_free() strips the SID prefix before calling
>   dma_free_coherent().
> 
> qda_memory_manager.c
>   Adds process-to-device assignment: each DRM file (process) is
>   assigned one IOMMU context bank device for the lifetime of the
>   session. qda_memory_manager_assign_device() first checks whether
>   the process already has a device (reusing it with a refcount
>   increment), then falls back to claiming an unassigned device.
>   qda_memory_manager_alloc() and qda_memory_manager_free() delegate
>   to the DMA backend after resolving the correct CB device for the
>   calling process.
> 
> qda_drv.c / qda_drv.h
>   qda_file_priv gains an assigned_iommu_dev pointer and a pid field.
>   The .postclose callback decrements the IOMMU device refcount and
>   clears the process assignment when the last reference is dropped.

This provides a nice summary of the patch, which is pretty useless.
Please teach your AI instead to describe the reasons and the design
decisions instead of just assessing what the code does. Why do you need
memory manager? Why can't you use existing GEM helpers?

> 
> Assisted-by: Claude:claude-sonnet-5
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
> Changes in v2:
> - Adapt to the dynamically-sized device array introduced in patch 07
>   (kcalloc'd from DT node count, replaces fixed QDA_IOMMU_DEVICES_MAX)
> - Protect register/unregister with the process_assignment_lock mutex so
>   the device-assignment and device-registration paths are serialised
> - No functional changes requested by reviewers on this patch
> ---
>  drivers/accel/qda/Makefile             |   2 +
>  drivers/accel/qda/qda_drv.c            |   4 +
>  drivers/accel/qda/qda_drv.h            |   4 +
>  drivers/accel/qda/qda_gem.c            | 134 ++++++++++++++++++
>  drivers/accel/qda/qda_gem.h            |  52 +++++++
>  drivers/accel/qda/qda_memory_dma.c     |  82 +++++++++++
>  drivers/accel/qda/qda_memory_dma.h     |  17 +++
>  drivers/accel/qda/qda_memory_manager.c | 239 ++++++++++++++++++++++++++++++++-
>  drivers/accel/qda/qda_memory_manager.h |  30 +++++
>  9 files changed, 559 insertions(+), 5 deletions(-)
> 

-- 
With best wishes
Dmitry
