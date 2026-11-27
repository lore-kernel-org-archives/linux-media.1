Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795774141;
	b=zLdRg3qX4SKfmRoiK72jjGf3z76oc9t7FEEX2qXg0tO6Dm+/UijBw6mVVhJpnKsf5Jcq
	 QtrAI5cBdcf48dCmhu8JAJPn+rwb04drvtMzkpXwk9Mofd5TgRq1XBrauiLu/Ic8FO1Zd
	 IMU5/D5BeBKXQsOzScGMQRHFBPOAKNgj1A1kRs4L4gKt6IrGqVjVDG7OtgFsybH6QxxOS
	 kMUR8h+mX3RG019EBhhPQKR38skVZ6pBSMqDnzI+cDSF+XanzAIeqVPo3a502O0GZXnKZ
	 8SgpomiMfGs0GIL6qNmaWAwEXzqolPTYXKm4aWAgXimEqAN3ve36E+y8uSJG2GW/Ipw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795774141;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=gxIqLV3ljqmx0hCCgWmazrwJHEtX76k6mOrNaOf+W4Y=;
	b=IeuAaMwWOEBLuNJxVwD0Umt94qVJrqazt3fjARaWP1Xn5eRzstd5Uo/3UYwvVnSf9RcA
	 77TzQbXZJgcoLNi4hyJm378MiOOxX7eXJULftlzRGDZ6E3YHXOK0l2slTiooo3XHZi9dj
	 /43NqFxQxKjdMaCAy/ZCOlU8LlRRc/Zk9FjFz/d/1zjt7jaixWW+12fW/qbD0dOADrUTW
	 6/hnUPzEfVeK5Y6XpMxtYhj2vbNU15SdVPRYOiMuqMe6Z+cOMTz6O5BvnhLJ5+ilp2njf
	 u+LVUb4j0JuxmoY6hpb1Z6hUjQGHi+KUv52kpyN8DAD8hRGK/fAYHPA2GXcjD723ZUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="EaV/RRhH";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EgLAE1Q+;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D1FC606A680
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 10:09:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D1FC606A680
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EaV/RRhH;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EgLAE1Q+
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7GgU63759136
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 10:08:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gxIqLV3ljqmx0hCCgWmazrwJHEtX76k6mOrNaOf+W4Y=; b=EaV/RRhHnPtzMO1X
	UWWTdxaQV4xaqoCvSX9qEt5LlmEHCdBKWOCsiG8j3j1H07pLiOeZMg7e31DqTGBf
	Z9+E5o0GtaIJuwwVdYIO1ZT2oyUOivgKjiGNngR0fr9pw6jRlL07YRmowvBkJ0jO
	wUW9N6vRxAHMgk3fMq1wqLapcqjNQ+BPK0ABIiN+/HUmf01Q/UxH2Tb6HgIKAnUE
	4VyjhwSdhjeq7OmUFv2wCa+hTL/qneYSocn10A8YRL8iKE7Gv00MxkON6fR3Skjx
	6zmk6/holfwIU+zlIJAHwJKxy/8AzdqduY9ZkDAWgHH9jZYPzDL2cmGPiVsmguVa
	fg/d3A==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j74g6rw08-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 10:08:59 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2f09a37f41dso49761375ad.3
        for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 02:08:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795774138; x=1796378938; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gxIqLV3ljqmx0hCCgWmazrwJHEtX76k6mOrNaOf+W4Y=;
        b=EgLAE1Q+M/67GsEL5D+SS/BC3URMOb2i7EqkCL2Y4HnsW3mmVY+W2j7a+9Q1CITE1E
         E29eMdFMRGUTMjTP7uxDUOh6BVlBXaZ6a4x1y8B2orx4BtcS6QsXsG6ClxQgzVJVFvbE
         yCclS37AfdjCrhmBCDTVBwMRIN5L23PfVMOcGW2/E3sYZc3MLspsxCoSOSqHNrGHb/dl
         JWw8rYc67FU9MeVvUWh/G2vsd8rb5QXKOPcRV7JW/UWBYf8q2yonge/ra0kDk1We+NMQ
         6uciHsJCwXQt+LRtLnPP7bWQi/4lusdim4NVFxpm0W2xBpst7pZJNenSWz/8/IDDftm0
         jiNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795774138; x=1796378938;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gxIqLV3ljqmx0hCCgWmazrwJHEtX76k6mOrNaOf+W4Y=;
        b=gzU0rWCcRym56YrWZ0j2ANI4RyCsaJwXvWqR+bFzh5ITlBqxfQiFlXYWptjdA2boFr
         vpHlXAAVeQUDdexKjFLeikiPmjILtsfeC+d/y0gTLBZJNxpG9ojui3DTosJ64QhWVWuL
         2L/66m59i997SP6565Akbi46LUqZQUQy3qH717cQLY4V0nR0EMnREYW1Bm5EOv/vOsHG
         T78CfWTBdHzc7OJH/obSSnuI7LNYb2yiphMfoPTw0NLYlbhd9/1wNTWgj6svkNhf+svK
         TStKsS9W6FwdrlV7oD62dej6FX88w0qUBWm9P04DKGsu6SeQwcjqYLLUVmQrWA4Vh7zB
         aDaw==
X-Forwarded-Encrypted: i=1; AL+hErE7hVrlCLb+i6wfgC38mhbnn+PFbNV9AWOQmbHVLS/Hmtnz+kfnLuOAlkXJ6KZrukqobx8omVFj1wM/NQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8TwJZIFoAyxqmsfL76W7vmIWZS/I/jvtLnT4i8cQSAInB6cBUY
	NRIsSWw+vDq7K17jveXX/+aC5gCP+/AqoV8VSCfO+6TN+AwgKnXkmUXB+DthyOYR7SKfGpLwI6L
	qQGW+blljn8omR5FZ6zsvcemL72QLSG4Z6h4ULwRBoZ9Vfq+JOYwwgyVpLHgQ6S1Klg==
X-Gm-Gg: AZFdTZdw+rbyM60iGSHK+o6BmNn2mlNhVikSh9zqT92zc82boflVkSgiFS2ZDv0cFps
	PApAV3FxFwR2FgTL2lwTbyYCyjLfAEhU01NEC5fwODcL6GF74VfpTJDY7LMJHNVWHg9iKhui4Rh
	vgIEMkq/yS/m9CC4i8UVR7mhnZqMSK+iDwT2IWXnPZOyCbuZOPif3pNO6ozTef/KT1JI56xFFkw
	BdGAGLvbz32EfzBfEz7gWyMv/DRwZAJBL7/McS0INmLzkd7H96sM2rvESPQ5DjCiyYupvmwOjgB
	aTRTU4jlSNjfmfFY5I1TtSe0hSVm5y+kWoI1p+dsE8HtijVdq0qHyEb5mjDYNCeyxd0GoPq/gLR
	WXoKMBR4Ha3WK4sozZMniubs1MmJJXRiikgqYnsme/u+uOIRDmhI2+Rwo1nexxWKfrzwSEYqrUo
	2sMAzv
X-Received: by 2002:a17:903:4b2b:b0:2f0:e66c:4c42 with SMTP id d9443c01a7336-2f0e66c521bmr73777095ad.42.1795774138345;
        Fri, 27 Nov 2026 02:08:58 -0800 (PST)
X-Received: by 2002:a17:903:4b2b:b0:2f0:e66c:4c42 with SMTP id d9443c01a7336-2f0e66c521bmr73776695ad.42.1795774137878;
        Fri, 27 Nov 2026 02:08:57 -0800 (PST)
Received: from [10.204.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee84294sm115589195ad.9.2026.11.27.02.08.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 02:08:57 -0800 (PST)
Message-ID: <a07186d1-2c7f-483e-ba02-74e4cd078b1b@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 15:38:46 +0530
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
Subject: Re: [PATCH v3 4/9] media: iris: migrate firmware loading to
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
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
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
References: <20261116162148.2864501-1-mukesh.ojha@oss.qualcomm.com>
 <20261116162148.2864501-5-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Gourav Kumar <gourav.kumar@oss.qualcomm.com>
In-Reply-To: <20261116162148.2864501-5-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: wk5-LNx_2GYcLBsbrRYa2gE-zNOAEdBn
X-Authority-Analysis: v=2.4 cv=U5kHnuru c=1 sm=1 tr=0 ts=6b0956bb cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=F4YNwraytLJjv4g9V0YA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA0MCBTYWx0ZWRfXwzCMoLNtv///
 XRHQo/oIBAUnwWhVq2hWeRIkxwlBFrFNblwxa8iYoU2e20EojNHR3V4dgAgFUw+GusBetUvwwim
 EcMpgi0TZVBPxI3wvYyz9GVxZZr1OMc=
X-Proofpoint-GUID: wk5-LNx_2GYcLBsbrRYa2gE-zNOAEdBn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA0MCBTYWx0ZWRfX2yuB8gTS0onq
 KGZfg7UAhqX6kSWJu46K2x7ybP5be0wm31iDXkA2FS93alvO2pUqnkWtTvIzArtfDlaNXBbl6nh
 P+ywipLnR/X/54uU6u56FwTa/I1xf+6tWx0HKDcIIwTMamOieCAa0kpLPeXvR8+MWVb/hZ4MPtH
 b+srb2QR85LqBar4unFLigzs0pZ/21A0E8xhyi99v41LKNdnVflaBZ0nDGXMHVPeWCX001rZDWi
 kpWj1ITwg53RyUrucB7LWul5VvvujyQ2YuWKPqSWVs4zcVki8hobHtOFaZRnAX8xj/31uo1mv2L
 Y88okrvxVZnG8NmMnC80ttYSZ+kJnymAzJ3pyHQyy6HHhHlV9exH33hyh/3qXwizEOEusgfvvEG
 5nB/f0+FbzbGrfP72ry2KXFO05m7ceDRbdjj637xSM5EL3uvbQ54/kikT9ikLlIbLwAMrTpg6ev
 KnhSJNx2pipvX9+3bPw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 adultscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270040



On 11/16/2026 9:51 PM, Mukesh Ojha wrote:
> iris_load_fw_to_memory() calls qcom_mdt_load(), which bundles
> metadata initialization, memory setup, and segment loading into a
> single API that does not expose a PAS context.  iris_fw_load()
> calls qcom_pas_auth_and_reset() for TrustZone authentication,
> which is the intended behaviour. However, a new
> qcom_mdt_pas_load() has recently been introduced that works with
> a PAS context and can handle everything qcom_mdt_load() provides,
> along with additional functionality such as shmbridge creation
> and retrieving memory from the shmbridge buffer when the same
> remote processor needs to run while Linux runs at EL2.
> 
> Embed a struct qcom_pas_context directly in struct iris_core and
> initialize it with qcom_pas_context_init() inside
> iris_load_fw_to_memory() on each call.  Replace qcom_mdt_load()
> with qcom_mdt_pas_load() and replace qcom_pas_auth_and_reset()
> with qcom_pas_prepare_and_auth_reset().  The
> iris_detect_firmware() scan retains a separate memremap window
> after qcom_mdt_pas_load() completes, since it needs to read back
> the loaded image data.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_core.h  |  2 ++
>  .../media/platform/qcom/iris/iris_firmware.c  | 27 +++++++++----------
>  2 files changed, 15 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
> index 3e4cf652bf39..ac73bda072f8 100644
> --- a/drivers/media/platform/qcom/iris/iris_core.h
> +++ b/drivers/media/platform/qcom/iris/iris_core.h
> @@ -9,6 +9,7 @@
>  #include <linux/types.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/pm_domain.h>
> +#include <linux/firmware/qcom/qcom_pas.h>
>  #include <media/v4l2-device.h>
>  
>  #include "iris_hfi_common.h"
> @@ -129,6 +130,7 @@ struct iris_core {
>  	struct platform_inst_fw_cap		inst_fw_caps_dec[INST_FW_CAP_MAX];
>  	struct platform_inst_fw_cap		inst_fw_caps_enc[INST_FW_CAP_MAX];
>  	struct dma_iova_state			*iova_state;
> +	struct qcom_pas_context			pas_ctx;
>  };
>  
>  int iris_core_init(struct iris_core *core);
> diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
> index 21f57d37da18..b701a7f43514 100644
> --- a/drivers/media/platform/qcom/iris/iris_firmware.c
> +++ b/drivers/media/platform/qcom/iris/iris_firmware.c
> @@ -201,21 +201,20 @@ static int iris_load_fw_to_memory(struct iris_core *core)
>  		goto err_release_fw;
>  	}
>  
> -	mem_virt = memremap(mem_phys, res_size, MEMREMAP_WC);
> -	if (!mem_virt) {
> -		ret = -ENOMEM;
> -		goto err_release_fw;
> -	}
> -
> -	memset(mem_virt, 0, res_size);

Restoring memset() is needed.
iris_detect_firmware() scans the whole res_size window for
"QC_IMAGE_VERSION_STRING=", but the loader only writes the firmware
segments, so the rest of the carveout can hold stale data. With a
firmware-name override on a platform that has both Gen1 and Gen2
descriptors, this could make a Gen1 image look like Gen2.
> -
> -	ret = qcom_mdt_load(dev, firmware, fw_name,
> -			    IRIS_PAS_ID, mem_virt, mem_phys, res_size, NULL);
> +	qcom_pas_context_init(&core->pas_ctx, dev, IRIS_PAS_ID, mem_phys,
> +			      res_size);
> +
> +	ret = qcom_mdt_pas_load(&core->pas_ctx, firmware, fw_name, NULL);
> +	if (!ret) {
> +		mem_virt = memremap(mem_phys, res_size, MEMREMAP_WC);
> +		if (!mem_virt) {
> +			ret = -ENOMEM;
> +			goto err_release_fw;
> +		}
>  
> -	if (!ret)
>  		iris_detect_firmware(core, fw_name, mem_virt, res_size, desc);
> -
> -	memunmap(mem_virt);
> +		memunmap(mem_virt);
> +	}
>  err_release_fw:
>  	release_firmware(firmware);
>  
> @@ -233,7 +232,7 @@ int iris_fw_load(struct iris_core *core)
>  		return ret;
>  	}
>  
> -	ret = qcom_pas_auth_and_reset(IRIS_PAS_ID);
> +	ret = qcom_pas_prepare_and_auth_reset(&core->pas_ctx);
>  	if (ret)  {
>  		dev_err(core->dev, "auth and reset failed: %d\n", ret);
>  		return ret;

- Gourav Kumar
