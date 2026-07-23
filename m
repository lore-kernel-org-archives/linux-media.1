Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9253A40B0E1
	for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 09:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784797615; cv=none; b=W13YQbrsUe7idwC5VfnQDeqhRwNU0X5c1xX9S1q+GkDwcyNKS/LeBuXi+gGLVUxIFO1x4/ABwFgUc3etp478CNMtynumV8BYa407TSFSD91vfWBBpxDDxabzzb+u7R0VA4YVHL6S1/2h62BJCPAILevmAB2S7DCn1hpwxDnrxUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784797615; c=relaxed/simple;
	bh=VyNAmFGdu/aOdX96ax+LrcbOMZTfWWbRNEFQkmWNHQY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hemuf72SHTJ0DQUeuVLucHsuNSKW47aCNiBwbxdZzg0k/XBcrzhObL6jpUmIr4iNqYN3E1UzADRcBHDAW4xEJN3W70ly8jIjT4ciqOB3Ghu5+XiHtQpDt/g2mTtnzBB60BQeutwgGFMHSnQXqgpQWxhQ9pn7wm/fTrtBEM1VDGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nOmxTpBo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RLyhZZWu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nOmxTpBo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RLyhZZWu"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N8qf5g3642620
	for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 09:06:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XGUzGgzuCfQbFUMO2UD4fa77qRiSf/xRPCVc9joi/6w=; b=nOmxTpBoCBe5oPyH
	2kOPeTM6MhlRwMDLY+dC/ZmTxiN305Sy+UgMDgdsrCxVWGLAMS64pO8AxTpIae2k
	OsJVJ3neFUln6e0EkyecyX9fK+5nOhkyArtaPkH7033vwbcbtw33ofbt2pQwBvqx
	GZXGBzDXmA1qaek6DfvAPcg3eu70bMyxKH1fbGKHOE1+3aOlpDSr59uZELjkSPlg
	rmx2vWO8dJShJIxhN2GWYmz0Zif9geZHDeLPfTy+L4ICvXjaux/o7qEESs5Yp/wY
	8fnMGn/UHwFiRlG1OrBYeRw5rcB8jZuv0t8DDiGH0tOnYFKbshYK9kFpe9KjgZhE
	prHYaQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkayh97w9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 09:06:52 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51e9d892f0dso2796231cf.2
        for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 02:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784797612; x=1785402412; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XGUzGgzuCfQbFUMO2UD4fa77qRiSf/xRPCVc9joi/6w=;
        b=RLyhZZWu760fInPCH2+jKCWdkFCjeOojTG7E0ndIB4o1CQUUemC61uEWh71RgE8OpJ
         2yDr5ehLg4k+OhWcTN1hcwQVqeBFqAImLBhP2Pd/aZYmWfdzQ6/x5N+Fc77XrP9D7km5
         CkwZlug8oX0cAcdVW/qHLSiXOpx2MGd7Euyk1nBiaz/pl7q2SGoFiBVPB5qR7zmmmg9c
         pjLgg7jQAHDV8k28GPMW756vVh13ggwwC6Wztp6eGctM55iKilrVlbW1bhhHrwq3X07t
         aL18cwVtXEYprp/T9Rb2zgXTe25X+DBH9lrw1MF6f9tdeVcvkaz9r+6sZYxt8oBaYs+R
         9xkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784797612; x=1785402412;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XGUzGgzuCfQbFUMO2UD4fa77qRiSf/xRPCVc9joi/6w=;
        b=FxHC9nbCcOSlum+gBeV8Kdhp2SRzmrooQ/sEEXeIo3e6a5R7YdLc05bk2rDGA+26Bo
         h/7YdHsUekiqFDxdyhAfgOjqhySfj2H1itZRAdPsUetFIijAqBzieU5lEQDtdV8g1vA9
         cLk6NG599Rvu81Smtv6vZIywJaBFUZPZhw6La4tqscaZsmDqtbC7ExVrAkBD4vu+3Yv1
         6TCY1RXVTkpXPsyvj9ChBn7/xTuOZjT8VsmfZKzuzVYNL41qPb+HWz/LRK67l1dr9Tkn
         if/T75a6J9tV3i6C3SNDvRp3B6My1KMzyQ2n6BGcnFgkegMnt2FWCIN5dU6Tl6WLkMhq
         cH8w==
X-Forwarded-Encrypted: i=1; AHgh+Rry7Mei8Jiv7YJ6wLPnxws7tQ7I5XpVc5XgJeHfEOT+oazDy7cu2YokFipQvXm+B81PThXBMbaz/rq03Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyhc7RBscYtq6mcS1LHhAxME3wpglJC65fua7hIBqJulcLtWJuK
	tzYVol9HzyQgt8RCcMtROtFJAsOIgvaU13r5TfVcAEczbzrb49EjBX0O6rhjCXJNVYnpVQEOFmE
	s/dBS3EClTnBtzTJvKxUaw9Y+CYzYu5/jwmmDKqF+qKbSyIigPIR2ph52Ssdtx5p6JA==
X-Gm-Gg: AR+sD11bXOskugKrG+s9BHHU901b8WtwRU4xSusUGYsbHBwPtYWjln4tBGe/ISO55hg
	+vd+4baYpCyL0MXGTzhvfprdLDkyKAw4ghmL03uRrpSmAs23nzMEs024PFAmtSJK86Vr8ha+7N+
	bafpdgbJN2CQbQiUmcPIHiwL4tkDV6b5T75+aVXTIhejdDAgwJO9e+IMfA862wdlSYCRRej+2wx
	ISMslCL0A83QRcGwvQG0DUltHwuIO4c+hDp3RMgDR/3SaFspJksOdjEfCaknZuh+2k3qq6A7Z2n
	vNrO/klynfycuAOBufku7/StHrPTrgE0ktMrG/tj+QfKXbXIEejt2WDFyspNPVlCaA/VX8rHw1e
	QjPDZZ8r+1lkWPzTwEvEvV402
X-Received: by 2002:a05:622a:4d1:b0:51a:8079:795e with SMTP id d75a77b69052e-5283ddf815cmr16854781cf.4.1784797611832;
        Thu, 23 Jul 2026 02:06:51 -0700 (PDT)
X-Received: by 2002:a05:622a:4d1:b0:51a:8079:795e with SMTP id d75a77b69052e-5283ddf815cmr16854531cf.4.1784797611461;
        Thu, 23 Jul 2026 02:06:51 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32f19c4csm203076466b.63.2026.07.23.02.06.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 02:06:50 -0700 (PDT)
Message-ID: <67c78d88-92b8-44b9-bbcc-6f53f6c60ef9@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 11:06:47 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/4] dt-bindings: media: qcom,venus-common: Add IOMMU
 IOVA reservation region
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260722-shikra_vpu-v5-0-3d80babd4672@oss.qualcomm.com>
 <5nIoqMekE2B3CTU4TIlUJxoI3Exckc2sUM9RmZBqboEOvgmkdrhKlRX3-FiMOiYFCWXwzO5pii52NJ6epuy1Fw==@protonmail.internalid>
 <20260722-shikra_vpu-v5-1-3d80babd4672@oss.qualcomm.com>
 <557377b0-7a21-45b6-b62c-d3b34a6a29f4@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <557377b0-7a21-45b6-b62c-d3b34a6a29f4@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=HZgkiCE8 c=1 sm=1 tr=0 ts=6a61d9ac cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=i4mD44tej1hBn5R5y4wA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: TE7Wx6yzwqWFUEEhZ__sOiQK7dqA_eo6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDA5MCBTYWx0ZWRfX2iFV2+/tGRXo
 VniQvXfG1wHWhKs2z97dDtUh8tBOIabfVOdqO+qUxSBvAtDeNEU6LHRQJ3jQYjFyyYlcxbfBriJ
 t5XEslH3wOtUEj1BNvKFVMGX6+fZO6w8Qx66zR7qfnJEQIJ9sa4HV9zTeUSF2am9exer/QAW7gE
 suGZRz22f4eM9eFqmlYaM+rBfW00TKclgdCmeQ0jyEQEpLI/ijZRBUal3Om1yPLh6xUF92EL7NA
 STmo1OsSRGPludpt6Fq8v6Ee5F2DsCAwpTYXG8DOGt2QsFNOC86oUikd9RUhnZnYfuv+B/fwihJ
 wn9wZ/M1e656ejsKl7ZeDXFyx5eglZbV4tyHE0RMpq2getr1ywRtOr+rbmGv2ngex9jDuVhQdlx
 oP3xMbxPafdDR7sX5b0bbSIfNpSoHCavuzEj3s+mfKJJdUPjYjZ3MgBckto1GOn8d7YcsEm7k2b
 l3cU069++UiLCSsymmg==
X-Proofpoint-GUID: TE7Wx6yzwqWFUEEhZ__sOiQK7dqA_eo6
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDA5MCBTYWx0ZWRfXz4CbVohO+mOr
 bc2HwEhk/FhfCq6Mc7hl1kcmJK/pPdcNyHdzSZIWe+1mmhTltr0igx4LRQ/maP23LszwiFeCBjo
 kWhWDD/KdIF1sCZtehZ4Qpo5A98GuJk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 adultscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607230090

On 7/23/26 12:03 AM, Bryan O'Donoghue wrote:
> On 22/07/2026 14:41, Vikash Garodia wrote:
>> Update the memory-region property to support two regions:
>> 1. Firmware-loaded codec carveout (existing)
>> 2. IOMMU IOVA reservation region (new)
>>
>> The IOMMU IOVA reservation region is required to restrict usage of
>> specific IOVA memory range. For example, VPU restricts usage of 600MB
>> for specific streams, which could otherwise lead to device crash. This
>> change allows platforms to define separate memory regions for codec
>> carveout and IOVA restrictions.
>> This schema update supports existing DTS having single memory-region,
>> thereby allowing gradual migration of DTS to support two memory region.
>>
>> Signed-off-by: Vikash Garodia<vikash.garodia@oss.qualcomm.com>
>> ---
> 
> I'm not mega-happy with this pattern being used - I prefer the pixel pixel_cb sub-node model you've proposed yourself.
> 
> OTOH you're the maintainer so its really up to you how you want to arbitrate this - the 600MB constraint will work even if its not pretty or the best thing (tm).
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Doesn't this cause the same limitation that the initial patch
by Daniel (all HW contexts can't access 0-600MiB anymore)?

Konrad
