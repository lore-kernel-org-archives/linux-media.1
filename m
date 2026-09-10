Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFDA63C3BEF
	for <linux-media@vger.kernel.org>; Thu, 10 Sep 2026 07:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789025675; cv=none; b=Ip17MuUrcIdxgxYFcfIiEyiYxfNizyDngXLcmlrtINxouzNWJUNn/DkhclWJSWBwdm1ZbLX27+ps9i4HjBS2pSACFPu+JfLBCmq7337VK+MtqHXbMG4G4X2I+UcJaVNecImkuMryprZa7u37fr13ZjS6gTSMn/kdwrpPenatunc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789025675; c=relaxed/simple;
	bh=HEpcZ+N5k/PBTaFR1jr8ti0Jo5CNMvvcXr2gyt00KqM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WcCC3v2G3jBR/Hr6nhSK+yENqhXv/+hjdIOuEDbOjgkvCyhjwTrFUJKZGLDLn3O37ZZ6PdoZOKmZGXWQSZgRDDyNNCXUn4BEu3TpPa2YX/vWuknHv70HaVf+C8pizaOotBFCssvwxmOf1nDixMwBhutteHu2c14ULTJT8gJh6Cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TrA5ADg0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=csBBOZIW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TrA5ADg0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="csBBOZIW"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A5Gg5Q162371
	for <linux-media@vger.kernel.org>; Thu, 10 Sep 2026 07:34:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R2sagXctCRdeY730etUoIGYaRKPWzNI1J5euw6/9W4A=; b=TrA5ADg0NJhtoRqE
	ZlEPBPOMTpb+ue8Y66UJYYQBotv6QHiYsoFk9z07cELpmkBGucU29FrwalCOhNVF
	wGDUO2Y13GrYcmzM/Eq/IbzXHRnwlCgeh/SVxusBdfr/Jd/0dhJCQayOlRnRrIni
	FREJ91rqmWbaeDtTbgdZ+Bbq7Tpx6xS+fPO402w3KNsJQKzXjQDA7Q8xFzKJYtYY
	l7cLDOEjfsko5ZBrUxedl8t3A7KRVSIQjJBH0nlLu2K6UZI5wzkePI4tV6UHCMNv
	PgB6En1yJMPis8ld1pmzJ18uYlsf+UYM40yLwqZqKVgJXLtMLbBMuj1zxFlK9vNq
	qzi5iQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcyg2qnr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 10 Sep 2026 07:34:29 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-53088a3939aso72526071cf.0
        for <linux-media@vger.kernel.org>; Thu, 10 Sep 2026 00:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789025669; x=1789630469; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=R2sagXctCRdeY730etUoIGYaRKPWzNI1J5euw6/9W4A=;
        b=csBBOZIWdxksM1o/N54HBuWqmgeUPLUMqjDRadjWoTo46R3FIsnS7HUXIsc04CVg/X
         CJ03SeI1EdR8KjqHFM88GmR+xJT8Fu4jErJ7ZnapqX+ABlguFKc+ijnhlQ7FRhHolLT1
         YUUKNy+GKieEAOG5pX6GJtMaIeuRX6bR6aFOJXlLhw5TA9r5QVNGYSx5Rk2HLh6oCOOg
         JTOM5/7pvZVz0sLZptx8cXME8ogIayPWwEbKR8GlFskt8zTFg3OA6QoOl8gqUgDVUZYu
         jhz5b5rO+kArsFKKoT8xPYILamNN3mxW9/dPdgWE2pg9m5emqgN87QU2YZTHKt8rddb8
         VzzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789025669; x=1789630469;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R2sagXctCRdeY730etUoIGYaRKPWzNI1J5euw6/9W4A=;
        b=HQjj0yDL3AGIsFKTC+5squRWxcvZ1RYy5jhIfIViSOUZnHD5r06Y5hPyrOHY5RRhyf
         iL97Gbe0+O6Zzs91CWimlsdmKRAFGFz/R9rXrLe19xDx3oEKyz8yELrdTFbtJ5AEKq/P
         lpHtb5m1TwVwB0MyxrSh3CM7uP6uGBamRXuff+ftKxT58FTX3VmtIDo85Zb1k4tnUzLj
         SGuxAldQDl8MS3zCcc/KBXpKKuaHtd8d3nOVu5l3avVBkDHZjPjMsdJM+2CBbuWATU0W
         J/kZUdJiiuyHqNmIAMWD969Grseu0Hq68CeWie3FIx0E70Y1UheeEp75ZjZzZJVkImWY
         OUQA==
X-Forwarded-Encrypted: i=1; AKwUvBxpZrj+C8iuKKVmJGEDaav/0EooxyZ0qaMsooGfLrt/rPCDqfQ6VpWNZjaomkW5YWSQZlgEU4nta3PMWA==@vger.kernel.org
X-Gm-Message-State: AFuF++kHxG2HDG0YgH83RQqOHVShDi7DS1qDWE2CR/BndRVmQ6dRG2nV
	wrlcfVSSrkudppzxL0LYM+XTKDOc6/vo2Cqlp4LJm0xOE+hXTytiG0NAVwYDXBXUwt/wMKnBgdh
	IhctjWY4gepifwAiuTHVVVAUDe4NWPZDOVo5HqpHS87V+9XodC8HELBivtYw5gzZPkw==
X-Gm-Gg: AYBFou1X/fT5MAbpDE3LaGP90Pih7wyKAeCLE7qOqAfIwcOOWJNW7sqcRmNT+pL0d1U
	P2ZLH8/V82JVOv4YCp5AtfiH5a+7VE1ybSDoJjKl9XpMp+q9QvEyYEUtksdPXlwN+paRCgRLxtE
	AXN6SqT3VtCCEIhB4SPDQn2P+jjylf7bZKviVTM2iLoKHSwY7zWqywGug2SZs9MKcRWOdVN1oiN
	ytCMbT/PYoxWacIQkaps/vqce/SZQB6GlKwMu1JtNCy9s0Ff54rWMn3sxSBKftxITnyCYhOBMmH
	36NoKkbJX1lEpiRVXYk2KzsvPAkuiB2byocVPo9uirrznCst+wiHLd+EzGXE7dVCzEjDje23RN0
	ovhAj6HG5X8zOVbafD1nisCm6O6DnFjeNCjp0cscmnxT34hmtuA==
X-Received: by 2002:a05:622a:411b:b0:530:4310:53a3 with SMTP id d75a77b69052e-53054a34ee4mr488617731cf.48.1789025668826;
        Thu, 10 Sep 2026 00:34:28 -0700 (PDT)
X-Received: by 2002:a05:622a:411b:b0:530:4310:53a3 with SMTP id d75a77b69052e-53054a34ee4mr488617551cf.48.1789025668499;
        Thu, 10 Sep 2026 00:34:28 -0700 (PDT)
Received: from [10.38.244.96] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-530868ceb68sm96542161cf.29.2026.09.10.00.34.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 00:34:27 -0700 (PDT)
Message-ID: <68453b13-624b-497a-b5f8-b59acb2afcd9@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 15:34:21 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/4] media: i2c: og0ve1b: Use monochrome-appropriate
 test pattern name
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260901-og0va1b-v6-0-a05b2d04c892@oss.qualcomm.com>
 <20260901-og0va1b-v6-2-a05b2d04c892@oss.qualcomm.com>
 <ap_t_x0D5moBWJz5@kekkonen.localdomain>
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <ap_t_x0D5moBWJz5@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Vu62kO2n c=1 sm=1 tr=0 ts=6aa25d85 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=PI9LhpIBPIlg1HrUti4A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: YDkZPxNFeBfCVwt87NVF98_zWO6iRPnh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDA4MSBTYWx0ZWRfX9B3UFHkA8csF
 rZ6v5MAIQL94fDdYMJZ/g6n4j6Kc8ox0sTNXPKos/K0XoLE470iOApCR/iSWoF6BdZksiy21IrT
 AnXm5/kX2DtVHLGb7aIbNfcdj9DHQa8IFs5Ap3qG0LmBPoMBpuSaT/D6Gf3fHJqadZBqlgSJE0O
 iEiES0NiMcFcol5useWqooNM0+gVnt6FZioToLi6FlsobCtfzxc/ZIsXRT6IOQHC6kYl7kPSChC
 9jC0VWVkwmNK+gl9BgSVx0t2gPRoseBhRgWgfPU6wO42swRVGiVXZ3hX8lRIl3UarIKtP5LdAO8
 ng3//7HUMF1C4SmJxqjwRv+xr5fM0QCmrOkoZYD6wtZtmFlnI9V0KKD7FPTRbL3myPXUBfDH2F8
 CdpF/A2KXZAbkrrTDpQ1rgbsRWWu/m7IlsiZ8T253KPMjHEiBgtRrM8PqPKIuVCcGbq9abBVkkG
 oucwjPo4gQMBjUK+b/w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDA4MSBTYWx0ZWRfX5uFOJVVi5sBc
 zO4C9NeZGLZIKs9bY13dnnYv+mIsvKymEJbhpTu4Zr1B9d7txgsgy47/WYvab7Zcvu4KuTV937g
 o4gk0gbJ9nS+7ChGKbJJpOxeu3ESWjY=
X-Proofpoint-ORIG-GUID: YDkZPxNFeBfCVwt87NVF98_zWO6iRPnh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100081

Hi Sakari,

On 9/8/2026 7:14 PM, Sakari Ailus wrote:
> Hi Wenmeng,
> 
> On Tue, Sep 01, 2026 at 03:40:05PM +0800, Wenmeng Liu wrote:
>> OG0VE1B is a monochrome sensor and cannot produce coloured test
>> patterns, so the "Vertical Colour Bars" test pattern name is misleading.
>> Rename it to "Standard Test Bar" to match the OG0VA1B naming.
> 
> I guess the test pattern generator is still the same (or similar) even if
> the colour filter on the sensor isn't what you'd expect of e.g. a Bayer
> sensor. You you call it standard, however, I think you should define what
> that standard is. We're not limited to datasheet naming here.
> 
Good point.
I agree that the monochrome sensor does not imply that the internal TPG 
cannot generate color patterns.

I'll drop this patch from the series.

Thanks for the review.
Wenmeng>>
>> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
>> ---
>>   drivers/media/i2c/og0ve1b.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/i2c/og0ve1b.c b/drivers/media/i2c/og0ve1b.c
>> index 84a28cdcade10f8fbcf945999e88f84641b9bc0d..da5c8e49d4a811f55736bd89c6922856f2e7391c 100644
>> --- a/drivers/media/i2c/og0ve1b.c
>> +++ b/drivers/media/i2c/og0ve1b.c
>> @@ -72,7 +72,7 @@ struct og0ve1b_mode {
>>   
>>   static const char * const og0ve1b_test_pattern_menu[] = {
>>   	"Disabled",
>> -	"Vertical Colour Bars",
>> +	"Standard Test Bar",
>>   };
>>   
>>   static const char * const og0ve1b_supply_names[] = {
>>
> 

