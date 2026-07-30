Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84CBA382395
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 16:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785429700; cv=none; b=s5TWQwv6V0I9Vcnjknx0pB3ScUTahYzrplpVAEfm+s+KvDqLmI3rAnI+rOkIQn4RtIt5o+lWhrJiztuyznXrDvOb+8kE3YYbjD7+VIR1MqWhX1DFXJLE4CXXCnIfweIhzvlzRuRN3Hg6rbIp4mY0aUIpQ9RVbLygVMj7wAICTP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785429700; c=relaxed/simple;
	bh=tnqAYbcrx0RonTL+EcqVTpPJksbPdOFBLaLEQHp4kg4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WKkSUJks9hKvMrWZ8mNKynJKERbGuuCRbaTh1GA9rpTKOuypZmNZSDhHwTOORkd138vH1NUDCC5Rln8S2ZRiQbMoCmZ46nRQ852vneVsUtHk2NN6nG6v2oEMLB89fzseOCih5UM0tHUMr1cjIPIq51Ff2k9U38eMCll4ZvCD+5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=adbY4bev; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=itOuq6hY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="adbY4bev";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="itOuq6hY"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UGWfuC2556054
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 16:41:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QvWkZGPRSti1vswpYdq7EeY1wLL3T358RjDODHLf5Ck=; b=adbY4bevhBM08y6I
	R2EDEsgc8O6NehiHhDl1ricf5a1yPn8V3SjwNYFCJ3G6DjtJ5LCrWxVRxw6i2rAo
	Kni6akWicukPIkFCvc7XblXFqpnNJhI0pM4Z3YXf4KQySw5a5k1u0of5m7lgH0J1
	cP9ULwDbgitBSAAKU1GVUf1ybBl+U42AA0/favtmMIBRR3Rc2sdgl0nSVk7kiBob
	9kq49Y5Fjf96Pp53xc5nVqM+0/YPGX1QHbg+0tbgBkEAXTXbZJMcKzzgsbW+VNff
	fDPdMwjnwjzexhMDvmkLhPl0JFrUTT7+GQxzY02tLmj98Id8Z2991UpMDXqCeyIT
	On20HA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr8168vk1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 16:41:38 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51e9d892f0dso7167651cf.2
        for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 09:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785429698; x=1786034498; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QvWkZGPRSti1vswpYdq7EeY1wLL3T358RjDODHLf5Ck=;
        b=itOuq6hYRfFCCysFYvfHZ2MolY87Kb8g864B6ngRcL1CHnnvEJGiyuxVCSJeiwOjyY
         x44LP8+CZ87bbPY62JE9JzOa3zSPRudoHBbxJuwWNCT7vSQ/+3xmLoD7qhPpbCSll4f+
         8+FSaG1keLOIpD/RK466bgD4FTTQc/RgmumOna8lPNz55MUeJf85/ZWfzZmxXqf1FHzL
         kfWjN9bgrlFH2LQdQvd/rmbUga1tq4hbjjBKhw2yPFdPT9BwmQBVI4Ie4vYFqXJcvFyH
         JDGievzNZxGkX8CPxU95h0eJIVyS7A99JnFGc63BRQIe2lIvtiMJWc7eU5UX7wF96THY
         D9fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785429698; x=1786034498;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QvWkZGPRSti1vswpYdq7EeY1wLL3T358RjDODHLf5Ck=;
        b=L+kei7i6+5MRAnrqylVbRzd9vcBQK1/0j/ryer0N0rcvLMfeMcIF47KwTO1j5xYo6N
         aG+9ygv/q1fVoh5A90nZhmVM0Jejt+1eMpMmhCFDqiwNYUK+p6D+1KIcW1fNjupW1Ond
         B/Hie4HxZctFLx0jCTkxP3pkGsADeHrpn0xY5hTZw6Y4iXLEFTdRR9UocH04d43KP/Un
         1NLV5uRco12oOFqn1wQZz5A2KZNoOTxuwQxOThZwfEwyyE2okX19ZavJNpdJOjaZ+mM9
         QAWtTqwZsCud26VU3jpsawXCbMI0MEgk4r/j3Pc8jpliigzAXv8Bc+q0NI6iw0oduYa8
         uFZA==
X-Gm-Message-State: AOJu0YyGvsMYlJsgh+gfKt28tUdM1+vDd3Mt6hz+uiSjXHfse4zf3eKz
	jaPFymf/e4kpay79qQt6hw/aVSzizMOBS+S69h/a2KJ2tLqYNgaSFGxfYGna62GlT+AsRZqsix1
	qQ+AYAipyXP4A1Fj8HD3Lyu8SjNJmXn3aDsOO9sQEYob8J8fUHiUrg6IwWDJUwWeQ8A==
X-Gm-Gg: AR+sD12Bwl8eGZj72Ve5+CZtmx7Tcd6kdl88nD4GiodIRn2NjZ+erYk+sC2zntv1xw4
	dPi8ztu7OhzMamTdV0zBBjHVRP5VkgYPmna9jzUEJ9GD6eFRqZ4LJOZTxTKInarA88sTPWXgNRB
	Yyub00h8OV60c1uvgS1KUBzxvaZfjRWkNvBk3el9Y0B2kxq6c94+H3dwZUHubcbULjpTlPC3Ej8
	WqyO9iy3A7SETX3pXdcurlTWAI3FRh/xyhj99hB5bHNjjG2ubyYwOaDKQge9JerZqjpqQEXZ1qL
	8UuMMqAcizV8vmfHbjT72L1LeNAdz/b3Fq4ppBMw7RAV0WDWR/OP7+HRRPml1ixkIZ3TRevg3cv
	TRS293YUg1Iczz+qpR+N+gx2L
X-Received: by 2002:ac8:6f16:0:b0:51a:8079:795e with SMTP id d75a77b69052e-52b42d5e380mr14617701cf.4.1785429697608;
        Thu, 30 Jul 2026 09:41:37 -0700 (PDT)
X-Received: by 2002:ac8:6f16:0:b0:51a:8079:795e with SMTP id d75a77b69052e-52b42d5e380mr14617041cf.4.1785429696887;
        Thu, 30 Jul 2026 09:41:36 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fa8b6ca74sm88186766b.31.2026.07.30.09.41.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 09:41:36 -0700 (PDT)
Message-ID: <0a5e04e3-f42b-4e1f-aede-028258178886@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 18:41:33 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] media: iris: reject open() when the session limit is
 reached
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Vedang Nagar <quic_vnagar@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260730-iris-fixes-v1-0-413d6cfaa8ca@oss.qualcomm.com>
 <20260730-iris-fixes-v1-4-413d6cfaa8ca@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260730-iris-fixes-v1-4-413d6cfaa8ca@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDEyNSBTYWx0ZWRfXwtRYLA08i5Jj
 7mYxfc1JEZgp1bfOhbZFeBzl6VBwu9AuPOiJDCH00HzjJgZEP4S+BuQfpheesH3pBrcnEHI1x+2
 PSduyY8LLnd/FjxfsTQ8EJBQq/XsHUVLpAvYaouFdKhmKK+w6XeKYuSU5ik/Jlsrc/leyeZfRaW
 zRPNY3VooWFJjaH1tW3QPbfB8N9ZZNy15s0PnNvZV2ANYL+Qiw2fm1cFW4W93FVtwu+zPpM6jiH
 RIs1qFtgU6dGS2VvoURzOa8JeYA/f8JSBDr95oberrsVZXhiZcA2A0M7dMrwQ+4Gryg0ySm5rNg
 381yfvtlN/YdJ4ZmlqzmQBSMULZteZYCxrzSGIsdGZ68u2N1WH5WphisMJg3gSyQaF1a34S494O
 E1UEdZW+wYbQ1ChMYbWQO6KnmBAI2gP+E5mOShl2jVAHbMgVe3dL0BgNELQDzWM0hGMDFb2X0yO
 h+LLGbINi86gUjK4nDQ==
X-Authority-Analysis: v=2.4 cv=LIlWhpW9 c=1 sm=1 tr=0 ts=6a6b7ec2 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=IXgDxvFm7GQjexM7_vQA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: WAXoHfyOhwlVaItmP4-vFUulvM_4ysve
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDEyNSBTYWx0ZWRfX0dAuHnFCWbW/
 c0SPij3NLOyO74A8CtzHnb+5ude3PIgsmZvDDcRtkhCUXMJBpn9NzHSC+H6QPDS+qNrLNNW4ieM
 v8xofW1BHS+HeB5DkY3XiBoGejF2i7Y=
X-Proofpoint-GUID: WAXoHfyOhwlVaItmP4-vFUulvM_4ysve
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_05,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300125

On 7/30/26 5:26 PM, Dmitry Baryshkov wrote:
> iris_add_session() silently skips adding the instance to core->instances
> once max_session_count is reached, but returns void, so iris_open()
> continues as if it succeeded and hands a file descriptor back to
> userspace. As the instance is not on core->instances, firmware responses
> for it are dropped and every subsequent ioctl times out.
> 
> Make iris_add_session() return an error when the limit is reached and
> fail iris_open() accordingly, freeing the partially initialised instance.
> 
> Fixes: 38fc8beaba55 ("media: iris: implement reqbuf ioctl with vb2_queue_setup")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_vidc.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
> index 14d63dc76c9b..b68b98f02e26 100644
> --- a/drivers/media/platform/qcom/iris/iris_vidc.c
> +++ b/drivers/media/platform/qcom/iris/iris_vidc.c
> @@ -39,11 +39,12 @@ static void iris_v4l2_fh_deinit(struct iris_inst *inst, struct file *filp)
>  	v4l2_fh_exit(&inst->fh);
>  }
>  
> -static void iris_add_session(struct iris_inst *inst)
> +static int iris_add_session(struct iris_inst *inst)
>  {
>  	struct iris_core *core = inst->core;
>  	struct iris_inst *iter;
>  	u32 count = 0;
> +	int ret = 0;
>  
>  	mutex_lock(&core->lock);
>  
> @@ -52,8 +53,12 @@ static void iris_add_session(struct iris_inst *inst)
>  
>  	if (count < core->iris_platform_data->max_session_count)
>  		list_add_tail(&inst->list, &core->instances);
> +	else
> +		ret = -EBUSY;
>  
>  	mutex_unlock(&core->lock);
> +
> +	return ret;

Since you already have to resend.. nit:

guard(mutex)(&core->lock)

if (count >= core->iris_platform_data->max_session_count)
	return -EBUSY

list_add_tail

return 0;

Konrad
