Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D24AC29BDBF
	for <linux-media@vger.kernel.org>; Wed, 26 Aug 2026 04:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787717393; cv=none; b=lAUwU7OoVJ3xay09IbUzx4P6ZD62sgGNw9kCvas0Olmem6ucaKCs9a/6w5uqZu8aEFyMP406cxdFU7wN4vtCp+DiG+wiRcTmm1pBI0HqM/GCLB+baSAmk/FDE+PsQk9H534kcI3jp9TzZy+rt/BYPt0gQHIZhG09z9SEOBcCZDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787717393; c=relaxed/simple;
	bh=5SvfTMsOD1bWrZ6352IG2/8QCgucdILZUyZYqrqPnbA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f6xn80N4Dx3l5IiSvEudk6SH3CuILmKEs7KMfwmkXLPlxsvKaYRIUnuICOti72oQOvqYedFg20FegywicgFHwMAfNkFTxcdVvuKTM3yl2t9sSDqTNgKD48HkePGh3AnxZs0CCeLFVBVcL6mwnOKPa4WzySq4MBDXhcv7hSEUwbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Iw7ITynB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ABXCgzmN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Iw7ITynB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ABXCgzmN"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67Q3HMHE3897669
	for <linux-media@vger.kernel.org>; Wed, 26 Aug 2026 04:09:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NCLuga3z/VHSFagGvb4FnviygWtjdzVtRxAkjFF5mvk=; b=Iw7ITynBmG1VkGo/
	wtZ8L1B9UQBwAX0x/MTX18eUjdRnpyo1PO9uHmBrQHD9rSRoM9ERd0ZDQMlbL9XJ
	5M/F6Ja90AI2PAugh0VNWhXK/3n/XqlUJ4eO8qlx/AmgLh0zxnMUhikG9yJw3UoT
	4Gp/SXzW7oSVjPnT2EQJXGet/ooulJPHhSa8GmCSEX6kJj6kHcZLssRpfHCb9+70
	eQaBRxii9roQhyBXQivB2zhNIBNOK9gOJfqulqtdTCjiaI4j/ygy/9BkPV4lCQQ7
	H7ROvVjeOGB7JRWxK5n5oWEHJS+UNIdULmtmCAlZenDdh4Cb9MH2EOCmmIkm/na8
	hh+ktA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9g4msqfu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 26 Aug 2026 04:09:49 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e8fee6af3so864340a91.1
        for <linux-media@vger.kernel.org>; Tue, 25 Aug 2026 21:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787717389; x=1788322189; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NCLuga3z/VHSFagGvb4FnviygWtjdzVtRxAkjFF5mvk=;
        b=ABXCgzmN+yPbmtPlni8EK9WUW4LSeEfJd08uXB5T9o4oWfOKSd+rFC0mVxlgW5ZsVa
         +1Hp8a8RG277u3PegUv1dRkFsBQjySpdLf6ES1q8TK0HpcFw9LErM5eCHes0PV7Je4qH
         sXB/QCT5uLHFCFHTYjMmPIKo+4Q5VkwC/UdKorni6BJLXMfb4s5jAKBL7CHV3JGBVhnF
         5evjPuqCdIYjMUCwBDfzUgsKKNmnCw09GCvkUXAp7l6GY/QgJcwjO24KQrTbTj+aMurp
         FI7TyOkI5IQO8G6+D3uxejxItf9/e4YNKnGdxA1odNCENd1uBN8g8AvNipFnyi+P10op
         WeJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787717389; x=1788322189;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NCLuga3z/VHSFagGvb4FnviygWtjdzVtRxAkjFF5mvk=;
        b=cQbNhaHBQ2lpzrNkjmFt2Lr/0Nj6RaE+UJbGqEEODkNeM2oGlyY+sCnR3t6ccLG2au
         eWNYqkG+PfGpa52MVf5K4RjlWWUOTdXeMsjRLT0IzeXmfAVbg7/q/ZUJl/W6Y89X16uS
         VbAZao/cqan4sNiaVMaUO9GjGPyzAVfKpL3xAzNZ4fPXBiP4c9v55pBGpV4acw2m3wL/
         F695V1n5PVY5e5rcrcsc5612+xnM5IBIwcPtKFIs1AodTCvUK9kXMIMqOdmPKkbVriEX
         cUrkFTsyjjUcflIpzWyekWCVl5YtrkeEcN3rXPsn+IxIYgGyr5P6uGLtGf3rNaoHSFoW
         pTwQ==
X-Gm-Message-State: AFuF++nTl715mykXfzJXeKvNinbXKKpKeBi5Bi2x9hW9k1c2+gm3K/tg
	wan8O0uScIRXx+4LQgt5LWU9TIsvonQJCO8rsZ784ckkjyulsuFS9EQfocyFjSsvAiUUA3NhcOD
	XroqQSY2wl3vDKsYIQlIQkjKYRTKKP35keWMe4e1e6T/QEvGltl4vm9atKP1JRmpicw6LqDqE5A
	==
X-Gm-Gg: AR+sD10kTwE1gJObjki6C86RuKYEC2NqUziKoEZlJ1ScAWgRMtZDDVsO0NE1ijIuqlZ
	EgziiazRlK20hoYD2NDM8iq3flYdkDEBlwV/WfAc8XZG8XHtRxMv7IPIOuKjWjcz9DaWagJ6TYL
	+fZehZbahVLw9tdv++IzccTsmIsu48t50VTaW5DX0MbE71Gy+4ov4vlW3dJ9YgQyXuLS8pce0yb
	SpF0SCPnW1DioVqXnpNC5OnkST5Y4Q3U4sjsLd5eqvpogY2YyyPptGZFwIVgYqQWa4gFb7vwFnV
	cv35V5pGTK3NrUwJbM8aN4tvq0LxlskTp3isjFLv1xyh1OrXQyItYTobiFieWhutA5s5QKun5UN
	+DEZ/l0B8kKypQJ1v9x+y9Gm3YgXwXXzT
X-Received: by 2002:a17:90b:1dce:b0:366:10f1:3d91 with SMTP id 98e67ed59e1d1-3966d13eb80mr8228478a91.1.1787717388569;
        Tue, 25 Aug 2026 21:09:48 -0700 (PDT)
X-Received: by 2002:a17:90b:1dce:b0:366:10f1:3d91 with SMTP id 98e67ed59e1d1-3966d13eb80mr8228407a91.1.1787717388029;
        Tue, 25 Aug 2026 21:09:48 -0700 (PDT)
Received: from [10.206.101.140] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283d7303a2sm4251269eec.10.2026.08.25.21.09.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 21:09:47 -0700 (PDT)
Message-ID: <7013a7ee-c9f1-278e-deda-a6f28946382a@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 09:39:41 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 5/9] media: iris: move the decode format list into the
 firmware data
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
 <20260709-iris-vp8-v1-5-6af3ab578a7c@oss.qualcomm.com>
Content-Language: en-US
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <20260709-iris-vp8-v1-5-6af3ab578a7c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDAzMSBTYWx0ZWRfXyUSg2292kNhT
 4RI21aZbnX7DjYTIF9Rjm/QG1XywvpygvhGtyliiZ0l5GwBQKtQbFCVbBDjxWi/0gnBJfKp9HR+
 YL+bgbkZ0ZnjSTHSCEyYEJyrf6OYnAE=
X-Proofpoint-ORIG-GUID: PIe_BUPY1eWxM1lW0_BLmRz8oSrhWBpB
X-Authority-Analysis: v=2.4 cv=eYgNubEH c=1 sm=1 tr=0 ts=6a8e670d cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=5BzqS10LXJDqCrChWL8A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDAzMSBTYWx0ZWRfX5JXpftrK4iiC
 XJSlqaIuo/IOSzjbpBuaxCPtnVmeAxHzktraozbTdhAZmcoDiGlVOEkvxa8J3vWEiViXfNNwKIJ
 ZyjCSveMpfuKh/lOzIe6Aj+wQAaoRHcVv3dAbGvBQ31dI8MPSNDuaUHzS4NrcCgLd3eO3kNpym7
 uOL17y3/fNt3YaPBTJJeS2qUDuhBiuVogXsGhZJVrn433vSvqnqJlMcIBoEM+dW19GXqI+29jcS
 85X4/yHXMcTfdh39bLdhPH2KvZ0p89iN9TqlI05no07q/ArCBL8UvgphNPhiI6NhXkaWA4LHz6S
 G0VPt1vAhMCAJIqnr94LBQ49ETHsf00hIrTHguQHOEXC3EiEJWLP2N5R2BMjxss2KfJiK0jfAKY
 +crw2qZcRdQT1SZeq2RS0c8P5cBUevSTm5pkLuhYMueLEsO8KE45VCZ9/vcuyQiy/BnVHdhL55f
 Fu+vm7fh08hvI3UaA6A==
X-Proofpoint-GUID: PIe_BUPY1eWxM1lW0_BLmRz8oSrhWBpB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_01,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 phishscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608260031


On 7/10/2026 1:07 AM, Dmitry Baryshkov wrote:
> The set of supported coded formats depends on the firmware generation:
> a single SoC can boot either Gen1 or Gen2 firmware, and some codecs are
> only supported by one generation. The decode format list was however
> kept per-SoC in iris_platform_data::inst_iris_fmts, which is too coarse
> to express this - a per-SoC list cannot describe the two different format
> sets the same SoC exposes depending on which firmware it booted.
>
> Move the decode format list into struct iris_firmware_data, which is
> already selected per firmware generation, and drop the per-SoC
> inst_iris_fmts field. Each firmware data instance now carries the exact
> set of decode formats its generation supports, so the formats advertised
> to userspace always match the running firmware.
>
> No functional change: every SoC advertises the same decode formats as
> before.
>
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_hfi_gen1.c    | 12 ++++++++++++
>  drivers/media/platform/qcom/iris/iris_hfi_gen2.c    | 21 +++++++++++++++++++++
>  .../media/platform/qcom/iris/iris_platform_common.h | 12 ++++++++++--
>  .../media/platform/qcom/iris/iris_platform_vpu2.c   | 10 ----------
>  .../media/platform/qcom/iris/iris_platform_vpu3x.c  | 17 -----------------
>  .../platform/qcom/iris/iris_platform_vpu_ar50lt.c   |  8 --------
>  drivers/media/platform/qcom/iris/iris_vdec.c        |  8 ++++----
>  7 files changed, 47 insertions(+), 41 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
> index 4f205757647a..8119c639ec24 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
> @@ -419,6 +419,12 @@ static const u32 sm8250_enc_ip_int_buf_tbl[] = {
>  	BUF_SCRATCH_2,
>  };
>  
> +static const u32 iris_hfi_gen1_dec_fmts[] = {
> +	V4L2_PIX_FMT_H264,
> +	V4L2_PIX_FMT_HEVC,
> +	V4L2_PIX_FMT_VP9,
> +};
> +
>  const struct iris_firmware_data iris_hfi_gen1_data = {
>  	.init_hfi_ops = &iris_hfi_gen1_sys_ops_init,
>  
> @@ -427,6 +433,9 @@ const struct iris_firmware_data iris_hfi_gen1_data = {
>  	.inst_fw_caps_enc = inst_fw_cap_sm8250_enc,
>  	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_sm8250_enc),
>  
> +	.dec_fmts = iris_hfi_gen1_dec_fmts,
> +	.dec_fmts_size = ARRAY_SIZE(iris_hfi_gen1_dec_fmts),
> +
>  	.dec_input_config_params_default =
>  		sm8250_vdec_input_config_param_default,
>  	.dec_input_config_params_default_size =
> @@ -668,6 +677,9 @@ const struct iris_firmware_data iris_hfi_gen1_ar50lt_data = {
>  	.inst_fw_caps_enc = inst_fw_cap_gen1_ar50lt_enc,
>  	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_gen1_ar50lt_enc),
>  
> +	.dec_fmts = iris_hfi_gen1_dec_fmts,
> +	.dec_fmts_size = ARRAY_SIZE(iris_hfi_gen1_dec_fmts),
> +
>  	.dec_input_config_params_default =
>  		sm8250_vdec_input_config_param_default,
>  	.dec_input_config_params_default_size =
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
> index 110b5630902f..6c1d562ab8c2 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
> @@ -1236,6 +1236,19 @@ static const u32 sm8550_enc_op_int_buf_tbl[] = {
>  	BUF_SCRATCH_2,
>  };
>  
> +static const u32 iris_hfi_gen2_dec_fmts[] = {
> +	V4L2_PIX_FMT_H264,
> +	V4L2_PIX_FMT_HEVC,
> +	V4L2_PIX_FMT_VP9,
> +	V4L2_PIX_FMT_AV1,

Kodiak supports both Gen1 and Gen2 firmware's, but AV1 decoding is not supported
on kodiak. With this change, the driver will incorrectly advertise AV1 decode
capability for kodiak platform.

> +};
> +
> +static const u32 iris_hfi_gen2_vpu2_dec_fmts[] = {
> +	V4L2_PIX_FMT_H264,
> +	V4L2_PIX_FMT_HEVC,
> +	V4L2_PIX_FMT_VP9,
> +};
> +
>  const struct iris_firmware_data iris_hfi_gen2_data = {
>  	.init_hfi_ops = iris_hfi_gen2_sys_ops_init,
>  
> @@ -1246,6 +1259,9 @@ const struct iris_firmware_data iris_hfi_gen2_data = {
>  	.inst_fw_caps_enc = inst_fw_cap_sm8550_enc,
>  	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_sm8550_enc),
>  
> +	.dec_fmts = iris_hfi_gen2_dec_fmts,
> +	.dec_fmts_size = ARRAY_SIZE(iris_hfi_gen2_dec_fmts),
> +
>  	.dec_input_config_params_default =
>  		sm8550_vdec_input_config_params_default,
>  	.dec_input_config_params_default_size =
> @@ -1317,6 +1333,9 @@ const struct iris_firmware_data iris_hfi_gen2_vpu2_data = {
>  	.inst_fw_caps_enc = inst_fw_cap_sm8550_enc,
>  	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_sm8550_enc),
>  
> +	.dec_fmts = iris_hfi_gen2_vpu2_dec_fmts,
> +	.dec_fmts_size = ARRAY_SIZE(iris_hfi_gen2_vpu2_dec_fmts),
> +
>  	.dec_input_config_params_default =
>  		sm8550_vdec_input_config_params_default,
>  	.dec_input_config_params_default_size =
> @@ -1934,6 +1953,8 @@ const struct iris_firmware_data iris_hfi_gen2_ar50lt_data = {
>  	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_gen2_ar50lt_dec),
>  	.inst_fw_caps_enc = inst_fw_cap_gen2_ar50lt_enc,
>  	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_gen2_ar50lt_enc),
> +	.dec_fmts = iris_hfi_gen2_vpu2_dec_fmts,
> +	.dec_fmts_size = ARRAY_SIZE(iris_hfi_gen2_vpu2_dec_fmts),
>  	.dec_input_config_params_default =
>  		sm8550_vdec_input_config_params_default,
>  	.dec_input_config_params_default_size =
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index 9743573ab083..317ba48e6305 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -255,6 +255,16 @@ struct iris_firmware_data {
>  	const struct platform_inst_fw_cap *inst_fw_caps_enc;
>  	u32 inst_fw_caps_enc_size;
>  
> +	/*
> +	 * List of coded formats supported by this firmware generation, used to
> +	 * advertise decode (bitstream) formats to userspace. This lives in the
> +	 * firmware data because a single SoC can boot either firmware
> +	 * generation, and some codecs (e.g. VP8, MPEG2, AV1) are only supported
> +	 * by one generation.
> +	 */
> +	const u32 *dec_fmts;
> +	unsigned int dec_fmts_size;
> +
>  	const u32 *dec_input_config_params_default;
>  	unsigned int dec_input_config_params_default_size;
>  	const u32 *dec_input_config_params_hevc;
> @@ -317,8 +327,6 @@ struct iris_platform_data {
>  	const char * const *controller_rst_tbl;
>  	unsigned int controller_rst_tbl_size;
>  	u64 dma_mask;
> -	const u32 *inst_iris_fmts;
> -	u32 inst_iris_fmts_size;
>  	struct platform_inst_caps *inst_caps;
>  	const struct tz_cp_config *tz_cp_config_data;
>  	u32 tz_cp_config_data_size;
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
> index 8f01cf7f6d49..37aee82a49f4 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
> @@ -36,12 +36,6 @@ static const struct iris_firmware_desc iris_vpu20_p4_gen1_desc = {
>  	.fwname = "qcom/vpu/vpu20_p4.mbn",
>  };
>  
> -static const u32 iris_fmts_vpu2_dec[] = {
> -	V4L2_PIX_FMT_H264,
> -	V4L2_PIX_FMT_HEVC,
> -	V4L2_PIX_FMT_VP9,
> -};
> -
>  static struct platform_inst_caps platform_inst_cap_vpu2 = {
>  	.min_frame_width = 128,
>  	.max_frame_width = 8192,
> @@ -89,8 +83,6 @@ const struct iris_platform_data sc7280_data = {
>  	.opp_clk_tbl = sc7280_opp_clk_table,
>  	/* Upper bound of DMA address range */
>  	.dma_mask = 0xe0000000 - 1,
> -	.inst_iris_fmts = iris_fmts_vpu2_dec,
> -	.inst_iris_fmts_size = ARRAY_SIZE(iris_fmts_vpu2_dec),
>  	.inst_caps = &platform_inst_cap_vpu2,
>  	.tz_cp_config_data = tz_cp_config_vpu2,
>  	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu2),
> @@ -122,8 +114,6 @@ const struct iris_platform_data sm8250_data = {
>  	.opp_clk_tbl = sm8250_opp_clk_table,
>  	/* Upper bound of DMA address range */
>  	.dma_mask = 0xe0000000 - 1,
> -	.inst_iris_fmts = iris_fmts_vpu2_dec,
> -	.inst_iris_fmts_size = ARRAY_SIZE(iris_fmts_vpu2_dec),
>  	.inst_caps = &platform_inst_cap_vpu2,
>  	.tz_cp_config_data = tz_cp_config_vpu2,
>  	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu2),
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
> index b8099d7ce556..30c95621fa0e 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
> @@ -50,13 +50,6 @@ static const struct iris_firmware_desc iris_vpu35_p4_gen2_desc = {
>  	.fwname = "qcom/vpu/vpu35_p4.mbn",
>  };
>  
> -static const u32 iris_fmts_vpu3x_dec[] = {
> -	V4L2_PIX_FMT_H264,
> -	V4L2_PIX_FMT_HEVC,
> -	V4L2_PIX_FMT_VP9,
> -	V4L2_PIX_FMT_AV1,
> -};
> -
>  static const struct icc_info iris_icc_info_vpu3x[] = {
>  	{ "cpu-cfg",    1000, 1000     },
>  	{ "video-mem",  1000, 15000000 },
> @@ -109,8 +102,6 @@ const struct iris_platform_data qcs8300_data = {
>  	.opp_clk_tbl = iris_opp_clk_table_vpu3x,
>  	/* Upper bound of DMA address range */
>  	.dma_mask = 0xe0000000 - 1,
> -	.inst_iris_fmts = iris_fmts_vpu3x_dec,
> -	.inst_iris_fmts_size = ARRAY_SIZE(iris_fmts_vpu3x_dec),
>  	.inst_caps = &platform_inst_cap_qcs8300,
>  	.tz_cp_config_data = tz_cp_config_vpu3,
>  	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
> @@ -140,8 +131,6 @@ const struct iris_platform_data sm8550_data = {
>  	.opp_clk_tbl = iris_opp_clk_table_vpu3x,
>  	/* Upper bound of DMA address range */
>  	.dma_mask = 0xe0000000 - 1,
> -	.inst_iris_fmts = iris_fmts_vpu3x_dec,
> -	.inst_iris_fmts_size = ARRAY_SIZE(iris_fmts_vpu3x_dec),
>  	.inst_caps = &platform_inst_cap_sm8550,
>  	.tz_cp_config_data = tz_cp_config_vpu3,
>  	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
> @@ -179,8 +168,6 @@ const struct iris_platform_data sm8650_data = {
>  	.opp_clk_tbl = iris_opp_clk_table_vpu3x,
>  	/* Upper bound of DMA address range */
>  	.dma_mask = 0xe0000000 - 1,
> -	.inst_iris_fmts = iris_fmts_vpu3x_dec,
> -	.inst_iris_fmts_size = ARRAY_SIZE(iris_fmts_vpu3x_dec),
>  	.inst_caps = &platform_inst_cap_sm8550,
>  	.tz_cp_config_data = tz_cp_config_vpu3,
>  	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
> @@ -210,8 +197,6 @@ const struct iris_platform_data sm8750_data = {
>  	.opp_clk_tbl = iris_opp_clk_table_vpu3x,
>  	/* Upper bound of DMA address range */
>  	.dma_mask = 0xe0000000 - 1,
> -	.inst_iris_fmts = iris_fmts_vpu3x_dec,
> -	.inst_iris_fmts_size = ARRAY_SIZE(iris_fmts_vpu3x_dec),
>  	.inst_caps = &platform_inst_cap_sm8550,
>  	.tz_cp_config_data = tz_cp_config_vpu3,
>  	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
> @@ -247,8 +232,6 @@ const struct iris_platform_data x1p42100_data = {
>  	.opp_clk_tbl = x1p42100_opp_clk_table,
>  	/* Upper bound of DMA address range */
>  	.dma_mask = 0xe0000000 - 1,
> -	.inst_iris_fmts = iris_fmts_vpu3x_dec,
> -	.inst_iris_fmts_size = ARRAY_SIZE(iris_fmts_vpu3x_dec),
>  	.inst_caps = &platform_inst_cap_sm8550,
>  	.tz_cp_config_data = tz_cp_config_vpu3,
>  	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu_ar50lt.c b/drivers/media/platform/qcom/iris/iris_platform_vpu_ar50lt.c
> index 99c839a0424f..e569817a0c80 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_vpu_ar50lt.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_vpu_ar50lt.c
> @@ -25,12 +25,6 @@ static const struct iris_firmware_desc iris_vpu_ar50lt_p1_gen2_s6_desc = {
>  	.fwname = "qcom/vpu/ar50lt_p1_gen2_s6.mbn",
>  };
>  
> -static const u32 iris_fmts_ar50lt_dec[] = {
> -	V4L2_PIX_FMT_H264,
> -	V4L2_PIX_FMT_HEVC,
> -	V4L2_PIX_FMT_VP9,
> -};
> -
>  static const struct bw_info iris_bw_table_dec_ar50lt[] = {
>  	{ ((1920 * 1080) / 256) * 60, 1564000, },
>  	{ ((1920 * 1080) / 256) * 30,  791000, },
> @@ -100,8 +94,6 @@ const struct iris_platform_data qcm2290_data = {
>  	.opp_clk_tbl = iris_opp_clk_table_ar50lt,
>  	/* Upper bound of DMA address range */
>  	.dma_mask = 0xe0000000 - 1,
> -	.inst_iris_fmts = iris_fmts_ar50lt_dec,
> -	.inst_iris_fmts_size = ARRAY_SIZE(iris_fmts_ar50lt_dec),
>  	.inst_caps = &platform_inst_cap_ar50lt,
>  	.tz_cp_config_data = tz_cp_config_ar50lt,
>  	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_ar50lt),
> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
> index 9169b1335b5c..59200ca72ded 100644
> --- a/drivers/media/platform/qcom/iris/iris_vdec.c
> +++ b/drivers/media/platform/qcom/iris/iris_vdec.c
> @@ -83,8 +83,8 @@ static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
>  
>  	switch (type) {
>  	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
> -		fmt = inst->core->iris_platform_data->inst_iris_fmts;
> -		size = inst->core->iris_platform_data->inst_iris_fmts_size;
> +		fmt = inst->core->iris_firmware_data->dec_fmts;
> +		size = inst->core->iris_firmware_data->dec_fmts_size;
>  		break;
>  	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
>  		if (ubwc->ubwc_enc_version) {
> @@ -128,8 +128,8 @@ static u32 find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
>  
>  	switch (type) {
>  	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
> -		fmt = inst->core->iris_platform_data->inst_iris_fmts;
> -		size = inst->core->iris_platform_data->inst_iris_fmts_size;
> +		fmt = inst->core->iris_firmware_data->dec_fmts;
> +		size = inst->core->iris_firmware_data->dec_fmts_size;
>  		break;
>  	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
>  		if (ubwc->ubwc_enc_version) {
>
