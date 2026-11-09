Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794210826;
	b=yhLhx/02jjIB/KTuLxxmaupWUGt08G6nD+SwrHW7NpuTXHjPaPwWYtkGbSFoUIKgCSzl
	 DO/X7raf+afjU7kAIA2fxbi2H6G06GhI6n2wgtsJTyS5Clc+yeuWfcHZQewa2AdrwwRx+
	 hge+xUdzjMUeBAZtdDSntuIsiCy017usNOj6QpMsu65WFg5YMHHMLksJAUxoiEpSTUuXO
	 cfS7g3yFf1UXVozVPxHkQlxnk1ZDe91djBFqXxitYdsecQUSGrnLzBADQgWLAfRhnM+u0
	 DJqVhUWXCFqaaxJ7C31zjprLYMS8D6ZBtOp+CZ75lHTpj1AZc7BqYLAj/X+shULc9ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794210826;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:Content-Language:To:Cc:
	 References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=o+haZWFojym2Cv7RGNTo1dLDTnfV5B6AZEJXSj/GaWs=;
	b=XD64R8UNp3wuVchNeoQULdbGUWAJu94zQ9LmGzjeCywYgJaYQzgJB7eo2ZXcN9Er9bM1
	 /xTR4VMhV+nYAt8mJlTSJcQLwQ4mka6Q7PakpjlbAmTsQ/OmY+K0usAChdLzyxhB6NOqq
	 477SDY7SXMJEphHA21AwgUo65Fz8WsXsIl5YYwAA/4QpR1f1Wb8uVhGwG+xQvKiq3d+W4
	 QWYz+t4OSfPQ+WDFG/tXHZ9n6K5MZZRiGGc3fyOwpjuyIXBpkh69wox1tBZ0QEsqzv+bk
	 qpzKT63PfDLYKFJYlBc62AIZZciXeR+AZvX0mVVSk1B5PgOxhf1FClo29D8ThCKavvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mwM0zqzP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jpPfpnWJ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF394606A31C
	for <linux-media@vger.kernel.org>; Mon,  9 Nov 2026 07:53:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF394606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mwM0zqzP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jpPfpnWJ
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A969qeH401313
	for <linux-media@vger.kernel.org>; Mon, 9 Nov 2026 07:53:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o+haZWFojym2Cv7RGNTo1dLDTnfV5B6AZEJXSj/GaWs=; b=mwM0zqzPE6GbLpxf
	fPNNojxyfYZePnBTqYOCrYvsGhQc2rrkol1ZfbQ0XXT9kajSnpYIV61DfyfK3c7K
	MK2DX7MjIcC8XkVNr5QrB7PqnqUZfZkErmJ0bfXPAzzl9dnzcxds/J2JRXyWk7IZ
	kFcbBh/orXJNJ+L4Ht6g5UnVWFOKbNy/ad3GI/yDT3o5yyJRyt120Dg/LSe8SeBq
	99U8/4iZI08rtlVGptz09iH2SdFdiUVseuDqxbdDHemspBUeYyyhrn/34rVIwHXc
	4Z2u8GpGTwoGbJgFSBv4wclj6TnnAgcw+0O9FA1baVlD6D8N0WYOnDH45SPMrxtp
	dDG4rQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsspf5mu2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 09 Nov 2026 07:53:45 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30c0d568830so1766462eec.1
        for <linux-media@vger.kernel.org>; Sun, 08 Nov 2026 23:53:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794210824; x=1794815624; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=o+haZWFojym2Cv7RGNTo1dLDTnfV5B6AZEJXSj/GaWs=;
        b=jpPfpnWJtghCTeee6Wyao8yI4UTBDlfr3M0mVMaO2nBkerY3KPE34LIXra4jzPrfA7
         rBz52E+gU3P4xNzYlgUB5Magqh1Gx0JOSJKuOuA63K5qELbVisv6m2N0aYSkAb3w7wig
         3nK+z0VxEahfqxK75m+8Ys7lg+YT/RzOByDs+zgWRFtAayi40rVlhPKUI2f9YaMALhY/
         JgBPX7n/mcCZwtoHLeSwd1/cXo0QNl60bW9ogMQG4k6mcStr9px7qdvliz5QrcUlRElE
         0X7eNPdomFYXJ0qQ8JnDXhil25cIhwEMnUmCwDSobjGoPx/jjseG6Gop5cg5QZRx6iWx
         O7Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794210824; x=1794815624;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o+haZWFojym2Cv7RGNTo1dLDTnfV5B6AZEJXSj/GaWs=;
        b=w8tw+F+xCz/HMvJuCXXP160wY8nBc3vC4gpK1Sr9x3BHD8KoTT43Sp9MNoKATjN1QX
         utIgpVZx5KnIEHncwcTGGjxy26U5OflMex0nL1wNZG/mosDbZ442XjoHFdnlwAJmCRu7
         gkpJ9VF4FgimudwmM1XKPduIQUvr8Def4wY1u0Tio++BkTbuVHfp5mxnaaRs1yb8pdYM
         uGILmCNoh3sEUzfTLyWAaLCtMEgsD2/2xWJTgrrywWDbT+iSTnan9jJKjLxLC0h66Vk8
         Ho5hRYQUgCQoO2ipoyBJ5HoHrmYKjqj0KaV+HkU0+Tr37TWMyFuP5xHWghka1/DYcN16
         cHAg==
X-Forwarded-Encrypted: i=1; AL+hErEVBxBaauxeDdQU0QZx7xtTQQWb8k1xyVrgAZtroCROipQIS+5F0CFwlgNkxUAUB3dJDUz2pgHTQfhh+A==@vger.kernel.org
X-Gm-Message-State: APuU4Z8j4eZIdJC99faiYunavPQ2fQnNjaS5D05i1kHLl+zhNvGzv875
	1W6lvEfAQ/cfA5RFiwSaVuKvZjm7pkzzpQrAxdNp3lERnncjuNo2yhx0llzxwqpyLGR2cJ35dPi
	Tw2uRDI1nzvgoom7lWrpR65Wf4ay296A6y2QYXhd+viGXJhCWiY7XixPit8zlGDQCTw==
X-Gm-Gg: AYBFou05SQVIs5pbGA7nt4m4aOr5JC4VZDk9o9+dfOSDCIEUp6k0jPtnM7KUL3L8cjy
	RnpD4RngkMQBkcPLwS31Hmwjz5+rcl5CXlbY55PJc5fMS7Bo6iAOBq45KEG4t39uuBXzjJo+0h+
	bhlVtjO5rtfkwRG+a9zfm5dvLV+fcMRTBmEYWrUREa4IeN0o/w6S4swbfgqD2gJ5aKFMW7ON7nX
	elU8KN+95JVv21zdMWAo5t6uQ0qm/EQq3H/XbOhh3GiT1c25u78c7dfFFfLf1zobU+x0PLPLojY
	8cD1C5sHsrKXp6lkelTI8UGO/y2dFwh/8lRepc+Skx5VfFWczaAD68HKksQSP1geAgcjiemuLFE
	sFSNHci+VSDKXDZf/u+Olzypcz4QX9cuYZ9Q1GkFjeIDJLPieB9VgSl54nydYN58n82zC08TYIj
	bDbi8=
X-Received: by 2002:a05:693c:4003:b0:36a:1f4f:3e9 with SMTP id 5a478bee46e88-3725d782bc5mr5640841eec.20.1794210824278;
        Sun, 08 Nov 2026 23:53:44 -0800 (PST)
X-Received: by 2002:a05:693c:4003:b0:36a:1f4f:3e9 with SMTP id 5a478bee46e88-3725d782bc5mr5640810eec.20.1794210823672;
        Sun, 08 Nov 2026 23:53:43 -0800 (PST)
Received: from [10.204.100.41] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-372669d2826sm11874478eec.29.2026.11.08.23.53.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Nov 2026 23:53:43 -0800 (PST)
Message-ID: <cf7b6956-90a7-ac3b-1b2b-545f95a14117@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 13:23:37 +0530
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
Subject: Re: [PATCH 3/3] media: qcom: iris: Improve diagnostics for system and
 session failures
Content-Language: en-US
To: Dipayaan Roy <dipayaan.roy@oss.qualcomm.com>, linux-media@vger.kernel.org
Cc: vikash.garodia@oss.qualcomm.com, dikshita.agarwal@oss.qualcomm.com,
        abhinav.kumar@linux.dev, bod@kernel.org, mchehab@kernel.org,
        p.zabel@pengutronix.de, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261106153126.120858-1-dipayaan.roy@oss.qualcomm.com>
 <20261106153126.120858-4-dipayaan.roy@oss.qualcomm.com>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <20261106153126.120858-4-dipayaan.roy@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAzMSBTYWx0ZWRfX0qcPdGUtNC/B
 iD/mxaY9ymWMr8BRg26MipRNuCxSeu3sgz1uH1eu1hb9MK0Y4mIGuDUDNUW+QWD6lzWCzSE6W33
 d/0GicWmBFsoVTXIL8dGl4FxeTdURhM=
X-Authority-Analysis: v=2.4 cv=LJzz05W9 c=1 sm=1 tr=0 ts=6af17c09 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=Fb52MO1wo91ysUZOzKQA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: CaVd6vdFNyW7rNJOxUNT-ffjnKMW9hBM
X-Proofpoint-ORIG-GUID: CaVd6vdFNyW7rNJOxUNT-ffjnKMW9hBM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAzMSBTYWx0ZWRfX+cNVR2nO1NDT
 Ghkm+vvZzdd2dV17ifTOnOc9h0+gz9VT4V/bfjHVr21gPTaivy1d7+A5zr//Se22q9iVEpl7nqR
 0oD/ETJ4UBgWFnCdzovc0Cx4SQFDJ6uZRDjeF2jVTfBv3iao1jQNGqRAOkoNtyz31V6tHayUrft
 hMzD1yw2rf9/kKZh2Jo5/gNxJUXsqVub/Fhd88iGbQdSrQViZKqXdj+FNKHg0C6UjpREFcLq58e
 tMCAN49MX5/SRFm5HqMPUGl5XJ+aeysDOLYi96iaunZqCpag5QOjH6XXS1vO6G/ccfH4DHlnxWx
 XVzqNUOATFxWIOb/2zajgoavZRv2iuC7jbbRW/OaaFDdKpEsjZp01zZ3wHUlsn7wRAjxjmRaNVd
 T2Q8zGt+uOqIuO+G3Orbwv9ZF1R/EwXjYZedb2Ar7u96wPPG0P+O8jHPrdWmuiFz0TGQK+hy/VR
 mi1MhpcoQuJCiQ7YnTA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611090031


On 11/6/2026 9:01 PM, Dipayaan Roy wrote:
> Log system and session response timeouts, firmware-reported failures,
> and failed recovery attempts so the cause of an error is visible.
>
> Add debug messages for unknown sessions, invalid state transitions,
> and successful recovery. Avoid a redundant system init timeout message
> after firmware reports an error, and rate-limit Gen2 session response
> errors.
>
> Signed-off-by: Dipayaan Roy <dipayaan.roy@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_core.c              |  2 ++
>  drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c |  8 +++++++-
>  drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c | 13 ++++++++++++-
>  drivers/media/platform/qcom/iris/iris_probe.c             |  8 +++++++-
>  drivers/media/platform/qcom/iris/iris_state.c             |  5 ++++-
>  drivers/media/platform/qcom/iris/iris_utils.c             |  2 ++
>  6 files changed, 34 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/iris/iris_core.c b/drivers/media/platform/qcom/iris/iris_core.c
> index d558475986ff..4224feaf1caf 100644
> --- a/drivers/media/platform/qcom/iris/iris_core.c
> +++ b/drivers/media/platform/qcom/iris/iris_core.c
> @@ -43,6 +43,8 @@ static int iris_wait_for_system_response(struct iris_core *core)
>  	ret = wait_for_completion_timeout(&core->core_init_done,
>  					  msecs_to_jiffies(HW_RESPONSE_TIMEOUT_VALUE));
>  	if (!ret) {
> +		if (core->state != IRIS_CORE_ERROR)
> +			dev_err(core->dev, "system init response timed out\n");
>  		core->state = IRIS_CORE_ERROR;
>  		return -ETIMEDOUT;
>  	}
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
> index 1ce7f97d4087..5c411e69e5fd 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
> @@ -284,6 +284,8 @@ static void iris_hfi_gen1_sys_init_done(struct iris_core *core, void *packet)
>  	struct hfi_msg_sys_init_done_pkt *pkt = packet;
>  
>  	if (pkt->error_type != HFI_ERR_NONE) {
> +		dev_err(core->dev, "system init failed (HFI error %#x)\n",
> +			pkt->error_type);
>  		core->state = IRIS_CORE_ERROR;
>  		return;
>  	}
> @@ -740,8 +742,12 @@ static void iris_hfi_gen1_handle_response(struct iris_core *core, void *response
>  			struct hfi_msg_session_hdr_pkt *shdr;
>  
>  			shdr = (struct hfi_msg_session_hdr_pkt *)hdr;
> -			if (shdr->error_type != HFI_ERR_NONE)
> +			if (shdr->error_type != HFI_ERR_NONE) {
> +				dev_err(dev, "session %#x response %#x failed (HFI error %#x)\n",
> +					inst->session_id, hdr->pkt_type,
> +					shdr->error_type);
>  				iris_inst_change_state(inst, IRIS_INST_ERROR);
> +			}
>  
>  			if (pkt_info->pkt == HFI_MSG_SESSION_FLUSH) {
>  				if (!(--inst->flush_responses_pending))
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> index b82f50458fe1..d5b4b27e0549 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> @@ -296,6 +296,8 @@ static int iris_hfi_gen2_handle_system_init(struct iris_core *core,
>  					    struct iris_hfi_packet *pkt)
>  {
>  	if (!(pkt->flags & HFI_FW_FLAGS_SUCCESS)) {
> +		dev_err(core->dev, "system command %#x failed (flags %#x)\n",
> +			pkt->type, pkt->flags);
>  		core->state = IRIS_CORE_ERROR;
>  		return 0;
>  	}
> @@ -929,8 +931,11 @@ static int iris_hfi_gen2_handle_session_response(struct iris_core *core,
>  	};
>  
>  	inst = iris_get_instance(core, hdr->session_id);
> -	if (!inst)
> +	if (!inst) {
> +		dev_dbg(core->dev, "response for unknown session %#x\n",
> +			hdr->session_id);
>  		return -EINVAL;
> +	}
>  
>  	mutex_lock(&inst->lock);
>  	inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
> @@ -958,6 +963,12 @@ static int iris_hfi_gen2_handle_session_response(struct iris_core *core,
>  			if (packet->type > range[i].begin && packet->type < range[i].end) {
>  				dequeue |= (packet->type == HFI_CMD_BUFFER);
>  				ret = range[i].handle(inst, packet);
> +				if (ret && !(packet->flags &
> +					     HFI_FW_FLAGS_SESSION_ERROR))
> +					dev_err_ratelimited(core->dev,
> +							    "session %#x response %#x failed: %d\n",
> +							    inst->session_id,
> +							    packet->type, ret);
>  				if (ret)
>  					iris_inst_change_state(inst, IRIS_INST_ERROR);
>  			}
> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
> index dd48fa750013..9cefe090466b 100644
> --- a/drivers/media/platform/qcom/iris/iris_probe.c
> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
> @@ -306,9 +306,15 @@ static void iris_sys_error_handler(struct work_struct *work)
>  {
>  	struct iris_core *core =
>  			container_of(work, struct iris_core, sys_error_handler.work);
> +	int ret;
>  
>  	iris_core_deinit(core);
> -	iris_core_init(core);
> +	ret = iris_core_init(core);
> +	if (ret)
> +		dev_err(core->dev, "failed to recover from system error: %d\n",
> +			ret);
> +	else
> +		dev_dbg(core->dev, "recovered from system error\n");
>  }
>  
>  static int iris_probe(struct platform_device *pdev)
> diff --git a/drivers/media/platform/qcom/iris/iris_state.c b/drivers/media/platform/qcom/iris/iris_state.c
> index 5552725c614e..bcb138ccf08c 100644
> --- a/drivers/media/platform/qcom/iris/iris_state.c
> +++ b/drivers/media/platform/qcom/iris/iris_state.c
> @@ -56,8 +56,11 @@ int iris_inst_change_state(struct iris_inst *inst,
>  	if (request_state == IRIS_INST_ERROR)
>  		goto change_state;
>  
> -	if (!iris_allow_inst_state_change(inst, request_state))
> +	if (!iris_allow_inst_state_change(inst, request_state)) {
> +		dev_dbg(inst->core->dev, "session %#x invalid state change %x -> %x\n",
> +			inst->session_id, inst->state, request_state);
>  		return -EINVAL;
> +	}
>  
>  change_state:
>  	dev_dbg(inst->core->dev, "state changed from %x to %x\n",
> diff --git a/drivers/media/platform/qcom/iris/iris_utils.c b/drivers/media/platform/qcom/iris/iris_utils.c
> index 1096cc4b01c3..5ca4d8e0836b 100644
> --- a/drivers/media/platform/qcom/iris/iris_utils.c
> +++ b/drivers/media/platform/qcom/iris/iris_utils.c
> @@ -78,6 +78,8 @@ int iris_wait_for_session_response(struct iris_inst *inst, bool is_flush)
>  	ret = wait_for_completion_timeout(done, msecs_to_jiffies(HW_RESPONSE_TIMEOUT_VALUE));
>  	mutex_lock(&inst->lock);
>  	if (!ret) {
> +		dev_err(inst->core->dev, "session %#x %s response timed out\n",
> +			inst->session_id, is_flush ? "flush" : "command");
>  		iris_inst_change_state(inst, IRIS_INST_ERROR);
>  		return -ETIMEDOUT;
>  	}

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

