Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B9E38AC7E
	for <linux-media@vger.kernel.org>; Thu,  6 Aug 2026 05:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785993854; cv=none; b=DRkE+fZEkSj+hPCIdcL6VqYEPkVVhSv2Dimcn9U8cfuI4TAwnGrXyMaaMuahArjknnWSRZhUnlMnqi/WPLtG3e5WzDyYBHkrn05uiZSs75uHmWxH6DfqS9T+ew/lVFkO4LKpoRW73+e30D9rUkdi0P0ximZK5Ny0ppzFTKTDCuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785993854; c=relaxed/simple;
	bh=p6r0qHV189FrJR470EN/DsJBccW3oIdEgcmun4e4osc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hM5RZs2DR+oNNVBZxrB0E8fT3PuKDhN12yc3k6ZBZ02LIGWfT0azd0H8n2uqAwKcsztZApRSyOYMhAKPvrWICiTFiuNmUZ6URFx5ZjqfTqVz810h+bYojYwNFK09Ur1cfdbXmeQpUaiqQAREKjuVRbK3+iGcBtvIXQUqnc25wuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X3CbsAkr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B03ncwWr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X3CbsAkr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B03ncwWr"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 675NbLwF4138251
	for <linux-media@vger.kernel.org>; Thu, 6 Aug 2026 05:24:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q4FnFzLuhOxY4KqHDjWQrowenk8GN1bq92AM6ExHsts=; b=X3CbsAkr9Orrx5oP
	hKQJzDa8BTMJJL7D/rt20tPJIcG54rbuWCCZ0UJ0Mq7YUUFvKHSz5kVpiaNPGQHD
	5S61VZ6BOOt2fan5mZTFBkqsvfwSvYtkLpCVEMZxgGGM306EhkB0F38MfLWp2uZ1
	bXtcuK2RLgHd0ztfwAcnM3lkBLFLSNTrxUxkeKTwwseRPjR2/nt4Zab+4n0OeewL
	iRfT/dGbSwQBqi5Br0IEy9ySGOZNrQJWFvh87jWBzsWAyLOzWjinHF9206AmjxGc
	mo3XsSksNaYUSZVORh37U9bDlF/CzQ0xPStjko9KbFiqj+yn/+ajXD4bat4+Smu2
	kA88Jw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fv5x9upmv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 06 Aug 2026 05:24:12 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb835525b13so2131337a12.1
        for <linux-media@vger.kernel.org>; Wed, 05 Aug 2026 22:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785993851; x=1786598651; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q4FnFzLuhOxY4KqHDjWQrowenk8GN1bq92AM6ExHsts=;
        b=B03ncwWr5XghwT83xUQPWjmZhAZDb+4lIWT8UXMi3KXQcXY4PXYIqmMS6iHQvbAXuC
         Jxx0FmpL0po5vKZlJfqjpib/ZKUwnw+6uAq5/iaDPy2nP0Va8QPGddmAjmyhmwaR+245
         XwBBWZ40Jo13vU7IGOcdeGW+pthC7U3bvAlsQeUcPLRIyRh/O0Qf4yWvhnuVtHj26pQK
         zoZ8q49ZXyHAl+AKyXAHTw9opI+D4pYGgalmT+2HLLCejDNdV4/SVtvuZGcL1Q/79yMM
         xFbb7Ob8ggK6ldNq0tMgPgt4uRUXxlEwcUQpq56ILdYp3sx5p5exfyY8y3XZeEc4Un8H
         1YKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785993851; x=1786598651;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q4FnFzLuhOxY4KqHDjWQrowenk8GN1bq92AM6ExHsts=;
        b=qxp3HYydqT0GoUaxHVWoZPbYwUqVDbbFRr3ZfLDhGpIbKBgqbd0bJ63AHY5HYQP958
         JSxRXc2PaQHEKmnibiYRIGt6/dFHNA+kcTh7tJuEKOvNdv8b2tTtZu6ylsF6/l6RONkd
         FwgX6eq++alFCwiQNp++MsnWpod5TjS1KL354Ecp+2GA7ffuLs1nLq/Xp9nEMqe0sCXX
         j9TVcp1UI1QgZS8ApG2VWS0C6WL+Kau1yY94BParZ9Fy/obKrVu8RwJmUjKhQ95b1oSZ
         J5ZSpvq7OUkVWQITUsoyrzd54zwiLKGAOEEZ1HwI95XZcyVWsswshmPekhjnQtA97StL
         Hpaw==
X-Gm-Message-State: AOJu0YwPPwrNywSHCrpfXP1LO4e0vpAm7F/OJUH7PSL7uk8zllmjzOMG
	uE9DRJiIXJ3djdlK/xu5DGFdDzkQ7XxBPAWtrwG8szdiMjUZe52928ZeD6iQ9L1VQ46P6SwmPqt
	9208Dj39d06VDtYBHPz/Hc/fhGejVbq6rnTJ1tzicZ7XSGHkaQgLbW/cfbzqukceO1A==
X-Gm-Gg: AR+sD100Xh9gPnpwm0aEEBGaUzlj8iOGIMNudsToI011txt9sw9a7hy+ZA8vTGS7kgr
	j2hysT2PCoq5pYae9iI3PLIOewT3otqjUxnGBj19D/5UNK/YF1vm+qtyc2XOmdIvL1P7wL74OBe
	oebqIj7xY2WxZugHJ7NrOlw1451e/aff7mQkxMTpTVvi0U0kEbTOorPrlVO+7y78Ykg7q/pE7++
	oqXul39Qe4aZGFgDmaKosi3e8SrwnzzS0b4a2zbSsxOpRHbKTxYdStxp4CF2kIIuLUt+h4TWlNb
	Pq0SQOdYa9I2V/tgG6EnOHFutStb/5XnUchNR/XxoBzxZ1HdhobJnaMmmRmjVp855szETv/SQuB
	5s3OORK+YzS/UBXIMIBAyI3OYPkQNIiIrpw==
X-Received: by 2002:a17:90b:1b45:b0:381:c500:b0d1 with SMTP id 98e67ed59e1d1-3903c67aad6mr13025543a91.20.1785993851064;
        Wed, 05 Aug 2026 22:24:11 -0700 (PDT)
X-Received: by 2002:a17:90b:1b45:b0:381:c500:b0d1 with SMTP id 98e67ed59e1d1-3903c67aad6mr13025506a91.20.1785993850637;
        Wed, 05 Aug 2026 22:24:10 -0700 (PDT)
Received: from [192.168.0.173] ([183.83.140.67])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fca9111b6sm20088364c88.13.2026.08.05.22.24.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Aug 2026 22:24:10 -0700 (PDT)
Message-ID: <2abf15f6-5f63-4433-bb31-0c1e9b0f0309@oss.qualcomm.com>
Date: Thu, 6 Aug 2026 10:54:05 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] Implement Region of Interest(ROI) support
To: Bryan O'Donoghue <bod@kernel.org>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel test robot <lkp@intel.com>
References: <_l91CrDl1TZCUzjX1JcRr1cgRM6CNFGa4eRe52VgXTUOOcx8yjj9YCeBaulfAgFkrnN6fCpZfpCIilkjdOV_JA==@protonmail.internalid>
 <20260804-enc_roi_enable-v3-0-e03b622a2d48@oss.qualcomm.com>
 <2fd1ce99-464c-4933-8ff6-7783c416cc7d@kernel.org>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <2fd1ce99-464c-4933-8ff6-7783c416cc7d@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDAzOCBTYWx0ZWRfXxubUn+ip8J0j
 frcE6nYVjBr/BbjkYmOe5Zf3qBL+X1uaGRoOM2vHX8Hc8lUUfSr5Maf+/3KD9Ole2XWGpzezGZZ
 MxtyRpadOQJyt8ez71h3eONG0XXDA9u+EtoZFCp1DmxGdC0I9ooEMPBK8BGJ4Z4chyLwB5ffE7N
 CutyuEXDfZi4o5MyrIkX2WffcK5U8fgmRTMg6I0Nd/zgooh3eeNTDG+isn0fqh+aGfgfpfN/1Xa
 +cSLurgPDgRZFYj6ZUBJoXy91nO48GMDyXxFRkY8gjTZmC5TbjDmHfAfH+7degxy4uOcCzXoBDf
 kUl+ObG59bfZSJIZLwWrbSjSOtY45kep72XuhJpldPDkYA/HjepcwL0QYJwow/Oitsn4dA0T71h
 hu0VzsCVHrSRWGptGyPjtt93AeqncgAnd4fCWn2fSyYK5LaU/b5jZZUcccD+DTflGFPKuScJ1pw
 B9zWUd37i9Nj9tCbh5Q==
X-Proofpoint-ORIG-GUID: raULbMjm9frNfvxPiLSlqeegmx6nvOVq
X-Authority-Analysis: v=2.4 cv=BMqDalQG c=1 sm=1 tr=0 ts=6a741a7c cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=kGzeRs6aa4G/VYrSuZk26Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=lqE17rhkgLkBxHscucYA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: raULbMjm9frNfvxPiLSlqeegmx6nvOVq
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDAzOCBTYWx0ZWRfX8kBBMJpSeXm4
 9M+Qk2GML0LUl/W2LWxYGhVAlM0Sv8xgAR4F8fXvPLrQ02mwSbnyC5DVnLP0+7lQ/nBNI+SDdBa
 6r5D9a647gRyqRoO/34tcppqLLPVKcg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608060038


On 8/5/2026 9:39 AM, Bryan O'Donoghue wrote:
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
>> [1]https://lore.kernel.org/linux-media/20260113-iris_enc_roi- 
>> v1-0-6c86eba38587@oss.qualcomm.com
>> [2]https://lore.kernel.org/linux-media/20260616-enc_roi_enable- 
>> v1-1-252792d27894@oss.qualcomm.com
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

Last time when i got this fixed, it seems the senders from 
oss.qualcomm.com do not get delivery failure message, while others are 
still getting. I wasn't aware of this part, since i was not getting from 
oss* doamin and i assumed it is fixed. Let me followup for the non 
oss.qualcomm* part.

Regards,
Vikash>
> Everybody responding is getting these bounces...
> 
> ---
> bod

