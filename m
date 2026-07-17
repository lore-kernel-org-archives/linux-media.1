Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8379336606A
	for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 03:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784259552; cv=none; b=HC+CA5v+MUNR0ZmuzPvEQAF9De7t2dX7AmpEm5qhMuy2qjCyGnpSzLRoXYIR+Ij/Fsrhz2BOK0KrPn3UbX64MuJdFNINwPbZKFsZKvPrgFQWDLBu6NdPLUuuIxSeWdPcT0qTpSmfatbZNy5x3ZkfC8J+6tmDqBh8zdyPRiR//Gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784259552; c=relaxed/simple;
	bh=yMkPvwdMfDowWXtBET9evp24tjqTr+r93/Qa4/P1ypE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RxrfUEaIneqDYZFK/jAwb1XRcSfYdOyNnwpPyoUnJGEWxHd4eML5s3gWId69uhSCnG4tB5iO2JfS0LVtKwOvvdO2vfE81R1ftMATUgfz//vQw17uczf5I2aAZfy5rc5VkriqGlmBf79qu2FOgghUtBmJoftdMMH6e/PSEmfjtqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oXwOQxzE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ks9M7TYZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oXwOQxzE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ks9M7TYZ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H33qqW594839
	for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 03:39:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XNyud4vuwDzfpyACJSMTgyNZvqHzuJLECor+03HpS70=; b=oXwOQxzEVNFoURZP
	nEvEn2ge6FVdCog0Hx7Zr6I6RR7kpnRorHx8J7LlfwLMadV7uwDWeImOhLHTc1Yt
	uwRbXSmLM3wRtJ0n2HzLjgBwICaNkFsbqXXv3Gd0+gHpFg1ZUFXeo/aSBdMp4PPu
	n6mz2QtsY5tSwzAHMYBKW8fS8S1j6T/2RLTQjzyfQ/UOi2TS5sDo2DF1XniPucqf
	O63YhfxxECpzc4Ad8V70S7MLen5CNaAweE9i/MeB035c8x7pFzyGmbApyc2Jdc9k
	n6Vy+esf9MRjXKwiteE2kQ2AYMc9evC0FiShybVf+zVxQHDAWxQuXGF8XjaIFUzh
	IthgMg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feym1b6w4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 03:39:10 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c88cfe287e1so3890594a12.1
        for <linux-media@vger.kernel.org>; Thu, 16 Jul 2026 20:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784259549; x=1784864349; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XNyud4vuwDzfpyACJSMTgyNZvqHzuJLECor+03HpS70=;
        b=ks9M7TYZV5yTA+VUQ0EXbFOAnS1sOZx2zOM0BK+BjLmTrvLIKDaI3LnJ5PXWvs2Ivf
         u08IdQ5wDTqZeKaZggIz0vfS3GTlcohW+KvZT/tB6JdGBsacJxhl9CqKxIw21BsOjBj7
         dFRrpH4es7uw6MdeOQQg6Zk6et50JkV23FBhcGXQWHzvTluNN+aBYDwrixq0eJsQRA6a
         eseOnID7Q2yFuzXuONpQZqWJVroirw7l0NfzrcfBeImqq0eY+u9rXh7KeIQv8WEnepyj
         0g+kdfy/qpvwKZFLKbWPHwzC62fpPegtpIa5jG5V2+CCHGRC6Te5dhfiIe3z4+VCQB7X
         DM2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784259549; x=1784864349;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XNyud4vuwDzfpyACJSMTgyNZvqHzuJLECor+03HpS70=;
        b=njSov7U8kjB/IKfjHAuRp1m1MX5gsDsidgWvq0jmw/bEfQbKuvTUi6ov3M2xBGDdF+
         UyoC+Phdl3uUYgFOGjAlt9isD8CZ8Xl1gSIFwwvwS3IdFspmc6u/zqAqhs5l+EJE+Xpg
         IJBI242eU/kNcyHeDUanjLzeN5Z7lZCQ8oq6qnAgnTU8OQcEfHgFuPsLOGUWomxD8vtx
         hHWJNrL1aZSGGquRnGz+WA5woA/rewm+rBKOm3+Yh3jj3yPi4bpcARcgOci+3pCDAuOp
         ayVFbEQxN0XxsFagKEjIZ2ToetZameFAOjVi8FT0NbMY+egd9X5yJI6km610Ov4WZAzP
         +Y7g==
X-Gm-Message-State: AOJu0Yxb6OAADq4IQB234T00M/BzI1TUDxbBHHJSdmMn+oETPmqUZTUT
	Y4D3+AwUM/ZMUOC9FHcXUbrOwBeDZxpSrzv9EOF5JtxN65KUh5XWYJKTBavAqh9/riX2CVmZVxx
	0CTvrTsG124KigpJ9siJBQPOQeDNF9R3vlrQ93gxeGLObCrfTVaD3xwGfqxzYr1xhwQ==
X-Gm-Gg: AfdE7cnA/6VhaufH+m4LqCY69ahWQ0wae+iT8ljse075HgdmTcHAQVkZNe379Vphphi
	fbSZ9p2clr71+T1wUHNzAAp/uPAhX642gOeR45B+McrImBCuOuVGurifeSyfOPQHezc1DTYnA9U
	NQME4Cqgf/5dG7ovX0CTky88Upmv7LQESKrw5bObmuwseSJMZekGt4xv6jA5BprUEw2crrxiU7M
	bhmXPWNVCo9ZyS/3l70F+U9dhjYbJ/A0xoN3h4uIl7yQomymaFL1EuUH9tt3ynKqEJhAIvVj+qh
	oOzmXd7uzltaYbSItObuvJPnJCK85WcXQSm5x+DcjaWPhHIz/3wvH+QH8LO5+QTaNbg0mGsug6E
	i5DvOOQhEZqGCOR+TYCUFZhswV8z9drLt
X-Received: by 2002:a05:6a20:734b:b0:3c0:b766:750c with SMTP id adf61e73a8af0-3c3ada90661mr794846637.58.1784259549188;
        Thu, 16 Jul 2026 20:39:09 -0700 (PDT)
X-Received: by 2002:a05:6a20:734b:b0:3c0:b766:750c with SMTP id adf61e73a8af0-3c3ada90661mr794810637.58.1784259548602;
        Thu, 16 Jul 2026 20:39:08 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1bb8a4sm1698546eec.14.2026.07.16.20.39.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 20:39:07 -0700 (PDT)
Message-ID: <e5abe3c6-a8b1-b4b5-1fe6-10f19d026d4c@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 09:08:58 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v7 03/18] media: iris: drop IRIS_FMT_foo enumeration
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
References: <20260709-iris-ar50lt-v7-0-76af9dd4d1f6@oss.qualcomm.com>
 <20260709-iris-ar50lt-v7-3-76af9dd4d1f6@oss.qualcomm.com>
Content-Language: en-US
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <20260709-iris-ar50lt-v7-3-76af9dd4d1f6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KPRqylFo c=1 sm=1 tr=0 ts=6a59a3de cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=tVthWWLC-BWYOXQWUWQA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDAzMSBTYWx0ZWRfX84GBxBmpMuUW
 6RrDOBDCpGHoVZhQ9koNyI3rlJ4LQeaHfmOPP/jLihu64K+73yxMScDJzLR745FXLlDf48AXSii
 AHxjqadyYZbZseUWFDNmq3rqA8hj4fJvWXMBo/wMBVaVQv8fAhwqpegNd/v17VVz+J0sNYOpfRu
 C8pMCMaPoiXSZdG6E/4yeSWcL2Y9Hibi5BhRFpuMU67/yUa2IGVu5mogy5c86T+vsJ3EDxeDqwq
 vEa75rC9fcFD0MnOA6uUZR4Dqab+qnrn87J7nBCtfBS367nu9GxGqCekBVStlncRjSSujhMOJ/b
 8Jdtho/XT07mSW5IKqtc+Z+/R0qvEnlu2eEsq6WhZd0TSzhL97qOO/q/AEiHYKEQ7pD4zdj2eLP
 IeVpM3YLGfr5tb7v0iJQYYx3vUsL5ClUcDDt1EDfBD65yOGy4dho28I31ZvEJt/UMxPmZOh2hZW
 27die/wfljvWetruAnA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDAzMSBTYWx0ZWRfXwl9I2S2DI39l
 gblddYsd+wtRWNOZ1zRhSw/zWdoB4nV1mJ6zXMF+GA82oy9NMqjz5PzVN3v02vpVRQJq0uaYqj4
 gOi9LUSVcGHMkTnpnWO8BxjfSb4wktk=
X-Proofpoint-GUID: Tro9D1OG-SJJ4hN1dynK-8sf16gm0BWl
X-Proofpoint-ORIG-GUID: Tro9D1OG-SJJ4hN1dynK-8sf16gm0BWl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_01,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607170031


On 7/9/2026 7:11 PM, Dmitry Baryshkov wrote:
> The IRIS_FMT_foo defines are only used for indexing values in the format
> enumeration arrays. However this kind of enumeration doesn't follow the
> V4L2 logic (which expects an array with consequtive indexing rather
> than a sparse array) and complicates adding support for platforms which
> support different sets of formats. Drop this enumeration and use flat
> lists of supported formats.
>
> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_instance.h       | 14 --------------
>  drivers/media/platform/qcom/iris/iris_platform_vpu2.c  |  6 +++---
>  drivers/media/platform/qcom/iris/iris_platform_vpu3x.c |  8 ++++----
>  drivers/media/platform/qcom/iris/iris_vdec.c           |  8 ++++----
>  drivers/media/platform/qcom/iris/iris_venc.c           |  8 ++++----
>  5 files changed, 15 insertions(+), 29 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
> index a770331d1675..ffdbbd20901a 100644
> --- a/drivers/media/platform/qcom/iris/iris_instance.h
> +++ b/drivers/media/platform/qcom/iris/iris_instance.h
> @@ -17,20 +17,6 @@
>  
>  struct iris_hfi_session_ops;
>  
> -enum iris_fmt_type_out {
> -	IRIS_FMT_H264,
> -	IRIS_FMT_HEVC,
> -	IRIS_FMT_VP9,
> -	IRIS_FMT_AV1,
> -};
> -
> -enum iris_fmt_type_cap {
> -	IRIS_FMT_NV12,
> -	IRIS_FMT_QC08C,
> -	IRIS_FMT_TP10,
> -	IRIS_FMT_QC10C,
> -};
> -
>  /**
>   * struct iris_inst - holds per video instance parameters
>   *
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
> index 961dce2e6aa9..ba91672df1bb 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
> @@ -35,9 +35,9 @@ static const struct iris_firmware_desc iris_vpu20_p4_gen1_desc = {
>  };
>  
>  static const u32 iris_fmts_vpu2_dec[] = {
> -	[IRIS_FMT_H264] = V4L2_PIX_FMT_H264,
> -	[IRIS_FMT_HEVC] = V4L2_PIX_FMT_HEVC,
> -	[IRIS_FMT_VP9] = V4L2_PIX_FMT_VP9,
> +	V4L2_PIX_FMT_H264,
> +	V4L2_PIX_FMT_HEVC,
> +	V4L2_PIX_FMT_VP9,
>  };
>  
>  static struct platform_inst_caps platform_inst_cap_vpu2 = {
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
> index 74626b35d9cb..7098b652c117 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
> @@ -49,10 +49,10 @@ static const struct iris_firmware_desc iris_vpu35_p4_gen2_desc = {
>  };
>  
>  static const u32 iris_fmts_vpu3x_dec[] = {
> -	[IRIS_FMT_H264] = V4L2_PIX_FMT_H264,
> -	[IRIS_FMT_HEVC] = V4L2_PIX_FMT_HEVC,
> -	[IRIS_FMT_VP9] = V4L2_PIX_FMT_VP9,
> -	[IRIS_FMT_AV1] = V4L2_PIX_FMT_AV1,
> +	V4L2_PIX_FMT_H264,
> +	V4L2_PIX_FMT_HEVC,
> +	V4L2_PIX_FMT_VP9,
> +	V4L2_PIX_FMT_AV1,
>  };
>  
>  static const struct icc_info iris_icc_info_vpu3x[] = {
> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
> index 9e228b70420e..4c8bc7aac135 100644
> --- a/drivers/media/platform/qcom/iris/iris_vdec.c
> +++ b/drivers/media/platform/qcom/iris/iris_vdec.c
> @@ -63,10 +63,10 @@ int iris_vdec_inst_init(struct iris_inst *inst)
>  }
>  
>  static const u32 iris_vdec_formats_cap[] = {
> -	[IRIS_FMT_NV12] = V4L2_PIX_FMT_NV12,
> -	[IRIS_FMT_QC08C] = V4L2_PIX_FMT_QC08C,
> -	[IRIS_FMT_TP10] =  V4L2_PIX_FMT_P010,
> -	[IRIS_FMT_QC10C] =  V4L2_PIX_FMT_QC10C,
> +	V4L2_PIX_FMT_NV12,
> +	V4L2_PIX_FMT_QC08C,
> +	V4L2_PIX_FMT_P010,
> +	V4L2_PIX_FMT_QC10C,
>  };
>  
>  static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
> diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/media/platform/qcom/iris/iris_venc.c
> index a945992f63aa..16c52ad07e2c 100644
> --- a/drivers/media/platform/qcom/iris/iris_venc.c
> +++ b/drivers/media/platform/qcom/iris/iris_venc.c
> @@ -80,13 +80,13 @@ int iris_venc_inst_init(struct iris_inst *inst)
>  }
>  
>  static const u32 iris_venc_formats_cap[] = {
> -	[IRIS_FMT_H264] = V4L2_PIX_FMT_H264,
> -	[IRIS_FMT_HEVC] = V4L2_PIX_FMT_HEVC,
> +	V4L2_PIX_FMT_H264,
> +	V4L2_PIX_FMT_HEVC,
>  };
>  
>  static const u32 iris_venc_formats_out[] = {
> -	[IRIS_FMT_NV12] = V4L2_PIX_FMT_NV12,
> -	[IRIS_FMT_QC08C] = V4L2_PIX_FMT_QC08C,
> +	V4L2_PIX_FMT_NV12,
> +	V4L2_PIX_FMT_QC08C,
>  };
>  
>  static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

