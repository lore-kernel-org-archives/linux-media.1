Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6298A3BFAF7
	for <linux-media@vger.kernel.org>; Thu,  8 Oct 2026 11:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791458241; cv=none; b=LPmsJ7V59oSrSkeSz6+78wkMRdgoT1B7jP7DXhWja/spmk31BGEFg83ngEtS62tVKNL0qChEbeO+K58PxRIzsYp6Ovdi3KCUjI4HLpds+zwggocVKFwjDnFktUydyVXHHk+OnpsFEbjx6pcYCP8lSvn1Njwo/dzdP1Mnhqtpnq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791458241; c=relaxed/simple;
	bh=9C8+ZBMnV6Yz5GoGuKBSlxmoHu/hfL+vCD9irsj3M0A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MgJzwMZ23cNLlDPNmFfAGLHk4yhVJbHW7glbyCPemG+ce7BsljISvHFjm88+E9sqwxalkGh3cXRAswhepmnUFbu4g0anjF62yXz+2soJV3lgFuA5tV8FhXISS3ok//tCdDUCLo2Brr7QnNUY8xmPQZNjDMZDDT9WI/Gk4KLKd5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KqbBOjPg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XWb7BgV4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KqbBOjPg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XWb7BgV4"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698AbIaY3751371
	for <linux-media@vger.kernel.org>; Thu, 8 Oct 2026 11:17:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/ab8smPxfVHeAoXkdhyV8/oNcR4yYT14zH2lqJ8jcrU=; b=KqbBOjPgXmySGfNY
	FTT+q1V6oBwlsFKArtbtr4IbwCFgW1WYNgbKDTWAjpQ3+eGjo4X9RG4KFtELpffm
	SXxDPOPh4nDcb+Je25/2Rqd62mfZuYyxU8UUdhocBCwke/G40j9+hpMGnA1SR6V6
	BhAj/424gX9iBzcTDhtIJWhH+Ym3H0xqfLGsuxgynmL2uyOmPsZOe9E/kr3wZDJ4
	e9X5vHuUm5uJfxhO4YrNrJUZfvmA267H41mDuPLp/m4RRmrKQXWVlEiGke1vFGWN
	bJZs5I2rwaHLWLgsHnHcNbj6gzahZPTuLX3u6HfJNS3ABhtQSVZU+JOek6yluL/E
	p/aHTQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h60sga758-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 08 Oct 2026 11:17:19 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cb93c874bso192407685a.0
        for <linux-media@vger.kernel.org>; Thu, 08 Oct 2026 04:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791458238; x=1792063038; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/ab8smPxfVHeAoXkdhyV8/oNcR4yYT14zH2lqJ8jcrU=;
        b=XWb7BgV4hxNsHpQJ9s4A6g5qTtg+JNmh01axC7kgpC/lljPL6M4zYWPYA4huDV9St+
         JhR3wrbdkCLztpcIWMFgsOBm+uBvkq/2mfHPPuXHdgELIwX8QVX093veRTxei9771RZD
         YTfLLjckGgvwvMcsOcX/f1rs0gVsXVMYH/ucSX7MB4QNYZwDgM6g5jVFfhIZf+HRz2oP
         HBmKfdwxcln1wuf+cCmAYOgEt1OkFtxK5A5R3UV62pU0WfhODp5teKRepYRm73Uj37sP
         aqT6S1Vr/MyFkBsam0i1H2Ede+ReYJ5iUapEl0EPe7UJK571ID0BU8xMhh4Zv4h+S75Q
         4iaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791458238; x=1792063038;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/ab8smPxfVHeAoXkdhyV8/oNcR4yYT14zH2lqJ8jcrU=;
        b=hwkLSpuvrX7K/ZQEYLzHg5zEU0iXZxWQ5ONu+Mty8W+vp357/Km32dkGCVLMfKUHsB
         MIc5r1YKSQQpWLTWYzuOc+n7d+ixqZw4RyDDhmxlt8nggU5hDm32fdXIjMEeWNKxDkeB
         MPl//Ji9hQFybyFdMZR/7N+SVoK/L6B3zstQV+5X3sz7pkAJ0FM+kH+zmJ86wXEn90k1
         iCvwR2Q+syq/JvIz3HSrCi6vqAepIYpO9aMJJb9TGtj4tHHSvXhY4YqX+wOI5+CdXLg/
         IJve1Z07U6fCHgFrFX+0FGwBF5ZPxjROto/Mo8IspDHHTdwTdr/eRyc4EI08IMpHhnfc
         E3VQ==
X-Gm-Message-State: AFuF++mjW3k+nPK0bHqTujKrJflNapY9bCD61sUckHteaOk0HYVMfBLL
	Xb1SUKwsbrHOthHqWHkhr13WtnyJJY8JwAZLCK/wAtfO9/HqkWSsUKEsYWJf/nS6mLM3JN4QohG
	1DHIKa57NygK4GsvAQ75oWAWKhVXGg8w+URUcqFSac6VIFZbZHGpB2fjN9ppr9PWdng==
X-Gm-Gg: AYBFou1qokx0PIIQ5F1Qu0uADpF4M/hzNVece2IDgYfnO/OPLojsAhGMDj+8CpFtY0l
	PK4uSWSWSWy/YPCdtUwBACuzowsmzV8s2uB3eVKZjn8ksKKKgBgC7e2TxmEkl0QDSzL5njIvh6K
	Z7jO7lIRBxxm571MSfh/7dmjpNDshKCdJAEjFn66BM0IMkjcU1NrHfduaEVrJr1HwD3vU9LCY8P
	vo70qIQMZ8RswkVB/5Hev4BaZR9cIHtxzBMMduGZYjV4ztZ8r2tFq2RHF/+hbAx+A5BFbsYNwn8
	ZRLoIp+CZH5zpo6mMfmXT12Iq2dEda9GSkLAbArso7ZGSvnITYnijc6TeKlZvzA3ZSeNBCddbT0
	yGaYMNTH6wNXl3NVYFD1N3tgeMcV1bAkjPP7+57F0
X-Received: by 2002:a05:620a:171e:b0:93c:ba9f:1165 with SMTP id af79cd13be357-93eab0de0b9mr365514085a.21.1791458237911;
        Thu, 08 Oct 2026 04:17:17 -0700 (PDT)
X-Received: by 2002:a05:620a:171e:b0:93c:ba9f:1165 with SMTP id af79cd13be357-93eab0de0b9mr365507985a.21.1791458237362;
        Thu, 08 Oct 2026 04:17:17 -0700 (PDT)
Received: from [192.168.25.64] ([94.155.124.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71bd7690sm10824675f8f.2.2026.10.08.04.17.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 04:17:16 -0700 (PDT)
Message-ID: <f3a4b60b-f992-4a0d-af9e-dd0fe7ae1ac8@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 14:17:14 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 66/74] media: qcom: camss: vfe-780: Produce the AEC Bayer
 histogram statistics
To: bod@kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Keke Li <keke.li@amlogic.com>,
        Richard Acayan <mailingradian@gmail.com>,
        Hans Verkuil
 <hverkuil@kernel.org>,
        Gjorgji Rosikopulos <quic_grosikop@quicinc.com>,
        Radoslav Tsvetkov <quic_rtsvetko@quicinc.com>,
        Robert Foss
 <rfoss@kernel.org>,
        Milen Mitkov <quic_mmitkov@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-0-ed985aefd611@kernel.org>
 <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-66-ed985aefd611@kernel.org>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-66-ed985aefd611@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: P1U10YItRm5aIAAup7VBmUAzeI3UU_c2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA0NCBTYWx0ZWRfXyMMPBDVMp08p
 9hcRPLfeFga57mp5QFG2ASxZnFAhZvAWEa/r8lgLLVnCS7wqiblewvPshu6nZ9htTSuREy2+zZQ
 Y4qmsNG1BDyixe2ZkriBqx+32Bt07hc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA0NCBTYWx0ZWRfX4yz2B1rq8VkV
 EC7H5H0hehjSOstZmOKGhZFZc2yvegdI6zz/1c882y2SdjZ5xN8XDnnjybpJ4ycf1KfAz6VrH8l
 cht+YfpxGplsHpGyvHrcCpEv91o9D+RHb8/hX0HMSIzyZuIopviphT3ibQC+yN2PLzeqv3Pzov5
 GaJ2A4qsRw6KYaqml5540IuyYvUZArklS0j+sXmlRzbfQazAdnF/q88AbqONjIRZFZ2xapRaA6S
 TqZojue0y/FjkIsUkmCk2WcsXscwNFmy1CJH8nTG5Ps3qUc/TbKhIN9XacSwcU+XBmmwQnqwk8K
 MtnOxqgjraNliXC3ikB5XttFmME3+dqOcSJVGILMJMlfGNO4V4jWPNHm6BQdujRrcMT4BKD/vVB
 w7UI0fGQLPrqqRYycJDrWWNBYAetyBzkem9ujxYTK8AEZ5xRdn30AMzONUHsDmV2VuIVCjoP8MH
 tKu1BbKhAjdPh+jwmnw==
X-Authority-Analysis: v=2.4 cv=DfWCOftW c=1 sm=1 tr=0 ts=6ac77bbf cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=eGCDHFSXubCXFTSSGhjuOA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=9HLjchaWZDWxLujXepYA:9
 a=_XCuZJuDE0Lb3mBl:21 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: P1U10YItRm5aIAAup7VBmUAzeI3UU_c2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_04,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 spamscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080044

Hi Bryan,

On 10/5/2026 8:14 PM, bod@kernel.org wrote:
> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> Stream the AEC Bayer histogram on the pixel line's statistics node, as
> the V4L2_META_FMT_QCOM_ISP_STATS block CAMSS_STATS_AEC_BHIST.
> 
> The AEC BHIST write master is frame based, PLAIN64, in completion group
> 4. Write master addresses are 256 byte aligned and the v4l2-isp block
> payloads are not, so the write master fills a kernel buffer and the
> completion of group 4 serialises it into the next queued statistics
> buffer with v4l2_isp_stats_init_buffer() and
> v4l2_isp_stats_init_block(). The copy runs a frame before the write
> master writes the kernel buffer again.
> 
> As with image buffers, each frame consumes one programmed write master
> address, so the write master is handed the kernel buffer once per queued
> statistics buffer. Without a queued buffer it has no address and the
> frame's statistics are dropped; the sequence numbers show the gap.
> 
> The statistics output runs when msm_vfeN_stats is streaming as the
> image node starts. The node may stop and start again while the line
> runs: vfe_flush_buffers() now forgets the buffers it returns.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  drivers/media/platform/qcom/camss/camss-vfe-780.c | 64 +++++++++++++++++++++
>  drivers/media/platform/qcom/camss/camss-vfe.c     | 68 +++++++++++++++++++++++
>  drivers/media/platform/qcom/camss/camss-vfe.h     |  9 +++
>  3 files changed, 141 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe-780.c b/drivers/media/platform/qcom/camss/camss-vfe-780.c
> index 1d00a3656d7c3..7642d9d4500de 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe-780.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe-780.c
> @@ -114,8 +114,49 @@ static void vfe_wm_start_pix(struct vfe_device *vfe, struct vfe_line *line)
>  	}
>  }
>  
> +static struct vfe_output *vfe_stats_output(struct vfe_line *line, u8 wm)
> +{
> +	unsigned int o;
> +
> +	if (!line->is_pix)
> +		return NULL;
> +
> +	for (o = 1; o < line->num_outputs; o++)
> +		if (line->output[o].pad == MSM_VFE_PAD_SRC_STATS &&
> +		    line->output[o].wm_num &&
> +		    line->output[o].wm[0].bus_client == wm)
> +			return &line->output[o];
> +
> +	return NULL;
> +}
> +
> +/* Statistics write masters are frame based and fill the output's kernel buffer */
> +static void vfe_wm_start_stats(struct vfe_device *vfe, struct vfe_output *output)
> +{
> +	u8 wm = output->wm[0].bus_client;
> +
> +	writel(0, vfe->base + VFE_BUS_WM_IMAGE_CFG_0(wm));
> +	writel(0, vfe->base + VFE_BUS_WM_IMAGE_CFG_1(wm));
> +	writel(1, vfe->base + VFE_BUS_WM_IMAGE_CFG_2(wm));
> +	writel(VFE_BUS_WM_PACKER_FMT_V3_PLAIN_64,
> +	       vfe->base + VFE_BUS_WM_PACKER_CFG(wm));
> +
> +	/* no dropped frames, one irq per frame */
> +	writel(0, vfe->base + VFE_BUS_WM_FRAMEDROP_PERIOD(wm));
> +	writel(1, vfe->base + VFE_BUS_WM_FRAMEDROP_PATTERN(wm));
> +	writel(0, vfe->base + VFE_BUS_WM_IRQ_SUBSAMPLE_PERIOD(wm));
> +	writel(1, vfe->base + VFE_BUS_WM_IRQ_SUBSAMPLE_PATTERN(wm));
> +
> +	writel(1, vfe->base + VFE_BUS_WM_MMU_PREFETCH_CFG(wm));
> +	writel(0xFFFFFFFF, vfe->base + VFE_BUS_WM_MMU_PREFETCH_MAX_OFFSET(wm));
> +
> +	writel(WM_CFG_EN | WM_CFG_MODE, vfe->base + VFE_BUS_WM_CFG(wm));
> +}
> +
>  static void vfe_wm_start(struct vfe_device *vfe, u8 wm, struct vfe_line *line)
>  {
> +	struct vfe_output *stats = vfe_stats_output(line, wm);
> +
>  	struct v4l2_pix_format_mplane *pix =
>  		&line->output[0].video_out.active_fmt.fmt.pix_mp;
>  
> @@ -126,6 +167,11 @@ static void vfe_wm_start(struct vfe_device *vfe, u8 wm, struct vfe_line *line)
>  
>  	writel(0x0, vfe->base + VFE_BUS_WM_TEST_BUS_CTRL);
>  
> +	if (stats) {
> +		vfe_wm_start_stats(vfe, stats);
> +		return;
> +	}
> +
>  	if (line->is_pix) {
>  		vfe_wm_start_pix(vfe, line);
>  		return;
> @@ -157,6 +203,11 @@ static void vfe_wm_stop(struct vfe_device *vfe, u8 wm, struct vfe_line *line)
>  	struct vfe_output *output = &line->output[0];
>  	unsigned int i;
>  
> +	if (vfe_stats_output(line, wm)) {
> +		writel(0, vfe->base + VFE_BUS_WM_CFG(wm));
> +		return;
> +	}
> +
>  	for (i = 0; i < output->wm_num; i++)
>  		writel(0, vfe->base + VFE_BUS_WM_CFG(output->wm[i].bus_client));
>  }
> @@ -165,8 +216,19 @@ static void vfe_wm_update(struct vfe_device *vfe, u8 wm, struct camss_buffer *bu
>  			  struct vfe_line *line)
>  {
>  	struct vfe_output *output = &line->output[0];
> +	struct vfe_output *stats;
>  	unsigned int i;
>  
> +	/*
> +	 * Each frame consumes one programmed address, as for images: hand the
> +	 * write master the output's kernel buffer once per queued buffer.
> +	 */
> +	stats = vfe_stats_output(line, wm);
> +	if (stats) {
> +		writel(stats->dma_addr >> 8, vfe->base + VFE_BUS_WM_IMAGE_ADDR(wm));
> +		return;
> +	}
> +
>  	/* camss-video sets addr[1] = addr[0] + bytesperline * height for NV12 */
>  	for (i = 0; i < output->wm_num; i++) {
>  		u32 addr = buffer->addr[output->wm[i].plane];
> @@ -237,6 +299,8 @@ static void vfe_subdev_init(struct device *dev, struct vfe_device *vfe)
>  	vfe_add_ds(&pix->output[1], MSM_VFE_PAD_SRC_DS4, VFE_WM_VIDEO_DS_4, VFE_V3_COMP_GRP_0);
>  	vfe_add_ds(&pix->output[2], MSM_VFE_PAD_SRC_DS16, VFE_WM_VIDEO_DS_16, VFE_V3_COMP_GRP_0);
>  	vfe_add_stats(&pix->output[3], VFE_WM_STATS_AEC_BHIST, VFE_V3_COMP_GRP_4);
> +	if (vfe_alloc_stats(vfe, &pix->output[3]))
> +		pix->output[3].wm_num = 0;	/* no statistics without their buffer */
>  	vfe_add_params(&pix->output[4], VFE_V3_COMP_GRP_0);
>  
>  	/* PIX mode */
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
> index b90b538c1aaaf..1522f1046d8dd 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -623,6 +623,63 @@ u32 vfe_hw_version(struct vfe_device *vfe)
>   * @vfe: VFE Device
>   * @wm: Write master id
>   */
> +static const struct v4l2_isp_stats_block_type_info vfe_stats_block_info[] = {
> +	[CAMSS_STATS_AEC_BHIST] = { .size = sizeof(struct camss_stats_bhist) },
> +};
> +
> +/*
> + * vfe_alloc_stats - Allocate the write master target of a statistics output
> + * @vfe: VFE device
> + * @output: statistics output
> + *
> + * Write master addresses are 256 byte aligned and the v4l2-isp block payloads
> + * are not, so statistics are written to a kernel buffer and copied into the
> + * userspace buffer when their completion group fires.
> + *
> + * Return 0 on success or -ENOMEM
> + */
> +int vfe_alloc_stats(struct vfe_device *vfe, struct vfe_output *output)
> +{
> +	output->dma_size = sizeof_field(struct camss_stats_bhist, bins);
> +	output->dma_vaddr = dmam_alloc_coherent(vfe->camss->dev,
> +						output->dma_size,
> +						&output->dma_addr, GFP_KERNEL);
> +
> +	return output->dma_vaddr ? 0 : -ENOMEM;
> +}
> +
> +/*
> + * vfe_stats_fill - Serialise a frame's statistics into a userspace buffer
> + * @vfe: VFE device
> + * @output: statistics output
> + * @buf: buffer to fill
> + *
> + * Runs from the completion of the statistics group, a frame before the write
> + * master writes the kernel buffer again.
> + */
> +static void vfe_stats_fill(struct vfe_device *vfe, struct vfe_output *output,
> +			   struct camss_buffer *buf)
> +{
> +	struct v4l2_isp_buffer *stats = vb2_plane_vaddr(&buf->vb.vb2_buf, 0);
> +	struct v4l2_isp_block_header *block;
> +	struct camss_stats_bhist *bhist;
> +
> +	v4l2_isp_stats_init_buffer(stats, V4L2_ISP_VERSION_V1);
> +
> +	block = v4l2_isp_stats_init_block(vfe->camss->dev, stats,
> +					  vfe_stats_block_info,
> +					  ARRAY_SIZE(vfe_stats_block_info),
> +					  CAMSS_STATS_AEC_BHIST,
> +					  CAMSS_STATS_MAX_PAYLOAD);
> +	if (!IS_ERR(block)) {
> +		bhist = container_of(block, struct camss_stats_bhist, header);
> +		memcpy(bhist->bins, output->dma_vaddr, sizeof(bhist->bins));
> +	}

According to my understanding, the v4l2-isp documentation explains that parameters
are copied to prevent userspace from updating and potentially corrupting the engine
configuration, which could pose a security risk
(though I don't think this concern applies to lookup tables like gamma/lsc).
That's a separate discussion anyway.

What I don't understand is why statistics are being copied. They should work the same way as
image buffers—from the engine's perspective, they're just buffers containing data, and from
userspace's perspective, they should be identical.
I may have missed an earlier discussion about this, but copying one or more statistics on
every frame (and there will be more in the future) doesn't seem right.

~Gjorgji

