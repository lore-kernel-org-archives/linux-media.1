Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794555751;
	b=xiLWn03QRtzYJ8TFseNhS4ZFpSoRNOb/BdjOaikgZ2qzRkfXAxmP6Fr0wwN+2jN8cQ70
	 BI8KmWGgDJoHoO6d2CpNfSS5es+9QXw/VH6ECA8yV2pvsdHT0/CsFtC78Lz56o0M0+pAy
	 f9PdJBfWLLqBQJHoXn81vdZj+Xrx+VkBEWyfy5JhnjAbJR+O1OyFqCm1HoPDMtStW5+zw
	 6IjPtdMKJ4EPXAg2+WfIo1BMUZSBAtfyx/cVNEONiFHvzTH4Xk1CbZwnmp6b0VYlvTKIP
	 wQJtb6ebbBJ4E9WiAL8Gbw6muOLuiPBxg+2Yzy/6lgFoaeHgdB8+kaT0NuuChbI+QJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794555751;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=NUl3m6J5h7TCNp52N0g9QRpKf+c3/loK8kBHxy8vOxQ=;
	b=4aMKKtRsXtiRF/arRvnmq13Ee+7BxTiTHHBloYt4TSh7nbJpzKS2a+t7UxtUaT8E5kvI
	 FfhQxd3BRwM3cqNuqAiRZFvXUoSKIw0skG/11gH2pZ3IRiVAvqAHV9Z215ZPC1oKNSnsN
	 aUOMk+NQ8bD5Tpdk2NAWQiqfxUx1UU/wxiiADGp2U7cV3Dow9LWXQxtepNV3tKIoI4EQt
	 H+eeQF45YL07CuRQ+OmJ7+4PjEafn+dVzP8JImxb+xVAuyd6TP3mPfWPyIQBwL8PypQm+
	 7XU4JDp6vpkrsnepS++C8JO6+WspNFg8ihML00utHpWeyelGCPqf7IshuGBIj1v8mGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IKrqBXbW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JpcI+C+L;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1828E606A321
	for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 07:42:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1828E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IKrqBXbW;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JpcI+C+L
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD576HP2619596
	for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 07:42:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NUl3m6J5h7TCNp52N0g9QRpK
	f+c3/loK8kBHxy8vOxQ=; b=IKrqBXbW+S1yf2L+Lm3ZghG01nzAfsaaUMKMZR6d
	2Y9uuJZNT2swj+FR1QJJ8zT9MJQ+nroqqhjwN9IFSABNwUpnm0iABq1jVx4Kur+E
	vp2mIERuTNtqhXtGjuJKef+NrF5rUMZAuiDP5DmubXsdORit1TNHbQbV+4I5FCz3
	aK8Y4QHyT6pQ4xwh9WOqetFA7KvBlxPB7occy19Cka00JJKnZduvMK9/q2+ELYiX
	SMglpDVmAJjthY1D5bTZmocJ4zM8S8+9icDBuWVdblifaoOpixwVxAu8iYVLE3i2
	0yHmgraIYz4RJ2h2pqiEw/U5T+vF2uq7cW9jT34dYYMLmg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwu2mrr4y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 07:42:30 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-378722fd4a3so820152eec.0
        for <linux-media@vger.kernel.org>; Thu, 12 Nov 2026 23:42:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794555750; x=1795160550; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NUl3m6J5h7TCNp52N0g9QRpKf+c3/loK8kBHxy8vOxQ=;
        b=JpcI+C+LRLJllT8MTDZdhqaBksfRcCi00AfwaVptR9HVeTLSuctoFMy9yxiNI0kTEk
         NJgorotVUexi/XstN12ZyxSPnMABDeBhRBs9zWZWY9Uf00a6m1owM3Hr7mwnDWfISbPC
         i4+oO73NnPF5chJdr2DhXAkPBBVvBuyzYCvCoqGT0tqsvdR8Ry8G9ZFUPhEBKR7r6zoN
         yrlWMqtwDWnyXZnUp46wP+V9yg+1fCqTwlYEI96QhAEJzPUhrdDn6A/Z/8EgO7li4MFm
         7cis1dtA8BHc2EasSEl9tFRXUfjOg8eFVmoNCtlSNwPgWTkpd3n1a2kyMnZrfvv0DZ3e
         DhmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794555750; x=1795160550;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NUl3m6J5h7TCNp52N0g9QRpKf+c3/loK8kBHxy8vOxQ=;
        b=zZb9wh1O3pesHL8dW1D7Wbj85CGmd+WzkUBYtYH6h8p9bmSx/gO+Xx6oUhl/0Zr73R
         SGSMM+zAqCveDc9CLTbzN0hzucM/nCv8TSs4vOYPMCz2dgDYeRWLbymUuntTHaL8CI5q
         +4PBR80Y9dhv3N4QEH9TX+6T/H4chZYWQHhGMYGV04cg7pStH/Li3ZCW+91rQyfP9bFn
         XUaZAYzUn6UEWGdnPqMn9ZAHbo9l7DH5RfcZ62DxeZvQJd2svJI8JtULPf/gClpT9xLq
         xEwHaovrRe7diTsw8ju1lWts+78JA26SC7b2jd/By1I9YrIM04IwhfvJWkreAnTeKd1W
         CIXA==
X-Forwarded-Encrypted: i=1; AL+hErG+gsHLrtoh6u5q69AFJLYtUc+5bLda3tHCGaCpriitfJonhM5JspB3SQmagGlpNE3kAPfpM/q4qkRLdQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8jyuG8uH6//zIoNk6viKEXdtYQKQRCQmqx4u4L05SHCHX7eYpX
	gNLUcFdsI+t3vpwB47vNHUohTTVjbBuX+gNllCmSISNTdrEjCkXjrb8Yx1MMN1Q5kBzHqryB1X5
	Dfyl0yViaBteuQ7Hyv8EcX764v6XGlt930YULjNfo2bQybbvjCqeQKrThTP768Wt2gw==
X-Gm-Gg: AYBFou3tizEAboIG+nwQEr9gYLyMxSyQr3vErpcjg0kgqAD9HqVTCCm7BflP29RGX2h
	kJMxOmyOO3eDhXY3/FUTY2j9ZmvyHaNw+hDuc4i+1LpcIXb6yiVD736g1LBliMLoF6MH/qr5gru
	KRVaJU3b0Dhikxn04Y3FKS1d6Q3ilBWkwT6vMH9fXphAVS2KI4qVHt4HfWNpz6AZ/A+vIoh1W8W
	Vep7BIMXHj+n2EHeiQyRBBIxyswNlKRVFCHRGYmDqN4jMs25ZCQaTcyM8ze1Iq/bFoqkUaAhpFq
	nscxTznjkkceO+6/CHVIJKBRlfT4gDF5N4DGd0MP3dlr+JUuoLN71WDH+HhtJVW4GzUZ/GS0vZv
	MUOHKF3RHfoYxOnYuIccp3nuVofRaGrt8NCu7rgs69zcfbOQJnE+VjlBTr3i9jbW6bSZWnByYfN
	4T
X-Received: by 2002:a05:701b:290a:b0:16c:3408:760b with SMTP id a92af1059eb24-1b503121292mr1619094c88.32.1794555749293;
        Thu, 12 Nov 2026 23:42:29 -0800 (PST)
X-Received: by 2002:a05:701b:290a:b0:16c:3408:760b with SMTP id a92af1059eb24-1b503121292mr1619067c88.32.1794555748517;
        Thu, 12 Nov 2026 23:42:28 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50309b2b5sm4436549c88.1.2026.11.12.23.42.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 23:42:28 -0800 (PST)
Date: Fri, 13 Nov 2026 13:12:16 +0530
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
Subject: Re: [PATCH 3/8] media: iris: migrate firmware loading to
 qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset()
Message-ID: <20261113074216.5md7myragcw2xkf2@hu-mojha-hyd.qualcomm.com>
References: <20260925155737.4161358-1-mukesh.ojha@oss.qualcomm.com>
 <20260925155737.4161358-4-mukesh.ojha@oss.qualcomm.com>
 <aa70a256-eba2-483f-8326-c3bd2ff3d33e@oss.qualcomm.com>
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
In-Reply-To: <aa70a256-eba2-483f-8326-c3bd2ff3d33e@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: ry7C610LfTgnX_9fKxSOmkeK5XXXtyrJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAzMCBTYWx0ZWRfX+9tznCF8deZH
 4pjm8R8MfGileBxZqkYXaGeAKmNfD9FQWD6x+ML7j+vdKi2wYjAuQ28sKPcJIZTzczWnEVOTJNt
 lXv00nR8fY9SNGmv7NevYfiDq5FF+w/F4ZV8fs1gmK/dUZye5JG0stZjX6ezA1k0gXq/4E4nvCH
 aMbgLbviBx67ZRkfwy7l7J9rVU/qWekslZv9kGdzMNmOpa0kEN+b+QYN85oY3DOgrJMZufJQz1m
 FHgVoeiM1eaPxoTcJznUWmvV2f+9sDEfbFYSErTbMQO6RReFzJBQFaQaA2CVX49CKJJJcPCm0aY
 1QLF9xDBbxfMiZHkUXBk6ixU3v6O1XrbHLNHIh1KMnQjXNSA/NfaGqIuqytev+tOzQYMzxxZf/E
 rY5M3j4dztqo+uoueuDotQlN2nNoFxSX3NM6rsomfMLounNlOO/L3lBRh4pcn+WFtc7/KffL48u
 SLkvqyUzoilE9Z29GFQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAzMCBTYWx0ZWRfX1XgwE8fEI7YS
 eoyh5aO9NvlcoE8QPVfnWSP9wXEntwfIVC5Uhm4ckdXoDefn03RLTdmdUp8qk4wEHFLs1kfCwbD
 jLSLapiCIklurqdbliY3Dl4LByR34ng=
X-Authority-Analysis: v=2.4 cv=ddQVTnXe c=1 sm=1 tr=0 ts=6af6bf66 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=sX6kAIEwX3NwIotb1QIA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: ry7C610LfTgnX_9fKxSOmkeK5XXXtyrJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130030

On Tue, Oct 27, 2026 at 03:01:41PM +0530, Gourav Kumar wrote:
> 
> 
> On 9/25/2026 9:27 PM, Mukesh Ojha wrote:
> > iris_load_fw_to_memory() calls qcom_mdt_load() which bundles metadata
> > init, memory setup, and segment loading with no PAS context, and
> > iris_fw_load() calls qcom_pas_auth_and_reset() which skips the shmbridge
> > prepare step required before TrustZone authentication.
> > 
> > Since the auth call is in a different function from where the PAS context
> > is allocated, add a pas_ctx pointer to struct iris_core so it can be
> > threaded between the two call sites.  Replace qcom_mdt_load() with
> > devm_qcom_pas_context_alloc() and qcom_mdt_pas_load() in
> > iris_load_fw_to_memory(), storing the context in core->pas_ctx, then
> > pass it to qcom_pas_prepare_and_auth_reset() in iris_fw_load().
> > 
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > ---
> >  drivers/media/platform/qcom/iris/iris_core.h  |  2 ++
> >  .../media/platform/qcom/iris/iris_firmware.c  | 20 ++++++++-----------
> >  2 files changed, 10 insertions(+), 12 deletions(-)
> > 
> > diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
> > index 24da60448cf2..68e6adcc1dfd 100644
> > --- a/drivers/media/platform/qcom/iris/iris_core.h
> > +++ b/drivers/media/platform/qcom/iris/iris_core.h
> > @@ -8,6 +8,7 @@
> >  
> >  #include <linux/types.h>
> >  #include <linux/pm_domain.h>
> > +#include <linux/firmware/qcom/qcom_pas.h>
> >  #include <media/v4l2-device.h>
> >  
> >  #include "iris_hfi_common.h"
> > @@ -123,6 +124,7 @@ struct iris_core {
> >  	/* encoder and decoder have overlapping caps, so two different arrays are required */
> >  	struct platform_inst_fw_cap		inst_fw_caps_dec[INST_FW_CAP_MAX];
> >  	struct platform_inst_fw_cap		inst_fw_caps_enc[INST_FW_CAP_MAX];
> > +	struct qcom_pas_context			*pas_ctx;
> >  };
> >  
> >  int iris_core_init(struct iris_core *core);
> > diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
> > index 21cdf1c39835..e73a5dd98b88 100644
> > --- a/drivers/media/platform/qcom/iris/iris_firmware.c
> > +++ b/drivers/media/platform/qcom/iris/iris_firmware.c
> > @@ -115,9 +115,7 @@ static int iris_load_fw_to_memory(struct iris_core *core)
> >  	struct resource res;
> >  	phys_addr_t mem_phys;
> >  	const char *fw_name;
> > -	size_t res_size;
> >  	ssize_t fw_size;
> > -	void *mem_virt;
> >  	int ret;
> >  
> >  	ret = of_reserved_mem_region_to_resource(dev->of_node, 0, &res);
> > @@ -125,7 +123,6 @@ static int iris_load_fw_to_memory(struct iris_core *core)
> >  		return ret;
> >  
> >  	mem_phys = res.start;
> > -	res_size = resource_size(&res);
> >  
> >  	firmware = iris_detect_firmware(core, &fw_name);
> >  	if (IS_ERR(firmware))
> > @@ -134,21 +131,20 @@ static int iris_load_fw_to_memory(struct iris_core *core)
> >  	core->iris_firmware_data = core->iris_firmware_desc->firmware_data;
> >  
> >  	fw_size = qcom_mdt_get_size(firmware);
> > -	if (fw_size < 0 || res_size < (size_t)fw_size) {
> > +	if (fw_size < 0 || resource_size(&res) < (size_t)fw_size) {
> >  		ret = -EINVAL;
> >  		goto err_release_fw;
> >  	}
> >  
> > -	mem_virt = memremap(mem_phys, res_size, MEMREMAP_WC);
> > -	if (!mem_virt) {
> > -		ret = -ENOMEM;
> > +	core->pas_ctx = devm_qcom_pas_context_alloc(dev, IRIS_PAS_ID, mem_phys,
> > +						    resource_size(&res));
> > +	if (IS_ERR(core->pas_ctx)) {
> > +		ret = PTR_ERR(core->pas_ctx);
> > +		core->pas_ctx = NULL;
> >  		goto err_release_fw;
> >  	}
> >  
> > -	ret = qcom_mdt_load(dev, firmware, fw_name,
> > -			    IRIS_PAS_ID, mem_virt, mem_phys, res_size, NULL);
> > -
> > -	memunmap(mem_virt);
> > +	ret = qcom_mdt_pas_load(core->pas_ctx, firmware, fw_name, NULL);
> 
> qcom_mdt_pas_load() passes the ctx to qcom_pas_init_image(), which keeps
> the metadata buffer in ctx->ptr, and qcom_pas_prepare_and_auth_reset()
> does not free it. Who is expected to call qcom_pas_metadata_release()
> for iris? I don't see it called after authentication (or on its
> failure), unlike in qcom_q6v5_pas.c.
> 
Below change is merged, so buffer will be freed in the call itself, no need
to call qcom_pas_metadata_release() explicitly for clients who are not
interested in saving their metadata context.


https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=2aa8fafc08e777e9da356307c1a0117e7f4277cf


> Gourav Kumar
> 
> >  err_release_fw:
> >  	release_firmware(firmware);
> >  
> > @@ -166,7 +162,7 @@ int iris_fw_load(struct iris_core *core)
> >  		return ret;
> >  	}
> >  
> > -	ret = qcom_pas_auth_and_reset(IRIS_PAS_ID);
> > +	ret = qcom_pas_prepare_and_auth_reset(core->pas_ctx);
> 
> ctx->use_tzmem is not set for iris, so the shmbridge creation in
> qcom_scm_pas_prepare_and_auth_reset() is skipped and the behaviour is
> the same as the old qcom_pas_auth_and_reset(). Please reword the commit
> message accordingly, since it currently implies that the prepare step is
> now performed by the new API as a fix.

Sure.

> 
> Gourav Kumar
> 
> >  	if (ret)  {
> >  		dev_err(core->dev, "auth and reset failed: %d\n", ret);
> >  		return ret;
> 

-- 
-Mukesh Ojha
