Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4683750CA
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 13:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784641793; cv=none; b=OxsnzZj+oMwYtIGs6lnDjajpHs2FT/0kmzBy4SOUL/ySRPRd4nTe4KqnhjCV76Dqxd3EwtpmPwc3nD7ZCGwNa80wxgcOiivfBM5AwjCJg7NFvhFfaEOCASBflVXmkcrIpyxSW8IS2bQ2Ckz4CKdrQunMuv23bPlj4JcrQrovOSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784641793; c=relaxed/simple;
	bh=wDxgpgB4cqvzORd2Ng0Z7chN1T6KmCCz8/zVtbDTCVU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lOyBYEW+qCaG307iqu5jnJxF31x28+JSRK/ZJFQedCeI3kR6yH9UkWmunBl6PmfG01vcLhtEr1//nx3dOvb8Z/RrP13wIQFnEYx3Z7IRXAhAzonMTyDdzy98uEumcpnySGK3p6j0IniIRzc2ng6I5n8cqdpXnsNeFSM8w8VKK/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CKHA9LOw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UVXEpIzQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CKHA9LOw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UVXEpIzQ"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LDg6Bn1971476
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 13:49:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4J+xoisba7u9XVXkc29nbVSk51yrBEFXVXFsqh8j5x0=; b=CKHA9LOw6QpmFIgO
	wlkbEsxqO4uwWyN55jAFPMpmq375eaXSIxHhXA4YFgN02dbugCr5aImPoJYFQisL
	VaeLOwit7MvZHSS/2QT9mFGR7L4ngD1M7HDYinX+Zi6zr7byyGhmVjvqXaOkhuWz
	oBodb6CiY61unLh01GCUAFA2dY1KmOvs33ms7GLvpTHSQ3ZZ16Ho9P9zuAnWEYW2
	Rk7I1Miko85hhUxRmA65l2OIP5NJMH2jy0jlOfGaXihlDDUh0+PRhRiZgHemktBy
	kUxnVaILRODCaawgTE2aUWtNstuCJh99dW5GSDSaSe9GQ2dZyOs5uxDfvK/hzYwd
	PL/otw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj68614e3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 13:49:49 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c9c26587e67so5548882a12.0
        for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 06:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784641789; x=1785246589; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4J+xoisba7u9XVXkc29nbVSk51yrBEFXVXFsqh8j5x0=;
        b=UVXEpIzQvNJae+t0+3bcKUC928r6c9QudKtWe4r6HuAAr7NoTjSU88YC1zvSmZpxO6
         B+IZpobg6J0fCh701X6zaipTfb/C3CKbj/QL+dCe8znoKAFkl5xgh8I7a+GcKESdfSzL
         SHlVPzlgEkG+3TTSFgmJjWqnLazQcVbp02yflb80rx2bC08zt6xCmrXd/JQnbEIT+ZwB
         i3Bq3GEkud1T3bcpYbpDS6WrmK1gB/udzCtqtfS2n1K87mO2nvIMlMaM7slCuKXsPD92
         rKFqHSQRFafvaKDjsBWNdhxBSiR9YDGUgkG6orVmJFAYB4rCS+WRWj0y3ZcfBKVpuniZ
         mc9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784641789; x=1785246589;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4J+xoisba7u9XVXkc29nbVSk51yrBEFXVXFsqh8j5x0=;
        b=kh7ogxyQ7ZpLCRiY8HtnkQ3cyxbwbB795IdPf1zzEH1IrMO79Ja8mh6Ulq/VaKNny5
         d9cYTpm283qFZ4ujOmGqssTp78nATo/JxcuPbk1uyZkCA7J0dt5dT0Emw6coR1Wv3Z3F
         QCEIMhHZQbONHYKOPMoF0CuVQEAk5RJkIhsEOIiCpFXa+eP9XSRKTWx0JLfffV5TgRC7
         cqs0NL4IIkmOCSTb6slVzi6NN/gZG2y8SEsb6DlBw6fR3k+fXT5JTIZulAhzKpleU63I
         29y/VecVU4mpQdqyivPj8r1pMbiw5pLsnYQCxJexj0jYQ4gNLvjxaXSG6DIj6HuOfTzz
         3TCg==
X-Gm-Message-State: AOJu0YwzDJB0pCb1BU4IrquF6f4/CHOJ68JLPakvY2xcjxa1w/MfAEM1
	0c6KTh+UQr4pZ5AWp7CFACSjnhM8pzR/uRONE9lstMM0KdVBDWeg3dVi9VrgEK4PXpVWmxiyjIV
	mh45t5jWRPAW6b1MTgpXV2jU/0LTajTnevo8Ofdqd6hIR2lK/Ct9wircBGVadS5LD1A==
X-Gm-Gg: AfdE7ckUrYIQ42o7xeKf6OoCTsl0yyeUz0DI6w7Dg+AzH8ctpLCSQ/c89Jh17kGB+OB
	zDacRivV72JYmzvJMkBO7F96OZ10xKq+WY/S+Z1hV39UPC/J6R8jTS5nV1oii1t2RoYgtD/jzAo
	NaXyv/65Wi9doWSRxDBmWQmq+4xEPr6qLBImSINVZz18jYYaSufakkUHwfA7B3pe62uyHfG4a64
	m5RukZUUK/UPRpjfCpx2n9+enGMxsHhp3zv0+/Cky2vNMse45rDmSmLdNtJ8gQPwua2I7TBWlrJ
	KdOwvsPfh55lM7Xch+fL2hXrSjyDdJTQH+wsamhBynRD1vV04dUwpxeyOcJwnApwCPBSux+AfLU
	RQEsJrLl13A+6N/dyvUCdZeLc1jyT41T1
X-Received: by 2002:a05:6a20:d52f:b0:398:76d4:c7e9 with SMTP id adf61e73a8af0-3c38dc13d10mr25501346637.35.1784641788377;
        Tue, 21 Jul 2026 06:49:48 -0700 (PDT)
X-Received: by 2002:a05:6a20:d52f:b0:398:76d4:c7e9 with SMTP id adf61e73a8af0-3c38dc13d10mr25501307637.35.1784641787769;
        Tue, 21 Jul 2026 06:49:47 -0700 (PDT)
Received: from [10.206.103.83] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1bbda9sm47202871eec.19.2026.07.21.06.49.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 06:49:47 -0700 (PDT)
Message-ID: <8b26445a-6df5-4fcd-b17a-211120fe8301@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 19:19:39 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 01/18] media: iris: Add Gen2 firmware autodetect and
 fallback
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
References: <20260709-iris-ar50lt-v7-0-76af9dd4d1f6@oss.qualcomm.com>
 <20260709-iris-ar50lt-v7-1-76af9dd4d1f6@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260709-iris-ar50lt-v7-1-76af9dd4d1f6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE0NSBTYWx0ZWRfX3Cvde2VcIV1a
 KoU5f3LZ9j3T3xlTtWDUfSeaM1azKczh/44gh7k26qZIUZmlCFQi9ptOkS8wjzrTcjCZQlnhjQ5
 deCVres9Izi444svhNlh1kry+9UPbJk=
X-Proofpoint-ORIG-GUID: yh6fX5i8tsjYY4Yia2jU09XYIUre5ml7
X-Proofpoint-GUID: yh6fX5i8tsjYY4Yia2jU09XYIUre5ml7
X-Authority-Analysis: v=2.4 cv=X75i7mTe c=1 sm=1 tr=0 ts=6a5f78fd cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=GWEVztfZRELcCs27ssoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE0NSBTYWx0ZWRfXzOmSKEsNQV3N
 6KSdxtJuDwNiDMHVLt26sioHHWHhLoWySZGS/TGcTgvS/o6zly3wUq5SANPZ1TbBftqm4m5nfda
 wxT4vR2ZCO8twwBMAFrG26HpeMpB1xXsvudBU1jTlJAGHDmdbt3aVmuz4KlWBvKOBASpHQ+YccG
 +BIQ/gSluc1hL8sX5lbE+PCSKPXX1u/os4+epiqPtg1+bU3V4XwPpTXbfirsdDeGxkYNZtaPP7S
 wvCsq5o7NR7UKzOcX+CmRaEuXw3mPYnlt9wWVWp9MCmVs738lBiAXohV+eM0K1VxQlbvq7OvZ2p
 hpKDVPELDurgThCq0R8FqA8Ooyo3dPlRdJizDnI9d2Vk3zJZLdAzFcXC6UMpTdGt0EqeYkE1Hwt
 /aydwchJZgX0Kr7Et55iiltYoPfGhX1NqDPLic/u30f88mAoF0twmrQ6/+4ktWdBuRftD7r5Ovh
 fwFins3DjX4TTctf/UQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210145



On 7/9/2026 7:11 PM, Dmitry Baryshkov wrote:
> From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> 
> Some Iris platforms support both Gen1 and Gen2 HFI firmware images.
> Update the firmware loading logic to handle this generically by
> preferring Gen2 when available, while safely falling back to Gen1
> when required.
> 
> The firmware loading logic is updated with the following priority:
> 1. Device Tree (`firmware-name`): If specified, load unconditionally.
> 2. Gen2 default : If no DT override exists, select the Gen2 firmware
>     descriptor when present and attempt to load the corresponding
>     firmware image.
> 3. Gen1 Fallback: If loading the Gen2 firmware fails and a Gen1
>     descriptor is available, retry with the Gen1 firmware image.
> 
> When a platform provides both Gen1 and Gen2 firmware descriptors and the
> firmware is loaded via a DT override, the driver detects the
> firmware generation at runtime before authentication by inspecting
> the firmware data. The firmware is classified as Gen2 if the
> QC_IMAGE_VERSION_STRING starts with "vfw" or matches the
> "video-firmware.N.M" format with N >= 2.
> 
> If a Gen1 firmware image is detected in this case, the driver switches
> to the Gen1 firmware descriptor and associated platform data so that
> the correct HFI implementation is used.
> 
> This change makes firmware generation detection platform‑agnostic,
> preserves DT overrides, prefers newer Gen2 firmware when available,
> and maintains compatibility with platforms that only support Gen1.
> 
> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> Co-developed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_core.c       |   2 +
>   drivers/media/platform/qcom/iris/iris_firmware.c   | 146 ++++++++++++++++++---
>   .../platform/qcom/iris/iris_platform_common.h      |   6 +-
>   .../media/platform/qcom/iris/iris_platform_vpu2.c  |  11 +-
>   .../media/platform/qcom/iris/iris_platform_vpu3x.c |  10 +-
>   drivers/media/platform/qcom/iris/iris_probe.c      |   4 -
>   drivers/media/platform/qcom/iris/iris_vidc.c       |   1 +
>   7 files changed, 147 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_core.c b/drivers/media/platform/qcom/iris/iris_core.c
> index 52bf56e517f9..6dbe18be5b49 100644
> --- a/drivers/media/platform/qcom/iris/iris_core.c
> +++ b/drivers/media/platform/qcom/iris/iris_core.c
> @@ -6,6 +6,7 @@
>   #include <linux/pm_runtime.h>
>   
>   #include "iris_core.h"
> +#include "iris_ctrls.h"
>   #include "iris_firmware.h"
>   #include "iris_state.h"
>   #include "iris_vpu_common.h"
> @@ -79,6 +80,7 @@ int iris_core_init(struct iris_core *core)
>   		goto error_unload_fw;
>   
>   	core->iris_firmware_data->init_hfi_ops(core);
> +	iris_session_init_caps(core);
>   
>   	ret = iris_hfi_core_init(core);
>   	if (ret)
> diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
> index 1a476146d758..a3aa41aa1e66 100644
> --- a/drivers/media/platform/qcom/iris/iris_firmware.c
> +++ b/drivers/media/platform/qcom/iris/iris_firmware.c
> @@ -16,20 +16,138 @@
>   
>   #define MAX_FIRMWARE_NAME_SIZE	128
>   
> -static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
> +/* Detect Gen2 firmware by scanning the blob for:
> + *   QC_IMAGE_VERSION_STRING=<version>
> + * and then checking:
> + *   - version starts with "vfw", OR
> + *   - version matches "video-firmware.N.M" with N >= 2
> + */
> +
> +static bool iris_detect_gen2_from_fwdata(const u8 *data, size_t size)
> +{
> +	static const char *marker = "QC_IMAGE_VERSION_STRING=";
> +	const size_t mlen = strlen(marker);
> +	static const char *vfw = "vfw";
> +	const size_t vfwlen = strlen(vfw);
> +	static const char *vf = "video-firmware.";
> +	const size_t vflen = strlen(vf);
> +
> +	for (size_t i = 0; i + mlen < size; i++) {
> +		const char *found;
> +
> +		if (memcmp(data + i, marker, mlen))
> +			continue;
> +
> +		found = data + i + mlen;
> +		size -= i + mlen;
> +
> +		/* vfw => Gen2 */
> +		if (size > vfwlen && !memcmp(found, vfw, vfwlen))
> +			return true;
> +
> +		if (size < vflen ||
> +		    memcmp(found, vf, vflen))
> +			return false;
> +
> +		found += vflen;
> +		size -= vflen;
> +
> +		/*
> +		 * video-firmware.1.x is Gen1.
> +		 * video-firmware.2.x and video-firmware.10.x are Gen2.
> +		 */
> +		return size >= 2 &&
> +			(*found >= '2' || (*found == '1' && found[1] != '.'));
> +	}
> +
> +	return false;
> +}
> +
> +static const struct firmware *iris_detect_firmware(struct iris_core *core,
> +						   const char **fw_name)
> +{
> +	const struct iris_firmware_desc *desc;
> +	const struct firmware *firmware;
> +	bool has_both_gens;
> +	int ret;
> +
> +	*fw_name = NULL;
> +	ret = of_property_read_string_index(dev_of_node(core->dev), "firmware-name", 0, fw_name);
> +
> +	/*
> +	 * A platform may support both Gen1 and Gen2 firmware; which one is used
> +	 * depends on the firmware image installed on the system, not on the
> +	 * hardware. That installed image does not change while the device is
> +	 * bound, so detect the generation only once and reuse the chosen
> +	 * descriptor on later core bring-ups (e.g. after a system error
> +	 * recovery). Besides avoiding the redundant probing, this ensures
> +	 * core->iris_firmware_desc and iris_firmware_data are published exactly
> +	 * once, before any session exists, so the lockless readers in the ioctl
> +	 * paths never observe a reassignment.
> +	 */
> +	if (core->iris_firmware_desc) {
> +		if (ret)
> +			*fw_name = core->iris_firmware_desc->fwname;
> +		ret = request_firmware(&firmware, *fw_name, core->dev);
> +		return ret ? ERR_PTR(ret) : firmware;
> +	}
> +
> +	has_both_gens = core->iris_platform_data->firmware_desc_gen2 &&
> +		core->iris_platform_data->firmware_desc_gen1;
> +
> +	if (core->iris_platform_data->firmware_desc_gen2)
> +		desc = core->iris_platform_data->firmware_desc_gen2;
> +	else if (core->iris_platform_data->firmware_desc_gen1)
> +		desc = core->iris_platform_data->firmware_desc_gen1;
> +	else
> +		return ERR_PTR(-EINVAL);
> +
> +	if (ret) {
> +		/* No firmware-name in DT: select by probing Gen2 then Gen1. */
> +		*fw_name = desc->fwname;
> +		if (has_both_gens)
> +			ret = firmware_request_nowarn(&firmware, *fw_name, core->dev);
> +		else
> +			ret = request_firmware(&firmware, *fw_name, core->dev);
> +		if (ret && has_both_gens) {
> +			desc = core->iris_platform_data->firmware_desc_gen1;
> +			*fw_name = desc->fwname;
> +			ret = request_firmware(&firmware, *fw_name, core->dev);
> +		}
> +		if (ret)
> +			return ERR_PTR(ret);
> +	} else {
> +		/* firmware-name given: load it and detect its generation. */
> +		ret = request_firmware(&firmware, *fw_name, core->dev);
> +		if (ret)
> +			return ERR_PTR(ret);
> +
> +		if (has_both_gens &&
> +		    !iris_detect_gen2_from_fwdata((const u8 *)firmware->data, firmware->size)) {
> +			dev_info(core->dev, "Gen1 FW detected in %s\n", *fw_name);
> +			desc = core->iris_platform_data->firmware_desc_gen1;
> +		}
> +	}
> +
> +	/* Publish iris_firmware_data first, then iris_firmware_desc (the guard). */
> +	core->iris_firmware_data = desc->firmware_data;
> +	core->iris_firmware_desc = desc;
> +
> +	return firmware;
> +}
> +
> +static int iris_load_fw_to_memory(struct iris_core *core)
>   {
>   	const struct firmware *firmware = NULL;
>   	struct device *dev = core->dev;
>   	struct resource res;
>   	phys_addr_t mem_phys;
> +	const char *fw_name;
>   	size_t res_size;
>   	ssize_t fw_size;
>   	void *mem_virt;
>   	int ret;
>   
> -	if (strlen(fw_name) >= MAX_FIRMWARE_NAME_SIZE - 4)
> -		return -EINVAL;
> -

#define MAX_FIRMWARE_NAME_SIZE can be dropped.

>   	ret = of_reserved_mem_region_to_resource(dev->of_node, 0, &res);
>   	if (ret)
>   		return ret;
> @@ -37,9 +155,9 @@ static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
>   	mem_phys = res.start;
>   	res_size = resource_size(&res);
>   
> -	ret = request_firmware(&firmware, fw_name, dev);
> -	if (ret)
> -		return ret;
> +	firmware = iris_detect_firmware(core, &fw_name);
> +	if (IS_ERR(firmware))
> +		return PTR_ERR(firmware);
>   
>   	fw_size = qcom_mdt_get_size(firmware);
>   	if (fw_size < 0 || res_size < (size_t)fw_size) {
> @@ -66,18 +184,12 @@ static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
>   int iris_fw_load(struct iris_core *core)
>   {
>   	const struct tz_cp_config *cp_config;
> -	const char *fwpath = NULL;
>   	int i, ret;
>   
> -	ret = of_property_read_string_index(core->dev->of_node, "firmware-name", 0,
> -					    &fwpath);
> -	if (ret)
> -		fwpath = core->iris_firmware_desc->fwname;
> -
> -	ret = iris_load_fw_to_memory(core, fwpath);
> +	ret = iris_load_fw_to_memory(core);
>   	if (ret) {
> -		dev_err(core->dev, "firmware download failed\n");
> -		return -ENOMEM;
> +		dev_err(core->dev, "firmware download failed %d\n", ret);
> +		return ret;
>   	}
>   
>   	ret = qcom_scm_pas_auth_and_reset(IRIS_PAS_ID);
> @@ -99,7 +211,7 @@ int iris_fw_load(struct iris_core *core)
>   		}
>   	}
>   
> -	return ret;
> +	return 0;
>   }
>   
>   int iris_fw_unload(struct iris_core *core)
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index c9256f2323dc..55a4fa356985 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -289,11 +289,7 @@ struct iris_firmware_desc {
>   };
>   
>   struct iris_platform_data {
> -	/*
> -	 * XXX: replace with gen1 / gen2 pointers once we have platforms
> -	 * supporting both firmware kinds.
> -	 */
> -	const struct iris_firmware_desc *firmware_desc;
> +	const struct iris_firmware_desc *firmware_desc_gen1, *firmware_desc_gen2;
>   
>   	const struct vpu_ops *vpu_ops;
>   	const struct icc_info *icc_tbl;
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
> index 6e06a32822bb..961dce2e6aa9 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
> @@ -22,6 +22,12 @@ static const struct iris_firmware_desc iris_vpu20_p1_gen1_desc = {
>   	.fwname = "qcom/vpu/vpu20_p1.mbn",
>   };
>   
> +static const struct iris_firmware_desc iris_vpu20_p1_gen2_s6_desc = {
> +	.firmware_data = &iris_hfi_gen2_data,
> +	.get_vpu_buffer_size = iris_vpu33_buf_size,
> +	.fwname = "qcom/vpu/vpu20_p1_gen2_s6.mbn",
> +};
> +
>   static const struct iris_firmware_desc iris_vpu20_p4_gen1_desc = {
>   	.firmware_data = &iris_hfi_gen1_data,
>   	.get_vpu_buffer_size = iris_vpu_buf_size,
> @@ -65,7 +71,8 @@ static const struct tz_cp_config tz_cp_config_vpu2[] = {
>   };
>   
>   const struct iris_platform_data sc7280_data = {
> -	.firmware_desc = &iris_vpu20_p1_gen1_desc,
> +	.firmware_desc_gen1 = &iris_vpu20_p1_gen1_desc,
> +	.firmware_desc_gen2 = &iris_vpu20_p1_gen2_s6_desc,
>   	.vpu_ops = &iris_vpu2_ops,
>   	.icc_tbl = iris_icc_info_vpu2,
>   	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu2),
> @@ -94,7 +101,7 @@ const struct iris_platform_data sc7280_data = {
>   };
>   
>   const struct iris_platform_data sm8250_data = {
> -	.firmware_desc = &iris_vpu20_p4_gen1_desc,
> +	.firmware_desc_gen1 = &iris_vpu20_p4_gen1_desc,
>   	.vpu_ops = &iris_vpu2_ops,
>   	.icc_tbl = iris_icc_info_vpu2,
>   	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu2),
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
> index 2c63adbc5579..74626b35d9cb 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
> @@ -90,7 +90,7 @@ static const struct tz_cp_config tz_cp_config_vpu3[] = {
>    * - inst_caps to platform_inst_cap_qcs8300
>    */
>   const struct iris_platform_data qcs8300_data = {
> -	.firmware_desc = &iris_vpu30_p4_s6_gen2_desc,
> +	.firmware_desc_gen2 = &iris_vpu30_p4_s6_gen2_desc,
>   	.vpu_ops = &iris_vpu3_ops,
>   	.icc_tbl = iris_icc_info_vpu3x,
>   	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu3x),
> @@ -119,7 +119,7 @@ const struct iris_platform_data qcs8300_data = {
>   };
>   
>   const struct iris_platform_data sm8550_data = {
> -	.firmware_desc = &iris_vpu30_p4_gen2_desc,
> +	.firmware_desc_gen2 = &iris_vpu30_p4_gen2_desc,
>   	.vpu_ops = &iris_vpu3_ops,
>   	.icc_tbl = iris_icc_info_vpu3x,
>   	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu3x),
> @@ -154,7 +154,7 @@ const struct iris_platform_data sm8550_data = {
>    * - controller_rst_tbl to sm8650_controller_reset_table
>    */
>   const struct iris_platform_data sm8650_data = {
> -	.firmware_desc = &iris_vpu33_p4_gen2_desc,
> +	.firmware_desc_gen2 = &iris_vpu33_p4_gen2_desc,
>   	.vpu_ops = &iris_vpu33_ops,
>   	.icc_tbl = iris_icc_info_vpu3x,
>   	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu3x),
> @@ -185,7 +185,7 @@ const struct iris_platform_data sm8650_data = {
>   };
>   
>   const struct iris_platform_data sm8750_data = {
> -	.firmware_desc = &iris_vpu35_p4_gen2_desc,
> +	.firmware_desc_gen2 = &iris_vpu35_p4_gen2_desc,
>   	.vpu_ops = &iris_vpu35_ops,
>   	.icc_tbl = iris_icc_info_vpu3x,
>   	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu3x),
> @@ -220,7 +220,7 @@ const struct iris_platform_data sm8750_data = {
>    * - different num_vpp_pipe
>    */
>   const struct iris_platform_data x1p42100_data = {
> -	.firmware_desc = &iris_vpu30_p1_gen2_desc,
> +	.firmware_desc_gen2 = &iris_vpu30_p1_gen2_desc,
>   	.vpu_ops = &iris_vpu3_ops,
>   	.icc_tbl = iris_icc_info_vpu3x,
>   	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu3x),
> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
> index c2dcb50a2782..7fe31136df21 100644
> --- a/drivers/media/platform/qcom/iris/iris_probe.c
> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
> @@ -251,8 +251,6 @@ static int iris_probe(struct platform_device *pdev)
>   		return core->irq;
>   
>   	core->iris_platform_data = of_device_get_match_data(core->dev);
> -	core->iris_firmware_desc = core->iris_platform_data->firmware_desc;
> -	core->iris_firmware_data = core->iris_firmware_desc->firmware_data;
>   
>   	core->ubwc_cfg = qcom_ubwc_config_get_data();
>   	if (IS_ERR(core->ubwc_cfg))
> @@ -271,8 +269,6 @@ static int iris_probe(struct platform_device *pdev)
>   	if (ret)
>   		return ret;
>   
> -	iris_session_init_caps(core);
> -
>   	ret = v4l2_device_register(dev, &core->v4l2_dev);
>   	if (ret)
>   		return ret;
> diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
> index 14d63dc76c9b..33edbc5cab8f 100644
> --- a/drivers/media/platform/qcom/iris/iris_vidc.c
> +++ b/drivers/media/platform/qcom/iris/iris_vidc.c
> @@ -9,6 +9,7 @@
>   #include <media/v4l2-mem2mem.h>
>   #include <media/videobuf2-dma-contig.h>
>   
> +#include "iris_ctrls.h"
>   #include "iris_vidc.h"
>   #include "iris_instance.h"
>   #include "iris_vdec.h"
> 

with that addressed, you may add

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
