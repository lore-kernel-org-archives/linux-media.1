Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794555976;
	b=qmRDC48CmUFGDAT5rIBr+5+p5n1V7/9yWxGtLE3HZrQfm1xRMHQrvs1Nf8Qqsrhc1yQU
	 sDbrYRV228uXdiWGC3ILdB6FqL8mpKFcTd4aRbqSBlWSxDkanxxnwGi5iFHwnJI8QL5/B
	 yIkR2fVWkfSC78MqRPBE/79A/9t1C7U535SEatXdzEbMp5obYF7Oi3kGxj4/P6gOrCL7k
	 Z3XrVRoo2Gv6j8uIi6U8Pn63+swFUkMl/Z6zus9hk6nrc3LbxAgNTG/mdGl4DDdJLv6mo
	 hIUAnhnIR7vvjzW/mvaUGDMBeaMep6T9NDSUROjASDqhTd00IPqGTHKFQI8FrVGjMvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794555976;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=FMnFKA+4pMDyPqtDTHmVFfRAjC7IXzhIXpiggjzZ9YI=;
	b=fNFw+bzdTAzSsHzhbQstkuwhseGw7ggtgtHmqjoxDANiTfkPZgu9LT4ZFG2GsEx7QL4P
	 0QEJwShmgLtae0684EB+BlvfnSWI7DXd4wVWZSq0WwIaFriV5gSpN0Hmd/gtghtTok3X2
	 n7k748eBcgcAMvhVJjq8SJ4of1flT7SXzgHtGER+aRJaNozrCAz2BZEII2/HkZnPDJfHC
	 P14sqTSBUqS71uqEAKzgnkRf0iLSgR45z2Epp8n4CH/Ep0h/UTZX1tkAeA36zx6uKUGwB
	 eVVeB288efItO3kvXxKMFi4qUtG3Q0/7nahSl0ecRy6pozWR8jSI0HAZL8uD9tyWv3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Zdglxlsq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RfYd9Pef;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C22606A334
	for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 07:46:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3C22606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Zdglxlsq;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RfYd9Pef
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD57CC83283518
	for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 07:46:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FMnFKA+4pMDyPqtDTHmVFfRA
	jC7IXzhIXpiggjzZ9YI=; b=ZdglxlsqS1jkrUVZb9JmJJu/zkcwdcocm1GCUFvn
	XB687YlqPWTLsVSHLzxBQbmQFHEwkZfbIOaVL2T1P0fLDLmnfDH7jAa2sDAemnoN
	pbUDelgRJlH8NKWpcbj1it7f4CWA4S+3I2PUK5AF/3bMfvzQVSMNGDMCyQR5uRMl
	X5o+WPBEmxp2QtwEzN6W5AbAgc6KJsU0ZBQkFaevjKjK2Rf4c5RAjUhEDlZ871bM
	iQy+K/ZS/xujAUgeBjNzFKsZx6/HUcTqKmHcfkcrendW+w4C167a1ocWhRTL3n5i
	RJ7aypU3H3r/5OC234slQhJbglJ+Bnw2QfasJ+fvdUeQ4g==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwv37ghtb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 07:46:14 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-370230d93efso3220277eec.1
        for <linux-media@vger.kernel.org>; Thu, 12 Nov 2026 23:46:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794555973; x=1795160773; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FMnFKA+4pMDyPqtDTHmVFfRAjC7IXzhIXpiggjzZ9YI=;
        b=RfYd9PefkiE+RDtaXmuhFdpgBYVxwNo9kmqYQdNzV66l08EBCzYl5gN7Wb9LDzqtwA
         9xmYcjc4DxTjDW9DVAlkAJQh1CyPFFyleiBMVENkAemvO2xNUNpvU3Mi3tDNkaSJ286Z
         ADs2q6tJkm8JAIjUZuyfO3fAT6PugDABJZXiuqfIYTRjccRoWtN5lCqWd/rSJVjgyHXG
         2NmTNp9tQOhaLWDPsUgSXySd6YqfEL7bjorMkXImxaHUsEWpMqmaW2svT0qN25dy52tX
         bFchz/m2Oif2eFC9XAqNV95a5MAU2sbbBcEXJ9TNVDwM8V3Ha8IzrM0v4SxUFYhtupsY
         T5eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794555973; x=1795160773;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FMnFKA+4pMDyPqtDTHmVFfRAjC7IXzhIXpiggjzZ9YI=;
        b=aQHnkLxs0hlpLs3a0AwmlyRNYsKmp5b4df1zLl4h7tPwHqmIl+snZd/YfGU2XjP58C
         gaEQ7UriuS3gtKsiPYq9PENQ1UeH4egFavgvJbtxEe22JMdT7c7N6B7OBulhikrGWrdh
         QKnKczrk2PRfxOQpM6J9kc92QabVV2nFjqyWS2YbvUHFX5DN1W/GlzslS/jUSi5Z16Qz
         CaE47ykQVzSj/a0KLfKQDVkoicCqmJFmm+gZecN1xjXZ9kkhuHYt7VoGpc/4xe6mOxIX
         QUrRl4X0RlwXgLFH4BP8esbhr3Qq7X75XQqfoMD2TvJRaCxxuxcebstXAl+fOR8zhcna
         RnUQ==
X-Forwarded-Encrypted: i=1; AL+hErFFiFmdmFDN6oSWgJVOv2om+bcJQEQ3UlaiXiNws67gTW5qtbFCopdLJGyoMOSIv4UlXddeBb0lNYMkvg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/CtEKyEXIFmIDtSPS3YTgTrvKu13Rmi4iQ4piM+85G3csgFL6u
	sduMY1/tdcRV0eeyIuljyMAJuO9Pi+NkmeE0dEZSiuLNh2W2y2kQJhc0bbZnm7P+9Klsin2LjOV
	PdHBeB1Wh/XlmtTfFruEGjLdVQBo103krMsTdMDfV184H6HOTD2I4PymSpVB/1a15bg==
X-Gm-Gg: AYBFou0Beyxa+D4+bmEUCcgp7g/2t1cPN7qH4FJlJqJzo7BATe7P6NADiNbSPHvwSJR
	oRG4phg4UbsZ3Ly+OwB/jgkM97lGrmtrOtNYP9w9ieuEXrE055q7sZeUQ0ljlVVg//48PYzQ2Tw
	hJQr7xAP2ba0h5Qw2xXcq+Nn2C/dRTeT5+JCsAIYE5crHWhsbg1CByl2JlsRBeaDO+ELHSId7bH
	I7yFha06dI884gS5h0E1Kki3Mi0sfCBdqYgyWTaYgxjRRD8nGYAzgr8pp3vhB475fvyhep0bPxT
	NWx9KxfQtUuPG+r2GGrsbcM0ZBxGkdf8Lm16gEWjibGKKsmrkCiWGPcG2vw59YAuf/iPSvVhrsr
	rVEouyEcZdkgksGK2plSsY87vMiZNW/K4a4tLG7tqZOHVxPFPHTNoWUG6hEUqNvisqUcSsE5C1x
	if
X-Received: by 2002:a05:7300:8812:b0:379:24d9:cb98 with SMTP id 5a478bee46e88-3796048149dmr1953996eec.0.1794555973171;
        Thu, 12 Nov 2026 23:46:13 -0800 (PST)
X-Received: by 2002:a05:7300:8812:b0:379:24d9:cb98 with SMTP id 5a478bee46e88-3796048149dmr1953955eec.0.1794555972421;
        Thu, 12 Nov 2026 23:46:12 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm6281195eec.19.2026.11.12.23.46.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 23:46:12 -0800 (PST)
Date: Fri, 13 Nov 2026 13:15:58 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Gourav Kumar <gourav.kumar@oss.qualcomm.com>
Cc: Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>, David Airlie <airlied@gmail.com>,
        Simona Vetter <simona@ffwll.ch>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Alex Elder <elder@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Abel Vesa <abelvesa@kernel.org>, Sean Paul <sean@poorly.run>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH 4/8] media: venus: migrate firmware loading to
 qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset()
Message-ID: <20261113074558.al5xktcizxfklkaz@hu-mojha-hyd.qualcomm.com>
References: <20260925155737.4161358-1-mukesh.ojha@oss.qualcomm.com>
 <20260925155737.4161358-5-mukesh.ojha@oss.qualcomm.com>
 <73bb47d6-af10-41d0-8fd2-173eadbaa937@oss.qualcomm.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <73bb47d6-af10-41d0-8fd2-173eadbaa937@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAzMCBTYWx0ZWRfX2g4o52w23Kze
 9CwCaol0JHK2k9MGizU3GyEiYcibTYLJ5UBX6WZTFgVUCy/L5mWyRyOwOe7MSHaTV0AgyEcIuoC
 ArFkVtX/j+W7kYWK4JZNkiC+JYuCw6I=
X-Proofpoint-ORIG-GUID: stG9JfUQ478MK70_Pme5wRECHtmBlwEw
X-Proofpoint-GUID: stG9JfUQ478MK70_Pme5wRECHtmBlwEw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAzMCBTYWx0ZWRfXwLBH/NM4PJdZ
 AczZETH0Qa+map1FAryN2OFDBCH15/S0fjlxfak8rb0koeiU08AbCf0c7fMigmY5/0J+PTEEFGt
 NF1/5LDUXJpheRX+BDBxaPzQfw5luN9OfMMDoV4pp30DCBh6f52a+c1f7LNiRztKNPiXVu4gUsz
 8GhNkTNO2+Vo+ZlwqhbL4lRSYn8pb1K0dNPeExituvUPh9QrMkgf44rZ3dNmEjhYuymJim3UXLT
 QEs4rGZxbI4bT9QX47XpW2FBzWiQwLJ8aFjHzrEHRTTbSYUKSVhkd22QNtG7g4dXoM5l/1iRtj/
 bn3teX/CFE3dgSCkk/Lz8rxvTwP90ofeQzF87dmOWBKDAmSL7CR7eimqO0/BpPOidmjYrzbH1d5
 SxbZNwFPUKtp2bcr7XhtdNG0MDHI6JTIWnQu8QeS+i4AaGnN7Ljnfb0xxpNAmR0W9u5rlcqKAId
 8Sv1zMga34UQvsfTclw==
X-Authority-Analysis: v=2.4 cv=ZeeIpcVA c=1 sm=1 tr=0 ts=6af6c046 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=8RL4tSxfe4pX_uSLj0sA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 phishscore=0 impostorscore=0 bulkscore=0 suspectscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611130030

On Tue, Oct 27, 2026 at 03:05:14PM +0530, Gourav Kumar wrote:
> 
> 
> On 9/25/2026 9:27 PM, Mukesh Ojha wrote:
> > venus_load_fw() uses qcom_mdt_load() for the TZ path and a bare
> > memremap()/qcom_mdt_load_no_init()/memunmap() sequence for the non-TZ
> > path.  venus_boot() then calls qcom_pas_auth_and_reset() which skips the
> > shmbridge prepare step required before TrustZone authentication.
> > 
> > For the TZ path, add a pas_ctx pointer to struct video_firmware so the
> > context can be threaded from venus_load_fw() where it is allocated to
> > venus_boot() where authentication happens.  Replace qcom_mdt_load() with
> > devm_qcom_pas_context_alloc() and qcom_mdt_pas_load(), storing the
> > context in core->fw.pas_ctx, then pass it to
> > qcom_pas_prepare_and_auth_reset() in venus_boot().
> > 
> > For the non-TZ path, pass NULL to qcom_mdt_load_no_init() directly,
> > removing the explicit memremap()/memunmap() since qcom_mdt_load_no_init()
> > handles the mapping internally when mem_region is NULL.
> 
> That is only true after patch 7/8, which adds the NULL mem_region
> handling to qcom_mdt_load_no_init(). Until then a NULL mem_region is
> rejected, so the !use_tz path fails between patches 4 and 7, which
> breaks bisection. I would suggest rearranging/splitting the patches so
> the qcom_mdt_load_no_init() change comes before this one.
> 
> Gourav Kumar
> > 
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > ---
> >  drivers/media/platform/qcom/venus/core.h     |  2 ++
> >  drivers/media/platform/qcom/venus/firmware.c | 29 +++++++++-----------
> >  2 files changed, 15 insertions(+), 16 deletions(-)
> > 
> > diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
> > index 46705a666776..adcf67043bf6 100644
> > --- a/drivers/media/platform/qcom/venus/core.h
> > +++ b/drivers/media/platform/qcom/venus/core.h
> > @@ -9,6 +9,7 @@
> >  
> >  #include <linux/bitops.h>
> >  #include <linux/list.h>
> > +#include <linux/firmware/qcom/qcom_pas.h>
> >  #include <media/videobuf2-v4l2.h>
> >  #include <media/v4l2-ctrls.h>
> >  #include <media/v4l2-device.h>
> > @@ -223,6 +224,7 @@ struct venus_core {
> >  		size_t mapped_mem_size;
> >  		phys_addr_t mem_phys;
> >  		size_t mem_size;
> > +		struct qcom_pas_context *pas_ctx;
> >  	} fw;
> >  	struct mutex lock;
> >  	struct list_head instances;
> > diff --git a/drivers/media/platform/qcom/venus/firmware.c b/drivers/media/platform/qcom/venus/firmware.c
> > index 3a38ff985822..4ea4c7769ac3 100644
> > --- a/drivers/media/platform/qcom/venus/firmware.c
> > +++ b/drivers/media/platform/qcom/venus/firmware.c
> > @@ -86,7 +86,6 @@ static int venus_load_fw(struct venus_core *core, const char *fwname,
> >  	struct resource res;
> >  	struct device *dev;
> >  	ssize_t fw_size;
> > -	void *mem_va;
> >  	int ret;
> >  
> >  	*mem_phys = 0;
> > @@ -117,21 +116,19 @@ static int venus_load_fw(struct venus_core *core, const char *fwname,
> >  		goto err_release_fw;
> >  	}
> >  
> > -	mem_va = memremap(*mem_phys, *mem_size, MEMREMAP_WC);
> > -	if (!mem_va) {
> > -		dev_err(dev, "unable to map memory region %pa size %#zx\n", mem_phys, *mem_size);
> > -		ret = -ENOMEM;
> > -		goto err_release_fw;
> > -	}
> > -
> > -	if (core->use_tz)
> > -		ret = qcom_mdt_load(dev, mdt, fwname, VENUS_PAS_ID,
> > -				    mem_va, *mem_phys, *mem_size, NULL);
> > -	else
> > -		ret = qcom_mdt_load_no_init(dev, mdt, fwname, mem_va,
> > +	if (core->use_tz) {
> > +		core->fw.pas_ctx = devm_qcom_pas_context_alloc(dev, VENUS_PAS_ID,
> > +							       *mem_phys, *mem_size);
> > +		if (IS_ERR(core->fw.pas_ctx)) {
> > +			ret = PTR_ERR(core->fw.pas_ctx);
> > +			core->fw.pas_ctx = NULL;
> > +			goto err_release_fw;
> > +		}
> > +		ret = qcom_mdt_pas_load(core->fw.pas_ctx, mdt, fwname, NULL);
> 
> qcom_mdt_pas_load() passes the ctx to qcom_pas_init_image(), which keeps
> the metadata buffer in ctx->ptr, and qcom_pas_prepare_and_auth_reset()
> does not free it. Who is expected to call qcom_pas_metadata_release()
> for venus?

I already replied in the other thread; it is taken care of with below
change, as clients like venus and iris do not need to call
qcom_pas_metadata_release() since the default value keep_mdt_buf is set to
false for every client that is not interested in saving the context
pointer.

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=2aa8fafc08e777e9da356307c1a0117e7f4277cf

> 
> Gourav Kumar
> 
> > +	} else {
> > +		ret = qcom_mdt_load_no_init(dev, mdt, fwname, NULL,
> >  					    *mem_phys, *mem_size, NULL);
> > -
> > -	memunmap(mem_va);
> > +	}
> >  err_release_fw:
> >  	release_firmware(mdt);
> >  	return ret;
> > @@ -237,7 +234,7 @@ int venus_boot(struct venus_core *core)
> >  	core->fw.mem_phys = mem_phys;
> >  
> >  	if (core->use_tz)
> > -		ret = qcom_pas_auth_and_reset(VENUS_PAS_ID);
> > +		ret = qcom_pas_prepare_and_auth_reset(core->fw.pas_ctx);
> 
> ctx->use_tzmem is not set for venus, so the shmbridge creation in
> qcom_scm_pas_prepare_and_auth_reset() is skipped and the behaviour is
> the same as the old qcom_pas_auth_and_reset(). Please reword the commit
> message accordingly, since it currently implies that the prepare step is
> now performed by the new API as a fix.

Sure.

> 
> Gourav Kumar
> 
> >  	else
> >  		ret = venus_boot_no_tz(core, mem_phys, mem_size);
> >  
> 

-- 
-Mukesh Ojha
