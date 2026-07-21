Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D6E13769F5
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 04:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784607864; cv=none; b=bM0vGadk8Wkn6hs5wBWYdmC2OJsRh0bShJ26SVoOeLjSdJhNUsMtkRgK+qJsg4iw1kITnDkBEYxz0t0iT303BtZlJFwm29PVcEdU5Ik8uxUFTJwzv+q0HNAZnwFBROq5F7f+E6xuDdfAd3jUStGg8JZlWuTBgTzPBMnbKPQeJXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784607864; c=relaxed/simple;
	bh=EpyQ6y4Z+XCilzchS+OWjLtr0nkGIpUDEJuyhxPxTFo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NqS3n3maq5l3Bv3yQaXxvjMJTCADYgJjed2eCO/Q5iBgqFuKZd+ZB4jPrl1xW3011/+0uYrvWpRvybpvKYRqZdlcaj6UIgUE4ZcE8+2eQ+hZa1dyFfcDHSGXpMt1ovHRYEdEJ34WirPidxN2jIs+UnnMaGx++6+cWYBIUPSXB/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZSBQ9YDc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=amTCQiwq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZSBQ9YDc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="amTCQiwq"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KNCnVL4107224
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 04:24:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eqqdMOtWVd9xfvkuaRwNW1E678ghvBfZd8MCCpQ39F8=; b=ZSBQ9YDchNLYArbX
	3Zc6Wn8yR6NgWc8GKPdJgDcJekFQP1LEl+gcIMBtXFKsG8WQPXNvm83051ZhC2My
	zAPnFzEuYXWWMxv1MyVs9sSQbrAKtQoUAQJlg1gr+BEsO4XxA/ZjSCc8UHGmaQsW
	lx002D9CLFqU9S8SH2zbedeVS7xe6E/AwleT+3yJ/5Ie6MtuHLTE4tM7ZU3eIFDC
	8QoocP17u79bFuPw1/lqevsJ19DqngnOWZ8UN7fwUS1Tze1KGFCc56kL0M544kC7
	ierS2yYwKso6u+K1AgKU7+VM9OP7YoP6eJKy1Y/dAToTcNZxrXM8oJLNQDph9bZJ
	ruUjnw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhvqn91xv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 04:24:22 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cb5cc1e13f8so3996779a12.3
        for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 21:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784607862; x=1785212662; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eqqdMOtWVd9xfvkuaRwNW1E678ghvBfZd8MCCpQ39F8=;
        b=amTCQiwqZQVIg+HPgpM0a/yYPXbwPMMWS7j3ykMTv8uVoI0aQBM7ekRUtG7tK45jCD
         btAhWNKRQBo5qoXMQt0xBP56j5eLLvgjSkDdurDR1lcI0XhQQoK3NRNtSt6RnVl6u0yu
         p0TupGlOWXDzShIUQNkPLmyjG0uqZAW/UzzMNV+jBYiEoqJyfCAATd2hCa0TWxUQaBob
         JpKCXUcMZB3Hjtus+R/YB/Kn2gDEPX9yNLjCbxUaryvw0buJJ/isbuf81DAlS48ncb0D
         0zZQrSy1M3A4oiZ4oTewUHiQ4F6WLlStch8I8A7hmtoKPVvAWqmzqsHzN05y0PWWwjRL
         JcEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784607862; x=1785212662;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eqqdMOtWVd9xfvkuaRwNW1E678ghvBfZd8MCCpQ39F8=;
        b=nxL7yDIN8RQdTOhs0Bm8H//5mZ7WbQwfQtIsQXR6bjW9mmDse5xnagjikd/RdhEx3x
         PCPY5JcGxeeFjzPDCc0NZ9+hWFveNN+QvU3Rrrvf8Ki4XQ6+/y5p/2yRjhWNZeW2Stca
         39reRK693yhL3cuKQ/3ZGcfJB8vW83CyT04AqAqj1Yr8rxy1lwdwZrwxqLOe69NU8w76
         6Y1QVYJMOVbvKUI75ApQ9XFhlXPAZOSL00hibXeZmSErOIa/rGQOgAPFZezUht0Iy8o2
         Bi7UFh/wZoK/BKNGVymtuHZUq6FKYV+xo2YsK2I5y3xMifKbyWYoxdPEmUBg5AKr7/h8
         MSig==
X-Gm-Message-State: AOJu0Yz62eNaBEyP0cirUuRAcFEiQ655Yj7G3r7wVD81AvSE+MLhue6f
	P2FwEwmHD3aZXdKgicJxCK2UfZkwfSqh2PIj5TkQO2I3cC2vU158gAXE6lvg+xdVoDkRWYqgcO3
	svuN1tzUN4Az391JWvKGVybw1GHX70AZIQNSUDTXZqCaw0KGbOg2ho3dqns659uhAwA==
X-Gm-Gg: AfdE7clOvdTKwrXvjHvkdQpLiKYxJX6I++nvQBz2P+eI61L4Hk1PLaKu/Zz+fm0S3xo
	LGfl4rskUYAPtT4eBJb14rgA8JyM0YWn1RjVtf1KKpGslQVn4/6p4yxAXJbEG+Vv8m/P+1iZJn0
	l+e5kKVazXef1UJJ6diqxHE1ywBj0EuR6QoB+L2oISAdeTViWSTXTgv6r89INmQu7yzttORSuYg
	Rl9Q6poPmoHTKxFbdJL1wtgeOjIPB+ArIArHm+T6TiIBAw529z/639poZsS9gm+SSosnyhjaDZc
	GRLfFN4sxKq9ZHEv1dHeX2ksuUTmW7dVHwsWStiZiB/YGLgf1BNRJZ4Q06rYS5Ddz8IoIVb+l34
	7u2WO4rbT/YjkYzp3k5h3KwQQkoyZ5S0R
X-Received: by 2002:a05:6a21:62c4:b0:3bf:735d:7fb8 with SMTP id adf61e73a8af0-3c3ad640c51mr16441353637.27.1784607861702;
        Mon, 20 Jul 2026 21:24:21 -0700 (PDT)
X-Received: by 2002:a05:6a21:62c4:b0:3bf:735d:7fb8 with SMTP id adf61e73a8af0-3c3ad640c51mr16441324637.27.1784607861223;
        Mon, 20 Jul 2026 21:24:21 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1bbaf6sm38100411eec.17.2026.07.20.21.24.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 21:24:20 -0700 (PDT)
Message-ID: <651ceaac-bdd7-4dbd-ee45-6d4e56f78b39@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 09:54:15 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 1/2] media: iris: force stage 1 work mode for CBR RC on
 encoder
Content-Language: en-US
To: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260717-iris_multi_slice-v2-0-9550b1feb39b@oss.qualcomm.com>
 <20260717-iris_multi_slice-v2-1-9550b1feb39b@oss.qualcomm.com>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <20260717-iris_multi_slice-v2-1-9550b1feb39b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDA0MiBTYWx0ZWRfXxkkFvFIWq4Ea
 qBdpBcAcFkW02fiD9zmtvuxjRcxikd/DrZ8Yoga4hP1fg/u6BocJzC4Z43JbXvJieCviSXe56jT
 f55unbYZpNGpsxKSnKLXPsEE6tvc7j8Ca6lvF7O0sfwAEMQVJiRA9cazm5ixPBixbNWx1YpmtYv
 9JoR+lck7/FbHcXMlV2f2lHnH8CPgDdrh+Om8OMdZtESWm9e8cnnkXBWS/DNvFR66v9A5bu1P9H
 /l36N5hF4AH94g6P3tdMMZsUUQQY9pJ+0bu7QIUUCNcnp8k6CiidEEYRz4yGu2H5rWqxQ3MIBlN
 ICsgxukwICrrNahmjeNH5dD7da0Si6ui5YhU47yBxTJnP78xU38h1TGnKbnLyP6NGeLrHTIFplG
 QCbjCo1Cu3KLH9WXEcg9Urh/6FgWH+/21MiXrKp7c80pN/zUGYFNuMEHhZ1x5ewXw3uHnHsKgdq
 roRgS7Y9Vtd6hdTTJTw==
X-Proofpoint-ORIG-GUID: 3lphjrOUngeGNEvuye4zqEbwMaO9EETf
X-Proofpoint-GUID: 3lphjrOUngeGNEvuye4zqEbwMaO9EETf
X-Authority-Analysis: v=2.4 cv=M5F97Sws c=1 sm=1 tr=0 ts=6a5ef476 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=hhjTFUP8Xi2ExFBNaNkA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDA0MiBTYWx0ZWRfX/YD6waAcQp+0
 hp/xIbtuMNtZOmnU/om2GpU/zdGgu3IHKIdaLnVqh1Mo2/ZL3RIRozy9+S4AuYwWzYpEqioNvnb
 F/gXZPm4WgDWttKsJ7/I5SyzUCCPwfE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210042


On 7/17/2026 12:21 PM, Sachin Kumar Garg wrote:
> iris_set_stage() currently always picks STAGE_2 for encoder sessions.
> CBR rate control requires stage 1 operation, so force STAGE_1 when
> BITRATE_MODE is set to CBR.
>
> The BITRATE_MODE fw_cap value is used instead of inst->hfi_rc_type
> since STAGE precedes BITRATE_MODE in enum platform_inst_fw_cap_type,
> so iris_set_properties() would still see the previous hfi_rc_type
> when iris_set_stage() runs during initial config
>
> Signed-off-by: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_ctrls.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
> index 10e33b8a73f6..6c4eed62d7e3 100644
> --- a/drivers/media/platform/qcom/iris/iris_ctrls.c
> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
> @@ -519,6 +519,9 @@ int iris_set_stage(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id
>  	if (inst->domain == DECODER) {
>  		if (iris_res_is_less_than(width, height, 1280, 720))
>  			work_mode = STAGE_1;
> +	} else if (inst->domain == ENCODER) {
> +		if (inst->fw_caps[BITRATE_MODE].value == V4L2_MPEG_VIDEO_BITRATE_MODE_CBR)
> +			work_mode = STAGE_1;
>  	}
>  
>  	return hfi_ops->session_set_property(inst, hfi_id,

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

