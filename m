Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82D4B483837
	for <linux-media@vger.kernel.org>; Wed,  5 Aug 2026 16:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785947955; cv=none; b=tp64DTuerOm22vwZDuSMf0JIrwVIlj8f1C2wYE3cR8lPjZLjinpOy2UJm3Rq2bzHPui/c13/y3dibuo451T2Y5xdWWScDFQDI55tatWG2WHawQzDNvynwKuhnl24ULL2FP6xb62b5MzibchiXs/d4fhtXFj0A5UnqIL3o516k+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785947955; c=relaxed/simple;
	bh=dMLwhSCfvDKAKTsi/oGCwtGRuxWrdokWflsUXBRcWdg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tc80ZuKfiHN99yBDwhuOFuW7WJJT5f9NnQvSwF/P8EVM7I8vD4XX4VGmsvfQBygCcBH4TXTHXzxvUOZcbuOZtxmCToJQy8pbGC3LkQK/IYRicStoa/yYM0A9Rwr0aVz6UTUuU2/9DkIExD48hu+ijUKU58Kx793HbEXH3XVATW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZU0SjmNk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Txd8aQdv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZU0SjmNk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Txd8aQdv"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 675FVG7w3297551
	for <linux-media@vger.kernel.org>; Wed, 5 Aug 2026 16:39:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k7n1g9FKdcFPJDlkdGVuNL68K4ddHZX+Qtk5y7qzAhg=; b=ZU0SjmNk0ZCOFAlA
	GbOJQ4Q2zAGzAyp8Oo88FB6C17jz3trfFYuAzox2HAF60+BkPJGGnduE8JoXT4k0
	aTlMSIpBrWf7S1I9dLJaEFP/XygawyImk+EgkW6pv7ZxjKLY9rrtyi1G7uIsTUQ5
	CUr2KF/p8bgOTPFul/uT7n6h2vJFLosEikLkgqJggDp8P0SVPu8tEdA8hcLHTsEj
	y3m4ddMcsKK5u3+RhS50kTFKwnBIS2w6RlnhYzglU5g/XupF0ZMQZTgctWeY04I6
	p70m8bRfuz38NnrYjr5svT1TluHmqTfcemmwYW9VrxDspsH7igm6uykhpXBBu8dT
	l7Idmg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fv5x5s28q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 05 Aug 2026 16:39:12 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38105cc58e1so277699a91.3
        for <linux-media@vger.kernel.org>; Wed, 05 Aug 2026 09:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785947951; x=1786552751; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k7n1g9FKdcFPJDlkdGVuNL68K4ddHZX+Qtk5y7qzAhg=;
        b=Txd8aQdvX9kpoQBIeTaqD+gtD94pU7byeFUnQ6cFEwDO7zCzRs/n7o+g+7cV0Y+zRr
         AwkRZLVdbDQmPboAqBMzOLrMe6bcf7hOQmTt52v6HxG1ZUzTaNXgiKcjakKj0Vz/rLBS
         KkRNew5w5Xp+qFQTwyDJDKd8LPnEIm/M18tINKvNYfCdJ7wm9jOZz5bQsgU7gVUEMAm3
         jnIiuZ9YWHax5Hn0Pt4yBmjDmZ60DWb2B/5qbt1HJZPlBIgwXB4uRJkrcn3cjGSRC6oY
         UZaNuXZrBhFa7C78pPwFipnUBSEIQht9qgIqmnYo/ljJRyYRXBPTm4pveX8PY/F0QDRd
         0VAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785947951; x=1786552751;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k7n1g9FKdcFPJDlkdGVuNL68K4ddHZX+Qtk5y7qzAhg=;
        b=Yxkpq+p5GQEh0XPXq95dy7QjuSwXZ5DPJzrBKkwEXuJJwK3E888Vv3ojvQJsJmpucC
         T6kHe237ArpybIhhEzf7rxbM9NoVf5U70eTxQrsvBSuA20kpZjVp+QMJYxmE7WMfSYie
         4VlYfL1IS6sorH2hAaoV35Rc4k4SyXwqaMO92xhjy4ausWadmL1R43+7pKJY6EM9k9ch
         OHJKotm0pxJn8mq+msV+R95hrOCjxd9wn4RxYahzu5mzyceA/lqDond5U8bnFBkFOFjq
         9dsyDaOTuOB/TQCeD2GYAwtVf8LTJWuOFNqx+WN7ZS0THRQk93GGChLWjE5teo9Elub3
         fwqQ==
X-Gm-Message-State: AOJu0Yz/Q2kKNAdmuM2IAIf8l0QocVqRigJA0riDS9ovta0Q2NwwwYxG
	LDxx5D+8sBScCF6cDtTBCd+cMLIzvm36pXVI64/325zFjPvz0mftxE5WfeRbN/MzleMSUzzw4KL
	NLVWOhES/YEuHrzVpy3E/R1KSrPhtQSOyoZZXxHi3Zd+kZN4XuSvwC1G3rSiqXUDyTA==
X-Gm-Gg: AR+sD13qDO0qz8u8CbtCVIZjp02L+hqcOZNT6arTkkcEamREE5YBlV7UZH/hXgxbVVN
	wNx13sx9w1mmE3+heL6hIYEBb5kJLntDS8z+SqErEBSBk1JDDJrNOhGeOXKepsSXqiS3r5iMgsG
	zhnXpYQiu9wXbXlbtjV6z12T/XPVuiZK2qrKLst0oqh/9Mn5Kd49A5aTwixWUQmW49VTZqrHHmj
	kyOwzSQSr3NbjVIhxsLHy7Z+nAKwoW9vHFXa7a/dgZNJYJOND9yzVausmEGlY4lIAmCVSyny/z8
	buc9CtCKKmaHUGxnzRFCtv+dHz2LpBvxYi2Bpeu0MOyiJD05EER/al2G//UtfvnR5XiX0QEUQZu
	xC4RYCwVOc4TJC8ED2GE7sI6G6zuLxNh/UTaqXcE4fEGyLoykiqFpd/H71fkXmQ==
X-Received: by 2002:a17:90b:1fc8:b0:38e:ab3f:2c99 with SMTP id 98e67ed59e1d1-3903c628181mr6312860a91.2.1785947951094;
        Wed, 05 Aug 2026 09:39:11 -0700 (PDT)
X-Received: by 2002:a17:90b:1fc8:b0:38e:ab3f:2c99 with SMTP id 98e67ed59e1d1-3903c628181mr6312825a91.2.1785947950614;
        Wed, 05 Aug 2026 09:39:10 -0700 (PDT)
Received: from [10.110.6.162] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fca908068sm15419492c88.12.2026.08.05.09.39.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Aug 2026 09:39:10 -0700 (PDT)
Message-ID: <b8181ab2-77d5-4a80-bf84-2f4e0217d2ea@oss.qualcomm.com>
Date: Wed, 5 Aug 2026 09:39:09 -0700
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] Implement Region of Interest(ROI) support
To: Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel test robot <lkp@intel.com>
References: <_l91CrDl1TZCUzjX1JcRr1cgRM6CNFGa4eRe52VgXTUOOcx8yjj9YCeBaulfAgFkrnN6fCpZfpCIilkjdOV_JA==@protonmail.internalid>
 <20260804-enc_roi_enable-v3-0-e03b622a2d48@oss.qualcomm.com>
 <2fd1ce99-464c-4933-8ff6-7783c416cc7d@kernel.org>
Content-Language: en-US
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
In-Reply-To: <2fd1ce99-464c-4933-8ff6-7783c416cc7d@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: v2QKRCO3rOYAQ3Z54iBaitAK5GoXcJ3J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDEzNSBTYWx0ZWRfX2h6DcxAVcMG9
 Pu70kBIToQYCFgeCUGgC6fiZkRefbfNYwmfwC/2ta1nSCstbrBFs7m7cMwmI/Dv1Ym31yoAgdUJ
 Hi+pp3rv6sodhJh/b2UpRsQha4xA4xJsfbZj1OuMSt8i+IpfS1HutydpCq/EkZb0Hc1zjjhseEH
 G/nYrbM/q5IRoBSK4eDHHQY2stYyzbgG5PBSGJvaVagpu6E+R0Uy8Tt5oeKStA6GWr6n9irZJ+z
 BAsMn9qJOmUj9CYSOIThxFypn4d+4qFoG3B4XlF84XMfbocJnlEyWOBD4X1khixRGn9jahl6zJq
 BkefhJOhnQO8+u5W7NMGuYfAnfP4XLDpIJJ299E/Ov4n54noA+Yi0DdnQh1gbYpNDueEFX7sL4W
 X+4jsKZr2HiBSnnAb3R+FQUP15FSXf6A7DytPMaunEdsJAzP7/yPWUSSpq9ZFjDULzZ1NK7dN7n
 qdUQeD/jtYeIIY62lNg==
X-Proofpoint-ORIG-GUID: v2QKRCO3rOYAQ3Z54iBaitAK5GoXcJ3J
X-Authority-Analysis: v=2.4 cv=RcygzVtv c=1 sm=1 tr=0 ts=6a736730 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=lqE17rhkgLkBxHscucYA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDEzNSBTYWx0ZWRfX+6/yf+5T9bEw
 /vWi/w7yU+YNz1ShVdsTewwDxRkIlUcxzxsdHcHzDy74Mbp8OdJi3FSlfVM9OPshG/e5yb7Ewsm
 gCy5VDAFk8rET7ym8Mm5MYXdALYULrs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_05,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 adultscore=0 phishscore=0 impostorscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608050135


On 8/4/2026 9:09 PM, Bryan O'Donoghue wrote:
> On 04/08/2026 21:05, Deepa Guthyappa Madivalara wrote:
>> Hi all,
>>
>> This patch set implements region of interest(ROI) support for
>> video encoder to be configured as a MB based delta_qp for
>> the whole frame. Custom controls V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP
>> and V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE are implemented to achieve this.
>> Corresponding support is added in iris encoder to implement this
>> feature.
>>
>> This submission and design is based on the feedback received
>> from community for the RFC[1] series posted earlier.
>> Initial testing is done by adding support to v4l2-ctl[2] to test this
>> control setting and its functionality.
>>
>> [1]https://lore.kernel.org/linux-media/20260113-iris_enc_roi-v1-0-6c86eba38587@oss.qualcomm.com 
>>
>> [2]https://lore.kernel.org/linux-media/20260616-enc_roi_enable-v1-1-252792d27894@oss.qualcomm.com 
>>
> as a sidenote can someone in qcom please, please, please do something 
> about Dikshita's email bouncing ?
>
> "Address not found
> Your message wasn't delivered to dikshita.agarwal@oss.qualcomm.com 
> because the address couldn't be found, or is unable to receive mail.
> LEARN MORE"
>
> Understood she is on some kind of sabattical - hope she is enjoying it 
> but can you guys either remove her from MAINTAINERS while the email is 
> bouncing or fix your email system to stop spamming responders with the 
> above response ?
>
> Everybody responding is getting these bounces...
>
> ---
> bod
Sure, will check with team internally and do as they suggest.
