Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795785690;
	b=UJD9ibN5C+3asc33p78ouSJF7BqOS9DX2s+hbPxYn1wqmag85C80RVQ0JDfN28cW8XbT
	 KrfOzMOcdv62LOTTpjgg9bVjlB+57S3ofKH+V+h3BGdH0aZIk6YQZnsaqkv1czP+KOFdE
	 Tjxji/xYfjBKYVy9wIIzfgdsD2aRWCFr5UtpzEYByGx3K1a/7KXq1h8FvSJeZuEc2VdKZ
	 dMJtNr4m6SWYxZD+cq5fUhjOziD2F+ZgG4TvDHERE59BQW39vhkrnI+lR/MxBxCan/M/V
	 EEXLpMnYTg9xQaS8Sxhsr04E6DuAk4dSKEbzYak7jYkZfBYlX2YT0KBMo+mqt5Exgvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795785690;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=JQA35lXIFx4Gl4uwWusbAEX4ajQDIefFfbPrN6cDsbk=;
	b=y6IXdHDydY4vPYyvwZzv6AqC4hdjI83C/mRwDfDJsWDbpE6rksLIqBQFmjFpyjvvGOcz
	 wbZ0aSbquvrnTeH82JT/er50+CtDGABTUTGbG+b1+N13fHN51JlHNcXwqyJf4oXo6jkT5
	 x/BT/OldgVLVMmlZBqn8Gyln9OXQXsBDFQTNUqs+NXQvty8TuwLvk9GEwcpeQSzcgOGSs
	 lUDAyqyn0Bs1Js8THUgR+/4KClkFBI57/HcH8CTYe+iarxGDWZ06vgdNkauH1fYzXwMY7
	 pniI5F6Y2vNXiBXc8xYgzcOrPMFgPGnv1JG2kaZevUwPC/d5z4nAzVN1x8++70J1OPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Yhf+60Qp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jGRS70XH;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75FD2606A323
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 13:21:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75FD2606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Yhf+60Qp;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jGRS70XH
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARChFVA296625
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 13:21:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JQA35lXIFx4Gl4uwWusbAEX4ajQDIefFfbPrN6cDsbk=; b=Yhf+60QpWDL6yiuS
	4RkUnrssYuCCJf4XvxrTXMISQkK//XPdmLy4b1M1c44SQZ2EfSBZ+gyxw41jRias
	1iZgsrumRd1DhwSmou97dw8JHKa2zOM7CU4k89EkbAT/yno2a5jwT/NGGPoJGZRu
	TIsPc85PFCqFAdQglLP9JjmRa8lGPGdErX3SoleosXI/Pr0/21lR1ZISCw2CfB3l
	M2fdjqbF38qhpXSiJFTS3YxcBont67Fld4O2WhtYehb777DzjeDI8CayIi8PiohE
	BQVOvjfbZUnTzUwrVRlbmkbIrE61UBWEvWLb5V4xKL8DFDdpQkaIHb0R03+NMS/F
	ZxbsQw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j74g6sk92-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 13:21:27 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-38355b03cb8so7372344eec.0
        for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 05:21:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795785686; x=1796390486; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JQA35lXIFx4Gl4uwWusbAEX4ajQDIefFfbPrN6cDsbk=;
        b=jGRS70XHvcjZWAmz1F36uOlYQu50PB9FFwQn6V4U+PJH2eOPzRGZ6og5Rk6wRWJkiw
         WZyjzSGDBX+O9ngqrJRA7yVmNev3iIQqUzw0tiAjYHQ9ZeoKEKUJX57qsvZZClidRNmk
         b//wvoYzfrUE7XxHitgbwe09BIU2QT/1Stf5+vLx/RPNC/O+Vg331YzCsqU4QTrcbG6K
         tzDDRSSOgmS5DlPCH27NXoxsfbTfqVp+/IOIDqhLcDDXJHC8APkcrekpZ8XNTeKp4oz/
         XH+T834eNRz8BmOuR4nw/Vce7MYHjXihaf3xUggBM4m8txJCI1E3Ha0CH96QaBdXhIKc
         lslg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795785686; x=1796390486;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JQA35lXIFx4Gl4uwWusbAEX4ajQDIefFfbPrN6cDsbk=;
        b=lRVe3XD66nKBwr1voTNgRZc2KyLTqx5ksdGXXzgGHorbzURKcei+xUbkor9uhMGTuS
         +SIn1voalOy/kFYv/SmAZu5+GDatXS5sntXVW9o6dqQRQehzjEef2GFIKXaEKk7q6Agl
         /woXQB1N3ZeF9SM3SLoHeCCp2Ay16DNmQOOzoCz7+7RxJu5R6+qrtpodHXDwXHMkmXU8
         w5+0BzdQTrAE7jt6EVbDQU6lNSQDh5L6JlbLLZsM7hlDSoSVzLtbp8DKLo5Qq/G7pdGw
         BySqnOtR9mI92ZXJqpJ+MZ61bAxhtVkJgkDs1xuvdw5W73HVyC80cfqRKQ81WHW/Zjlp
         HJXw==
X-Gm-Message-State: APuU4Z+bT5qiALQXgItKTQGhotg6Oi4NJIIEQyl6PPe9q4v0MO+l+JRW
	MU7DBMZR/mto+D1PAAP5wUgF2HROVtUcEPn+g3jdgQpsyREW02j2ykVWzGmo2jErFXabMHH4Ekn
	dDGiocu8+by2gY+2GalBHPosVwutgRszhambclSSQrBAzer71OIGwRdECnX+p5g9Kiw==
X-Gm-Gg: AZFdTZdJaj1ef2qPYnsjrncuEhnTl3rDTK9vdnJgzZMtuOJGazxN2Y4GxBTbDu5lUA0
	2I5QcLpLYq1JFtIRQFMFfY6sKn4DoB53hbWxO5vCiYWuoRC2Ei6OAaMcUo4Yy2DoszDZyQZuSKl
	eYioTmLgCE0pRjkV+FI0F2ZWXVujR65qf4PQv7TgXHDRw7qXrkRAB26n+qx7rOn9nsTjhP/hhqF
	P+oQrQl2NXlYICEDsD41mc+zP5xM+kQFkKU3YU3tjxFQkeGsJF4ckdQB/NIjGbl6zdmNnTU7bYq
	jaWygByZb94JlEHjzoa6S2e1y9cKli5aEjeQEMfXSGxLkCye47QWHMa0qcZ/csZYX6qIpNcxzIH
	xXZNBIETLmggw4v5sVyYpaIekrTe64NUPXJXDiudBRXnOn6punm4RLaqVWxDNzK8FV7UUBZ6nd9
	cS73I6Lw==
X-Received: by 2002:a05:693c:890a:b0:386:a93c:a637 with SMTP id 5a478bee46e88-386a93cad9bmr15012448eec.34.1795785686325;
        Fri, 27 Nov 2026 05:21:26 -0800 (PST)
X-Received: by 2002:a05:693c:890a:b0:386:a93c:a637 with SMTP id 5a478bee46e88-386a93cad9bmr15012407eec.34.1795785685711;
        Fri, 27 Nov 2026 05:21:25 -0800 (PST)
Received: from [10.206.111.23] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd40c5sm88438325eec.10.2026.11.27.05.21.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 05:21:25 -0800 (PST)
Message-ID: <79980587-fe29-4b6a-a1f1-0cfba7da492c@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 18:51:17 +0530
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
Subject: Re: [PATCH v2 1/5] media: iris: support decode-order output on HFI
 gen2
To: Xilin Wu <sophon@radxa.com>,
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
        Jason Pettit <jason.pettit@oss.qualcomm.com>,
        sakimidare <ssmzhn@163.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>
References: <20261127-iris-va-fixes-v2-0-385e8636c22d@radxa.com>
 <20261127-iris-va-fixes-v2-1-385e8636c22d@radxa.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20261127-iris-va-fixes-v2-1-385e8636c22d@radxa.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: LSpbtEco3Iu1yXV6xhW6f4j76-VuiWJm
X-Authority-Analysis: v=2.4 cv=U5kHnuru c=1 sm=1 tr=0 ts=6b0983d7 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=Byx-y9mGAAAA:8 a=QX4gbG5DAAAA:8 a=ksxQWNrZAAAA:8 a=azMBqCJUQdMnf_Vbsx8A:9
 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22 a=AbAUZ8qAyYyZVLSsDulk:22
 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA1MyBTYWx0ZWRfX5tpP2H74okTC
 t06SLZh/86TPuwktVbUTAyPw0m63bQry7cZ2GNVVQHBHWYy6FLFC/9mqURUPM5J7yHTA2vY/j8Y
 UHwVtzXNlSLcBGlZzu+1pa4bljiqFeU=
X-Proofpoint-GUID: LSpbtEco3Iu1yXV6xhW6f4j76-VuiWJm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA1MyBTYWx0ZWRfX0qO2m3hcZg8g
 X/KGvAekakFJj1/ZQjfCF+T4awetkjkYVplqo5Ad8kfqYwKRjnQutzFhLeCZa4Q6bNVvudjPwlA
 wkxzLdD0HHPwIHlzo/gbcQeOSu1KlmIJOqH0VXGFv4FlpCeiNhM9VeWcwm1QrqT0LtbHm/Ezex3
 5uvSbSjpdfn25rxDox8zAHXB3ssU9LGROlnOnLOjpdR/k6LA9qs21qRZFaKuEpJ8IY3/OT3fwuu
 ayZaUk1AsH/cExossAB/q5V4ddQqMCgSX0h3J6fsm+PjAB3Pt18J83EAA6WcyTLhtozSaXnFHcJ
 69WK95m7UaTAdankbIEmCOjDWKEOh9jedPf2hzvrICT+7oLQcFRC5lE6cZXDyNj784hHEhhUBW/
 uF7uD6r88Bd3VVo9bSSJN3xqbywBjEVtsb/5SJqHihlXDHRtjxDl+IB+KjkejdC50Ks1kBtxoNz
 OXk/ef4SawJuM/CIrrA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 adultscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270053


On 11/27/2026 5:10 PM, Xilin Wu wrote:
> Venus implements V4L2_CID_MPEG_VIDEO_DEC_DISPLAY_DELAY_ENABLE and
> V4L2_CID_MPEG_VIDEO_DEC_DISPLAY_DELAY, which let a client ask for
> decoded pictures in decode order instead of waiting for display
> reordering. Iris does not expose them on HFI gen2.
> 
> Add both controls for HFI gen2 decoders. Enabling the display delay
> with a delay of zero, the only supported value, selects decode-order
> output through HFI_PROP_DECODE_ORDER_OUTPUT. Display-order output
> stays the default.
> 
> Tested-by: sakimidare <ssmzhn@163.com>
> Acked-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---
>   drivers/media/platform/qcom/iris/iris_ctrls.c        |  8 ++++++++
>   drivers/media/platform/qcom/iris/iris_hfi_gen2.c     | 20 ++++++++++++++++++++
>   .../media/platform/qcom/iris/iris_hfi_gen2_command.c | 18 ++++++++++++++++++
>   .../media/platform/qcom/iris/iris_hfi_gen2_defines.h |  1 +
>   .../media/platform/qcom/iris/iris_platform_common.h  |  2 ++
>   5 files changed, 49 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
> index 4f2633bbb49f..0b59fc79971c 100644
> --- a/drivers/media/platform/qcom/iris/iris_ctrls.c
> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
> @@ -163,6 +163,10 @@ static enum platform_inst_fw_cap_type iris_get_cap_id(u32 id)
>   		return SLICE_MAX_BYTES;
>   	case V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_MB:
>   		return SLICE_MAX_MB;
> +	case V4L2_CID_MPEG_VIDEO_DEC_DISPLAY_DELAY_ENABLE:
> +		return DISPLAY_DELAY_ENABLE;
> +	case V4L2_CID_MPEG_VIDEO_DEC_DISPLAY_DELAY:
> +		return DISPLAY_DELAY;
>   	default:
>   		return INST_FW_CAP_MAX;
>   	}
> @@ -314,6 +318,10 @@ static u32 iris_get_v4l2_id(enum platform_inst_fw_cap_type cap_id)
>   		return V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_BYTES;
>   	case SLICE_MAX_MB:
>   		return V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_MB;
> +	case DISPLAY_DELAY_ENABLE:
> +		return V4L2_CID_MPEG_VIDEO_DEC_DISPLAY_DELAY_ENABLE;
> +	case DISPLAY_DELAY:
> +		return V4L2_CID_MPEG_VIDEO_DEC_DISPLAY_DELAY;
>   	default:
>   		return 0;
>   	}
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
> index 79bbd06ef8d2..7a1204da17ca 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
> @@ -1106,6 +1106,22 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_dec[] = {

Take care for adding other platforms too

>   		.flags = CAP_FLAG_INPUT_PORT,
>   		.set = iris_set_u32,
>   	},
> +	{
> +		.cap_id = DISPLAY_DELAY_ENABLE,
> +		.min = 0,
> +		.max = 1,
> +		.step_or_mask = 1,
> +		.value = 0,
> +		.hfi_id = HFI_PROP_DECODE_ORDER_OUTPUT,
> +		.flags = CAP_FLAG_INPUT_PORT,
> +	},
> +	{
> +		.cap_id = DISPLAY_DELAY,
> +		.min = 0,
> +		.max = 0,
> +		.step_or_mask = 1,
> +		.value = 0,
> +	},
>   };
>   
>   static const struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
> @@ -1818,6 +1834,7 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
>   };
>   
>   static const u32 sm8550_vdec_input_config_params_default[] = {
> +	HFI_PROP_DECODE_ORDER_OUTPUT,

No need to add them under these array, which gets picked as subscription 
"iris_hfi_gen2_subscribe_change_param" property by driver to firmware.

Please use .set callback to set these parameters.

Regards,
Vikash
