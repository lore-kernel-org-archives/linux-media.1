Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B934F432BE1
	for <linux-media@vger.kernel.org>; Mon,  3 Aug 2026 18:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785782263; cv=none; b=P9tt+bwdx1itwNd9+txojj/johr/hH+VktTv9HfxKKWiZ03KU1RC+qc9n8RLeC18FhDcgMK+e/JVxOd9vRtitwN45LWH7iEW/2Ju5aOnNy5v7XyH0bNvq5SiRyAmf78dRm8kkNjvVKPtjkje85Inl0G4xgBCaFTLKP6X5nJthm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785782263; c=relaxed/simple;
	bh=aMvYJsvgQGt1hsKgdZ1g6TxBoqxAqrHlzxqmA7g2iPA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oysBk5Pjls4FkM/xkW9hgxOWxFBBqkzXH963v87ANkQsiQenJZ9hPx5e1FWtn5S6WRNDAUcNuOiqjYBScaAkexzAZJcS/IyxqxsUwl5dC/LncU7IcI5srCUO/M4ZAtuOgIZhPpVP1IZ11dj7o3IbhRGsdiIlOZtAs3108cyZqrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eZrKRV87; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RJ361Ert; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eZrKRV87";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RJ361Ert"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 673GwN7J1224802
	for <linux-media@vger.kernel.org>; Mon, 3 Aug 2026 18:37:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hIP9IRTQDlp4agva/gLK4c0w6ETu1nA/RCtshOXlPNY=; b=eZrKRV87v/MLtCWb
	StOuC/BYF7oeLzyO7NdiGGshs3xH1mpVzo1MnRpP4gw9SLoLpciBrmp+zl0IPQ+t
	89AnmlbrQoFtnMZWG6O6TsAalFsA8pyHYRbehVsaULkX2NW2zTXztXL7YSJUoUaD
	3JCp1degubj8T0TmAtClYYCXDqPu9HDmJThNtt9wzAsQb9nJLhC00EQkYf2Vj7ZF
	VAF7sDaM5YAcQvSzjkomrQ15h3bsTC7NYy/c43Xj/xVm9ohClj+qC3N4ymLl/zUS
	NL16fx78/5fG4IGupbMFtg7Egsd+flAEkwqI6Uuskvb5YM2lgPJeJeiW5YNokp9R
	k8csJg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnvnk31w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 03 Aug 2026 18:37:40 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8f0f45415cfso42767146d6.2
        for <linux-media@vger.kernel.org>; Mon, 03 Aug 2026 11:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785782255; x=1786387055; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hIP9IRTQDlp4agva/gLK4c0w6ETu1nA/RCtshOXlPNY=;
        b=RJ361ErtW5iXKms6F4VkOcMeDljcNtPKEElY1EPwEVlA/k/Z4F0qzECBw9F+1iltU3
         KgBx20ZOh4AgRq15LCYif6rF8EKbu0DaAGo4B6xhBtSLKdtih/Yat7dIMrb3Kc1PvpBY
         SOLclw4F0bS47ZdBjpcgBdXT1uVpgUUCGBQLTqUg1DLpqWzs/yeHe1EdV2+oLac334jW
         Eexo2FSTnRgHqBdfxVA6wbd1ZyyYEuRagdbwXgDa99z5MWFjpgEPWLLve5ijDFYZmQ2C
         bdkEILGhpzhp6DLB5/PWzMbn6iCPbrASEs1z3QH4yJ+6QKF6ZxC+5D2DwHUUG4CqFwYU
         Uizw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785782255; x=1786387055;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hIP9IRTQDlp4agva/gLK4c0w6ETu1nA/RCtshOXlPNY=;
        b=itSGOQITAIkScwgv36RCV6C3hdckBus7RE4u383aMrGFItmHi6+QRfIunKUIq1u7GI
         sIgdr5TJzLkhDLTSuaXdHCQTC/hIZ79vgWkzM/Znf9hsuUdvRgsTkdfRjIQ9QdXjPLE0
         aouSe2w/C+wmba4VQd8Pft9GCydO64pqeawi+8Qsa7JyGOaobfrM3F9i92V96QfQHI0Z
         9n7+Tak6KE5AImV4PNb8W7nu/Oa2Iz19VA7Ww1GFzVjaheSF3G5vKyiWMD+QqG1kvEeL
         UryNKY4qk0lQ3vCvOd1aZc1P1r3AE9HARkfy+Rx3umNl7KSx17qaCmSzTu4CPc1C4s+7
         FXeg==
X-Forwarded-Encrypted: i=1; AHgh+RpHX+TqK1dgcqDIkw4LrjtpAvGVmRcATCL/1pl7D+L5wy3pAfjo5BG+yBUuF9z8syKLfLepRV4nIG3jGQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzk/+8o2exi9qigggfefHMMxcTGLjn4z4Jytp9jouK6Fa0l+ZTh
	b3J1G112UMNy8SWgGqFXuUuc7qNIIG1y4qgS8T1AmmHKMk+A8+wecdgaoWeNZtcB2GFGSzc2uUH
	98MrU32HJEgOZaMmlgfj8eUnb0DJzJPC7XUaJ7bfT6QSufe/1K7FDfwjZFoixn2ExfQ==
X-Gm-Gg: AR+sD11MHsMM32aAjssX1pChlDqUaU8sZz9HXRQSwBTix1/3gf+LZJJbXdYtUR8SfZf
	S363gSFlMoMT0N2VRo0EpqT+t91cgUDdzyW8YmSvjX+Ts1yTaupwcIWUduqI0KUPTebxNGuJETS
	1SYWjRiS+5oxQuAnp/SDI1tJ5XvTS/Uu67bqAlhjFCnqho30EKxvEASboGbN1sz8b/ivY3Q01Zk
	mYbOHKVDc7hHCYjObh9sPxTxdgDRk43vOTibfsREGja4Ko+WyQryZZrJteW2lfHVJ/VW4tnX+0V
	c1sRGlomFIK+aA2ZyT2GKfQlDE7lExfMVtA/J1yB9qTOF2o/4awIpm9LcY73kJqakyo9wdWTFyn
	5l8yGVFYUuglDo+PYKn0M90Oi2sqKG81JOPFvU05gMjBVNmb0bdfnpjzl5v0KD4+rFSJRZch1cZ
	Z8Df88BYGOVQm35Q==
X-Received: by 2002:a05:622a:1247:b0:51c:844f:28da with SMTP id d75a77b69052e-52b56673bf2mr250409731cf.5.1785782255290;
        Mon, 03 Aug 2026 11:37:35 -0700 (PDT)
X-Received: by 2002:a05:622a:1247:b0:51c:844f:28da with SMTP id d75a77b69052e-52b56673bf2mr250409101cf.5.1785782254764;
        Mon, 03 Aug 2026 11:37:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39f812e310dsm15855291fa.30.2026.08.03.11.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 11:37:32 -0700 (PDT)
Date: Mon, 3 Aug 2026 21:37:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: "Gjorgji Rosikopulos (Consultant)" <gjorgji.rosikopulos@oss.qualcomm.com>
Cc: Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        linux-media@vger.kernel.org, bod@kernel.org, mchehab@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, loic.poulain@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/3] media: qcom: jpeg: Add Qualcomm JPEG V4L2 encoder
Message-ID: <h7e5t6rqvrlogj4li4incr2pog57dfal23rqo326vi2cz4zpxl@m7orpk6dftty>
References: <20260730150524.2659577-1-atanas.filipov@oss.qualcomm.com>
 <20260730150524.2659577-3-atanas.filipov@oss.qualcomm.com>
 <vz6a2qugu7kkci3fcdkd236axr3ur33ghrgoopbrz3isueml45@b4frwo4l2hfh>
 <3f40cde3-a4bd-424d-be42-60915c90e6c3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3f40cde3-a4bd-424d-be42-60915c90e6c3@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=aoaCzyZV c=1 sm=1 tr=0 ts=6a70dff4 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=PdqdRH78fHWJp5eU5_0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: k_3FJ9MwBvoGG480MT_1-VJReOkOwc4V
X-Proofpoint-ORIG-GUID: k_3FJ9MwBvoGG480MT_1-VJReOkOwc4V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDE2NSBTYWx0ZWRfX7EV60uz0c8vv
 Z8gSHbSC1Kp+43t2qpSNLy43QzVLtm8ZXjyF5boj1LF5cqNx3NXCg6PcmbZqzlMYZRt3PbkBBLG
 reFR3MkKjgQvHhG6jh2/o0L3g2Thpc+E864JRtbe5NxX8a+OJUApDi0ieq+eo6dyqVwYypqWdH/
 z3QhwvRtf4/Gmo877B+deIlN7TohUsoxiM2sBIv2LQN25snLLntCPJPZOcevT91meU7qPwfopK2
 +PemYzTCVjyxTdoTD+XYV6GlYIUpFDfQnMKAVONRHYKFtaPkKtH08cq122F327P0fYOtsPE8QTo
 zAPmKBxQh0Zq3nWfiZf/YLjU8oA5YEim6x6WbKAKeI+CHFYeD/nuKc/zoCrTs+ovZB6nFFKjsBQ
 yxn/8Z/RgOLIEQW5b9yH/3+VvRHrWwZ/heNESfGSxBsacX81XxwQZL+9N0FVdpTLnsbIGCC51hY
 eRd5L7aQ4WW7O6WqO2w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDE2NSBTYWx0ZWRfX5yeFNJMyrGTA
 uoJi4WQzGYQ0w8PikwwwZa7wqmTOA/1hk2Zki6Wkc5Uje/YSa6spJQxMnjcFWsKf4ZXUgDsPh2W
 5mG2jwMKQOo0d8+xmFwmDg/ipkRaboI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-03_04,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030165

On Mon, Aug 03, 2026 at 06:57:09PM +0300, Gjorgji Rosikopulos (Consultant) wrote:
> Hi Dmitry, 
> 
> On 7/30/2026 6:57 PM, Dmitry Baryshkov wrote:
> > On Thu, Jul 30, 2026 at 06:05:23PM +0300, Atanas Filipov wrote:
> >> Add a Qualcomm JPEG encoder driver implemented on top of the
> >> V4L2 mem2mem framework.
> >>
> >> The driver wires vb2 queue handling, format negotiation, JPEG header
> >> handling, interrupt-driven job completion, and runtime PM/clock/ICC
> >> integration for the standalone JPEG encode hardware block.
> >>
> 
> <snip>
> 
> >> + */
> >> +
> >> +#define JFIF_HEADER_WIDTH_OFFS		0x07
> >> +#define JFIF_HEADER_HEIGHT_OFFS		0x05
> > 
> > And you've ignored feedback here. PLEASE move all standard-related
> > defines and code to the common helpers. Are there any other drivers
> > which construct JPEG files manually? If not, you are lucky and you can
> > just push you code. If they are, find a way to unify the codebase.
> > 
> > At the very least, it would make you split this commit into at least
> > two, making them more readable.
> 
> Yes, this comment was incorporated, maybe partially, or it wasn't fully understood.
> The helper is used for the quantization tables and wherever helpers are available, 
> similar to other drivers: hantro_jpeg.c, e5010-jpeg-enc.c.
> 
> The missing JFIF tags and additional helpers can certainly be added,
> but is holding up the current driver just for that a reasonable ask? 
> This discussion may continue for a long time — is it reasonable to wait that long?

From my point of view, yes. From your comment it feels like each driver
having their own way of wriing JPEG framings.

> 
> I agree it would be good to have all other upstream JPEG encoder drivers move to shared helpers,
> but the effort isn't uniform across them. 
> 
> Five drivers — hantro_jpeg.c, mxc-jpeg.c, rcar_jpu.c, gspca/jpeg.h, and solo6x10-jpeg.h,
> build a fixed byte-array template and patch width/height/table values at hardcoded offsets, 
> so they could plausibly migrate to a shared builder with a similar shape to what we're proposing. 

Can we start with something as simple as this for our driver too?

Then you can converge all these drivers to use those simple helpers
(this should not require the actual hardware to test), then improve the
helpers.

> The other two, e5010-jpeg-enc.c and coda-jpeg.c, use incremental byte-by-byte writers instead, 
> so their migration would look quite different and isn't a drop-in fit for the same API.

Ok, these are more difficult cases.

> 
> Either way, we don't have access to most of these devices and can't verify the changes ourselves, 
> so migrating them is not a simple effort to undertake as part of this series.

Which reads: "we already have 7 different implementations of JPEG
framing / file format, can we add 8th?" The typical answer would be
"no".

> 
> > 
> >> +#define JFIF_APP0_LENGTH_HI		0x00
> >> +#define JFIF_APP0_LENGTH_LO		0x10
> 
> <snip>
> 
> >> +#include "qcom_jenc_dev.h"
> >> +
> >> +/*
> >> + * JENC encoder hardware operations.
> >> + */
> >> +struct qcom_jpeg_hw_ops {
> >> +	void (*hw_get_cap)
> >> +		(struct qcom_jenc_dev *jenc_dev, u32 *hw_caps);
> >> +
> >> +	int (*hw_acquire)
> >> +		(struct jenc_context *ectx, struct vb2_queue *queue);
> >> +
> >> +	int (*hw_release)
> >> +		(struct jenc_context *ectx, struct vb2_queue *queue);
> >> +
> >> +	int (*hw_prepare)
> >> +		(struct qcom_jenc_dev *jenc);
> >> +
> >> +	struct qcom_jenc_queue * (*get_queue)
> >> +		(struct jenc_context *ectx, enum qcom_enc_qid id);
> >> +
> >> +	int (*queue_setup)
> >> +		(struct jenc_context *ectx, enum qcom_enc_qid id);
> >> +
> >> +	int (*src_fmt_update)
> >> +		(struct jenc_context *ectx, u32 old_fourcc, u32 new_fourcc);
> >> +
> >> +	int (*buf_prepare)
> >> +		(struct jenc_context *ectx, struct vb2_buffer *vb2);
> >> +
> >> +	int (*process_exec)
> >> +		(struct qcom_jenc_dev *jenc, struct jenc_context *ectx, struct vb2_buffer *vb2);
> >> +
> >> +	irqreturn_t (*hw_irq_top)(int irq_num, void *data);
> >> +	irqreturn_t (*hw_irq_bot)(int irq_num, void *data);
> > 
> > How many non-default platforms do you support? Zero?
> > 
> > Drop the call table.
> 
> There is plan to add support for more platforms, if the preference is to remove platform based ops now,
> and introduce them when new platform is added i am ok with that. But will require more work now and
> for the new platform...

Yes. When you add a platform, we (reviewers) can see, what exactly is
required for that platform. For now, you are adding complexity for no
added value.

> >> +
> >> +/*
> >> + * V4L2_CID_QCOM_JPEG_PERF_LEVEL_AUTO - enable adaptive performance scaling.
> >> + *
> >> + * When set to 1 the driver selects the core clock OPP level based on the
> >> + * encoded frame resolution and fps target. When set to 0 (default) the
> >> + * driver always runs at NOMINAL (highest) OPP level.
> >> + */
> >> +#define V4L2_CID_QCOM_JPEG_PERF_LEVEL_AUTO	(V4L2_CID_USER_QCOM_JENC_BASE + 0)
> >> +
> >> +/*
> >> + * V4L2_CID_QCOM_JPEG_FPS_TARGET - target encode rate in frames per second.
> >> + *
> >> + * Used together with V4L2_CID_QCOM_JPEG_PERF_LEVEL_AUTO to select the lowest
> >> + * OPP level whose throughput is sufficient for the requested frame rate.
> >> + * Has no effect when perf_level_auto is 0. Range: 1-240, default: 30.
> > 
> > I assume 1-240 is only applicable to your driver.
> > 
> I think we can drop those controls and use s_param on output(source) video node as it
> was done for some of the other m2m drivers including OPE. Which make sense we tell the
> the driver at what rate source buffers will be received, then the driver will choose op
> level to satisfy that requirement.

Ok (if you say that there are other m2m drivers doing this).

-- 
With best wishes
Dmitry
