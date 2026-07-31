Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA3AB2E7375
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 07:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785483442; cv=none; b=On7zcT70XR3pa3ILY34198xBiPJpptHUGvCQXG6yjHHMJL3Uk6pdsf7/5pTxRVey2P6RRLd6XxhSsZQZ+KJvruk82PCbU8rbPV3gxoB1+9BdXC27lQpaiqwB6XrvNsp/3nizyJGL2eGMgWa7P3rAWIEAS2s1P8NmH4P6qh9jXHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785483442; c=relaxed/simple;
	bh=M/h/HXxQevNZO8MyiWwHtH4v5kkXGmFU9MgvzXsH+pw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H6Y4Ecsv4Jvnz8OiZH4oDlOtgYgHKURrV9hG8s9GjgHrMJ/cZHRCT9dvZQ/P5qkgo7DvxMLXqgAMZClmspMc4IzW5nCHkab6MH4gQg0SFjcAZVFTuOLT0tU76mDtW6MfbgBbXsPX70SpP54jCgHoRjmgxLrAPFLiGaQIEsWGPDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TrCHzdrL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a0MPsyCC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TrCHzdrL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a0MPsyCC"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V7HDRa302396
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 07:37:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	96O+6qmFGL3L90+ljcjNqYHYT6VNKpx+yp/U8r9URvw=; b=TrCHzdrLmx+tqUPX
	pOGOs8PVZBVRgGCzBVaD7BqA91GPzMnEjv/ko3a5EzlbjxfO1YjVXM9YNvIz9dpg
	w3WvYRjh5PAbwD3Iw+ZZdONFrJ6EUxn0WtEvavw0tddL4r+UhCgTH0qcx+2g8RWu
	TUjjXzKuRyZ29w/iEWtMQosLXqJUl6r8ueja4cGg8evmlWQho/yMPnn+/isF8OXY
	z8TQwMUfjQq0uO6eAtXAhxGAfVOyI9WBFKlNbU+LXI9gHR8tBLrPS8UhNxIpM7Og
	rHQoBd0avALBCAcf20g0t33pQBpy6+RUlGq8+taENsbJ3Sc1qoETEj/ZIBorG1Hq
	RV2ApQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frq6dr25f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 07:37:20 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cb4cdf95b5aso1246011a12.1
        for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 00:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785483440; x=1786088240; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=96O+6qmFGL3L90+ljcjNqYHYT6VNKpx+yp/U8r9URvw=;
        b=a0MPsyCCAXONlJX4upNDzEl1xgUqOkfUg1HZh7Kf+PYqSD8X9b+hD1WTfyfFYiuwBX
         gIeMcWPVZEMWqILZ8DJ5XN62xVQdyO0rKZms3wzduT6T3Eqe7OP7tIbncJ8TAR4jWLmp
         RBhn7hQF7nmZBdO9xLrKhOnLfvjlmD7d1tE+FtTWM5pjDatAEZ8CErG9n8tUMSHj0TEi
         ZVfZ8ARn3JMhklonkB84lC8wWnId83pSb8PH7Tt+lL/xFa7ZXrtmQGcFjpbywIr4dCG8
         pxVwSY8k0H+e8eVP3jgKPvbrpNlRYlrdCagUe5OD3LR2XDFWsN9fCKvL4pXWu1VKwXj2
         TxSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785483440; x=1786088240;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=96O+6qmFGL3L90+ljcjNqYHYT6VNKpx+yp/U8r9URvw=;
        b=AzJMImRwp6sDbkhsBOeLiYNGuVRxXNq6LHwdAy14mfFazu63jZVtzy9CgUu0qDSXne
         nI8nMiTxLPWEtkltjOeBqkVe7H9sy8ohl2+84R359xw0veBcii/f8U6WUO+8GgnPCVlO
         x4+oWLDcOjP5zU+i8YJsXgys0qVnu6xrAvtGwD44ZRQip3CBL9bSicSmVgCZvmDlDAc1
         C1TrLYwbsD6SSjQxAyZJqETUEe6MtB38b+i3Khe7atqkD+5ENZpDJLMv+0HORICDvGjg
         wN3Q0U4Jlpiu4mUUhml6vp5yBrqvKb+hSYdu2tdgJhanXmE3uaxd5tWfF6b4lDgWMpAE
         MAzQ==
X-Gm-Message-State: AOJu0YwHcQX+dp1DwStsqdJlN5a5XmSsebIevnJi06SsWMNLQfT/Ja6o
	4OPLT3QDXAI1V/ISkodfKTpZpcDZDlcZDvcr9LqCsiZ1SHMkRjsuEX+zEAisqydU7EebL+1ZKnK
	/gsUZ74GJpZlDRaWqNWwaImKTfJyyCagrtvttv/bOJhizu20m9MlBIySZymy3zUMTeA==
X-Gm-Gg: AR+sD13/XpyCktku7KY2LvDGH14FbC20Gtumab8uyKlgBf0L4yGexMJXB5mqOV/InbI
	H4/ez9WesuNoIsNXotiUUfEK9wYmvkk1CzJVvqe98q2PraU6khKfCXYuzgGyj2BGT75xwi6if9X
	QusFtz1YCC1TUePQ7onE71xGwMUpDtSQYbXlLex69uUyVGeG1mJxUaqTJhQKjYe/P1ld3N/ABL2
	wqsql+kloiufkPBQ4wd8r3o8nBwYn+gd5iUOfQG+IET/OWFfW0tGXO5DTHaL4FokBAKxkmNbJr5
	iyHzOMBk8SkAq+h5oHJZza4TjhLVGwPKQPqffdA7A+dOLAacEDjwLxxBgnlUp/6sohH5hAfE8i+
	V7xycJb/HhiaKap492/xffSOSChA0RgCZD44=
X-Received: by 2002:a05:6a21:6cc4:b0:3c3:6c90:65b1 with SMTP id adf61e73a8af0-3c91b15569fmr889124637.25.1785483440266;
        Fri, 31 Jul 2026 00:37:20 -0700 (PDT)
X-Received: by 2002:a05:6a21:6cc4:b0:3c3:6c90:65b1 with SMTP id adf61e73a8af0-3c91b15569fmr889108637.25.1785483439905;
        Fri, 31 Jul 2026 00:37:19 -0700 (PDT)
Received: from [192.168.0.172] ([49.205.251.199])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e06fe9fsm2377772eec.25.2026.07.31.00.37.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 00:37:19 -0700 (PDT)
Message-ID: <0ff4bd78-1536-4246-a4f1-91f8294118af@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 13:07:13 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/9] media: iris: enable VP8, MPEG2 and interlaced video
 support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260709-iris-vp8-v1-0-6af3ab578a7c@oss.qualcomm.com>
 <xbvyccur5htwxzxpqywtnh7orm6gwjxqmfh7qkzb4egqxhfv46@ilvrnxrztdbv>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <xbvyccur5htwxzxpqywtnh7orm6gwjxqmfh7qkzb4egqxhfv46@ilvrnxrztdbv>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=CLIamxrD c=1 sm=1 tr=0 ts=6a6c50b0 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Am0+rXbGVt9FyytbsJdRwA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=3DCSY4Mj9CwNLs-masMA:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA1MyBTYWx0ZWRfX73pQkebq7p6G
 9HXhH6cK/Lm/lyliExkHbvTrhI9uV5SxAaSVESh+CYlLhmCZ3pz446jm6zcbo0/hPKIJ6Rav0G/
 pPrQ8zilpJEpyE8JWAKOYoVE+xsDPj+90HAkZD7Th4xirOkEv47EZ9JmdRxAL53vRXaFsvYuMtB
 pRAkNd/OIvXGLd2WSXoE5OcaKv5/gHckHBvPE4UfaUmhQ3XQszvHggrOSJCXJI4ceO9wK8J/hG/
 3GKn94GOOKmaq3l2uy9+0Kiku3hePiALzdJRFZ0YSCQGeuM23L8ZwfMMOhVET7J/i3cGuqMNQQE
 c/pj0Jmn8j0+F6478oSe9bZCsldGbQxYBDQpMDMClVwCBjrKnCxouO0XuRJPteI5hX9rEIsM1pL
 1XnEY1iHWeD1XU7uUXXWfZf2ghw3nzz1adeP+bJIvU+3iJyYpwP4hSqLxPC5FyZDHkw+LKG4CMv
 RI8sPRjj33jZBL2qCiQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA1MyBTYWx0ZWRfX6y3M2nLdFWLe
 7IzrBiUkDg9ARrxBzmF0QmhOXFFv2laDuQJNj+jXQJVDhXv26fchpKt1hsyQ1u6pzFDSqPtj8zH
 glU5hM0mvFFvU2CvVxlvEySb7qgqWEI=
X-Proofpoint-ORIG-GUID: V_ubZHRy3Ntf7nidj3E0QMhM54pRBTS3
X-Proofpoint-GUID: V_ubZHRy3Ntf7nidj3E0QMhM54pRBTS3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_02,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 suspectscore=0 spamscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607310053


On 7/31/2026 4:22 AM, Dmitry Baryshkov wrote:
> On Thu, Jul 09, 2026 at 10:36:57PM +0300, Dmitry Baryshkov wrote:
>> Bring back features supported by the Venus driver, but not supported by
>> the Iris driver: VP8 (encoding, decoding), MPEG2 (decoding only) video
>> support and also support for interlaced video streams.
> 
> Dear maintainers,
> 
> This has been sent three weeks ago. Zero reviews. This is hard to name
> as an acceptable response rate.
> 

Acknowledging the delay in review in this series, and my sincere 
apologies as this had to wait.

I did not see any sashiko reviews in this. Is this all clean OR the 
series was posted before sashiko was enabled for media patches ? Incase 
later, might be a good idea to respin it to get the feedback while 
manual reviews gets in.

Regards,
Vikash
