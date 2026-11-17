Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794902262;
	b=hExnBBUjCOp8EBVBUOrks6aFDmcGpm6V437rAmjkdobjOkfkIrLo08YMjHya5GqK2tZC
	 /kgT0jFTvh4CywEeIeBJs02rq71om3JMOJNMf7f48zCk1X9oetnWISAuhV8Q7DKr+Jl+A
	 CtC2er1dEeh8Mg8gHfUfnVMV825xN9EQ1nbM5c4asEtLEuik1XJAsWCoSirLztSXnls7t
	 jbApv0bB/19bgEASuAAIo0MEGDD5f3l1zJ/WjijkxIRqOQoIzexKo2i+wzV7Q8pK6vzSG
	 ZpbiixWJKzNGmHajGQ1n1zUivXuX1wTSl/6pwNAizQoEv/NzD7zXqLkY0ZhuZ2lSWbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794902262;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:Content-Language:To:Cc:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=MLlCCShlOa+MPZ0JlAdJDjsDVBjSAOvo1zMk+KLQ9bY=;
	b=i97uOw32uNaWmtigKxRcqSBeO1Z0zHa40kC82xYJ4TSzv74NML0vGyC31oVPaNz9EaQE
	 7Nx5aB5Wor/IidygJw8LptKyLnWjSqcz20Rxj+29CjM8I0avNRnh986elAVxkyirxYy++
	 B/pQDIFsfJsbrHNM+HnGbK+c6J+AAXoATLyP7XT4rTcgsi8EIOOWNLHueLR4KfK02uNyK
	 znoUjBVox8uXzUIXajoPBx4wfnOXTCPbNKuP7qCXekfNb6cHHdRMgq4ab/kzyELfTk2z2
	 pfQowm1wKwWnmqP90Enz7w67uQm7b4NTM9rTN6Mfg67vUFjBk6rp2a4PTXBBd4R+Ryw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FmQwt4bb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PtgIgQWR;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41683606A32A
	for <linux-media@vger.kernel.org>; Tue, 17 Nov 2026 07:57:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41683606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FmQwt4bb;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PtgIgQWR
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH539uE3458123
	for <linux-media@vger.kernel.org>; Tue, 17 Nov 2026 07:57:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MLlCCShlOa+MPZ0JlAdJDjsDVBjSAOvo1zMk+KLQ9bY=; b=FmQwt4bbWhbkQ6Ts
	W0PvawoGMyhL7hp+98zs4c+/dRDaPCwScV6Qd0qLno4+F6QZpAQPfPvBisW/w2u5
	2+/mIo6vqbfVeWp+wIljKODwLfrteqTRWsCOFhrrrntOc/tabxQaQwyu2qGR81Db
	BRXlRLtDHnQYFQIOj7vW7TAiTOrp6IdkPTyc6s73IpDEtSldpOT5Vn2dCZMP9TAC
	TfG14XNeFsFoUZIRLRlekLdPmwnWxgx4yk6EA1OiGEOrhkurqtf5g8Q9N3GiaeNr
	mfIWtr9l5L/OUV9+OVyQhySbXXkVoshpyKR2XZtAeDehEG1ko1PFVFETR8I7B9Fo
	XnVbkQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0geh8k8a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 17 Nov 2026 07:57:41 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33713e5e6daso4117346eec.0
        for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 23:57:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794902260; x=1795507060; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MLlCCShlOa+MPZ0JlAdJDjsDVBjSAOvo1zMk+KLQ9bY=;
        b=PtgIgQWRUPwyFAcZnIWuokqaMkEixi+NvN8cSjwIaP3QHP+XEUpg5FqsLZuAWQ1OKn
         Xh0juSRs5XAkC1QsJh0Wyw6mwoXleyrBkFKncJcPg2CmtDv1sYMuMt2xbIi76zneoNdu
         f/RtmDfH+eOdpnfOdfK4TlAS3EnyWJkT/P3gtGddMlg/AlVC+CleRtmlB7trhfFWHZaq
         smYWI4tX/Mg41evpCs0B/sJN/KvpgPifE4ZQw9oRF0GtTXvcWa4JoWVQAoyySRLNpScp
         HEzEup7LTZ05GudFCl3DW/pE3fg8F/1rt6FSd3r6R4tloENryKo0jjC2Btkafwz5pg0I
         fgnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794902260; x=1795507060;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MLlCCShlOa+MPZ0JlAdJDjsDVBjSAOvo1zMk+KLQ9bY=;
        b=ai+97jergXh24G5kPDgbViEYGspYO+1/jJogfqJlS/hba+wFA0S076dj/lzZTGSiBN
         Ss58IR6lFwKKMbdRPbzj8mGW3sm73gPr/BtXapjn4t+47p14OGjpMM1blSPmkOo3B6hO
         jGKmtQCmpBklY/RSP/3FmZRfJ/goUxEeZYohVNUEd4g84RZ/V//e1jbwxAOcRIK6TJmm
         4+FRu1As5pftEsckw1w1xmErMElWBy9u7IxoO+/jfF5qSlgEw113/BhBXKy+vAhnCbQ4
         8zwzgTwH4ukVplBlHVAj9lADaHPlfOsubSyY8rzBrjxK0xm/zAlVa6mQgIRK0jGvIoFg
         47xw==
X-Gm-Message-State: APuU4Z+N4bdJFUeatnTPOKygOKyJ0jeKUlGABElVQDuIoNhVXnHFROn6
	hCPdLlP256uD93QJ2WigE04RPnYEs+gDKVQR5A3YumAyh+FT5GkL9h/nKrRxl9tLYCzUHi2di5+
	Ux7HvnYvpNeGFGsOWOyldZJcjINe+3Fr00Ax5xGmGaboYOS7FBI/Fkt7qVXkaKXnqCQ==
X-Gm-Gg: AZFdTZfWOaiha6HRf5YyBMLRI3+Yvy2AgitIhFr5djHXynACObf7gCceYEFlluKkV5E
	TgJawDW87xglWaKSQM2CT0LeYthKktAN/xM87s9areTabnzYinTVlezLYWh8rIikaIjUgorvx9Y
	Ic+v3+Pa0HmPMGpW0zG4aJzA5P62PDB0lAD7btUCfNFxcvrpYgkan8j0EFPdQFlCne7fLjJv+ri
	54ycNuP0CJvh6PRhjFQCzTa5OY7TKfYMd2uZ58sUsqG1FKgeCrVbavaYH9Gts9ezqAKI9hFN22I
	KbPxNkvI6otFZ18DFF25QL5Wf+6Nwigcjmq7T5A0CKWhMFsXOF2tRNoXmLRoaoZk4lbZ7mkQlBw
	prKrBY+3iYWqPmptzURjSKBQAoSBD8GPuJtvGgRuQ++ht1zqSdGXwJoYkyNJZn1UrZFqMYl4V4o
	JasGIC
X-Received: by 2002:a05:7301:fd03:b0:36a:3ac:b15 with SMTP id 5a478bee46e88-37968993d61mr11889996eec.36.1794902260031;
        Mon, 16 Nov 2026 23:57:40 -0800 (PST)
X-Received: by 2002:a05:7301:fd03:b0:36a:3ac:b15 with SMTP id 5a478bee46e88-37968993d61mr11889973eec.36.1794902259508;
        Mon, 16 Nov 2026 23:57:39 -0800 (PST)
Received: from [10.204.100.41] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-380e0fdcc36sm6089673eec.25.2026.11.16.23.57.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 23:57:38 -0800 (PST)
Message-ID: <f3079c6e-36eb-0c65-2e46-c9cb0a371656@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 13:27:32 +0530
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
Subject: Re: [PATCH v2 1/3] Revert "media: qcom: iris: use disable_irq()
 during power-off"
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Hungyu Lin <dennylin0707@gmail.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261111-fix-disable-irq-safely-v2-0-8e13f68c2ef9@oss.qualcomm.com>
 <20261111-fix-disable-irq-safely-v2-1-8e13f68c2ef9@oss.qualcomm.com>
 <39881cfa-6f44-41fb-aade-041d9cdf2f9e@linaro.org>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <39881cfa-6f44-41fb-aade-041d9cdf2f9e@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Fyml4BE6bJ833hgL_q4Rj-AzSonSFNVr
X-Authority-Analysis: v=2.4 cv=dLkzC+Zb c=1 sm=1 tr=0 ts=6afc08f5 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=4gvInHfGZssBu6MVqJwA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: Fyml4BE6bJ833hgL_q4Rj-AzSonSFNVr
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAzMSBTYWx0ZWRfX/sdLupkiyNsU
 iCI9AjkukrXBpUl3Ree0pSDBrx89rK8ysHmfFAAV92T0emXCn7juSKr2uc/sblmzQnxW1WMb64R
 J119XEZ6tyCpoCf+7YLZjHf2cbDJxgI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAzMSBTYWx0ZWRfX+uh4nSgnHCha
 SUVrtX3oXzG4ZRuc1oNltKVVKo8JggQo+qpE0mMV3z1xvgL3molbCbVg6zw00LGR/Z04KPrYVFU
 PclS7h6XoqQLdrQLSDDjdIxmVF9UJYkYmUQV+qt9YJzE9osTzrskc81QQwVOPvYv9mcMGmiimtV
 stk15U26cBpD3QwkSoumsQe3aWRZNiyM3oztFFkQCDcd2oEzEvJcDpzQ47EinjSuEzBrXttBrmm
 z4fwE9KGzU+kNqfkz/8uEGRWBpF7LS8EZ7TZNkis+ksF/QYUaQmEAnD8A3G5C9rm2lkaL26oHzI
 eq2hf8I13RJt+cmhjwM9xZEP3sinr9zfqpwRuaXeXRKMvcqZx20OZ8UUEDJE1cKeosul/L+/VR9
 4CqlKcPwplmdhjXw/kPiFU4XbmjK122apfK+Nr27+Nkj7Ncw1ijH4r/gr3uhbMlyBVc9AqCuU8T
 LH+WahCG6y9vIjl/wAg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170031


On 11/13/2026 6:25 AM, Bryan O'Donoghue wrote:
> On 11/11/2026 09:05, Vishnu Reddy wrote:
>> iris_vpu_power_off() is always called with core->lock held.
>
> This statement is not true : int iris_hfi_pm_suspend(struct iris_core *core)

Why is the statement not true here?

iris_hfi_pm_suspend() is called from iris_pm_suspend(), which already holds
core->lock when it calls it. So iris_vpu_power_off() is called with core->lock
held on this path too.

>
> And TBH as I look at the code I wonder if it should have a lockdep assert if
> that lock is a requirement...
>
>  The threaded
>> IRQ handler also requires core->lock to proceed. If the handler is woken
>> and queued around the same time power-off is entered, it cannot acquire
>> core->lock because it is held by the power-off caller. disable_irq() waits
>> for the handler to complete, resulting in a deadlock.
>>
>> Fixes: b9c2215bdedc9c ("media: qcom: iris: use disable_irq() during power-off")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> ---
>>   drivers/media/platform/qcom/iris/iris_vpu_common.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c
>> b/drivers/media/platform/qcom/iris/iris_vpu_common.c
>> index 243bd845349f..1e183fc4e58c 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
>> +++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
>> @@ -240,7 +240,7 @@ void iris_vpu_power_off(struct iris_core *core)
>>       iris_unset_icc_bw(core);
>>         if (!iris_vpu_watchdog(core, core->intr_status))
>> -        disable_irq(core->irq);
>> +        disable_irq_nosync(core->irq);
>>   }
>>     int iris_vpu_power_on_controller(struct iris_core *core)
>>
>
> Looking at the next patch I'm fully recoiling.
