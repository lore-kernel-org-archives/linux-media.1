Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB15472F78
	for <linux-media@vger.kernel.org>; Wed,  7 Oct 2026 10:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791367265; cv=none; b=hpNP1sljSSvF7GCTuHFY0rB91bucYewrH5yDd16sCtRFiBIRfHYsoq/8J7ShAqsRBYe8XcgKcj4iCFcNN1sc28yvDoZDeZOd+iZL7HYU+eM8PKCPaqf7jjcUOuZH11PvujZZAiyl37OmeRovdBd2tyju7U7PAxQdjScKAV9rzi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791367265; c=relaxed/simple;
	bh=kT9shb5MvhohupBnYEiT1SmtC2M0G+OAfdgFWHHHntc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FFXgMGQ52pszt1Eocl7IshIaSb85jlAPrBuujEo07tAIBiiY29LHX0IUPokfbxLOLJ/ygeYL4iqYr2R5/4RQmf3LQ4xO8HbAq7rzGi9fbPlD772Rx85y9MVw4U+PwSWFoXSFqntZkjEnzzw9Fqi4g/zD3SZuDvtdqQIuZ4FwzC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I7H6E40Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C2ytvAbZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I7H6E40Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C2ytvAbZ"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jmqo2711448
	for <linux-media@vger.kernel.org>; Wed, 7 Oct 2026 10:00:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qlUKaFMDrg38PJ0GDSlOro1LZIAOUQlGfbV+b5Mr72M=; b=I7H6E40QcAdgCk0K
	SdYYJm1vadjyPM5v4qxzWw5cjLhaZyyaY+DyyttlfPvc8v9z23O6OUaSZIY3Zd2Q
	3Ib808Cch+mF4lARhQLYq5R1K+w/aRTfhVf0azKxtKG5gl/MKayg4HItKfGEG1jj
	Ld8q0Fu93qqW/9D1tRofC3Q8Ue0dI5dqQcypQGfM3ICrYk9zn2PcsBDJwG1CfcDi
	QcoQX+xGWVx6CaBKF8r2ea3Y4P+uyc9Gn3iWXpYL3qTRhWU5lqaD3k+Jw6hRJREx
	H9D4z/GtVXYmQ76V/5TYbW9i9tOsSC2lC3h1DZHsP2K5KkYmiK0bcYzZ8+8Lzbla
	wxE+sg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5c1s1kmg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 07 Oct 2026 10:00:53 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-934956beec8so835951285a.0
        for <linux-media@vger.kernel.org>; Wed, 07 Oct 2026 03:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791367252; x=1791972052; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qlUKaFMDrg38PJ0GDSlOro1LZIAOUQlGfbV+b5Mr72M=;
        b=C2ytvAbZDusGUYWKOQShuLwpls5bsXHg1NsIqj7HAOCQzcodZCwW34ZRTVATV4XvFs
         uARZjB9Y/j9YUB8dn1SOIUJ7aRFAZ+a4FZwJv6Ao6pevyweqmi0s9aZpv4e95AhQZQ+c
         Vcn+YvN3ZBTcoxOlprxoHZ9VKnJyw94HgvIGkX/wpEwxPU/xoTHJjpAGLckHQ87pY9zU
         pR2p9Taqvt3dpnI6AC1+OUHjKKwMzdPBcAgM3PJOBGsCGnhPLLcAE9DZDelidHfF/G5f
         qJq6NHTTWOqSpY2+6t6NmB9eG/g4EpUG3MsQCtxwR2fLN6cfu5IWCWreFLeIHMLDSTRc
         KqZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791367252; x=1791972052;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qlUKaFMDrg38PJ0GDSlOro1LZIAOUQlGfbV+b5Mr72M=;
        b=ZZsgL6uXEITOxStWoFdj4myCRiMjDKzGsvFCudNYe3hr9soRHIwnsDtnUH3PFkJDQW
         /BG4KxqoNPlxDFmoXMqK/vVroKCMJ6RsbjkWd124eQgDHGpda9uXDo0EDNLKUYbLemYD
         VkoZK6hUyzLw95iEnUtEnOe6Qf00SFLzPe3S2SWs/1tQQ99WXJfV1eTDtx/slVaPiyYW
         2XdYY2/f4EVwrPyUvvtkd/KIAsDyZ/aXWu5Y7+i/AoNRLMfYO9N26fIGzgERqZQItTc4
         V9f4ncOvCMvNKJq4nu8gY1b2ah4jB5CiwlGfaIJU8SG9Kqh3uKKzgeKTQG0PL8lOh7p/
         +MGg==
X-Forwarded-Encrypted: i=1; AKwUvBzGsuyBYgO2V+lj6bpBVI54xly6UdlpezhRI6uHimNRJSW/9HT0Q3KedVtkiULyW3CmGTFEGppqVXGJUA==@vger.kernel.org
X-Gm-Message-State: AFuF++lPk52MWF5DFDYC+YpKMCX8aXyEM9RyEwo4IElpLXsOi6igFeU0
	u+xaan+xWs4LJGEEYE20gLHG/JdCPlj5QD38Vy4rRAAWlVUX/8aisMTMtVN/zZKT4oJnrLBaABe
	Bv36LXEuvAGBOWEVjn+wAO3aOKPBd/DUimIkc1A9vE5PbxnABWSxCHGP07TYcVGUf7w==
X-Gm-Gg: AYBFou2SeODLjVK5dRt6pFLORVZ+HZIntvUQG6ZV0dCe5U9WdqLglDtFR4GUcSvC2g1
	4rKk2vxWmcVH+VC3NSWMrnLLugU+6zEQ5Pum/E956mp3os0Cw7mtcJJJrddExH+lTdajFuUBHOs
	WGDKSAA4weio0htBRy6w7EKmjo0FhhZ8ngVyG4eG/Ka4uZgW63swc58sjNSAgF4lRd2xCCaAHUj
	pSYGyijSfMiGACSYKmrCRSbFy1CfIhEPOnlUteGaxTv8Rr7Hai0nbRRoZUrjfdC16qIfswrCaP9
	JFGfyykvGx8t1nzhMn53/ZRsj26O1K6GI0Etas5ssUaSYmaZT3OTSljvfnnLGeHEHNSekoCSJi2
	7/G+WuEGUei/bUP69BLoGSKX31O5D75pcKQJgUXJ+
X-Received: by 2002:a05:620a:27c1:b0:93a:14c:32ad with SMTP id af79cd13be357-93e9af3458dmr355366985a.0.1791367252354;
        Wed, 07 Oct 2026 03:00:52 -0700 (PDT)
X-Received: by 2002:a05:620a:27c1:b0:93a:14c:32ad with SMTP id af79cd13be357-93e9af3458dmr355361185a.0.1791367251734;
        Wed, 07 Oct 2026 03:00:51 -0700 (PDT)
Received: from [192.168.25.64] ([94.155.124.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178c5b9d6sm125385755e9.13.2026.10.07.03.00.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 03:00:51 -0700 (PDT)
Message-ID: <df0d8984-37c7-42f0-a0a8-16008130882d@oss.qualcomm.com>
Date: Wed, 7 Oct 2026 13:00:48 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/45] dt-bindings: media: qcom,sm8250-camss: add pixel
 path variant
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        hariram.purushothaman@oss.qualcomm.com, pshrotri@qti.qualcomm.com,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        johannes.goede@oss.qualcomm.com, konradybcio@kernel.org
References: <20261006223953.3382273-1-gjorgji.rosikopulos@oss.qualcomm.com>
 <20261006223953.3382273-5-gjorgji.rosikopulos@oss.qualcomm.com>
 <e7c46f2e-fa6e-4cfa-b16e-8fa5d2112db4@linaro.org>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <e7c46f2e-fa6e-4cfa-b16e-8fa5d2112db4@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: kAMSK563Sov2fmMSQCxYmp7iUBMiBP0b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzOSBTYWx0ZWRfX8mdmOp3icDhM
 l49APaVJ+w1aLZNb2/O7rHSLIkN0kaCtVraSQZ7qhUrn9Uq8iafgIVg5MHs5mF5yhCmCz6vIpKW
 b0Y/eR7pOlyh28UsH1QQQS/uWLT+AYL0QayPN/az1cXTfXTQVCAPY+5uYhCd67k6eLWdTNA8jVF
 70Bec6RZ5o57o5TpTCMsxgHW8ECQtaiCNEx9ukfrcUzFt+RkduDaW7Hw8wcOWO3Taq3LA+C+lcd
 HuHK5S2PyaWbrFTSB0zO3jGZEw35Bg/nGKTpY3yGWGySnFtl2bEPc+EefcdyWwyVMLgBUw9zfNO
 /yaGRUfzHxml2gXGF16crZTCE9HY8xqTCfK9+f/PoYvrjGVzfCZvVuVrADGUWJlq6vU3jOVap6r
 ZAOAwTfujRtZdd6CEQSn2FfZadW6bAasx+FVa9JuXGSzYBVAOlLEbiEMPzs8hDhTcZ/pBbQE2Ld
 1C946D0VQazmR/0mRvw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzOSBTYWx0ZWRfXya5roSPV83/t
 u5icnT4B1PdMZNf4pz8/z3fpCCBPNktxQ6DY6cXu+Fh5N/ZzBEebNYO7HTu1thKp9QyrYX0kY6d
 J/1Xg0PCJjfHJQpN2SvFWA7rTlQzJnY=
X-Proofpoint-GUID: kAMSK563Sov2fmMSQCxYmp7iUBMiBP0b
X-Authority-Analysis: v=2.4 cv=NatzRGD4 c=1 sm=1 tr=0 ts=6ac61855 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=eGCDHFSXubCXFTSSGhjuOA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=hlJ52qXToqDDZdDxZ0gA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070039

Hi Bryan,

On 10/7/2026 12:52 PM, Bryan O'Donoghue wrote:
> On 07/10/2026 00:39, 
> Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com wrote:
>> From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
>>
>> Document the qcom,sm8250pix-camss compatible for CAMSS configurations
>> that use the IFE pixel path. It uses the existing CAMSS property
>> layout without additional properties.
>>
>> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
>> ---
>>   .../devicetree/bindings/media/qcom,sm8250-camss.yaml          | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
>> index a509d4bbcb4a..d561179be48c 100644
>> --- a/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
>> +++ b/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
>> @@ -14,7 +14,9 @@ description: |
>>   
>>   properties:
>>     compatible:
>> -    const: qcom,sm8250-camss
>> +    enum:
>> +      - qcom,sm8250-camss
>> +      - qcom,sm8250pix-camss
>>   
>>     clocks:
>>       minItems: 37
> 
> Same feed back as on the other binding.
> 
> Enabling the PIX path shouldn't require a new compat string - 
> Lanai/sm8650 operates this way and x1e/x2e will also follow this format 
> in v2, v3.

I agree, maybe pix should always be enabled, hope userspace not break because
topology will have more outputs. Not sure how to handle this case for backward 
compatibility. In theory if userspace apps are well written they should just work.

As an option do you think that camss-ife can be migrated to camss-pix and connected
the pix sub-device just for pixel pipeline?

~Gjorgji
