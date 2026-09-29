Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AE924E36DF
	for <linux-media@vger.kernel.org>; Tue, 29 Sep 2026 16:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790698070; cv=none; b=E2CyX0BeE72BbidRPv3YBJJAIesDimdDhpQY8F4h2HJRNcp37gdiUreag/KECJb9EUjZbCRisMP82xZo8+CZV5cMwze4xHp5HFhF0C4IaP3UQaQrYDlBfHZsBKRjwgAvS2TQj+84IUhVUpYRrfibXYsnc1/z19XTOvbsRel4m/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790698070; c=relaxed/simple;
	bh=UiPEbTTVeS4GTLOBWf0eweXZfag4iu80jpneHEBS5eE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=otBeD+UW8SCxLOfn3kWg2WG+fr1NdRU/4KLF86RqrBJNKNQID95k+bf5wY+vh16mudq7REIkoGrwSWbEspBIarI0I5Inb5xQyhAJjJxmm/4kFuI6AdlZ0t0mOaIRTBXx6Uo93qA7o1YqQ5OEuyk0cjmPSm2a0KiOSdwyY1wW1AM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l9MwBIBr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OKmwA0Ng; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l9MwBIBr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OKmwA0Ng"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCrDpS1018403
	for <linux-media@vger.kernel.org>; Tue, 29 Sep 2026 16:07:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Goj3XTA9GUEGFQR6FU85iMyT4vgBSSBhVAmRftd5OZY=; b=l9MwBIBrLxNSjUml
	UWHdL3pCbDN4JwOorDTbn4SG4ZpI0s9C5X2dEYPNgBHq6exfw9f3kAWOMuw/CQHA
	eZ4RhJW8Jx1d6xisXn6ndnq5wzeGRooHEjBGk54JLwsvUICjcvQnhBc8HmJa3Rj2
	egw4XhReFYaYyyzcMrU7/1cRfEld/pkpOs66zAxo20GAm7i3a5tdLTGG6I9YxUe1
	69sZtSZXb6XmeaIQJdXMsqx1CVKywZkFQUXcm/V2r9Oy9ndc+0+zZqri2XyKDiS9
	gUq1zlf6XwdzPctqyPvmtbLNkhO45z4txNxrx14ckJLjsmkttFUjEnao7DyZaS/g
	5vTcBA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h05yxk0k8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 29 Sep 2026 16:07:47 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3437d0cc8c7so3813212eec.0
        for <linux-media@vger.kernel.org>; Tue, 29 Sep 2026 09:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790698066; x=1791302866; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Goj3XTA9GUEGFQR6FU85iMyT4vgBSSBhVAmRftd5OZY=;
        b=OKmwA0NgOmQYrHNsphYUv4BDWFKNalli5EusQpLonzkOqCKQIiVedSRrZufSDc6eBF
         5pU4iKhYdG0A/4sQSGPbofbhfvFPzZKxg+L+ooJF7ztv6CHq5TOPFdaQiJ5OUtLaU+2r
         uK7Ax5b3owMEZGp6kQfV+RVwzyKS7ryiLRRCXL3UBEqY1+1pl8/Bpxz1gKgW+iXyCBxJ
         nk6DiDXEgwn3+tVfGvmxfIR6vilxyq3sYhGUCqATlAfkkwhGQ51vr9e/ZOOgAuTE4rJR
         WlNAH5R1SS+Ux5G6YfQlsckdEMrbFqkM2Cx0/PpIMVBu98qsndjh5dykWLV908TZpKch
         4LLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790698066; x=1791302866;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Goj3XTA9GUEGFQR6FU85iMyT4vgBSSBhVAmRftd5OZY=;
        b=ACkdw5Fhz7zMxEIIr+YXMsxFHkXw14/dVPvkcjrFrMGTqaug+yxZQA9Qg7msnph1WO
         uvNvYzzGwKzx9dSr8RmALc2gOG7Vu3cElefCELeHBxsVn0LARd0Qecl0gUHOa+bn4tI7
         f4oRjin+UNMVrzhQ7VuwacR7kyeVH/3M66yyO2KARTHyU4F1ct2aKiuuyqfoKAAzPDaw
         Gbg5NsUIR1kbyUEqvpxldoeaueDfFC2jQqFbsD4C2M//spBO7qv+MLHoB/HuWN+CtWhu
         eDWsD7P4jc5W4GvuDKi4PqSe2t8i16j2uZiA1CC7neKtROka9UbbEcXEe3clHYsMvvCH
         Byww==
X-Forwarded-Encrypted: i=1; AKwUvBwn3doz+O3i/yDgFXJSJ5rZRe3yxWaLa0w+OcLeucBA2xT2xzDSZQAquTfz35kfRGeYePFVPg6bVePqeg==@vger.kernel.org
X-Gm-Message-State: AFq9FYIx1edM0yxEMe44NOl2bqPijVLphS87/1ROKA0KwgSWcu4k2NwQ
	xSeRe/hvXpVwItxmKe07r8oqQ46uV50aUWUtBYIv7t9fYlcov1ExZ+Zs0vi2BRPVmyzkDJ4PUrq
	Dux1fp/1x0Kuh/TBZtXJXmQOsWZxnlCfSDFkTEQBvGtRYdaKeFESpPb5JfngD8Ff51w==
X-Gm-Gg: AYBFou2LCHrGOpk0tpaIpNXpLtNKJyMyKfo7DKAqgqnHeEWqrb6MTzTXYoorEvbzfq4
	kGQsI/6kMNFtC3zPhYjxAtyCxLTAs62JC9FCjAvdgZJdqgvmI2tR8qDckABXZx48Si0VsblRh19
	tU0G/Eb323H1bAvjj+te45KObrFOuu6J15oLjAqPV0g/bl9HFe881BTglnV1Uwcr/IniTDTghev
	TUoUO+5aXl+DuKck1fOl5G83ltV4vuK6RhIJKgX9Dh3cyqEpL+2UMTlvvyaop7UvJdM0zcFGmzE
	AqqmHuQkVgfw5XCJb3jU5vg5vxvP73fEFS7/JYfoSY1pUHd1HcTrgq+isbJqpXkV4ytfrZ8ojn1
	EJDZ4udXCoqupT5mvbbI7ZV494g==
X-Received: by 2002:a05:7301:db11:b0:34b:7158:974d with SMTP id 5a478bee46e88-34b71589858mr2141824eec.27.1790698066005;
        Tue, 29 Sep 2026 09:07:46 -0700 (PDT)
X-Received: by 2002:a05:7301:db11:b0:34b:7158:974d with SMTP id 5a478bee46e88-34b71589858mr2141776eec.27.1790698065066;
        Tue, 29 Sep 2026 09:07:45 -0700 (PDT)
Received: from [192.168.1.6] ([183.83.136.86])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34c38bea1bbsm351546eec.23.2026.09.29.09.07.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 09:07:44 -0700 (PDT)
Message-ID: <1eeccb79-540f-4a84-987c-77dc2b05fd18@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 21:37:38 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] media: iris: add support for vbv delay
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260927-iris_vbv_delay-v4-0-8ee2b7462e68@oss.qualcomm.com>
 <20260927-iris_vbv_delay-v4-2-8ee2b7462e68@oss.qualcomm.com>
 <jc4vctqyyrh7gvoxv7h7ioqnrv72t73trgesscx3xpd4xwpj2m@m6no5tnmet5s>
 <828e8a38-4d11-4126-8f77-04e05e1a94b9@oss.qualcomm.com>
 <CAO9ioeW_EabUpjDZa6w-60=CbDXVgGw0-N2t4Z5SpJPrrhcrtw@mail.gmail.com>
Content-Language: en-US
From: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
In-Reply-To: <CAO9ioeW_EabUpjDZa6w-60=CbDXVgGw0-N2t4Z5SpJPrrhcrtw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA2NCBTYWx0ZWRfX84DJVE7Xn/3C
 esk7IlAT/0bU7HHRBKzgmGmpC9VGnp6lFJtaOAZsXBW7rF8oaEPXFcLGJwUjMCcDqsvbOmKZUkG
 r1fpeeBXx6oOOZu8pTOaKztaZwcD7Dk=
X-Proofpoint-GUID: 1neWuy0RyYJ6F2t0HSQwRV_lJJPhAzIn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA2NCBTYWx0ZWRfX9SQ5UHZwESat
 6KmKT8gFBte/uBPJ3gGpY5PO0Knhgeq8ab3JrnVVdB3q57cQIfqrnKl6FctbFeMx67NDqaZcED+
 C/BjlC26/gWaCHe/oKouGy6FDaqioA/JnHFMDMqLJv+JiUUV79tmVYTQgikXzv1TtYLjP3+P5GM
 VJiqjAOvQoH++S4nasxftflNlKgpIxMzOis9e6AtKDQFudyObtUUwmBllG8+BBDZP0nyyCVFCoL
 y4gTZ4urJIZvYgEFjp1pqnMggg9ONBmw0JQn8xio07oCXVa8N5SwBCuwgRtIUhHaT4YsHH9kV/g
 e0Vi+j35DHO/wDRMkb9x5Cs/k2cuIoFNdrmFu3IcoPPTuC5lN8LtjaT/86YQBxOGRV6NS0MjaAi
 e1D3UYJMrDsgWwpLTineocizWjgVFlOroI6dCjgTFMVjxzsyCj/GASrTk/nSOjZhMKGYpsP/aFs
 DnRN87vcCkXMc9yERCg==
X-Proofpoint-ORIG-GUID: 1neWuy0RyYJ6F2t0HSQwRV_lJJPhAzIn
X-Authority-Analysis: v=2.4 cv=SaFi5fRu c=1 sm=1 tr=0 ts=6abbe253 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=3QCVlsRjdi7GuuGcdgbjPA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=ziDTZQdal7qNKhkiiRgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290064



On 9/29/2026 8:35 PM, Dmitry Baryshkov wrote:
> On Tue, 29 Sept 2026 at 14:54, Sachin Kumar Garg
> <sachin.garg@oss.qualcomm.com> wrote:
>>
>>
>>
>> On 9/27/2026 11:55 PM, Dmitry Baryshkov wrote:
>>> On Sun, Sep 27, 2026 at 09:27:46AM +0530, Sachin Kumar Garg wrote:
>>>> Add the VBV_DELAY instance capability for the HFI Gen2 encoder,
>>>> exposed to userspace via V4L2_CID_MPEG_VIDEO_VBV_DELAY and mapped to
>>>> HFI_PROP_VBV_DELAY through a new iris_set_vbv_delay(). The property
>>>> is only meaningful for CBR rate-control modes.
>>>>
>>>> Low VBV delay values (34-100 ms) require the encoder to run
>>>> with a single video pipe, so extend iris_set_pipe() to force
>>>> work_route to 1 whenever the configured VBV_DELAY falls in that
>>>> range.
>>>>
>>>> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>>>> Signed-off-by: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
>>>> ---
>>>>    drivers/media/platform/qcom/iris/iris_ctrls.c      | 37 +++++++++++++++++++++-
>>>>    drivers/media/platform/qcom/iris/iris_ctrls.h      |  1 +
>>>>    drivers/media/platform/qcom/iris/iris_hfi_gen2.c   | 12 ++++++-
>>>>    .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  1 +
>>>>    .../platform/qcom/iris/iris_platform_common.h      |  1 +
>>>>    5 files changed, 50 insertions(+), 2 deletions(-)
>>>>
>>>> @@ -541,8 +545,19 @@ int iris_set_stage(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id
>>>>    int iris_set_pipe(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
>>>>    {
>>>>       const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
>>>> -    u32 work_route = inst->fw_caps[PIPE].value;
>>>> +    u32 work_route = inst->fw_caps[PIPE].max;
>>>
>>> Why is being set to the max value instead of using the .value?
>>>
>>
>> fw_caps[PIPE].min/.max/.value are all seeded from the same platform
>> constant (num_vpp_pipe) at init, so .max and .value were interchangeable
>> before this patch. This patch now writes the applied pipe count back
>> into .value (used elsewhere for power/cycle estimation), which makes
>> .value stateful. Since iris_set_pipe() is re-invoked on every resolution
>> change while streaming, seeding work_route from .value would let a
>> previous single-pipe override persist as the new baseline on the next
>> call, even after the VBV-delay/CBR condition no longer applies. Reading
>> from .max instead keeps the default pipe count stable and re-evaluates
>> the workaround fresh on every call.
> 
> With the .value being written, does it need a lock protection?
> 
No — inst->lock already serializes this. iris_set_pipe()'s write to 
fw_caps[PIPE].value only happens inside start_streaming 
(iris_venc/vdec_streamon_output(), both the iris_set_properties() cap 
loop and the DRC re-apply path), and start_streaming takes inst->lock 
before reaching either. The only reader outside that same call chain is 
the power/clock-scaling code (iris_vpu3x_vpu4x_calculate_frequency()), 
which is only invoked via iris_scale_power(), itself called from 
start_streaming and buf_queue — both of which also hold inst->lock. So 
writer and readers already can't run concurrently; adding a lock here 
would just be redundant with the existing vb2-op locking, and no other 
.set() callback in this file takes one either.

Regards,
Sachin>>
>> Regards,
>> Sachin>>        u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
>>>> +    u32 vbv_delay;
>>>> +
>>>> +    if (inst->domain == ENCODER &&
>>>> +        inst->fw_caps[FRAME_RC_ENABLE].value &&
>>>> +        inst->fw_caps[BITRATE_MODE].value == V4L2_MPEG_VIDEO_BITRATE_MODE_CBR) {
>>>> +            vbv_delay = inst->fw_caps[VBV_DELAY].value;
>>>> +            if (vbv_delay >= 34 && vbv_delay <= 100)
>>>> +                    work_route = 1;
>>>> +    }
>>>> +
>>>> +    inst->fw_caps[PIPE].value = work_route;
>>>>
>>>>       return hfi_ops->session_set_property(inst, hfi_id,
>>>>                                            HFI_HOST_FLAGS_NONE,
>>
> 
> 

