Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB544418EC
	for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 06:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790144220; cv=none; b=PUS9KuN1iVmK+HTbrTCaijV/yIfwRSlRhRpWDv536lCvblz6TQcDUmHqeaYgvsOYnVufrcMoYpcOXrjvpb4/7LYDHhmJ0H95vbazENnRMx4IGuUCP+TZADYG16xs4j6X/tinvRsVmL226LxUjiV3GhRYGZgewFBDWcKLe7NOV9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790144220; c=relaxed/simple;
	bh=peXXU50xndQ4gAoFBh6lBioyyPiw7OjAKlIqeV7t6ic=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VtTQQ93P0lY8sqcvRKtq51tOpuBXxaGm4ZCim3e9H0eU6PITaG2NiaSj/eRdWHanB4rAa8qIi3wvt0W4FXF8+4+b1u7ErjKloaTlLudGbS3pKnzbQOW+o9oypNDSNV31rirJOIEwNoZDCU5LuJ6IEcdV7ABIsadtVbYh8LKGOBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LTGNdvh+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aBYvZmOX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LTGNdvh+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aBYvZmOX"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N3iIDX2247138
	for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 06:16:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XAVSQafxI3Jl7WTU6fUPik0vtCcJL5EtlAGkPjfSPC8=; b=LTGNdvh+tK4uTGe3
	dBVpvQxGhbf9BoBC++S/Kx47e6bhEBx6Y7GO3GBfExQ1IMaljtbScDjHP/Mb2kTD
	TY87oyqfAjnTfbN6tZTLUkRJpOjxI+oZ9Drr+4NkWoTROCmNG5NwgfIZ2C8mFR40
	6Y0NO4vS+0MU4e6DLHN/Zebg2d40KaUAJxdDKx9EmDOUCRvUnRuhBuUDcS34b0x3
	DxLgfMixbbks82ORZavdA9VU/zx3l8ZpQgmM7JbbbZrVT/6SBO7Dthi3mTgv2qRW
	NN0Hpq7Wwq+YevdOHzudqa0YK3IlHSb137KDPPgmthg17kyzEipCkx0cf+DQ8RBT
	6/OamQ==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guymw2cc8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 06:16:58 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1431ba79941so628003c88.1
        for <linux-media@vger.kernel.org>; Tue, 22 Sep 2026 23:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790144217; x=1790749017; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XAVSQafxI3Jl7WTU6fUPik0vtCcJL5EtlAGkPjfSPC8=;
        b=aBYvZmOXP6lkAcU5i+XOYZTNZiIsxDQCygSG+CT/QwVN35BOdFpG6MI1L42ZrP09D3
         gLTaJDz2VbIVLAwfCeOn0M8Ui8N1+InJSymZyKrkn7Vv9hMvrrEUSGmFI9gceke7w7Ry
         CaDhOzHtRjlXusnIF2DMdn3l0rbYblYVkrn9TN+AgI22PDef8dkhKa0yrAt8777qnoQm
         IRecteWp/Lul8fmP+oYY1JTI3yzm/UNEPmcGWoAAfE/QHrT3Sr3rWW+NZDrW5mZA7n/L
         /iWrE/XpBTOQm27n8VF4HPuUGgEb7WpY3kTtbC6oaadngyS0kKh3XOYDZDqv1ttvPILg
         lS6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790144217; x=1790749017;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XAVSQafxI3Jl7WTU6fUPik0vtCcJL5EtlAGkPjfSPC8=;
        b=g40B1CUPzJTy9ksTRS3ZLim2SeYBJoTUNYvcjcZrSpbDw3wQWvO9nihxckDG9qn47d
         2ZgsJ+kz/bDrPM3LMr7OEbcNmCcNvXDv9mX4d24XbH5qaC0dO84+UT0KKcHWqEhFY7yZ
         gFugkv/0ACNLZSYknzve4GkRISm71jUnYUdE2trztw+pvFeuPseOvJHGnWkoyNnUbKRN
         VxN0U0edy4GTZmSlRgCkmi/nKDgMQ/InBhZ0YhWTga0RiiR/Eqocm/ukZwK7RquMqFO0
         7dS5NwPSwsZsDkYUUy2ZTYl1w4dRnNThS5o/J9zKXY2DFz72/seVmr3GE8zbKfH2sq1S
         5/wg==
X-Gm-Message-State: AFuF++ltBaz4glhvgCLPDOt1PG9TCcewih4UqdERNef+w14v6schXL++
	Vt7GjDMp84BXwJB0YGN5U4TYVxtAcsggW3HwgJcEQsFaAHp6xR5RkIvrvj1mifo1EexMrR6bIU0
	peXuvwUY2EnduXIVoiQcLPhjdPaqvFxCUdjWAhFwtr0eqkwr2Z2Qe8n/G/cENBNqG7A==
X-Gm-Gg: AYBFou2HEcU2OV5EFXXxCCgB1t025elZFjK0VG6ODYzuLY0A2ch+EGuIioRAGIjxQ7V
	PJxViGrZQKIRmelYjXVTaGQ9RmWlyozEIFM2zbu1YHn5p5Jz90fINl1FFbGOKvb7tO6iMt8T09b
	9yY92q7QklbU0kOvSJaY+bHGbK1xKuO/dqC+l2A3HYQp9VyNEYHly/mLUo6C7kh1O0DVX6L80yb
	q4d6o8gVTQ5IJ2hdxi8KXr9S4+zsWHJprOU4mFcd7JEkcXmhjHFJggaNqp/H0v8bV4i9YSDIlc4
	oLL9jfu7rG8WLwAoxKIgwRIEfvIpj0Y8peFhD2qd9/AKSo+liIWWrhi8fJ0DRAUR5bzVPHfpi+b
	Iu6ki2nk5wWQXW5LCfYsQ/lR8/UxofsI=
X-Received: by 2002:a05:7022:208a:b0:137:f532:e360 with SMTP id a92af1059eb24-144f9086f02mr1827464c88.3.1790144217279;
        Tue, 22 Sep 2026 23:16:57 -0700 (PDT)
X-Received: by 2002:a05:7022:208a:b0:137:f532:e360 with SMTP id a92af1059eb24-144f9086f02mr1827431c88.3.1790144216582;
        Tue, 22 Sep 2026 23:16:56 -0700 (PDT)
Received: from [10.206.101.140] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e96e498f0sm3375833eec.27.2026.09.22.23.16.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 23:16:56 -0700 (PDT)
Message-ID: <023d4410-a730-a5e5-ea84-474e957d7a5b@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 11:46:49 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v9 01/19] Revert "media: iris: Add Gen2 firmware
 autodetect and fallback"
Content-Language: en-US
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
References: <20260731-iris-ar50lt-v9-0-d71a782001c0@oss.qualcomm.com>
 <20260731-iris-ar50lt-v9-1-d71a782001c0@oss.qualcomm.com>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <20260731-iris-ar50lt-v9-1-d71a782001c0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAyNCBTYWx0ZWRfX2vV1Oa31zxOc
 8ncnwGVubB/re6chD9gN2EK41mSiIsa9Mq/ig7cefFFf5zfBnAXHBYZ7xvBm9Mbj4Lbp2CfMbrf
 axNXbb23dUT0uTnL4h3tRP7rqsEz5Mw97YZHiNlM9x47l1txWjW9xUtFe2xoSiMXy4bRLAWSHuk
 h555UViQKDk/eEAyX35gL5rgx+Em+dLdhUgAJoUsjfUo7OHKaXUip+bJxGgLCRUiwsJv1s6/K6O
 3Qr4t7ucSXUzGAmxzChrlPUi/54yJo0rjXu4gRBtFtLvuxt2cz/LVC20oxNzSTDH3jmguRE53on
 Z91YxhWnsqzCknLyrMflwzySyQCPe6yYuWLiMnG8DH3Vo3EtQx6GoA75ZIHnUPA96+Xu4mHkVk/
 cJzzI1Z5tTN3tcKk9d3HfOJXzumuZgAAEGRurgHqCzT5u/nwSRrErEwYjuHIPKFN7cOIzwGLeiJ
 R7lYEiDAXka/hWf7tdQ==
X-Authority-Analysis: v=2.4 cv=feI4WEQF c=1 sm=1 tr=0 ts=6ab36eda cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=fAD_4TVitci44sXei48A:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-GUID: DPbnL2oT7Xx2WlwuLDA6o9UDgz4lnPBr
X-Proofpoint-ORIG-GUID: DPbnL2oT7Xx2WlwuLDA6o9UDgz4lnPBr
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAyNCBTYWx0ZWRfX1zOTfyeW9Qb/
 re4WHoBjkXKL/d0gRJfkhzL8y11ibEHo9SDDVNPoNhqQQnuuPOypGiJenLIAu9PQ/Pb5anSQbON
 +1sOh9HtWnk/4ImqHCUASxoPOvkcKLw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230024


On 7/31/2026 5:18 AM, Dmitry Baryshkov wrote:
> The commit 412a2e5955e0 ("media: iris: Add Gen2 firmware autodetect and
> fallback") added support for detecting the firmware HFI interface based
> on the firmware contents, but it has issues with the MDT split files and
> with synchronisation / locking. Revert the commit, it will be replaced
> by the better version.
>
> Fixes: 412a2e5955e0 ("media: iris: Add Gen2 firmware autodetect and fallback")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_firmware.c   | 119 +++------------------
>  .../platform/qcom/iris/iris_platform_common.h      |   6 +-
>  .../media/platform/qcom/iris/iris_platform_vpu2.c  |  11 +-
>  .../media/platform/qcom/iris/iris_platform_vpu3x.c |  10 +-
>  drivers/media/platform/qcom/iris/iris_probe.c      |   4 +
>  drivers/media/platform/qcom/iris/iris_vidc.c       |   3 -
>  6 files changed, 33 insertions(+), 120 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
> index 965384fdd339..1a476146d758 100644
> --- a/drivers/media/platform/qcom/iris/iris_firmware.c
> +++ b/drivers/media/platform/qcom/iris/iris_firmware.c
> @@ -16,109 +16,20 @@
>  
>  #define MAX_FIRMWARE_NAME_SIZE	128
>  
> -/* Detect Gen2 firmware by scanning the blob for:
> - *   QC_IMAGE_VERSION_STRING=<version>
> - * and then checking:
> - *   - version starts with "vfw", OR
> - *   - version matches "video-firmware.N.M" with N >= 2
> - */
> -
> -static bool iris_detect_gen2_from_fwdata(const u8 *data, size_t size)
> -{
> -	static const char *marker = "QC_IMAGE_VERSION_STRING=";
> -	const size_t mlen = strlen(marker);
> -	static const char *vfw = "vfw";
> -	const size_t vfwlen = strlen(vfw);
> -	static const char *vf = "video-firmware.";
> -	const size_t vflen = strlen(vf);
> -
> -	for (size_t i = 0; i + mlen < size; i++) {
> -		const char *found;
> -
> -		if (memcmp(data + i, marker, mlen))
> -			continue;
> -
> -		found = data + i + mlen;
> -		size -= i + mlen;
> -
> -		/* vfw => Gen2 */
> -		if (size > vfwlen && !memcmp(found, vfw, vfwlen))
> -			return true;
> -
> -		if (size < vflen ||
> -		    memcmp(found, vf, vflen))
> -			return false;
> -
> -		found += vflen;
> -		size -= vflen;
> -
> -		/*
> -		 * video-firmware.1.x is Gen1.
> -		 * video-firmware.2.x and video-firmware.10.x are Gen2.
> -		 */
> -		return size >= 2 &&
> -			(*found >= '2' || (*found == '1' && found[1] != '.'));
> -	}
> -
> -	return false;
> -}
> -
> -static const struct firmware *iris_detect_firmware(struct iris_core *core,
> -						   const char **fw_name)
> -{
> -	const struct firmware *firmware;
> -	bool has_both_gens;
> -	int ret;
> -
> -	*fw_name = NULL;
> -	if (core->iris_platform_data->firmware_desc_gen2)
> -		core->iris_firmware_desc = core->iris_platform_data->firmware_desc_gen2;
> -	else if (core->iris_platform_data->firmware_desc_gen1)
> -		core->iris_firmware_desc = core->iris_platform_data->firmware_desc_gen1;
> -	else
> -		return ERR_PTR(-EINVAL);
> -
> -	has_both_gens = core->iris_platform_data->firmware_desc_gen2 &&
> -		core->iris_platform_data->firmware_desc_gen1;
> -
> -	ret = of_property_read_string_index(dev_of_node(core->dev), "firmware-name", 0, fw_name);
> -	if (ret) {
> -		*fw_name = core->iris_firmware_desc->fwname;
> -		ret = request_firmware(&firmware, *fw_name, core->dev);
> -		if (ret && has_both_gens) {
> -			core->iris_firmware_desc = core->iris_platform_data->firmware_desc_gen1;
> -			*fw_name = core->iris_firmware_desc->fwname;
> -			ret = request_firmware(&firmware, *fw_name, core->dev);
> -		}
> -
> -		return ret ? ERR_PTR(ret) : firmware;
> -	}
> -
> -	ret = request_firmware(&firmware, *fw_name, core->dev);
> -	if (ret)
> -		return ERR_PTR(ret);
> -
> -	if (has_both_gens &&
> -	    !iris_detect_gen2_from_fwdata((const u8 *)firmware->data, firmware->size)) {
> -		dev_info(core->dev, "Gen1 FW detected in %s\n", *fw_name);
> -		core->iris_firmware_desc = core->iris_platform_data->firmware_desc_gen1;
> -	}
> -
> -	return firmware;
> -}
> -
> -static int iris_load_fw_to_memory(struct iris_core *core)
> +static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
>  {
>  	const struct firmware *firmware = NULL;
>  	struct device *dev = core->dev;
>  	struct resource res;
>  	phys_addr_t mem_phys;
> -	const char *fw_name;
>  	size_t res_size;
>  	ssize_t fw_size;
>  	void *mem_virt;
>  	int ret;
>  
> +	if (strlen(fw_name) >= MAX_FIRMWARE_NAME_SIZE - 4)
> +		return -EINVAL;
> +
>  	ret = of_reserved_mem_region_to_resource(dev->of_node, 0, &res);
>  	if (ret)
>  		return ret;
> @@ -126,11 +37,9 @@ static int iris_load_fw_to_memory(struct iris_core *core)
>  	mem_phys = res.start;
>  	res_size = resource_size(&res);
>  
> -	firmware = iris_detect_firmware(core, &fw_name);
> -	if (IS_ERR(firmware))
> -		return PTR_ERR(firmware);
> -
> -	core->iris_firmware_data = core->iris_firmware_desc->firmware_data;
> +	ret = request_firmware(&firmware, fw_name, dev);
> +	if (ret)
> +		return ret;
>  
>  	fw_size = qcom_mdt_get_size(firmware);
>  	if (fw_size < 0 || res_size < (size_t)fw_size) {
> @@ -157,12 +66,18 @@ static int iris_load_fw_to_memory(struct iris_core *core)
>  int iris_fw_load(struct iris_core *core)
>  {
>  	const struct tz_cp_config *cp_config;
> +	const char *fwpath = NULL;
>  	int i, ret;
>  
> -	ret = iris_load_fw_to_memory(core);
> +	ret = of_property_read_string_index(core->dev->of_node, "firmware-name", 0,
> +					    &fwpath);
> +	if (ret)
> +		fwpath = core->iris_firmware_desc->fwname;
> +
> +	ret = iris_load_fw_to_memory(core, fwpath);
>  	if (ret) {
> -		dev_err(core->dev, "firmware download failed %d\n", ret);
> -		return ret;
> +		dev_err(core->dev, "firmware download failed\n");
> +		return -ENOMEM;
>  	}
>  
>  	ret = qcom_scm_pas_auth_and_reset(IRIS_PAS_ID);
> @@ -184,7 +99,7 @@ int iris_fw_load(struct iris_core *core)
>  		}
>  	}
>  
> -	return 0;
> +	return ret;
>  }
>  
>  int iris_fw_unload(struct iris_core *core)
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index 974809509146..a9453d539fc2 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -292,7 +292,11 @@ struct iris_firmware_desc {
>  };
>  
>  struct iris_platform_data {
> -	const struct iris_firmware_desc *firmware_desc_gen1, *firmware_desc_gen2;
> +	/*
> +	 * XXX: replace with gen1 / gen2 pointers once we have platforms
> +	 * supporting both firmware kinds.
> +	 */
> +	const struct iris_firmware_desc *firmware_desc;
>  
>  	const struct vpu_ops *vpu_ops;
>  	const struct icc_info *icc_tbl;
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
> index bbdbf21961d7..fa5bb143158d 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
> @@ -29,12 +29,6 @@ static const struct iris_firmware_desc iris_vpu20_p1_gen1_desc = {
>  	.fwname = "qcom/vpu/vpu20_p1.mbn",
>  };
>  
> -static const struct iris_firmware_desc iris_vpu20_p1_gen2_s6_desc = {
> -	.firmware_data = &iris_hfi_gen2_data,
> -	.get_vpu_buffer_size = iris_vpu33_buf_size,
> -	.fwname = "qcom/vpu/vpu20_p1_gen2_s6.mbn",
> -};
> -
>  static const struct iris_firmware_desc iris_vpu20_p4_gen1_desc = {
>  	.firmware_data = &iris_hfi_gen1_data,
>  	.get_vpu_buffer_size = iris_vpu_buf_size,
> @@ -106,8 +100,7 @@ const struct iris_platform_data milos_data = {
>  };
>  
>  const struct iris_platform_data sc7280_data = {
> -	.firmware_desc_gen1 = &iris_vpu20_p1_gen1_desc,
> -	.firmware_desc_gen2 = &iris_vpu20_p1_gen2_s6_desc,
> +	.firmware_desc = &iris_vpu20_p1_gen1_desc,
>  	.vpu_ops = &iris_vpu2_ops,
>  	.icc_tbl = iris_icc_info_vpu2,
>  	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu2),
> @@ -136,7 +129,7 @@ const struct iris_platform_data sc7280_data = {
>  };
>  
>  const struct iris_platform_data sm8250_data = {
> -	.firmware_desc_gen1 = &iris_vpu20_p4_gen1_desc,
> +	.firmware_desc = &iris_vpu20_p4_gen1_desc,
>  	.vpu_ops = &iris_vpu2_ops,
>  	.icc_tbl = iris_icc_info_vpu2,
>  	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu2),
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
> index 74626b35d9cb..2c63adbc5579 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
> @@ -90,7 +90,7 @@ static const struct tz_cp_config tz_cp_config_vpu3[] = {
>   * - inst_caps to platform_inst_cap_qcs8300
>   */
>  const struct iris_platform_data qcs8300_data = {
> -	.firmware_desc_gen2 = &iris_vpu30_p4_s6_gen2_desc,
> +	.firmware_desc = &iris_vpu30_p4_s6_gen2_desc,
>  	.vpu_ops = &iris_vpu3_ops,
>  	.icc_tbl = iris_icc_info_vpu3x,
>  	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu3x),
> @@ -119,7 +119,7 @@ const struct iris_platform_data qcs8300_data = {
>  };
>  
>  const struct iris_platform_data sm8550_data = {
> -	.firmware_desc_gen2 = &iris_vpu30_p4_gen2_desc,
> +	.firmware_desc = &iris_vpu30_p4_gen2_desc,
>  	.vpu_ops = &iris_vpu3_ops,
>  	.icc_tbl = iris_icc_info_vpu3x,
>  	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu3x),
> @@ -154,7 +154,7 @@ const struct iris_platform_data sm8550_data = {
>   * - controller_rst_tbl to sm8650_controller_reset_table
>   */
>  const struct iris_platform_data sm8650_data = {
> -	.firmware_desc_gen2 = &iris_vpu33_p4_gen2_desc,
> +	.firmware_desc = &iris_vpu33_p4_gen2_desc,
>  	.vpu_ops = &iris_vpu33_ops,
>  	.icc_tbl = iris_icc_info_vpu3x,
>  	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu3x),
> @@ -185,7 +185,7 @@ const struct iris_platform_data sm8650_data = {
>  };
>  
>  const struct iris_platform_data sm8750_data = {
> -	.firmware_desc_gen2 = &iris_vpu35_p4_gen2_desc,
> +	.firmware_desc = &iris_vpu35_p4_gen2_desc,
>  	.vpu_ops = &iris_vpu35_ops,
>  	.icc_tbl = iris_icc_info_vpu3x,
>  	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu3x),
> @@ -220,7 +220,7 @@ const struct iris_platform_data sm8750_data = {
>   * - different num_vpp_pipe
>   */
>  const struct iris_platform_data x1p42100_data = {
> -	.firmware_desc_gen2 = &iris_vpu30_p1_gen2_desc,
> +	.firmware_desc = &iris_vpu30_p1_gen2_desc,
>  	.vpu_ops = &iris_vpu3_ops,
>  	.icc_tbl = iris_icc_info_vpu3x,
>  	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu3x),
> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
> index 5db6398433a4..81cccb756b94 100644
> --- a/drivers/media/platform/qcom/iris/iris_probe.c
> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
> @@ -253,6 +253,8 @@ static int iris_probe(struct platform_device *pdev)
>  		return core->irq;
>  
>  	core->iris_platform_data = of_device_get_match_data(core->dev);
> +	core->iris_firmware_desc = core->iris_platform_data->firmware_desc;
> +	core->iris_firmware_data = core->iris_firmware_desc->firmware_data;
>  
>  	core->ubwc_cfg = qcom_ubwc_config_get_data();
>  	if (IS_ERR(core->ubwc_cfg))
> @@ -271,6 +273,8 @@ static int iris_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>  
> +	iris_session_init_caps(core);
> +
>  	ret = v4l2_device_register(dev, &core->v4l2_dev);
>  	if (ret)
>  		return ret;
> diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
> index fcbc60016bee..1c052ca235be 100644
> --- a/drivers/media/platform/qcom/iris/iris_vidc.c
> +++ b/drivers/media/platform/qcom/iris/iris_vidc.c
> @@ -9,7 +9,6 @@
>  #include <media/v4l2-mem2mem.h>
>  #include <media/videobuf2-dma-contig.h>
>  
> -#include "iris_ctrls.h"
>  #include "iris_vidc.h"
>  #include "iris_instance.h"
>  #include "iris_vdec.h"
> @@ -197,8 +196,6 @@ int iris_open(struct file *filp)
>  		goto fail_m2m_release;
>  	}
>  
> -	iris_session_init_caps(core);
> -
>  	if (inst->domain == DECODER)
>  		ret = iris_vdec_inst_init(inst);
>  	else if (inst->domain == ENCODER)

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

