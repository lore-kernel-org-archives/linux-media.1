Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81CFF443E5A
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 18:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784138881; cv=none; b=khPzhLY1nlVHl1vGxn2TT059G0N1FI/InGF3adD3GBWpR2qSn2bZaqcbpWjfbvt3/6MpE2Y+OuM4hOSB2U9IQPzuqgghZZcjZnWpHeAD7N+U/lqta90PMD1fG0/NoDf12ZsI868PVQQXTuGVnyuW19d5k9BdVezE9CaLKxnLuPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784138881; c=relaxed/simple;
	bh=yk81vj59l2TmlXH4K+qJfCYvv46f+EWu/61vbJd9hyU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KsbxlG6x+Z0lk56NXKSrrlbTuQ3DJRflLnUQmJIhKMaX5dFK8g5BQHAJFk2qYa5N8GHyxLGRVctbMw0OuMAheZki7kRZf0MVpzh26juyXA+o4DNdfPy6Z/DOJlVMXArwxztCrI8XkFf3lBZexXidhIZVc2AnjK79hSHECeeZjM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QG0j9kE3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dWN8+BfN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QG0j9kE3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dWN8+BfN"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FHLvPN074259
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 18:07:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	owjCSr9b7MMLyEnv0fXfg5oQfeA8x1a4DWRxMp1KHH8=; b=QG0j9kE3UmnyuZrj
	W4iQ2dWKlxRnnw7FTXVk2auEnp72Uh/2ZGA7lk+BSspZMU9zm3WrT/ImHx2b8B7Y
	3DIqBChIsZ4wLPCDPt7vlBstlYgPQ92bHFz2DE6WMvu+CjSHC+4Wefiet5iXdimU
	IecgsAb5JcNUPZ6qtZHd42Dziqs8+bbRSTje/tFYlUTrUcVyT9XSVxl9gD/7U6P4
	+foflPMir01mHnNwF0Z7SvNCvMl+MbFWHXUUCmws+IvDp/MNr/uLotWBpsbfR5RE
	PWxt5v10JHpNiwo4ZoJrDM/+3GZoh2VNu8Xpue+/w+jcwHGgfW0ptv8/5WGufR8p
	Cfp7Ow==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feehv85rd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 18:07:56 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c892143db7fso2202690a12.1
        for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 11:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784138875; x=1784743675; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=owjCSr9b7MMLyEnv0fXfg5oQfeA8x1a4DWRxMp1KHH8=;
        b=dWN8+BfNKDQUZyROXjWzVUCCrYINSf7VcgDzfhnJ4OFALaCUniyK34OVn44uv9RKtl
         5Hyhr4kSh1RCbNBer5bVzo/C30TBirbc7srirMReHGNtJVft/GSEoVmjpctM+q1ZHVcK
         RJsxULf08o68HjVuCWM0ud5rqcnxrNYZxJe7pmQmCli7atrbyXlz397yJ1IuiUxg2HEt
         BBsjiauRq4/D+95lrTHMwbQ5vXSNLY6U2y5wX/b+NbSI2RrqhGJp73uSZxWEOylmJ+rg
         6qXxPVQN+9lpKTtjDskbWQwmYYjjNv0ws7iZdY2rc4HNLURoFyjHlUFySR+XRuO4QQsY
         P9jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784138875; x=1784743675;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=owjCSr9b7MMLyEnv0fXfg5oQfeA8x1a4DWRxMp1KHH8=;
        b=qqfA1mOtVgJ6qFhlhzCp/ZgfiacfUVrbQTt8uFbWPfFintZEkbHDZ4zw4+kedPlbtP
         gBJfUKPwCamazB3s17kpRHDtFkIQ2habQnXnfoDCcqUwAYO36pZF1PRJhDrQVK0CnLBB
         lZnssLGEFS2An04E5aGPG/KF0pEHLHrL+eLFsVwoPGuIXdr8CihsSwJctlMIYgLqGpH6
         +r1lIFQuLxLv/y2S+Z1etqSLpabBLKrfFMQ+GMBZ3X47ZMCAyZsaIq1zqpqfgiwabkl3
         +t+ITIlQTw7ynB//Z9QaaJEIBX4mPdBZmSftwn5rGCnq0L5RfRKsJ/qyk1qgP8F9wE5U
         lMMw==
X-Forwarded-Encrypted: i=1; AHgh+RrlWMS7abZFmjBKCJ5E/S3O1s1PT5vsDSiXSa9SjbmzzRaC4jPoQXMPua3tzYu/NFVgrU/toA+Gb9aUiw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzp3Lwe9Ndy8DMKMiwjjYkSBXNLsSh8LzDS1Sx0V8/D3kNoQu6P
	KMKzqHKtiyl3Kx3VA/sv1ypH5zqNSmhQ4+NOVpZtXMEAwlIEndOUefO/rgz1iFrfwDik8DAYmsP
	5SLhQP+0BlMPUpCjnGruDrMxtY5+3bGn1dhyZJp1ixk29c5bRTcZ+Atr0Q3udY2Zh0Q==
X-Gm-Gg: AfdE7ckvBXZAJnWf0/RHUoFPJYC/Eu1YYMsojGUmhCJ0VUVHVGKF8aPfj+Jcd9j+J1I
	rKdjpmewDWmp3OrAjg2Isa6g72kPtw60BU+Nc+xo0HQSqXeCSsDK1p6D7gnaHtZb8b8BQuVcHeI
	FgV97Di+HPOvw0EYMbW77K/hERQnC9eRJJv7NpCaLqZqBMSItfMUgkd5ErKGHZmd8lLEK/Nza+n
	RWCIZsXjYP+tAMMhaOxRxXVpAZudq8yoJLGfXxmBUfn1TLpXt6TjH3eLIhT1/6TNeSxp0grYo0b
	mb4LoWLgs911cyT4wrNPb6T3dt972vAbgtnDqxVBWozkeRWriYi6YPhx+ATcYWrzN5+Tx2qOmiK
	392CoIlJiP3kH5AvvG5bbasGHYvEvW2enHu9RF0hSFAbq
X-Received: by 2002:a05:6a21:1798:b0:3c0:9c1a:8952 with SMTP id adf61e73a8af0-3c110b35019mr19226589637.74.1784138875485;
        Wed, 15 Jul 2026 11:07:55 -0700 (PDT)
X-Received: by 2002:a05:6a21:1798:b0:3c0:9c1a:8952 with SMTP id adf61e73a8af0-3c110b35019mr19226551637.74.1784138874931;
        Wed, 15 Jul 2026 11:07:54 -0700 (PDT)
Received: from [192.168.1.9] ([106.222.231.43])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13cd432f1cesm5187074c88.11.2026.07.15.11.07.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 11:07:54 -0700 (PDT)
Message-ID: <312315da-699f-48c6-8331-6dce3abb899c@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 23:37:48 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V5] i2c: qcom-geni: Add dynamic transfer timeout based on
 transfer length and frequency
To: Dmitry Guzman <Dmitry.Guzman@mobileye.com>,
        Aniket Randive <aniket.randive@oss.qualcomm.com>
Cc: viken.dadhaniya@oss.qualcomm.com, andi.shyti@kernel.org,
        sumit.semwal@linaro.org, christian.koenig@amd.com,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        naresh.maramaina@oss.qualcomm.com
References: <20260715101805.3615166-1-aniket.randive@oss.qualcomm.com>
 <20260715144558.abf5078829bfd2a0973019a9@mobileye.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260715144558.abf5078829bfd2a0973019a9@mobileye.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ZpDd7d7G c=1 sm=1 tr=0 ts=6a57cc7c cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=OlrBKP18NtReKxGUJ9moaA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=SU41Sc21RSR5G0VrqPMA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDE4MCBTYWx0ZWRfX3rbs7z8przXI
 88EwiXriDdfaaBEhx07AtxO4H7uh5vxaSwwvVyrkealjU93BYqolwXrGmHPPzNAkPHwWf0CWt/+
 djaw6YZUl8RGNTUsdej4JVqJTu0uccCketKdYr/JmCS5pP5Xwg8Ro5ZLo7fXgVAf3K6MDNZk7eN
 MrkNp/DU+tzBBuHXs9t9fx5hyfPjsuknGEg0+ECHi+RHkY6Wy8smgvYZm5VLT/WLr5ciPU8jnFM
 LTnYgS7IfJFmTfFZ1wsLky0qz36RrsbF3ap67Koc623x9euYwuZIdys0UR7bSXMvVJfhh3Avo/f
 nqit+a4bjP0tChnJ5/Oe7I7yQv8wxKknIPgrf0qVI0uz5rXqyMBeX9Hv5nuHOx82+7nGZb2a5QS
 2npJJAAgv4GszQZtjq0+aNVjuvFdr8RnRFaJu9SHbLaFraf2/H4htyQWASLSDo3CPULTZJZx44C
 f4vfDeJQkmIj9pamhdA==
X-Proofpoint-GUID: iYdiumH4n0XwTrSfEVDEzL9e09t5B-c_
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDE4MCBTYWx0ZWRfXzzEJot/2OpWE
 udiM4OvvQuuo1BL6jQPO3vaPQe1y8VOS40WUHzZvWveGS1dMI03aPtYECcfEhhkfs7Y+pPBd4T3
 7wb5nbjrMwNkYESVuUP8YAW4B3inLEE=
X-Proofpoint-ORIG-GUID: iYdiumH4n0XwTrSfEVDEzL9e09t5B-c_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_04,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150180



On 7/15/2026 5:15 PM, Dmitry Guzman wrote:
> On Wed, 15 Jul 2026 15:48:05 +0530
> Aniket Randive <aniket.randive@oss.qualcomm.com> wrote:
> 
>> This replaces the fixed 1-second timeout with a transfer-specific
>> timeout while preserving sufficient margin for software overheads and
>> bus-level delays.
>>
> 
> The dynamic timeout may be useful for any I2C bus controller, not only
> for qcom-geni. Structure i2c_adapter already has field "timeout". Isn't
This is good, thanks for pointing. For geni driver, please review 
gi2c->adap.timeout (client->adapter->timeout) can be used and you may 
explore retries also in case you want to retry.
> it worth to move the timeout calculation to i2c-core, so that the core
> updates the timeout field in i2c_adapter structure, and the controller
> driver just uses this value, instead of duplicating the calculation in
> every driver that will use this feature?
> 
> Also, such parameters as I2C_TIMEOUT_SAFETY_COEFFICIENT and
> I2C_TIMEOUT_MIN_USEC may be configurable by user (for example, in
> device tree) for more flexibility.
> 
I think it's good to keep it within driver, not to expose as 
configurable. This would keep changing per user/system load, but ideal 
timing is theoretical + some offset, hence can be better managed by driver.

> Best regards,

