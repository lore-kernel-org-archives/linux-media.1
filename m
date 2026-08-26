Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87170DF59
	for <linux-media@vger.kernel.org>; Wed, 26 Aug 2026 04:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787719853; cv=none; b=eIdmAj2E5hHhj+YVmcaBNGU7MifNDSNvQpQoRzTefJBSLG7dUWoDxLOGppHQfPSWRDK5GSXTGGXz/3a8EiLkC7I0T2woqJIPRQJIZ9TuZah83nXE5s9DxYF534M+R23ICAfmPgXr+iWArd5Qw4ws4O3pOY2b1YaGb4CITqskWI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787719853; c=relaxed/simple;
	bh=was0gA7C61MqRV6TCNyKVDHKgaXY871PGbZPrxBxqVs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tmLGIQeL6q+KQKDw1LBBxT38DcSC2QnXaJyM0tMG3O0xnp2mUXqWBwqu8BZOXvVdX9HTr/OWUwIPG8nG+/zIShrFONjilJU81/QGyVH0XkT+WQ4drjQHRr0diJyoI0ofO4WovphSgOgJOdWIEULPRt7v3lSYnl2PE1VvomOA1Jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aQ+kD17I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VLf6ufIF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aQ+kD17I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VLf6ufIF"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67Q4baYO3543412
	for <linux-media@vger.kernel.org>; Wed, 26 Aug 2026 04:50:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sApYm4i2DaHuWJj5iOqvh6kTTxC17NxEQwwfqsJf7Es=; b=aQ+kD17IH8ypl56Y
	I5iO01TyyvAcf/5GaCtoP7C/UAzFWxv9eiync2nOIFM+A+uEHcrQwvh8HRhkn2cw
	x60rDqog0HzcKZ48O7y527SimYTtMX9Adpxxxb1VJDGsvMMvtZTHY4mtcgWyTrco
	s5Fx7rGcd/albKfiImS905d1nHTewmj1FgT6O6MorZOyC9wRuC4P3zlrFGeRNhbH
	dzdmr52Izr80Jf8uCjpcTJ2tYKOFF7lFRKu6rZz3PYwZM4M6iAel7OQ6q1Oy/Gdg
	KpZQQOPyj3sQyq26vBYN08dzZMf+CuPYZRE5iVbJoQ/P7c78k3XyfRecMyEnHFRC
	St0mIg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9s9g8129-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 26 Aug 2026 04:50:50 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cfa4e4684bso12897635ad.2
        for <linux-media@vger.kernel.org>; Tue, 25 Aug 2026 21:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787719849; x=1788324649; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sApYm4i2DaHuWJj5iOqvh6kTTxC17NxEQwwfqsJf7Es=;
        b=VLf6ufIF1IUwUgCi7zp0yEarzBSPkxJDnT9lRwWQ2xsz4VlGnjTQnAkMxd2wzBwxQy
         bgaP1HUZn9hXP7LvTgfYRM8k76FnthVJIIhj0RqlHEEQOozvPmHGTU8q/Klxgh7i3S+G
         SBRAj1ZMEF/0ELdPDKwTJJezizJ3VzFKfZ4mCw3dIYldFii0htZs7MqPtfyHWF/o3MHh
         rlWyDsjrrQ9WhmbhqhVWkldScesW2gsk/iigC5P7BXC/06fgqSDP1V9wENVAPTHbFLjd
         iOYT8K7V1+PApjcHtRithM/9CA27IApC7Ufj/+iT1qcCpLPyR8asZeGSIgqoKCeN3pPT
         HFeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787719849; x=1788324649;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sApYm4i2DaHuWJj5iOqvh6kTTxC17NxEQwwfqsJf7Es=;
        b=FtFHzGEsAGz6/v6AiaEQ+oYztWGmQHW3UV7g3QACDSk1k/Q9wWYLFHmmCHknwjvBf3
         jBoMpu5hlsh04HxFBHXsCvRKwsbS0owgsaRPkW0o0VdZjvZP45I7JeI0Ge+Vm9iigtaS
         grZNywlcsq6UQGocKH651f3gmuxSN7lJVwL7x77SMfbTjgPxO4J/SuwArGZXMyKmBiST
         7pbD3jq3STqKPJW4nf01p0SugF/c2Mv/V6xSfDdA2v//fZ39RUbRXxVZ0VJ3cXautoym
         Pyiz53BNKUzvUD3RhLYMumv2xVgRkjEnmhEbUH2Ct3Oyoruh/F+OMqRRzt71wtYqe6mD
         p6SQ==
X-Gm-Message-State: AFuF++kDLJrGeKyTHeIvBz/+QnnDriEgSMdfENui4M48Fx1TVBsAyEM+
	9jsLnaIoJpm7mdRTwNi65+stj6fH1+ITgSE2s/yx3UVNJ4Rewamf4KQHE8zKI4uPfjpb2XCNdO8
	9o/+J8THvZeziKqBECi+qHZGflYJxhdmO+0fC7CIN7nHvsNxqh6IU7BRw4LxFymzzMw==
X-Gm-Gg: AR+sD12yCbgWrN8iYE2RFiD5Ppol8TigQu/EUbr+vRD0Gl1+bBMWh8uWZmMO1mgF+LA
	nEL+Nz7w0j4WSiGRvnVZxdAt/hpVUWHq22zglVqpSlHNLlnvre1Vhoa/y0jGsY3DtktgtBHmokZ
	stgnjLnHmpH+6ymCMBbO099sJFnpbUCniM761UGqj1M1KLM7Rhk3ShqlgDLqSucVJzJHn2T1eum
	1qTW2JUV09HmkoJkQL0xg7Gsy03BhVy6osOZzsvE7ebCDQwaEftEcXh3iVXBLn6DDc/Eqxuut6S
	MiSWmZQ77bDpNw3VdUWZPexhvSV1EGdddv1N2OnF+yUUxN1QinIah+flGik8rwMRIhq3QnvE6Ym
	VM9hdl8zasNXOj55OulyzHOR8k8Q9SLfG
X-Received: by 2002:a17:903:1a8d:b0:2d6:3c1a:85e0 with SMTP id d9443c01a7336-2d707b60b93mr68646675ad.14.1787719849220;
        Tue, 25 Aug 2026 21:50:49 -0700 (PDT)
X-Received: by 2002:a17:903:1a8d:b0:2d6:3c1a:85e0 with SMTP id d9443c01a7336-2d707b60b93mr68645785ad.14.1787719848737;
        Tue, 25 Aug 2026 21:50:48 -0700 (PDT)
Received: from [10.206.101.140] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283d60b539sm4117125eec.1.2026.08.25.21.50.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 21:50:48 -0700 (PDT)
Message-ID: <fc07bf67-2c7e-ec68-c9bc-595bcfb050d5@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 10:20:43 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 7/9] media: iris: add MPEG2 decode support on Gen1
 firmware
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260709-iris-vp8-v1-0-6af3ab578a7c@oss.qualcomm.com>
 <20260709-iris-vp8-v1-7-6af3ab578a7c@oss.qualcomm.com>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <20260709-iris-vp8-v1-7-6af3ab578a7c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: NQ4-LgchAB460BPEjY81ct6VaGkUMysg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDAzOCBTYWx0ZWRfXxuDxZXlco4D2
 MKO3bzNSaAy/Khn+3NXtElSoq9yX1mg1OFjW6UuY7JqecJqqaoEaGv5Ay2Gy0q4EAzCMSriYdrS
 txfJna88IsIyg22LoH4FTjJE+FTr+A+9EGd/d4iSVgliKLevwcvyqNZcwxwDNQuq/VjptGjn6ab
 AxvJkBYUj9z9iywZFHqKF6Wn97wfeRDVx5XTG+11vNCHKXHwmDH6uMN07To994DWt+2RN9lg32x
 OKzKfZ/EIyGNk5uwNo/jPzK/5dd6qb+gqcpxHRiI9d6piOvZY0Fm1s2NxsirhDovm01UJ3FBcxT
 5Msk/0PG20FV8SoWRiJa0f3jzjTfOyR3DV8qAjy59Sx1oQV+a5tOYfO5339zBNOpDIeqG7bM9eJ
 xiFNck81qoqVNoV/Tdcs9nmAhD7qt7irqK4ynFtGlrDkZme2enobfVXewi9VCSxfZxNo9D1vOJY
 jZAZWrNzGt7Y3VNH3Rg==
X-Authority-Analysis: v=2.4 cv=Xfq5Co55 c=1 sm=1 tr=0 ts=6a8e70aa cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=DJKZbvoiZJQd1Qtpw-4A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDAzOCBTYWx0ZWRfX6L6sQqvo/pgA
 w4WbwFNRts2Z77zjO/336MGpqeesSgCy3kxIXTMnerLrAvGHMJqZuTSzGAvABI2ZrY6+4vsvFe6
 AfAEQ5UqbnT2fBg2hKASf7JEo2nuS04=
X-Proofpoint-ORIG-GUID: NQ4-LgchAB460BPEjY81ct6VaGkUMysg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_01,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260038


On 7/10/2026 1:07 AM, Dmitry Baryshkov wrote:
> The Gen1 firmware supports decoding MPEG2, but the iris driver never
> advertised or wired up the codec.
>
> Add the MPEG2 HFI codec code, map V4L2_PIX_FMT_MPEG2 to it in the Gen1
> session open path, and compute the MPEG2 internal buffer sizes (line
> buffer and the quantisation-matrix / QP-dump persist buffer). Advertise
> the codec through the new Gen1 decode format list and register the MPEG2
> profile and level menu controls so userspace can query them.
>
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_ctrls.c      | 15 ++++++++++++++
>  drivers/media/platform/qcom/iris/iris_hfi_gen1.c   | 24 ++++++++++++++++++++++
>  .../platform/qcom/iris/iris_hfi_gen1_command.c     |  3 +++
>  .../platform/qcom/iris/iris_hfi_gen1_defines.h     |  1 +
>  .../platform/qcom/iris/iris_platform_common.h      |  2 ++
>  drivers/media/platform/qcom/iris/iris_vpu_buffer.c |  9 +++++++-
>  drivers/media/platform/qcom/iris/iris_vpu_buffer.h |  3 +++
>  7 files changed, 56 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
> index 1bd6460a1b0a..8f9347c1df2b 100644
> --- a/drivers/media/platform/qcom/iris/iris_ctrls.c
> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
> @@ -30,12 +30,16 @@ static enum platform_inst_fw_cap_type iris_get_cap_id(u32 id)
>  		return PROFILE_VP9;
>  	case V4L2_CID_MPEG_VIDEO_VP8_PROFILE:
>  		return PROFILE_VP8;
> +	case V4L2_CID_MPEG_VIDEO_MPEG2_PROFILE:
> +		return PROFILE_MPEG2;
>  	case V4L2_CID_MPEG_VIDEO_H264_LEVEL:
>  		return LEVEL_H264;
>  	case V4L2_CID_MPEG_VIDEO_HEVC_LEVEL:
>  		return LEVEL_HEVC;
>  	case V4L2_CID_MPEG_VIDEO_VP9_LEVEL:
>  		return LEVEL_VP9;
> +	case V4L2_CID_MPEG_VIDEO_MPEG2_LEVEL:
> +		return LEVEL_MPEG2;
>  	case V4L2_CID_MPEG_VIDEO_HEVC_TIER:
>  		return TIER;
>  	case V4L2_CID_MPEG_VIDEO_HEADER_MODE:
> @@ -175,12 +179,16 @@ static u32 iris_get_v4l2_id(enum platform_inst_fw_cap_type cap_id)
>  		return V4L2_CID_MPEG_VIDEO_VP9_PROFILE;
>  	case PROFILE_VP8:
>  		return V4L2_CID_MPEG_VIDEO_VP8_PROFILE;
> +	case PROFILE_MPEG2:
> +		return V4L2_CID_MPEG_VIDEO_MPEG2_PROFILE;
>  	case LEVEL_H264:
>  		return V4L2_CID_MPEG_VIDEO_H264_LEVEL;
>  	case LEVEL_HEVC:
>  		return V4L2_CID_MPEG_VIDEO_HEVC_LEVEL;
>  	case LEVEL_VP9:
>  		return V4L2_CID_MPEG_VIDEO_VP9_LEVEL;
> +	case LEVEL_MPEG2:
> +		return V4L2_CID_MPEG_VIDEO_MPEG2_LEVEL;
>  	case TIER:
>  		return V4L2_CID_MPEG_VIDEO_HEVC_TIER;
>  	case HEADER_MODE:
> @@ -527,6 +535,7 @@ int iris_set_stage(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id
>  		 * content also uses a single stage.
>  		 */
>  		if (inst->is_interlaced ||
> +		    inst->codec == V4L2_PIX_FMT_MPEG2 ||
>  		    iris_res_is_less_than(width, height, 1280, 720))
>  			work_mode = STAGE_1;
>  	}
> @@ -565,6 +574,9 @@ int iris_set_profile(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_
>  	} else if (inst->codec == V4L2_PIX_FMT_VP8) {
>  		hfi_id = inst->fw_caps[PROFILE_VP8].hfi_id;
>  		hfi_value = inst->fw_caps[PROFILE_VP8].value;
> +	} else if (inst->codec == V4L2_PIX_FMT_MPEG2) {
> +		hfi_id = inst->fw_caps[PROFILE_MPEG2].hfi_id;
> +		hfi_value = inst->fw_caps[PROFILE_MPEG2].value;
>  	} else {
>  		hfi_id = inst->fw_caps[PROFILE_HEVC].hfi_id;
>  		hfi_value = inst->fw_caps[PROFILE_HEVC].value;
> @@ -585,6 +597,9 @@ int iris_set_level(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id
>  	if (inst->codec == V4L2_PIX_FMT_H264) {
>  		hfi_id = inst->fw_caps[LEVEL_H264].hfi_id;
>  		hfi_value = inst->fw_caps[LEVEL_H264].value;
> +	} else if (inst->codec == V4L2_PIX_FMT_MPEG2) {
> +		hfi_id = inst->fw_caps[LEVEL_MPEG2].hfi_id;
> +		hfi_value = inst->fw_caps[LEVEL_MPEG2].value;
>  	} else {
>  		hfi_id = inst->fw_caps[LEVEL_HEVC].hfi_id;
>  		hfi_value = inst->fw_caps[LEVEL_HEVC].value;
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
> index 4c3aa5a03ddd..4b05c2a47b0b 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
> @@ -41,6 +41,29 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8250_dec[] = {
>  		.value = V4L2_MPEG_VIDEO_VP8_PROFILE_0,
>  		.flags = CAP_FLAG_MENU,
>  	},
> +	{
> +		.cap_id = PROFILE_MPEG2,
> +		.min = V4L2_MPEG_VIDEO_MPEG2_PROFILE_SIMPLE,
> +		.max = V4L2_MPEG_VIDEO_MPEG2_PROFILE_HIGH,
> +		.step_or_mask = BIT(V4L2_MPEG_VIDEO_MPEG2_PROFILE_SIMPLE) |
> +				BIT(V4L2_MPEG_VIDEO_MPEG2_PROFILE_MAIN) |
> +				BIT(V4L2_MPEG_VIDEO_MPEG2_PROFILE_SNR_SCALABLE) |
> +				BIT(V4L2_MPEG_VIDEO_MPEG2_PROFILE_SPATIALLY_SCALABLE) |
> +				BIT(V4L2_MPEG_VIDEO_MPEG2_PROFILE_HIGH),
> +		.value = V4L2_MPEG_VIDEO_MPEG2_PROFILE_MAIN,
> +		.flags = CAP_FLAG_MENU,
> +	},
> +	{
> +		.cap_id = LEVEL_MPEG2,
> +		.min = V4L2_MPEG_VIDEO_MPEG2_LEVEL_LOW,
> +		.max = V4L2_MPEG_VIDEO_MPEG2_LEVEL_HIGH,
> +		.step_or_mask = BIT(V4L2_MPEG_VIDEO_MPEG2_LEVEL_LOW) |
> +				BIT(V4L2_MPEG_VIDEO_MPEG2_LEVEL_MAIN) |
> +				BIT(V4L2_MPEG_VIDEO_MPEG2_LEVEL_HIGH_1440) |
> +				BIT(V4L2_MPEG_VIDEO_MPEG2_LEVEL_HIGH),
> +		.value = V4L2_MPEG_VIDEO_MPEG2_LEVEL_MAIN,
> +		.flags = CAP_FLAG_MENU,
> +	},
>  };
>  
>  static const struct platform_inst_fw_cap inst_fw_cap_sm8250_enc[] = {
> @@ -435,6 +458,7 @@ static const u32 iris_hfi_gen1_dec_fmts[] = {
>  	V4L2_PIX_FMT_HEVC,
>  	V4L2_PIX_FMT_VP9,
>  	V4L2_PIX_FMT_VP8,
> +	V4L2_PIX_FMT_MPEG2,
>  };
>  
>  static const u32 iris_hfi_gen1_ar50lt_dec_fmts[] = {
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> index 90645ed3e0d8..53ba48f88410 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> @@ -111,6 +111,9 @@ static int iris_hfi_gen1_session_open(struct iris_inst *inst)
>  	case V4L2_PIX_FMT_VP9:
>  		codec = HFI_VIDEO_CODEC_VP9;
>  		break;
> +	case V4L2_PIX_FMT_MPEG2:
> +		codec = HFI_VIDEO_CODEC_MPEG2;
> +		break;
>  	}
>  
>  	packet.shdr.hdr.size = sizeof(struct hfi_session_open_pkt);
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
> index 13c8ff59d6e4..3c8ae1c82540 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
> @@ -14,6 +14,7 @@
>  #define HFI_SESSION_TYPE_DEC				2
>  
>  #define HFI_VIDEO_CODEC_H264				0x00000002
> +#define HFI_VIDEO_CODEC_MPEG2				0x00000010
>  #define HFI_VIDEO_CODEC_VP8				0x00001000
>  #define HFI_VIDEO_CODEC_HEVC				0x00002000
>  #define HFI_VIDEO_CODEC_VP9				0x00004000
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index 84017b66e98f..3d631effe307 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -116,9 +116,11 @@ enum platform_inst_fw_cap_type {
>  	PROFILE_HEVC,
>  	PROFILE_VP9,
>  	PROFILE_VP8,
> +	PROFILE_MPEG2,
>  	LEVEL_H264,
>  	LEVEL_HEVC,
>  	LEVEL_VP9,
> +	LEVEL_MPEG2,
>  	PROFILE_AV1,
>  	LEVEL_AV1,
>  	TIER_AV1,
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
> index ca90414e6c19..c16e2b652cf4 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
> @@ -298,6 +298,11 @@ static u32 hfi_buffer_persist_vp8d(void)
>  	return ALIGN(VP8_NUM_PROBABILITY_TABLE_BUF * VP8_PROB_TABLE_SIZE, DMA_ALIGNMENT);
>  }
>  
> +static u32 hfi_buffer_persist_mpeg2d(void)
> +{
> +	return QMATRIX_SIZE + MP2D_QPDUMP_SIZE;
> +}
> +
>  static u32 hfi_buffer_persist_vp9d_ar50lt(void)
>  {
>  	return ALIGN(VP9_NUM_PROBABILITY_TABLE_BUF * VP9_PROB_TABLE_SIZE, DMA_ALIGNMENT) +
> @@ -1083,6 +1088,8 @@ static u32 iris_vpu_dec_persist_size(struct iris_inst *inst)
>  		return hfi_buffer_persist_vp9d();
>  	else if (inst->codec == V4L2_PIX_FMT_VP8)
>  		return hfi_buffer_persist_vp8d();
> +	else if (inst->codec == V4L2_PIX_FMT_MPEG2)
> +		return hfi_buffer_persist_mpeg2d();
>  	else if (inst->codec == V4L2_PIX_FMT_AV1) {
>  		caps = inst->core->iris_platform_data->inst_caps;
>  		if (inst->fw_caps[DRAP].value)
> @@ -1163,7 +1170,7 @@ static u32 iris_vpu_dec_line_size(struct iris_inst *inst)
>  	else if (inst->codec == V4L2_PIX_FMT_VP9)
>  		return hfi_buffer_line_vp9d(width, height, out_min_count, is_opb,
>  			num_vpp_pipes);
> -	else if (inst->codec == V4L2_PIX_FMT_VP8)
> +	else if (inst->codec == V4L2_PIX_FMT_VP8 || inst->codec == V4L2_PIX_FMT_MPEG2)
>  		return hfi_buffer_line_vp8d(width, height, is_opb, num_vpp_pipes);
>  	else if (inst->codec == V4L2_PIX_FMT_AV1)
>  		return hfi_buffer_line_av1d(width, height, is_opb, num_vpp_pipes);
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.h b/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
> index 684b459c0cad..4694467677f6 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
> @@ -69,6 +69,9 @@ struct iris_inst;
>  #define VP8_NUM_PROBABILITY_TABLE_BUF (5 + 1)
>  #define VP8_PROB_TABLE_SIZE (3840)
>  
> +#define QMATRIX_SIZE (sizeof(u32) * 128 + 256)
> +#define MP2D_QPDUMP_SIZE (115200)
> +
>  #define SIZE_SEI_USERDATA			4096
>  #define SIZE_DOLBY_RPU_METADATA (41 * 1024)
>  #define H264_CABAC_HDR_RATIO_HD_TOT	1

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

