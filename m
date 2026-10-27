Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793093519;
	b=ckJ0v/JKoIcDN4N3kY3z7pV8TtuHYMWxqqwElggKrqkUwkjod9Jo3oHjmlZ/pPxAIEmR
	 XNT5OjX7fgcQSQ5ZFv0Rr633XIXKRH+sfDYG1x7DjYTQqjcObvUoN3my2alrcG3zvrzrS
	 SCxetcuyC+RUImrdk9Z8uD5fRCJjebAQmIK+1705C++MNsY3T8UtUoO5ds17OhTpJd/GN
	 LKzsdJxm9I+TDMRiXB1jRS+XvRfW4+/qb1+mDBQhpQI0p+VmmzAsuek7kIKgK2AEvrdP8
	 86PFGmr1Jc3r0Y6Ml8qUjAKKG0L1pgXON7KtTXn22wf78gq5gZk8xHwFgtcI4X/9XFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793093519;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=tMas7QgfTczyZxXDj1TfoR+MSTG6n9DPxh649aqtWyg=;
	b=sM3/HDqyG9wqzNndOzZMucRQ0SZc764Q1zGqOEXGdIHOCfl1nJuEGONTT0E4iNYZ294R
	 o12FPVr5Ye1A6UqBfNoYIABYKmKcMet5m/Rb42L30GCrfjXKBC6S3CaNfhDt4xATticHp
	 lRm0Cg6pEgzT35rUNAsycJNxCDiWIVy1+l+ICxgvwjn/k8Yy83YuC3YEkr1yDELo5uasA
	 XOWAm5IMtmcgpMYeooFimIVXE6G+8cSLPogdq3HXZ2TFn21v7eCd2kZDLUrRyMXrf1Zbv
	 F/DKnxK4vp4aJMpWidpfOb5RLZSMX9cHXTsdrXcqXe0YUQ/Rjok4NiNgsPTSnrQiasg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=d18HWBTK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PNfisHcf;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C1DD606A333
	for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 09:31:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C1DD606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=d18HWBTK;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PNfisHcf
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69R8fsBM2192679
	for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 09:31:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tMas7QgfTczyZxXDj1TfoR+MSTG6n9DPxh649aqtWyg=; b=d18HWBTK5yk45lzr
	b74uArz3Zh8QM210ZHXY3jNxD1DCFe02CJCPjrPzNP/yrxbduO9Ow9Fq0JWhIPa1
	UYJ8yDexkkqlt/YNcxfPcug/zxVpK4fuewgkE/D0pI0HezeqNzXsiZV9SOYl/kg7
	MyDWAjvKwKTv4pI/uqLGGN7+uF5ncjUff0BjHqLmPJCF7r2Ej6rStwKuvQ9vYJQc
	WcUQYFdIGfUbA7pehc/5hfZ3/DM4tey/XlA9xXZwXpY7O9Pweu46EFGPRTzHrAv4
	1H5hC4OBkBBLOawipZ1X+GwKDkuYVt/++g+hgNdV5+GuMBuxXyvL1OQARwyb3prD
	1iknbA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjjbt9jnh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 09:31:56 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ac77c3ff6aso5819251a91.0
        for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 02:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793093515; x=1793698315; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tMas7QgfTczyZxXDj1TfoR+MSTG6n9DPxh649aqtWyg=;
        b=PNfisHcfqdT/aw10V8FuDSN/N7ru/Pm2ELzncld3ywghxh1YLdIg5r4QgNkUNkhbgu
         d8cyT3jpVfZ/Xc9+H5i31TZa7vEB8Sm+MC9QoX/tbV3ZtxEYhM5E6QDSfTXuxYmFuCr8
         vGkfpK3iHU/VBJhRgRDcn+LDeA6lvqOTlaDWJBjGM6ku6gz6jP6hDHXTEHN0mYXsc/yI
         Mc95Kcv/+7f72cANGfv+NcZA7rRfPspvqtqizjV2DyPpat7cvvxx2F86XEKK2O5Throi
         faB2OStN+D6GKOwMNus7frAT90+ymb9go171GRApQsZBXygOI2ynC1g91ULp5lURoP0W
         tfLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793093515; x=1793698315;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tMas7QgfTczyZxXDj1TfoR+MSTG6n9DPxh649aqtWyg=;
        b=AAMUQuQAENerIXYohz7rrydL+ggaGII7lB1sKn0xHd1J6opYAq8pFsc8f90fRGdiZZ
         R8PCbMEgFwzBXToFs5kt5ta3yXhymdV2RV2a9VejuiplqRvCGz7AJjnqG3bHPdtwO1kJ
         6jgg5iK/ljfj27xa8U3qfaSBjzA+A2HMOs9ka1Iu1sEXJWLyHVITA/VHqCOwfASXR/xP
         KD8TrF1ca4N0ck+AZqja0nBHOTZbFhVptK2kil3HwFzqc4G/IdLCtMcsK08dWEmwBa11
         Q5MkDmR+aNkxWFklq0H7R6CaFox2Og2PMHYxLwKfjbIvP6j96UMEqFiPUoRgqa1Hhf8b
         2W2Q==
X-Forwarded-Encrypted: i=1; AKwUvBw+TdDr7SnbXxxqCFLVRMscpaGf6X7JxI+Te5pV4i2YYy2xRh0mqwY4ZHjrvHkNWZA8IVb1XfGffH8U3w==@vger.kernel.org
X-Gm-Message-State: AFq9FYLNZFbhNDmMtNf7IbLuyG348YsbW9Kf8sNmsFQR7esjy1YER8YK
	L3FUW13MVlUag6eG3S37say9RuzSGjeknnl19U9XQBd/OLlR+4pSVP7swG4FpfwpUPTcKs56O1C
	OelYqz8qJ3em8vvz252WupCG3wNRWIXf53xxcqWXQt85fyFzUI8S6gdsttkxx/v44Qg==
X-Gm-Gg: AYBFou22i6j8gPSP37VphsVWKfuAmOkKApifp5HHZr0ba+ebIhxLvP+mm3B7dIAuwDW
	nGsjjHxmD7LLdVHxdIVId9wHCMJHp0WnSE3QDtx3naEIEJDxuGJO6f2e98yyzP50M8yPggsVX+J
	Y1ZB8TSubeS0KKD7uzLnkTlqZCkg4IkwV6CiGOBbdWDfwdqDIkNjZguHnTDsFAbRc7GviSJ3c6N
	BmeEf0yDHUmXKvgkUkRwV2RaA81yjGJf6c9Wpatf+6I9/o4luyR7Bhs9vF4TrZv+VD7AB/+3yYl
	QoT8KySl9UFfG5N7gm+9J+eACagUK2I5V9QLasYN5M6EFn3aT3h7ycKrxABM9wqzIVoCH8eZ4YB
	u+ZnlF/4+zg3TY2h1WcWMrfOlsDd2K7t/nmHfMkSsby78s/IPeatZRpP5f3aITpz1VGyIbe8en+
	5fxJnQ
X-Received: by 2002:a17:90b:164e:b0:3a5:147a:3b63 with SMTP id 98e67ed59e1d1-3ade9b2ee37mr8269757a91.8.1793093515025;
        Tue, 27 Oct 2026 02:31:55 -0700 (PDT)
X-Received: by 2002:a17:90b:164e:b0:3a5:147a:3b63 with SMTP id 98e67ed59e1d1-3ade9b2ee37mr8269724a91.8.1793093514545;
        Tue, 27 Oct 2026 02:31:54 -0700 (PDT)
Received: from [10.204.101.238] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adeba47266sm6423275a91.1.2026.10.27.02.31.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 02:31:53 -0700 (PDT)
Message-ID: <aa70a256-eba2-483f-8326-c3bd2ff3d33e@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 15:01:41 +0530
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] media: iris: migrate firmware loading to
 qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset()
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>, David Airlie <airlied@gmail.com>,
        Simona Vetter <simona@ffwll.ch>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Alex Elder <elder@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Sean Paul <sean@poorly.run>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org
References: <20260925155737.4161358-1-mukesh.ojha@oss.qualcomm.com>
 <20260925155737.4161358-4-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Gourav Kumar <gourav.kumar@oss.qualcomm.com>
In-Reply-To: <20260925155737.4161358-4-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAzNyBTYWx0ZWRfX28Av7Ng0wVmA
 TBjcSoMmNurygplEWLOrd/JpLSVwZlDSMidBo17QkZQvgfT0bOEqsq/OQ4p5FWCuqcaRjc0g2+q
 nIie8A+1lParq0ww+HBmHWLHIaIPaTs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAzNyBTYWx0ZWRfX1gxIyGotNP06
 CCJQFNLtKDhrhNpRTwNDdaHW2FhHcqIWtjnXWxHYrohqO4G0zbnA+5ffR50vcrKMbCKXRvo9un9
 OzEownTgo1NVNwm5CsgQeYNv8KvJckyKYq7dj5pkjFSIGk451kEfznmlOh3YdvknUCfT34QRGqq
 lR7dFQi/iPunWVOOxnf4tCNdzz9o4gLCPbQyRyvNhGyP3phZzJ/EwOCFCUkv4LwwPfUpgTcqUk/
 qsDBi9roDyuLweaOKhuK1yKUbrT/mNFcWBIAknPo5Nb8/a0UHCVrTYMAYmjuuhMcsnERoM8Wd7r
 KHI8l+1mSDLwnBPGdJU10Fx152FVyHFy7ljKkMFdKMOfEu44GdkAL1MgNSKd3P5+aDSkgQtrf7a
 HfV8sh1ya1KRBg4CZUQuOFlBvmMCKOKwKP6hyzmhr34B6pfg3hoZ5LMcQgMakHiKKmlrmeW6NJx
 q1PxTz1evXqZQGRuIvg==
X-Proofpoint-ORIG-GUID: d1Vd2Tx5tEORzW7x5bUTnGN4A4tfr3SX
X-Proofpoint-GUID: d1Vd2Tx5tEORzW7x5bUTnGN4A4tfr3SX
X-Authority-Analysis: v=2.4 cv=XaIcX455 c=1 sm=1 tr=0 ts=6ae06f8c cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=nYfwElOfYSAnSMmgWPMA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270037



On 9/25/2026 9:27 PM, Mukesh Ojha wrote:
> iris_load_fw_to_memory() calls qcom_mdt_load() which bundles metadata
> init, memory setup, and segment loading with no PAS context, and
> iris_fw_load() calls qcom_pas_auth_and_reset() which skips the shmbridge
> prepare step required before TrustZone authentication.
> 
> Since the auth call is in a different function from where the PAS context
> is allocated, add a pas_ctx pointer to struct iris_core so it can be
> threaded between the two call sites.  Replace qcom_mdt_load() with
> devm_qcom_pas_context_alloc() and qcom_mdt_pas_load() in
> iris_load_fw_to_memory(), storing the context in core->pas_ctx, then
> pass it to qcom_pas_prepare_and_auth_reset() in iris_fw_load().
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_core.h  |  2 ++
>  .../media/platform/qcom/iris/iris_firmware.c  | 20 ++++++++-----------
>  2 files changed, 10 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
> index 24da60448cf2..68e6adcc1dfd 100644
> --- a/drivers/media/platform/qcom/iris/iris_core.h
> +++ b/drivers/media/platform/qcom/iris/iris_core.h
> @@ -8,6 +8,7 @@
>  
>  #include <linux/types.h>
>  #include <linux/pm_domain.h>
> +#include <linux/firmware/qcom/qcom_pas.h>
>  #include <media/v4l2-device.h>
>  
>  #include "iris_hfi_common.h"
> @@ -123,6 +124,7 @@ struct iris_core {
>  	/* encoder and decoder have overlapping caps, so two different arrays are required */
>  	struct platform_inst_fw_cap		inst_fw_caps_dec[INST_FW_CAP_MAX];
>  	struct platform_inst_fw_cap		inst_fw_caps_enc[INST_FW_CAP_MAX];
> +	struct qcom_pas_context			*pas_ctx;
>  };
>  
>  int iris_core_init(struct iris_core *core);
> diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
> index 21cdf1c39835..e73a5dd98b88 100644
> --- a/drivers/media/platform/qcom/iris/iris_firmware.c
> +++ b/drivers/media/platform/qcom/iris/iris_firmware.c
> @@ -115,9 +115,7 @@ static int iris_load_fw_to_memory(struct iris_core *core)
>  	struct resource res;
>  	phys_addr_t mem_phys;
>  	const char *fw_name;
> -	size_t res_size;
>  	ssize_t fw_size;
> -	void *mem_virt;
>  	int ret;
>  
>  	ret = of_reserved_mem_region_to_resource(dev->of_node, 0, &res);
> @@ -125,7 +123,6 @@ static int iris_load_fw_to_memory(struct iris_core *core)
>  		return ret;
>  
>  	mem_phys = res.start;
> -	res_size = resource_size(&res);
>  
>  	firmware = iris_detect_firmware(core, &fw_name);
>  	if (IS_ERR(firmware))
> @@ -134,21 +131,20 @@ static int iris_load_fw_to_memory(struct iris_core *core)
>  	core->iris_firmware_data = core->iris_firmware_desc->firmware_data;
>  
>  	fw_size = qcom_mdt_get_size(firmware);
> -	if (fw_size < 0 || res_size < (size_t)fw_size) {
> +	if (fw_size < 0 || resource_size(&res) < (size_t)fw_size) {
>  		ret = -EINVAL;
>  		goto err_release_fw;
>  	}
>  
> -	mem_virt = memremap(mem_phys, res_size, MEMREMAP_WC);
> -	if (!mem_virt) {
> -		ret = -ENOMEM;
> +	core->pas_ctx = devm_qcom_pas_context_alloc(dev, IRIS_PAS_ID, mem_phys,
> +						    resource_size(&res));
> +	if (IS_ERR(core->pas_ctx)) {
> +		ret = PTR_ERR(core->pas_ctx);
> +		core->pas_ctx = NULL;
>  		goto err_release_fw;
>  	}
>  
> -	ret = qcom_mdt_load(dev, firmware, fw_name,
> -			    IRIS_PAS_ID, mem_virt, mem_phys, res_size, NULL);
> -
> -	memunmap(mem_virt);
> +	ret = qcom_mdt_pas_load(core->pas_ctx, firmware, fw_name, NULL);

qcom_mdt_pas_load() passes the ctx to qcom_pas_init_image(), which keeps
the metadata buffer in ctx->ptr, and qcom_pas_prepare_and_auth_reset()
does not free it. Who is expected to call qcom_pas_metadata_release()
for iris? I don't see it called after authentication (or on its
failure), unlike in qcom_q6v5_pas.c.

Gourav Kumar

>  err_release_fw:
>  	release_firmware(firmware);
>  
> @@ -166,7 +162,7 @@ int iris_fw_load(struct iris_core *core)
>  		return ret;
>  	}
>  
> -	ret = qcom_pas_auth_and_reset(IRIS_PAS_ID);
> +	ret = qcom_pas_prepare_and_auth_reset(core->pas_ctx);

ctx->use_tzmem is not set for iris, so the shmbridge creation in
qcom_scm_pas_prepare_and_auth_reset() is skipped and the behaviour is
the same as the old qcom_pas_auth_and_reset(). Please reword the commit
message accordingly, since it currently implies that the prepare step is
now performed by the new API as a fix.

Gourav Kumar

>  	if (ret)  {
>  		dev_err(core->dev, "auth and reset failed: %d\n", ret);
>  		return ret;

