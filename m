Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E6AE416853
	for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 12:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792152367; cv=none; b=pEAa+StB9vKIAVK2HzGC9uaSc3PyNH+78jd8bJbDNKW1x4XAr86QhksKB8s1KHwznGYczRogheFvvkOWr3XGi+zA/hT+fe8e0STRDS9jOMnrNOLqeYNQU5A+eiBZphttfM4aTVonv7dtkLA9/nx1mlaZqgjjCBm82JYjoY6S3v8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792152367; c=relaxed/simple;
	bh=But6DdTD+w1AFKmLFPaiVXO4CeibFjccHZ1CQcy6SIk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QHsTqJNN4pMuNLv6ZmB8/bAjKMsap0H0PfedZE5aX76/UBIsCSCnn87zXqYCRbGdSo/OoQD8SZQBXT0Iwav5rRxE8gE41So1vkOfTEyGuOZK99xgrZLSvRGhBHVrUa1YM/EiARXW558sYjGRaN/D8amVi2hGkna0ENB0b20AZZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cfcN2dVl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OJw16TNz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cfcN2dVl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OJw16TNz"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GAASRQ3069342
	for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 12:06:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bWzg8bctVvqRGEewiwOX+S0Z7/Ay3Fj1IoRNJ5Ddqeg=; b=cfcN2dVl9jVZL7Tl
	kI2ddKGopHXchsnI6OpYS1SnsqYeK6z7CE4q/sMXCGbfe0cS2hqrg1eDVqcFADSI
	yAt+zBVO8HiN/nvoN4wvpIy52V+kj0mupei0pNwySdFKQf7IcsC+MA2n+Qru/i7G
	beJyo53oQKCBh6YB1fYJfM5wHnKBeAwlUFpQvB3o3a/JMmymMIxgSc0pytg+OdwL
	O+tCpulwNwGzaqb/AiTszZs0X+XlvrqgpXLFdC5swEUlq6xD/Ew8R8WoVJWT6Er+
	BchFOkDG6ZmZ6G0gDxOhvgN8ICLPmSsnVfuRHeH0wOqZ9Oj5SWC3bgnrzzZgUOVm
	nhxGYQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hba2626sd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 12:06:05 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5338a4075d3so20035491cf.1
        for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 05:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792152365; x=1792757165; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bWzg8bctVvqRGEewiwOX+S0Z7/Ay3Fj1IoRNJ5Ddqeg=;
        b=OJw16TNzrcU4hsgV22/CHgkh4GV3wPPqfjx4BabLPQhlhHl9UC7CSOJ87ySDb4NgFX
         7LnGaQW/YBfqX0Oh/WNDQHvebeDNkmb/xP6ey5KNIrLoYDjCLRE96LX1VQH71olqiCVb
         HuzDRdQ29uCsSqQFWwN9zajqBHZqQjh3joP3FHFq4QvzS+xvhObUBGptx+sGNOd8gPDI
         7HtN98WiugGqQH1lhemHuGlko+qZwEVOjiO7+O1GSpuHhnj+lKuifr2dI3a5Bf+zNvya
         FWvCq8rChtZbckzXxA0Qu0jYivUaiii15INjCxPpbNPfPVTfq/wM0igAjuLeFO3x+tkq
         GI0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792152365; x=1792757165;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bWzg8bctVvqRGEewiwOX+S0Z7/Ay3Fj1IoRNJ5Ddqeg=;
        b=SUeOdJn3W8cKyWzUKy2VJ6UVAgMYZXbMCp46InkfYaFizmSlxHamR+EFrTTEQ24euY
         ZXnJEh0s3jqYDBMtwDPS/tQqxPbtjqtUfQGCz+eurp4OfbGkY1Mn4CsDkQQDVI9x5q1S
         CueNPRLUEg0Q/5A3qiE5Ft7Sq8DjEdetEggr5HNNZ97feSl9FNAyOuZYXmlNeCmc9NEF
         mJWTOo4sVpGz849VydK6Tj9RXzCcIUtf0yEZdkP73NNtsYX27t1/Z3B4ghYgMcfcFEOY
         K/CEQuDm37bdMnBHGG4HVfOxldGMP6Es7H/b7OtF5gG1EIkdOWOfrtN2PXvRbkkugW9s
         Aesw==
X-Forwarded-Encrypted: i=1; AKwUvBzAXEWufUqkKw9x1wY0KR4Ea4tpWJc0qZuXYl4EcZfijO+FpOResY5XoAMSysRuSHugaQsc5aWU0Zk1yg==@vger.kernel.org
X-Gm-Message-State: AFq9FYLN2WXhkcmJ4mTJIlmTY0PBqrA88q5jCH9YyShevkifYgdaHoxN
	W9Tumst9vksIxl1feklnnFZT4xfnkelyA9yGePb+598HlOnXcZjdqgyhsk0XmxLANG/c8ZNHqob
	WVuUYNNzdVhwExUA9KGoTbCUYD5k9SOdS8QcI1V98y3ztgbS8VVTSwW4OH3wEySt6eg==
X-Gm-Gg: AYBFou18J6gF2Lh4YbTzQ5LmMK6CNnIu7MhIn4NJOFhwk+jzRR/rKgx9rKBeZeSogUv
	7D8WKzfqXf4QEKzwCztS1FoAZvSuPP8RalPzaGrdDAqEkYg8TTZuTLGr30h0ZVxbBtNkLEIjW1G
	tjBC6zNuyo6dB8aiISeOmimp+eWPmwzc7PuO7X6YAY1L+djePZjLVGxP5HcPP4CUpk0FjZAnXqA
	9VvvURx4nyZpl9HOUByIK8s5s089Ub6rjmzCCLo3uxoyZvnMdrlORfIPw2sJiop6+/4ZQMESpOE
	UcNbFPkiNBMvYNQ89wIOfFNFiK/xrg1r+qHTvbRVbuFcjpEjyEgjDiGdcezvNX2ItgOXTqKm2eV
	kM6d8vsOoCkwVo6MXvV7GwQ==
X-Received: by 2002:a05:622a:453:b0:536:3519:de44 with SMTP id d75a77b69052e-5363519e697mr17804531cf.4.1792152363606;
        Fri, 16 Oct 2026 05:06:03 -0700 (PDT)
X-Received: by 2002:a05:622a:453:b0:536:3519:de44 with SMTP id d75a77b69052e-5363519e697mr17803941cf.4.1792152363002;
        Fri, 16 Oct 2026 05:06:03 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40913c615esm64286366b.42.2026.10.16.05.06.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 05:06:01 -0700 (PDT)
Message-ID: <80314471-1913-4dbd-b91d-7b25bf4b3b14@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 14:05:59 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 4/4] phy: qcom-mipi-csi2: Add C-PHY support for
 X1E80100
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>, geocausa@gmail.com,
        Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        David Heidelberg <david@ixit.cz>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Suresh Vankadara <svankada@qti.qualcomm.com>, tjose@qti.qualcomm.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261016-x1e-cphy-rfc-v2-0-377654253193@gmail.com>
 <20261016-x1e-cphy-rfc-v2-4-377654253193@gmail.com>
 <010f8a27-e058-4c8b-8681-24df30c29853@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <010f8a27-e058-4c8b-8681-24df30c29853@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=bsHZl0ai c=1 sm=1 tr=0 ts=6ad2132d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=Nw1dH8mji9hsHjV9vaMA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA0OCBTYWx0ZWRfX+sXb2gLLOsOZ
 dq2fTjBwbaFAC5j2hPnOmAVTOvboXVLb7bGPw/a1VPwG6gQ12PKHM9E/W07rArPEAI2vJZJt3bV
 6YuhrSwu4E+435jDgbkLfEjtE1SSZAtkyuogAo909AY0F7wOeI2VRvvCAS63zfJpTy7S9Qfmg58
 /5u3vW34tWyDnGmfLLVmZeKIOoe+kSW/NXVw4eBCeUWYGXkMN3IylEeOoZpaNMEEwVOhmdco7rl
 TBbB4jCkUDnpGCcFIoqeaDLmOEu/wcny5Kg+z99GVQhcJe5n6kzEsK7fNosGFfffdy9vN3y7Tee
 8PyZT+NNRHfjm1teCdgpXdiop0PQZhiELzklxE4bt04ar1fAbwu+2alk4jXWZeotggdN8RJ3JMC
 4vKp1knviMwZG1T0gxrToM5W9IlJ6wLGTLNAnuiyu3UitM49dQWASxyh149x794krz0YRtZ6SD5
 66M6+PkndVBiekI+aSQ==
X-Proofpoint-ORIG-GUID: kx2Ckn3SCsze8-SZB60bDIdwZ5q50rzu
X-Proofpoint-GUID: kx2Ckn3SCsze8-SZB60bDIdwZ5q50rzu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA0OCBTYWx0ZWRfX+7qV65kFFqJ2
 Y9Ifpt/fJrw6GHX+dEWsa4jQYhMxkK7cGxy9X7cDwqpkHdrYghCQFsrVG8AdHjtdiWrViwgIP2f
 mzfSLA33nX1J/sYHzJUDcaONk7DHdGs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 phishscore=0 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160048

On 10/16/26 1:35 PM, Nihal Kumar Gupta wrote:
> 
> 
> On 16-10-2026 16:27, George Neacsu via B4 Relay wrote:
>> +	{.reg_addr = 0x0a54, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
>> +	{.reg_addr = 0x0a40, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
>> +	{.reg_addr = 0x0a60, .reg_data = 0xa8, .param_type = CSIPHY_DEFAULT_PARAMS},
>> +	{.reg_addr = 0x0a84, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
>> +	{.reg_addr = 0x0a90, .reg_data = 0x02, .param_type = CSIPHY_DEFAULT_PARAMS},
>> +
>> +	/* csiphy_reset_exit_reg_2_1_2, 3PH */
>> +	{.reg_addr = 0x1000, .reg_data = 0x0e, .delay_us = 3048,
>> +	 .param_type = CSIPHY_DEFAULT_PARAMS},
>> +};
>> +
> I checked the register settings and they look good to me.
> 
> Can we write the delay value in hex as well, to keep the table
> formatting consistent.

I don't think delay in hex makes sense to a human reader

Konrad
