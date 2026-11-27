Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795769889;
	b=xsHGWKIF4LRDMSVxM48j7tvl5kwz8eIfgGvgJpRILUnaPSu3OVQ5GaPvWpyLNpK06YZw
	 oKb7ggj6IsYYxzW1vuE1L+5+IP+BvJfJ0QCfbb/wSfRWXaWL9bhfPu0wCe9n4uX76fis9
	 QwWB2tu8E0cFfj/O1XX6bCEYaldO0Du20K+rlw+8sr57OUGkzb0t3WkI4tiE8m/MG0pKi
	 mLlL+rmaMheRROxObPY50tesryly52+tlJg93a6ZmSBDtgxeEHZtfJcRMWSFCpiCPT17y
	 cS4ZvePYRQg365TdzmdYznbqolCYfLQxwLFsl3/V7kvs++lEy1WepAtY1j27Vr9s+Jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795769889;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:Content-Language:To:Cc:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=IRlMPFzJQx0/atgk1w0PgWq/gYg0r3dI2wQg6CYsn6E=;
	b=D6z/DDXKHJYMHN1gclg9R1n2pW0uI/SsPhCJcwK35bGmbtoTmft/g/29yUqAGKh8P9aZ
	 LXtoVHuNrCezs27vnxekZ8Uq/7UYc8cCEnVYw3g+jovXwRtFWm/idEGBhK8LzI763DzQk
	 yp+Jlc/qclRf46SlwMeb1MwApS5jLpF/KTqmLoxDxDjFdMrd7dJ9dJZbW8QOAcvHO7Ooh
	 zi0LSnby6K876dITqAZP80wd+B83ztLRZzQ7ad3l2eHYwM1oPXFMlE1+Q8BYgIZG/r76n
	 Ry6rPmsa0K/hOZULWjQVilcLpXPwcnGCw3o/M6OaqqKdnY5+7FgQCoNku1cu3cAR+Mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Lk9Oywob;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Oh9xeZhJ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 593FD606A326
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 08:58:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 593FD606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Lk9Oywob;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Oh9xeZhJ
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7Gc1E905128
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 08:58:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IRlMPFzJQx0/atgk1w0PgWq/gYg0r3dI2wQg6CYsn6E=; b=Lk9OywobtmU/Ngh9
	29CuMYg7t/As9oJzt9mhYKv8TbgK4y1gkpzUS2DplRkGsTnHJ69jVuo+gA3oJWgF
	1tlPQKzlOEbRaICMeNpeBrbCBBjmyVYznQQeLp1gx9TgxCrANZxbWc3BDaHPITax
	b93SLvu+kd3inrmbizExN2lr6KA2fHBh2acquuo4cUi4MsNNFQMlx6BBcfA5LB3a
	00de6Y7aZyYc0i69YEs0YG6HV9CFQw95N96OCqeLqfFCz2oN7BQEIOUflwMVryoP
	NloIeE1NqBwiZDOaHT2Fh4PeosCy/lXlcWvBHUs/yT6ufSKh6R+d7R49hVIMh+g7
	MWuc6g==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6ru39rw6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 08:58:07 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-386a0f79047so8465560eec.1
        for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 00:58:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795769887; x=1796374687; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IRlMPFzJQx0/atgk1w0PgWq/gYg0r3dI2wQg6CYsn6E=;
        b=Oh9xeZhJtQ2T5rYnNDwDWH+lSGlDiPXyOD9Pg6/lxM/XbtJ1FuiPDRVVH6OR0kBbtd
         aoNAw5RXYpGk//GIJzosoKwoY+gV2i/V2fmMd9/4tUXdRdtZzFcGdLnG94HWN7TP6ZZR
         SeGL5f2swvRQfdWNEZp5zjT6rSh7KkANzvtjTgYJNjsVT3P3zBC4XuD4vin7ztt+RiiU
         PTGjRn7EdDrNFIMwjd1Q79mmFO8Jly74hvA6BcVgKLmiEfv9glrQqWVYvvS1ms2jYRKm
         aTGEZOYrINlrBjpKRPYKqG3JBljLN4vMmazAgILZ/SyegHTh9jlYdypj4oKMsewSWWZi
         Vdsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795769887; x=1796374687;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IRlMPFzJQx0/atgk1w0PgWq/gYg0r3dI2wQg6CYsn6E=;
        b=fHovgUHIKbUat1TZw2VAqWYDIFrMmyaLyZ3A1aBaOEkMcYBHO9MJmyUIZbWImTgJp+
         rb+HdUfMAQHlc6NzonYJk1Tewl7UsgbuEEb1wSCKU73ZRADoF5FzFLX7wZfuiCjQArEm
         omrXTXSgoomej1fqFI63RzwPU/5v723Vuj09Pf4qvBY72t4rGhO/jghLuIbvr8qzHx5u
         FuNyOd7nBsTVmDCpdT9vcGqIzJ/gpMuYWQH/3zNaDIx8Eb4/xaGHxCpaxBGNwbK+PdWd
         5uIjkvK5DEg1AChuXwHZ/EgRcAdqtG7NJTjE8VWCmGDWHjoDmFAKyLkS1SzxazF0d++g
         RMiw==
X-Gm-Message-State: APuU4Z/3Umg5dgLu7FpCyWfOBMqYSjc1CgqBpLzlhSouPCTJAUTXn5j8
	qyRKnlxN+gLDbMt5m0kZ6LsYCYiaZ6kH5kqV9UmEWLy8ZBAosiWTcyXkUxriSbQ03VP8xKEz30T
	qYMkhZ1K1Zm4v/QliOp7+3KjND4i4qC4jkSYUG9Et8cgLadPUgjDblQzrAxGvZUEdaw==
X-Gm-Gg: AZFdTZcgdmA//roLjVQ1iwQIHQDsb+w7FTJYZyL144ZO2T8eFZ2D7fZuH6QppD2x13e
	dnpf4UybeAqbvr6tZAF3KiWUtXEFU1Koo3Yxj9ksB97eu9BbwdmqQd6ak0mdKYovOMtl72qftoF
	U8d083sbMgbY7D+Z76hVd31qX4XPnDu2iSFrQWV90VQXBvorWV06inWT65zqhMyteh6JGz6grmy
	+iEWrtF6M7w1rgNLL7vhK8BWryRPXulvqYHQjXeiQglWv5AoaoF91IYA03/sCvBSysuyPe6r4BQ
	kkXQH4z7RjfpufbK08ZPIqsfHr0qj+g7ZQ+8+KgMeBPDDtLpFrG9/XoWd1bRuCmCe2It4am1BHZ
	J9xoZCu5g5in+IWO6PRdbbEK6lLDVi8010L8o/UNWXVvKOyOQ+wdUPh15gqKDXuknk1RoOzxagk
	vOaaiW
X-Received: by 2002:a05:7300:6da7:b0:376:77e6:a66 with SMTP id 5a478bee46e88-385704509cemr8394367eec.16.1795769887237;
        Fri, 27 Nov 2026 00:58:07 -0800 (PST)
X-Received: by 2002:a05:7300:6da7:b0:376:77e6:a66 with SMTP id 5a478bee46e88-385704509cemr8394327eec.16.1795769886631;
        Fri, 27 Nov 2026 00:58:06 -0800 (PST)
Received: from [10.204.100.41] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385c6830815sm63561148eec.20.2026.11.27.00.58.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 00:58:06 -0800 (PST)
Message-ID: <189f2827-808c-1cb1-e1b3-3f35278503a3@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 14:27:58 +0530
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 3/5] media: iris: Add deblocking filter controls for HFI
 gen2
Content-Language: en-US
To: Xilin Wu <sophon@radxa.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>, dragon@radxa.com,
        Chris Obbard <chris.obbard@oss.qualcomm.com>,
        Deepak Sikri <sikrid@qti.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Loic Minier <loic.minier@oss.qualcomm.com>,
        Jason Pettit <jason.pettit@oss.qualcomm.com>
References: <20261029-iris-va-fixes-v1-0-44a2783f782b@radxa.com>
 <20261029-iris-va-fixes-v1-3-44a2783f782b@radxa.com>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <20261029-iris-va-fixes-v1-3-44a2783f782b@radxa.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=cOF1IVeN c=1 sm=1 tr=0 ts=6b094620 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=ksxQWNrZAAAA:8 a=EUspDBNiAAAA:8 a=ctBV4z7rrj7PSml0dIUA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-GUID: 2gzlktTZwEc8unOZXNyadq7gMesghYJ4
X-Proofpoint-ORIG-GUID: 2gzlktTZwEc8unOZXNyadq7gMesghYJ4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAzNSBTYWx0ZWRfX/yqK48Rxk59j
 DbhMWC+5d+3ZIgGRRiERsTlBD4qS08H/OO5vIweyhBGCpZ4/2JXlnlAW9MQsFu03a+eLSN6ogfY
 +ow2JeqnVCJOygzfcXcRxLLJqEkzBe2QKu3hp/kRZLiiixHs2udITwV8RiqaIC68tLeitqEs/kx
 1lQxITtRbnnJJSmFOBmnjsEqOibr+P2ilp0lvaMN/tHU4sEqm94FBNU5XaazlGaTSWD49z8xvoG
 /BBYT7NVqgJEOv2Jy3R7VCJodiJBNN6nliFdCccQzYD//L02XCI73uHwv6kdXYIPZc4z7ItgfeW
 xEmJ3z+L7xoosakVlPuRwgyLYrTCn+46aJ/4U5WmE+j2huSWSrHcZCLK7CZ3xiWfMQxEkX7AAqz
 cGX/MeAJ6zUoWI2kbZt3KyliiisDnDdoegIhEMmMyJQqprAFrwn59smRh84BXqiqoICoooCTPNH
 Yu43aThg/StgOQ96QOg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAzNSBTYWx0ZWRfX2PYxbOF74H9n
 qU7xGGlkc+55zw2Mh1TuB4YsKP/gL3dmlhyHNpiNo5vp7/J+wxrwVPpzp5QRYHi6q1B9O/qGemy
 eFLKfgK0Di9fhXZrB5QrQYMscbUJ1W8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 adultscore=0 spamscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270035


On 10/29/2026 9:28 AM, Xilin Wu wrote:
> HFI gen2 encoders do not expose deblocking filter controls, preventing
> applications from configuring the filter mode and offsets.
>
> Add the standard V4L2 H.264 and HEVC loop filter controls.
>
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---
>  drivers/media/platform/qcom/iris/iris_ctrls.c      |  85 +++++++++++++++
>  drivers/media/platform/qcom/iris/iris_ctrls.h      |   1 +
>  drivers/media/platform/qcom/iris/iris_hfi_gen2.c   | 116 +++++++++++++++++++++
>  .../platform/qcom/iris/iris_hfi_gen2_defines.h     |   8 ++
>  .../platform/qcom/iris/iris_platform_common.h      |   6 ++
>  5 files changed, 216 insertions(+)
>
> diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
> index 1dbea37c93c3..a9b8124aca56 100644
> --- a/drivers/media/platform/qcom/iris/iris_ctrls.c
> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
> @@ -55,6 +55,18 @@ static enum platform_inst_fw_cap_type iris_get_cap_id(u32 id)
>  		return GOP_SIZE;
>  	case V4L2_CID_MPEG_VIDEO_H264_ENTROPY_MODE:
>  		return ENTROPY_MODE;
> +	case V4L2_CID_MPEG_VIDEO_H264_LOOP_FILTER_MODE:
> +		return DEBLOCK_MODE_H264;
> +	case V4L2_CID_MPEG_VIDEO_H264_LOOP_FILTER_ALPHA:
> +		return DEBLOCK_ALPHA_H264;
> +	case V4L2_CID_MPEG_VIDEO_H264_LOOP_FILTER_BETA:
> +		return DEBLOCK_BETA_H264;
> +	case V4L2_CID_MPEG_VIDEO_HEVC_LOOP_FILTER_MODE:
> +		return DEBLOCK_MODE_HEVC;
> +	case V4L2_CID_MPEG_VIDEO_HEVC_LF_TC_OFFSET_DIV2:
> +		return DEBLOCK_TC_HEVC;
> +	case V4L2_CID_MPEG_VIDEO_HEVC_LF_BETA_OFFSET_DIV2:
> +		return DEBLOCK_BETA_HEVC;
>  	case V4L2_CID_MPEG_VIDEO_H264_MIN_QP:
>  		return MIN_FRAME_QP_H264;
>  	case V4L2_CID_MPEG_VIDEO_HEVC_MIN_QP:
> @@ -210,6 +222,18 @@ static u32 iris_get_v4l2_id(enum platform_inst_fw_cap_type cap_id)
>  		return V4L2_CID_MPEG_VIDEO_GOP_SIZE;
>  	case ENTROPY_MODE:
>  		return V4L2_CID_MPEG_VIDEO_H264_ENTROPY_MODE;
> +	case DEBLOCK_MODE_H264:
> +		return V4L2_CID_MPEG_VIDEO_H264_LOOP_FILTER_MODE;
> +	case DEBLOCK_ALPHA_H264:
> +		return V4L2_CID_MPEG_VIDEO_H264_LOOP_FILTER_ALPHA;
> +	case DEBLOCK_BETA_H264:
> +		return V4L2_CID_MPEG_VIDEO_H264_LOOP_FILTER_BETA;
> +	case DEBLOCK_MODE_HEVC:
> +		return V4L2_CID_MPEG_VIDEO_HEVC_LOOP_FILTER_MODE;
> +	case DEBLOCK_TC_HEVC:
> +		return V4L2_CID_MPEG_VIDEO_HEVC_LF_TC_OFFSET_DIV2;
> +	case DEBLOCK_BETA_HEVC:
> +		return V4L2_CID_MPEG_VIDEO_HEVC_LF_BETA_OFFSET_DIV2;
>  	case MIN_FRAME_QP_H264:
>  		return V4L2_CID_MPEG_VIDEO_H264_MIN_QP;
>  	case MIN_FRAME_QP_HEVC:
> @@ -884,6 +908,67 @@ int iris_set_entropy_mode_gen2(struct iris_inst *inst, enum platform_inst_fw_cap
>  				     &entropy_mode, sizeof(u32));
>  }
>  
> +int iris_set_deblock_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
> +{
> +	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
> +	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
> +	u32 mode = inst->fw_caps[cap_id].value;
> +	u32 alpha_tc, beta, hfi_value;
> +
> +	if (inst->codec == V4L2_PIX_FMT_H264) {
> +		if (cap_id != DEBLOCK_MODE_H264)
> +			return 0;
> +
> +		switch (mode) {
> +		case V4L2_MPEG_VIDEO_H264_LOOP_FILTER_MODE_ENABLED:
> +			mode = HFI_DEBLOCK_ALL_BOUNDARY;
> +			break;
> +		case V4L2_MPEG_VIDEO_H264_LOOP_FILTER_MODE_DISABLED:
> +			mode = HFI_DEBLOCK_DISABLE;
> +			break;
> +		case V4L2_MPEG_VIDEO_H264_LOOP_FILTER_MODE_DISABLED_AT_SLICE_BOUNDARY:
> +			mode = HFI_DEBLOCK_DISABLE_AT_SLICE_BOUNDARY;
> +			break;
> +		default:
> +			return -EINVAL;
> +		}
> +
> +		alpha_tc = inst->fw_caps[DEBLOCK_ALPHA_H264].value + 6;
> +		beta = inst->fw_caps[DEBLOCK_BETA_H264].value + 6;
> +	} else if (inst->codec == V4L2_PIX_FMT_HEVC) {
> +		if (cap_id != DEBLOCK_MODE_HEVC)
> +			return 0;
> +
> +		switch (mode) {
> +		case V4L2_MPEG_VIDEO_HEVC_LOOP_FILTER_MODE_ENABLED:
> +			mode = HFI_DEBLOCK_ALL_BOUNDARY;
> +			break;
> +		case V4L2_MPEG_VIDEO_HEVC_LOOP_FILTER_MODE_DISABLED:
> +			mode = HFI_DEBLOCK_DISABLE;
> +			break;
> +		case V4L2_MPEG_VIDEO_HEVC_LOOP_FILTER_MODE_DISABLED_AT_SLICE_BOUNDARY:
> +			mode = HFI_DEBLOCK_DISABLE_AT_SLICE_BOUNDARY;
> +			break;
> +		default:
> +			return -EINVAL;
> +		}
> +
> +		alpha_tc = inst->fw_caps[DEBLOCK_TC_HEVC].value + 6;
> +		beta = inst->fw_caps[DEBLOCK_BETA_HEVC].value + 6;
> +	} else {
> +		return 0;
> +	}
> +
> +	/* Firmware expects offsets biased by 6, with alpha or HEVC tc in bits 23:16. */
> +	hfi_value = alpha_tc << 16 | beta << 8 | mode;
> +
> +	return hfi_ops->session_set_property(inst, hfi_id,
> +					     HFI_HOST_FLAGS_NONE,
> +					     iris_get_port_info(inst, cap_id),
> +					     HFI_PAYLOAD_32_PACKED,
> +					     &hfi_value, sizeof(hfi_value));
> +}
> +
>  int iris_set_min_qp(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
>  {
>  	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
> diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.h b/drivers/media/platform/qcom/iris/iris_ctrls.h
> index 08db80744420..82437f4e19c1 100644
> --- a/drivers/media/platform/qcom/iris/iris_ctrls.h
> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.h
> @@ -29,6 +29,7 @@ int iris_set_bitrate_mode_gen1(struct iris_inst *inst, enum platform_inst_fw_cap
>  int iris_set_bitrate_mode_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
>  int iris_set_entropy_mode_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
>  int iris_set_entropy_mode_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
> +int iris_set_deblock_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
>  int iris_set_min_qp(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
>  int iris_set_max_qp(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
>  int iris_set_frame_qp(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
> index 65af61b63a29..a271858fd06a 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
> @@ -357,6 +357,64 @@ static const struct platform_inst_fw_cap inst_fw_cap_milos_enc[] = {
>  		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
>  		.set = iris_set_entropy_mode_gen2,
>  	},
> +	{
> +		.cap_id = DEBLOCK_MODE_H264,
> +		.min = V4L2_MPEG_VIDEO_H264_LOOP_FILTER_MODE_ENABLED,
> +		.max = V4L2_MPEG_VIDEO_H264_LOOP_FILTER_MODE_DISABLED_AT_SLICE_BOUNDARY,
> +		.step_or_mask =
> +			BIT(V4L2_MPEG_VIDEO_H264_LOOP_FILTER_MODE_ENABLED) |
> +			BIT(V4L2_MPEG_VIDEO_H264_LOOP_FILTER_MODE_DISABLED) |
> +			BIT(V4L2_MPEG_VIDEO_H264_LOOP_FILTER_MODE_DISABLED_AT_SLICE_BOUNDARY),
> +		.value = V4L2_MPEG_VIDEO_H264_LOOP_FILTER_MODE_ENABLED,
> +		.hfi_id = HFI_PROP_DEBLOCKING_MODE,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> +		.set = iris_set_deblock_gen2,
> +	},
> +	{
> +		.cap_id = DEBLOCK_ALPHA_H264,
> +		.min = -6,
> +		.max = 6,
> +		.step_or_mask = 1,
> +		.value = 0,
> +		.flags = CAP_FLAG_OUTPUT_PORT,
> +	},
> +	{
> +		.cap_id = DEBLOCK_BETA_H264,
> +		.min = -6,
> +		.max = 6,
> +		.step_or_mask = 1,
> +		.value = 0,
> +		.flags = CAP_FLAG_OUTPUT_PORT,
> +	},
> +	{
> +		.cap_id = DEBLOCK_MODE_HEVC,
> +		.min = V4L2_MPEG_VIDEO_HEVC_LOOP_FILTER_MODE_DISABLED,
> +		.max = V4L2_MPEG_VIDEO_HEVC_LOOP_FILTER_MODE_DISABLED_AT_SLICE_BOUNDARY,
> +		.step_or_mask =
> +			BIT(V4L2_MPEG_VIDEO_HEVC_LOOP_FILTER_MODE_ENABLED) |
> +			BIT(V4L2_MPEG_VIDEO_HEVC_LOOP_FILTER_MODE_DISABLED) |
> +			BIT(V4L2_MPEG_VIDEO_HEVC_LOOP_FILTER_MODE_DISABLED_AT_SLICE_BOUNDARY),
> +		.value = V4L2_MPEG_VIDEO_HEVC_LOOP_FILTER_MODE_ENABLED,
> +		.hfi_id = HFI_PROP_DEBLOCKING_MODE,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> +		.set = iris_set_deblock_gen2,
> +	},
> +	{
> +		.cap_id = DEBLOCK_TC_HEVC,
> +		.min = -6,
> +		.max = 6,
> +		.step_or_mask = 1,
> +		.value = 0,
> +		.flags = CAP_FLAG_OUTPUT_PORT,
> +	},
> +	{
> +		.cap_id = DEBLOCK_BETA_HEVC,
> +		.min = -6,
> +		.max = 6,
> +		.step_or_mask = 1,
> +		.value = 0,
> +		.flags = CAP_FLAG_OUTPUT_PORT,
> +	},
>  	{
>  		.cap_id = MIN_FRAME_QP_H264,
>  		.min = MIN_QP_8BIT,
> @@ -1309,6 +1367,64 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
>  		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
>  		.set = iris_set_entropy_mode_gen2,
>  	},
> +	{
> +		.cap_id = DEBLOCK_MODE_H264,
> +		.min = V4L2_MPEG_VIDEO_H264_LOOP_FILTER_MODE_ENABLED,
> +		.max = V4L2_MPEG_VIDEO_H264_LOOP_FILTER_MODE_DISABLED_AT_SLICE_BOUNDARY,
> +		.step_or_mask =
> +			BIT(V4L2_MPEG_VIDEO_H264_LOOP_FILTER_MODE_ENABLED) |
> +			BIT(V4L2_MPEG_VIDEO_H264_LOOP_FILTER_MODE_DISABLED) |
> +			BIT(V4L2_MPEG_VIDEO_H264_LOOP_FILTER_MODE_DISABLED_AT_SLICE_BOUNDARY),
> +		.value = V4L2_MPEG_VIDEO_H264_LOOP_FILTER_MODE_ENABLED,
> +		.hfi_id = HFI_PROP_DEBLOCKING_MODE,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> +		.set = iris_set_deblock_gen2,
> +	},
> +	{
> +		.cap_id = DEBLOCK_ALPHA_H264,
> +		.min = -6,
> +		.max = 6,
> +		.step_or_mask = 1,
> +		.value = 0,
> +		.flags = CAP_FLAG_OUTPUT_PORT,
> +	},
> +	{
> +		.cap_id = DEBLOCK_BETA_H264,
> +		.min = -6,
> +		.max = 6,
> +		.step_or_mask = 1,
> +		.value = 0,
> +		.flags = CAP_FLAG_OUTPUT_PORT,
> +	},
> +	{
> +		.cap_id = DEBLOCK_MODE_HEVC,
> +		.min = V4L2_MPEG_VIDEO_HEVC_LOOP_FILTER_MODE_DISABLED,
> +		.max = V4L2_MPEG_VIDEO_HEVC_LOOP_FILTER_MODE_DISABLED_AT_SLICE_BOUNDARY,
> +		.step_or_mask =
> +			BIT(V4L2_MPEG_VIDEO_HEVC_LOOP_FILTER_MODE_ENABLED) |
> +			BIT(V4L2_MPEG_VIDEO_HEVC_LOOP_FILTER_MODE_DISABLED) |
> +			BIT(V4L2_MPEG_VIDEO_HEVC_LOOP_FILTER_MODE_DISABLED_AT_SLICE_BOUNDARY),
> +		.value = V4L2_MPEG_VIDEO_HEVC_LOOP_FILTER_MODE_ENABLED,
> +		.hfi_id = HFI_PROP_DEBLOCKING_MODE,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> +		.set = iris_set_deblock_gen2,
> +	},
> +	{
> +		.cap_id = DEBLOCK_TC_HEVC,
> +		.min = -6,
> +		.max = 6,
> +		.step_or_mask = 1,
> +		.value = 0,
> +		.flags = CAP_FLAG_OUTPUT_PORT,
> +	},
> +	{
> +		.cap_id = DEBLOCK_BETA_HEVC,
> +		.min = -6,
> +		.max = 6,
> +		.step_or_mask = 1,
> +		.value = 0,
> +		.flags = CAP_FLAG_OUTPUT_PORT,
> +	},
>  	{
>  		.cap_id = MIN_FRAME_QP_H264,
>  		.min = MIN_QP_8BIT,
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> index e89ed4075526..04e5429328eb 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> @@ -57,6 +57,14 @@
>  #define HFI_PROP_BUFFER_FW_MIN_OUTPUT_COUNT	0x03000124
>  #define HFI_PROP_PIC_ORDER_CNT_TYPE		0x03000128
>  
> +enum hfi_deblock_mode {
> +	HFI_DEBLOCK_ALL_BOUNDARY			= 0x0,
> +	HFI_DEBLOCK_DISABLE			= 0x1,
> +	HFI_DEBLOCK_DISABLE_AT_SLICE_BOUNDARY	= 0x2,
> +};
> +
> +#define HFI_PROP_DEBLOCKING_MODE			0x03000129
> +
>  enum hfi_rate_control {
>  	HFI_RC_VBR_CFR		= 0x00000000,
>  	HFI_RC_CBR_CFR		= 0x00000001,
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index aa8cd2e1b3f1..75e56d10f5d0 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -158,6 +158,12 @@ enum platform_inst_fw_cap_type {
>  	FRAME_RC_ENABLE,
>  	GOP_SIZE,
>  	ENTROPY_MODE,
> +	DEBLOCK_MODE_H264,
> +	DEBLOCK_ALPHA_H264,
> +	DEBLOCK_BETA_H264,
> +	DEBLOCK_MODE_HEVC,
> +	DEBLOCK_TC_HEVC,
> +	DEBLOCK_BETA_HEVC,
>  	MIN_FRAME_QP_H264,
>  	MIN_FRAME_QP_HEVC,
>  	MAX_FRAME_QP_H264,

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

