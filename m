Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68DB93AD528
	for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 21:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784582084; cv=none; b=Dh9h/OuzeFbhHiPggA1L7JhEvDRLx1Nrj9svi+PXiws6smkTGAdVFgwW/+jI4v2sgRocO3YkstBdXQsZSaEnv+9ekQjo3jUImx19p6LKW3NmOxKyOVvmTE7c2Blyyl04nEh3czeJVyZ4nL+SOBakCyXtFqarcsQ94PlcOCpNZGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784582084; c=relaxed/simple;
	bh=VFFt3HQPz4z1ZL+ZlR492dczakUwHhoEourn+AuREIE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ebLT6HZPYSHpJQisjIiq6y7m4a1hw8Z2bO3IvylFYEbOwM8elj3VsJDKwA9ATCWR9LtbWT5rbQdYeMSXFK/N1sFGgJfzoTOQVu03b5IH1SPsw5q7QOZEC4URqO0aj26ETEpaKHs9Nr5VZQan0+u3qPIBls8CEhBubF/IWLu9MrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VLA9nq/T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MW9UNjTq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VLA9nq/T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MW9UNjTq"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KJTggT3622334
	for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 21:14:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6paqjA3lujsVdPkVfvdxl3SS
	kpK7zmopgMYqn4yDCh0=; b=VLA9nq/TObG+XJNTQA/FZYUHKTjXU+r7bjgEubgC
	en0uT0Sc+qgUZ3eaGW296ZWyHeB+/ZL76K/bh9LNg5idpu427m8oY4De+rwQGrPL
	jMABCrP21Cw+NOc9CZbGkYR1+xftk6cU0ZM83kef8tYkpLWOk1+lrdJf61U8SW5Y
	+sUARGCATgpKtvn4FjmS92VbeDvMZbzkU3OC3oXP0N4gsDyRKmR/xUajjnuVq+3g
	eK7Vquz9ym5jW+p8D6LBLK30dLZWXzpQaSfIy9DLZrS0gg6KNODlFjGCp58gIiQq
	bjXGrqKNpUvzMe/VEjr3SfOxQ4cuJb7fW4hL7b3ipYudBQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhfvxkctj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 21:14:42 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8fdace20927so80750266d6.2
        for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 14:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784582081; x=1785186881; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6paqjA3lujsVdPkVfvdxl3SSkpK7zmopgMYqn4yDCh0=;
        b=MW9UNjTqT9zFWm1jsXSfJV7uMMF/86gobh6uTxaXoaOZV+r0hEt/7qohGSbJyV0sCf
         6bRnpBxJdUU+VCNLiUCRI4oBWd1TX+BQuAS1Nc9M8C5NlG7WMSoFj4ek09vaqq3MT6PK
         3Vg4aBqRzvFxTanuXzG5AyUYzPrdzu3LO38TkAiiZd+mR8DPhcWOASZYmQf6i+DAcMqb
         z9fDFqcW+Y99nF4ysMQE76G2/C5klcouhHY0+WM7wsqNjtNdMQBTPGZ6gn+S9zhdjJqX
         D6fbZns1wrwF6HARa3ZFCKA8enN5L++y9q41YL5wiJlJpYTNNoxV0jW1OS4eUK7L8D+q
         lCvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784582081; x=1785186881;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6paqjA3lujsVdPkVfvdxl3SSkpK7zmopgMYqn4yDCh0=;
        b=sdTkM9VHVXO+81foElvS7BgViN4qWymvpoNPpAmvTQ00NF8zyalfDsUL2Piz+KB/Eu
         /DkIfh6lcWZ+D7bW8KVQWWz8+CmuEtyYjNPbBAXb/mciBeH6c8bXnjp104tH84ytlan3
         m9/c+MGkCEyxrcB12RR1u85mrAInkNewTlGJKNdSNWaNORp4IACPPiCE9oPf8wqJTDKw
         jVA6gQlPggdJK0DhFbABZiDD2baLPvE4KVo57ee7qBK93+ksH37WZLsHrjMWoWKJpN6S
         AF0HaL7GRPTH2g3NxNXCT7MU7rrHJ2CpbIN8jCKTksZswUAE9WaxER1twISUlEoK10As
         OQiA==
X-Forwarded-Encrypted: i=1; AHgh+RqrB7RFkKDWz2KIOtx+ir7dQdVs8I1Nuf/nJoTeHbzs78Ow3CyvJDEdT9lg3uhffiOa/VB30EBQ7PkoIg==@vger.kernel.org
X-Gm-Message-State: AOJu0YySb1Se/S9fEb5LZnw58ZA74PyZ6FAAFHlmqYivVBA8alGlxrPh
	oyUh/8Ou1BkXeBEvzk9m6PKouWTF0rm4s/fflJW5BYhr9X816/rXiLY2v7JtXglu243GkBNL8gw
	dD2FWvXg2uEiQHpBq+/QHWVfMma1gTr/2dBTh1QzOdXMVOw8vLFsVtZ6pmyLRvnEAZg==
X-Gm-Gg: AfdE7cldB0V46zkQ/LrGIZGQF5ffWJwuuGvTl8shbkL9zHzpQ4IT8jFWnm54VLaJMo4
	kKZ4AY3stkCezSb2ZIn64lsaoa3mwFTpDO6WIUAFXI5CtdIh401L54t+fyz7D+qaL4EgSEJyr+0
	fsXeKYUqPFo+RR6uEAlbXXRPGtsW+ddAqd46miZjnFpIPp2vqWNY+HadFFJFGoYe5BcRasqAJKq
	hWyO35yy85cDbDA0X27i9dBP1JO7tMuLlgF7cqgrDvsUJ6CUqt5OtXKpapjUzm/el0qLN/YIP1b
	lAxeOyIcDj5LObfBMmcfCftBxWpZyE67Ts8L00nuoAy4abGa7XcpGZNzGFXT6uUndRNHkqmW2y+
	h2rxcfyky0+aHpowzWiGMdAGh7AVr/9QrLgFA1wLlpiOgXVnr55+Uvfx0S/g7lhQyFGr0zv6KYm
	v27JGdoc9pW7prpA==
X-Received: by 2002:ac8:5fc7:0:b0:51c:207f:6524 with SMTP id d75a77b69052e-5213cdcd357mr148862371cf.37.1784582081579;
        Mon, 20 Jul 2026 14:14:41 -0700 (PDT)
X-Received: by 2002:ac8:5fc7:0:b0:51c:207f:6524 with SMTP id d75a77b69052e-5213cdcd357mr148861941cf.37.1784582081042;
        Mon, 20 Jul 2026 14:14:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b291e1c888sm2530660e87.67.2026.07.20.14.14.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 14:14:39 -0700 (PDT)
Date: Tue, 21 Jul 2026 00:14:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: iris: add new rate control type MBR for encoder
Message-ID: <zlvbtffdpmqtwwhknvyz5f3f22gm23qsupg3qp7hagz7j7rhmk@7heecitj3plg>
References: <20260720-b4-add_sc7280_mbr-v2-1-a2a86f630f57@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720-b4-add_sc7280_mbr-v2-1-a2a86f630f57@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=HKLz0Itv c=1 sm=1 tr=0 ts=6a5e8fc2 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=oY5olKvstY0uGbtyxhMA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDIzMCBTYWx0ZWRfX9B29TWLH7vIO
 y8AMAdavEXkHbHUdCwt4v6a9ZyzpgHLDsFkw4I6lijou3O0FuY+BdbpKtnVejy7P3kUgWpteU4B
 9WA/wb+jNjl0GoxnvmYHWjdDwT50amo=
X-Proofpoint-GUID: AXZoxGSXGBUGEQHH28OIpddjzoC5UxsB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDIzMCBTYWx0ZWRfX2s2I9udaTMwp
 7w3Wc5B/q2fu+EBSeTq6NfuebiHX3pU02iY5rn5hEfkKzCc5zfHZHDTFGEk5HehG+qp+IOK+Lpm
 lQo37b9qqSzrIds6Fs+/klFwX3E8iER71EKVb8EbR86BUDfZwSo3giVKirUkUAU2XWSgkXTzwgl
 3KGYlDMbpXbAfWab+/iyW5h8mozC2NIVH86WhvVGv93cr6H9zLf+VtLNnuM/aQzuLCuAu1BHVYp
 Ki8rpE2HPFw0TgXoK4v8kYQG+mM/9CKciXj3hr67cYKG37lxeHVtU++55esNSNdgM1kSHhgFWWN
 qwOJiRII+ThGriXXBQqGJqV+DOT9LE2/M141DmHxRkA1oJH2aYjFCTqHDALQdyTuzC77vfN3030
 +QiHf+SfwAh9zDR7vlzBj9rt5oSXIDkIJY9t3vxvpPYU502so59oD6MeMjoelHECKHnqBxG6zAH
 GOdX9yB62QUlUZbByvA==
X-Proofpoint-ORIG-GUID: AXZoxGSXGBUGEQHH28OIpddjzoC5UxsB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_05,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200230

On Mon, Jul 20, 2026 at 10:44:19PM +0530, Sachin Kumar Garg wrote:
> Add support for the MBR rate-control mode on the encoder.
> MBR has no corresponding V4L2-spec definition, it is exposed as a
> Qualcomm IRIS vendor-specific control rather than a generic
> bitrate-mode value.
> 
> Reserve V4L2_CID_USER_QCOM_IRIS_BASE for Qualcomm IRIS driver
> specific controls and add a new boolean control,
> V4L2_CID_QCOM_MBR_RATE_CONTROL, to enable it. When set, the driver
> programs the firmware with HFI_RATE_CONTROL_MBR, taking priority
> over V4L2_CID_MPEG_VIDEO_BITRATE_MODE when both are client-set.
> 
> MBR is currently supported only on sc7280. Rather than duplicating
> the encoder capability table per platform, add a mbr_rc_supported
> flag to struct iris_platform_data, and merge in a small
> platform-specific capability table containing only the MBR cap for
> platforms that support it.
> 
> Signed-off-by: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
> ---
> This patch adds support for the MBR rate-control mode in the Iris driver.
> 
> Changes in v2:
> - Per upstream review feedback, convert MBR enablement from the
>   generic V4L2_MPEG_VIDEO_BITRATE_MODE_MBR menu value to a new
>   Qualcomm IRIS vendor-specific boolean control,
>   V4L2_CID_QCOM_MBR_RATE_CONTROL.
> - Drop the now-unneeded generic V4L2_MPEG_VIDEO_BITRATE_MODE_MBR
>   enum, its "Maximum Bitrate" menu string, and its documentation
>   (previously sent as a separate patch 1/2).
> - Drop the separate inst_fw_cap_sc7280_enc[] table (a near-complete
>   duplicate of inst_fw_cap_sm8250_enc[]); sc7280 now reuses the
>   shared encoder cap table and layers in only the MBR-specific cap
>   entry via the new mbr_rc_supported flag.

No. If we have capabiltiy arrays, please extend them. Does SM8250
firmware support MBR mode? Is it supported by AR50LT firmware?

Another option is to rework other entries in the caps array. Describe
logical platform flags (describing possible modes, profiles, etc.,
etc.), generating V4L2 controls on the fly.

> - Link to v1: https://lore.kernel.org/linux-media/20260213-b4-add_sc7280_mbr-v1-0-e8d95b4e4809@oss.qualcomm.com/
> ---
>  drivers/media/platform/qcom/iris/iris_ctrls.c      | 101 +++++++++++++++++----
>  drivers/media/platform/qcom/iris/iris_ctrls.h      |   4 +
>  .../platform/qcom/iris/iris_hfi_gen1_defines.h     |   1 +
>  .../platform/qcom/iris/iris_platform_common.h      |   2 +
>  .../media/platform/qcom/iris/iris_platform_vpu2.c  |   1 +
>  include/uapi/linux/v4l2-controls.h                 |   6 ++
>  6 files changed, 98 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
> index 10e33b8a73f6..0a979649663b 100644
> --- a/drivers/media/platform/qcom/iris/iris_ctrls.c
> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
> @@ -154,6 +154,8 @@ static enum platform_inst_fw_cap_type iris_get_cap_id(u32 id)
>  		return LAYER4_BITRATE_HEVC;
>  	case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L5_BR:
>  		return LAYER5_BITRATE_HEVC;
> +	case V4L2_CID_QCOM_MBR_RATE_CONTROL:
> +		return MBR_RATE_CONTROL;
>  	default:
>  		return INST_FW_CAP_MAX;
>  	}
> @@ -297,6 +299,8 @@ static u32 iris_get_v4l2_id(enum platform_inst_fw_cap_type cap_id)
>  		return V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L4_BR;
>  	case LAYER5_BITRATE_HEVC:
>  		return V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L5_BR;
> +	case MBR_RATE_CONTROL:
> +		return V4L2_CID_QCOM_MBR_RATE_CONTROL;
>  	default:
>  		return 0;
>  	}
> @@ -335,6 +339,17 @@ static const struct v4l2_ctrl_ops iris_ctrl_ops = {
>  	.s_ctrl = iris_op_s_ctrl,
>  };
>  
> +static const struct v4l2_ctrl_config iris_mbr_rate_control_ctrl_config = {
> +	.ops = &iris_ctrl_ops,
> +	.id = V4L2_CID_QCOM_MBR_RATE_CONTROL,
> +	.name = "MBR Rate Control",
> +	.type = V4L2_CTRL_TYPE_BOOLEAN,
> +	.min = 0,
> +	.max = 1,
> +	.step = 1,
> +	.def = 0,

How does this play with other rate control mechanisms? Will it allow
user to select multiple?

> +};
> +
>  int iris_ctrls_init(struct iris_inst *inst)
>  {
>  	struct platform_inst_fw_cap *cap = &inst->fw_caps[0];

-- 
With best wishes
Dmitry
