Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E23A352015
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 16:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785516956; cv=none; b=P9sVkKOgWTS4YDf8ku1lL5dWN+u0i2xIDCQV0PvuiwsBHsZRSPbdzywMeS1iI4pRWaF70iWS2PoGHLKXFYWYyrQ11+Y8iqzWKpFfD02dJ4bpPMdgTkfX7tQlOCwdmHVLRILTS07AMI3piCmzvDDCRh3C1KeQ1xVOXrKmnx9tiOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785516956; c=relaxed/simple;
	bh=vNQcuHZwnfBcaqBRKp24fl+ic099dWBRsaw7Ei0waQg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uINtsa8xT+P+9e3HByexfD/lLiQkuXbNJombkPaMYnXrw53pyu0m0qD2Uy+PFME6/fc8Z1lx3iPbrcL+hG7NF8xXdSr9LPVRhTjz/UQwlbBkQaU1YX227EEiqKBORxtD+Wimuf2DLYEQWMJPuvqzoo8G1vg37wWwkL0aF3bAqGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YFdMV4tT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XrAYa2nR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YFdMV4tT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XrAYa2nR"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VFONcG205498
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 16:55:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8/wy2Wv/9rNwpuSJ2n6D4naMTb2qPF9MQec2tA1cdJA=; b=YFdMV4tTcXF5RLtW
	wD79XefII6C0bWPZAykN4hpNtvSajCMxrMvzT9OpnB4ruQq/crUuTE4dxpwLNen6
	FdIjlkNK1Ma8yjAiQ4D/o0PW8JX8b86+Pio1EWa9sD8GNEGjjOjBtuSNxDJlpxU7
	KEotBtT3ESzEYvPlwRm5c3Ity0MaqOrQFLS6zh0ZOu2wErn0snB+Dik2lGAT4ZWc
	HzTNojJbi/kquXZ6tiWcLs8J2FaxYFDrL/7MgGoV61rmpFJYMLHavdpLrGmtXcZU
	vg8I+X3K4JWBXaPOPhegdCq6F1Xl+uEtEAHoPeZGkniLuPBRYn/QC67vZapQmnx1
	TmaZJw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fru5dhdn5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 16:55:54 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c07313be5so1818681cf.2
        for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 09:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785516954; x=1786121754; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8/wy2Wv/9rNwpuSJ2n6D4naMTb2qPF9MQec2tA1cdJA=;
        b=XrAYa2nRZRBX4Iuzc6ZqvJyq/Hne1V0FKcfncJzFIfcu2syAl7Sixxda/1VMF31WE/
         h+B5GvzkPRjXhn6Xpl9Qhb50oHe49UnQJ8+s4DS7aixdusm2m92rEtAKFXoHWQCHir7z
         /qDs3X08/eSa3YjFohtKFuVd8exgvGtprsTPrwWbVBGp0rkfUS+bdvi1H4s8HJhY/aI7
         WxvbZ1JNjbNzzKz3uMNKe2eeUrepPJzHctdHR5RW+04r6H7E9UgQn1DCPTo5dj2uZAFA
         8r5gprq2ObexvOcJs7S8KhcCnX09XL1lJVov+S0oc4Bd4eg51cQ273qBvxUIx/hJg6p9
         hR7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785516954; x=1786121754;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8/wy2Wv/9rNwpuSJ2n6D4naMTb2qPF9MQec2tA1cdJA=;
        b=CsUoLOa6xRmiO6o5wvIfy/D5kPpWB/vJsYFNfR2E3Ow5skPqSbKvqryRi5cuitrYBD
         gsZAVH33LUCDAn+v6heBvsY3UwRzEMFBOE2nRVdudrZU96ebHEFmqF68YjQcfDv1cc3y
         XfrLbhhH/ZnOtalmBBHJN6TTr1yzAAcxtn8vEQSJeVpfhNJgWUn0m5Yh8N+4c7+6dc6L
         i2LZ4eDPVroxO0CqNIYaTqR1iw4J7vGMu00mWgw7m2a+uYmVMVyP3Dnb5zb3hZ96PA+A
         HDq5IpIGJ9PAdT7OeHBdXz1CkunfxiAfEjBxgoYc8OADGOiwFUfHjaYOSnenu/Qfhclv
         7p7A==
X-Forwarded-Encrypted: i=1; AHgh+RqU9FR0xvs26yuhm4BpKOdmxLiAOcMlPbHvP/yL5jAMVeph4EngiLSCbGHMx6E60NU0pH1WA5Uh572+qg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwOIwnN2wfE6zUESbpufBswUOJgTIgHoK1b315ET4HiLumQcrbD
	zuJnTkrNEVYcLdCOpM4p4T0h9+8v8dQHYrCd8VSK1D4CaW7eJ6koU34ve3Gb4CXluAcD1/y4JvG
	KdLFhF+PUBaIAGckbverEfXPHM3qKU1UnPAWDyr3631gz0eLYqv4u9wwyBifDZtoT3g==
X-Gm-Gg: AR+sD13Okpv2olvzVyxuhcoH8y2tPkH1oy1pzDuyriDWC41PvU27mH3GV+HEAF82m0m
	saGXam43+Q45eaGBCqc2Rb9jk8I3x90G1YtCFlh45NYY6eDvyKq6kqBVOUoEOlm8SU9Lgv+Myi8
	iViezKKkp4OEv30/dSgGJYcBGrqPaVjp09N3YkyU/ywCd/SKtLLgUaAIDmmqAvuFHU1M19XtfDm
	I7KV1S34XwyELBQD2BcoS10CW+hT8s3b+d1LwWyWWGgjjBNXuE8/grsR3YktP9txz55JlMTGbAO
	nH65IkSS7Gp4ibKsGQNspcwxDf9HU5vJYZpkjgLl4Rj0R/hHBbop4nmv9huF+sT4+GhA/3X3HSg
	uDOXqRS2P/e7rFh3tkE/kkmG1
X-Received: by 2002:a05:622a:791a:20b0:51c:2101:f0 with SMTP id d75a77b69052e-52b566f6530mr10087031cf.2.1785516953766;
        Fri, 31 Jul 2026 09:55:53 -0700 (PDT)
X-Received: by 2002:a05:622a:791a:20b0:51c:2101:f0 with SMTP id d75a77b69052e-52b566f6530mr10086751cf.2.1785516953414;
        Fri, 31 Jul 2026 09:55:53 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a09c655626sm2944226a12.22.2026.07.31.09.55.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 09:55:52 -0700 (PDT)
Message-ID: <4f02329f-1c0e-4684-96bf-e71eb5b73cc4@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 18:55:50 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sdm845-shift-axolotl: Add
 actuator for main rear camera
To: David Heidelberg <david@ixit.cz>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Martinz <amartinz@shiftphones.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260730-dw9714v-v2-0-d5da19e6c60b@ixit.cz>
 <20260730-dw9714v-v2-2-d5da19e6c60b@ixit.cz>
 <3ac4eb1b-348b-444a-bba0-e4c64d5b57bb@oss.qualcomm.com>
 <b9afe038-dfa3-4927-adf3-5b99885fb911@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <b9afe038-dfa3-4927-adf3-5b99885fb911@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: tdoan3xCcL6Gy2aPaZmNRIIj2AJHunDk
X-Proofpoint-GUID: tdoan3xCcL6Gy2aPaZmNRIIj2AJHunDk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDEyOSBTYWx0ZWRfX0gGCRhYOvcGD
 GK/337kiSSdNHTxjQLscU16xHTfrYPdrzvbugMRDx1SaQ45FujFWoAKiN7y1FQO9xnhQUw56iYa
 2hRElhanplok/czTuRy9/GcINRWa7Riapln7fj+nDlVcmmJc7LGBETNbl9aemk2oH97Ka/4kBKd
 4m9FMOOoZd7lDSZwdvUV0Bhb2FyVQxT3X4CeXWGIkgs1pbO/+PruUD5nzyAORj2wjwNXqcylSsX
 9//SgUin/CQ71ipGYwAeNqDhyI9blK0HIQRwgjrF/DJZPBawPI+CQ7aXepRqnKw6ZJg/tOL9XNL
 0Ndn+D78wGK0vXlVQ99I4mGT0/X8RIa2AHJ8KsFA694tirnkCu7IM3zHHEXOfa0cOxEQnTt6Ja+
 D09KYmasFVtiNhioGCqrGiaM+VD3wx6ibQeDFLpivj5icaMFf+xa1utj4m9kt33vjdACcmQDZao
 rsCQaU9a3H8us+CV7Hg==
X-Authority-Analysis: v=2.4 cv=SKZykuvH c=1 sm=1 tr=0 ts=6a6cd39a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=6WajdqW1cDUHmqu6UyEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDEyOSBTYWx0ZWRfX+wxic4hFXXkW
 5WgD+PAb/DrevEWzqdvOE3ci6p5oZb6o9BxpxZlhm08TXSrWvdUMBPLwnUfo9q34+Xj/Yhdrau/
 BB3XXKQxq2Hq58EEgw/MrmBVz7+eCJM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_05,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 adultscore=0 impostorscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310129

On 7/31/26 6:46 PM, David Heidelberg wrote:
> 
> On 31/07/2026 17:41, Konrad Dybcio wrote:
>> On 7/30/26 12:20 AM, David Heidelberg via B4 Relay wrote:
>>> From: David Heidelberg <david@ixit.cz>

[...]

>>> +        /*
>>> +         * TODO: This node represent bus supply to the cam i2c module.
>>> +         * Others DT do in similar fashion, but should be addressed
>>> +         * by the bus-supply in the future
>>> +         */
>>
>> I can't quite parse the second sentence..
> 
> I'll rephrase, I noticed that other device-trees where there is also i2c level-shifter also introduce always-on regulator. I let clanker check impact on power consumption, it's likely irrelevant, but in the future would be nice to have proper bus-supply property in use instead of always-on.

Aaah level shifters.. got it

Konrad
