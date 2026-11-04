Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793831996;
	b=mhC7YS+BdD6O2vqe82W5xLFfY/EwnH1FjuawpYWT77BQDVfIMXcAd2oSSN3gnsT4MMZr
	 Cpn/5gDTysCGDwIEIxUHIhGZYb9UtckAuY35jX2c00me65AINbPgvcD3lZ9/KGHNEahAu
	 3krmoaTmZxYraUNQYVaFjWp6Fk3cO65umpjEmTn3eE6NNfCV5SzQDGKmxlkGm0VryC+0+
	 1pEy/pwwS5D8/SF43XyOeNdz+riVL6sBd1AqeIFFNowCggjrZFo3zIPBZaadfC///fKXX
	 qmWtYYPrh8ecESmOZqjEtg+fCJk2ha6q6u72CJS+1rXqjqhJFfKlFkjg09ykS+y1gQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793831996;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=PJA9ZjVWgygH4tYxEI+jP8ouDsYJfs5Yih4eQhnKOCY=;
	b=gbioqcCx+Pz/TxTnWuhVaZIFy+GD/9TToGqeKtuAIY01wLIzhzb1ii7uwyo69Bt1Zr4H
	 ZyoDR0fbcW5enbfxIA5aOQZaEpAYzhuhcmBffQ/ApFVpUn+kX4SqWe9p1oOS9WyirTLol
	 phLmdAa7/vp+8dx5x5HO7BuCJiuOe/v9I6pr7SI2z77YllYLOjuqPm0cO1a7IWeGzxxQW
	 JHLkjFBdbpZRJvfpBRRnNpeRJIzleUyP7agdsLJu3DHFvvC/89a6pYM0cVLaGIxKQFsr0
	 JRpkhhvaGUHZyVXIPXG/s7/atx/UlFYQqb+Tj4Va/qYRk1vEQXcPAu6YRXLsyP1QbcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aDEmr3Um;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ekyrhJLD;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD27606A31B
	for <linux-media@vger.kernel.org>; Wed,  4 Nov 2026 22:39:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DD27606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aDEmr3Um;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ekyrhJLD
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4M5BBP1292199
	for <linux-media@vger.kernel.org>; Wed, 4 Nov 2026 22:39:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PJA9ZjVWgygH4tYxEI+jP8ouDsYJfs5Yih4eQhnKOCY=; b=aDEmr3UmzEamOC+A
	xPEzrZZTgcNgdzsecmhH1CcBswhJqo4oektlcz6lO1H+BUCx//LpLnBC1jbPf2g6
	bfe0uNlQfrLEpRIIHcHRylCJ2cu77HNQkvhu5//NagvpcLduczchdIGRrZ5QFeFD
	VuYDU7lJtSRng8un1Yqwa4F4pY/SC4u/rXgrQrwXZb2ivGFqgbKhMvESs9j533F0
	NO+r0hUyhySwb+4RLPhVmPfPuJ91NW1h7keHYE2v5maUsAWjmisuokFVmKAd0FSY
	j2XPl3QIgXoRTvAB72hXjIOXL4jld6pxHV+m9o8bfIy9czFDqgGiNl6YbdXRgiyQ
	P0LLUQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr163kcg3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 04 Nov 2026 22:39:55 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-359b81ad4e8so1517237eec.0
        for <linux-media@vger.kernel.org>; Wed, 04 Nov 2026 14:39:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793831995; x=1794436795; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PJA9ZjVWgygH4tYxEI+jP8ouDsYJfs5Yih4eQhnKOCY=;
        b=ekyrhJLDv8sR0xdDH7/SGhzlnPA2MUfr8obiK/sFVlNhtglTkYtycIOTHn/aS92/CP
         qIlJaEMhwNaCP6Ccuz/OU/pSGvM0ByzT6P8o1XEP8VgoZR6NO8rMAEPm1e3yOehL0QI7
         1NtLpkQ9vSLLADYlSyZCf6cLPJnKG9lqZnOgaeMBRSdZDp1KxBNqqBaFdFLWlF/TeM8a
         /FyMxmXtzza/oVOCzZrc4FPTORC3m21ACg8tLal7Edx+07edVSKJq/ozROWllnaE9mou
         jU01qTBzYxafU1v7iNuWUP5eS4XULklG9b7S+grWvOqMQRc9vUiARfVylEfkw41tpFz4
         JvtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793831995; x=1794436795;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PJA9ZjVWgygH4tYxEI+jP8ouDsYJfs5Yih4eQhnKOCY=;
        b=G1DYHWo1tjKDCzDAfDDDvgtOLiz8ag1kLkcFsIVQMOifCakLukNzRQJxxZiZeaWcsx
         FAOAi4KY1j7ryhAGKuvRtSAzstaB1eeIxEo29udfKMrtNjFVlHOqAoBf5YENof3xuW2Z
         /KNDqAmsu/Hi3DgF7UmFdczrDnwQkRweFFXM0zFVQi055RUdaVKNJEL9wX9v6uHosBd2
         vXOM0Jio/NagGP88NSwMGaSDgafpJE1r8ZSbGpSTS62hcFeB6Oq3rckisoH94V/Zkqsh
         8p+AZ5S7S3YGa7rrQvSczenSys3AG3I5uWY+WGGSpFxl0Efj98SGQCpTLVk+UE3Fk3oU
         Cywg==
X-Forwarded-Encrypted: i=1; AKwUvBy8KzWwtTd8AzdP6kbv84xKmb0qDWlPYBabvPtHjKi1miNrtHVu4pbdyTm28BvFAvqYOpohI3+sxUHWzw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+a2/29cspVW0mmP2k4H08pbHeHvjHuiXnTzwj9QJODYkS7M39X
	Uq2Zyibtv8w6e6YO4W5GewiiCzkrHgFb+JbM3VzSsC+LW0ehkgxrDvYCVWBTTA68W9nP767iHZm
	xcDrnCy7I9yFdvHlzwY2YUOYoB59FBeYD1IW9dOKrvcytX1/VWJmclVyXipRALIjgiA==
X-Gm-Gg: AYBFou3lI+xC71RDbtNyHJ93aC+BoigjvuvkzLisbn/PYRgKO6npAcRGvjNp2uOmTAJ
	3T49qX2wnaU8dkmtz6xLuh64jahF3TD6hOORqwpkn92cwfUbmegsHrBm4sGhtnw/F0Xv4Ml2AJb
	9B6dtMMuaZsBG5yLbWlr1SuLL6pjo/un80pxSl8dr/VimzQUsA9aCQxr44AC/aMwXCc0TDxHiSD
	fqPsLuZtZuz1DLmYaIgKSulJgCevT97qce2Sa2MeQcsLQJsW+LhwW2FSDi9eNUE8gOQiV+yAjrh
	6zhCUCAZb61B5f4TtSl2ZLp3L1IHI+YQzNZr5VXLCYDasRBmg0HtdICLSKTlk7oKdG8jwpXruf7
	J5qXZ76Mw4siovMvgpGXlrgN+UBA14l1LtfiD7fuAn/+ep8njEHLN58cOGnGk0m3W27wmm6V8GI
	UKFZOdpbdXH9WZmvToeRp0pHY6+ulcZQ==
X-Received: by 2002:a05:7022:ec4:b0:14f:8d59:edcc with SMTP id a92af1059eb24-1ac5c369adfmr28168200c88.12.1793831994577;
        Wed, 04 Nov 2026 14:39:54 -0800 (PST)
X-Received: by 2002:a05:7022:ec4:b0:14f:8d59:edcc with SMTP id a92af1059eb24-1ac5c369adfmr28168157c88.12.1793831993985;
        Wed, 04 Nov 2026 14:39:53 -0800 (PST)
Received: from [10.71.181.181] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca3788bffsm10405125eec.1.2026.11.04.14.39.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 14:39:53 -0800 (PST)
Message-ID: <8c0c9459-5cb6-4280-816c-9aaceffe1df8@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 14:39:52 -0800
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] dt-bindings: phy: qcom: Add common qcom,csi2-phy
To: Krzysztof Kozlowski <krzk@kernel.org>, Bryan O'Donoghue <bod@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        gjorgji.rosikopulos@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        jigarkumar.zala@oss.qualcomm.com, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261103214105.3605181-1-anusha.nandi@oss.qualcomm.com>
 <20261103214105.3605181-2-anusha.nandi@oss.qualcomm.com>
 <f319ba87-5569-4323-ae4c-3f9f34a9a3c1@kernel.org>
Content-Language: en-US
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
In-Reply-To: <f319ba87-5569-4323-ae4c-3f9f34a9a3c1@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: kNJzBCnEqHpnxdUsVAQzbmy9S8pES-sf
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA4OSBTYWx0ZWRfX72+s4HSA5+Lf
 v8QxkXpWq4Q3w/6HSL15Pfj9OFvIlff7gBhCCWPJWsZ70yiMjmr0EzUOLPiqZP49RE3ft9f5RxA
 wgKxEB74UidB2+e/YTWqrSdvCpm4sr8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA4OSBTYWx0ZWRfXwgqEgLxXtwpx
 jogNAlDBB0lfFYrepPBzSthKjooZWUfZt1mcWt7GH87plDo7Is7t475ZUQT29odcD6Ks5hGU25D
 8SC/pYiRMtH8jbuhtc+4htB7B0R/hmp8KzBiA/FgVRewj4+sSPW+nFgeiO17ebW86VJaeuDdzS4
 rvK6yYH7EI4iTrCgyW8FOBxQCw+5jn/8P7jSUf9V93LZWnpeUHesoHEZHBshg9wbHuFp7gx7265
 TvW//jgq1FFYNhMP++UkDPX63NUI3Kvqmjy/pTKB9O+0u/jbox5vOmTR8jeiqgMdlN7K39zKMw1
 ay2vda6Rr+UUhtoBm7F96siwcNdAVRH4ftyce/8ULYZmxwcTF2spQNuGQkEhqdf8MKs3vq3fY4h
 f68d0nBCPPO/ABnGncrWGI9D3dInljx04SmIVqb17aOQ2XT4PrSg4yJ4+JtEr2CweFNfdR+OgVF
 GtpoO7SJRjPh8UdPktA==
X-Proofpoint-GUID: kNJzBCnEqHpnxdUsVAQzbmy9S8pES-sf
X-Authority-Analysis: v=2.4 cv=O5OsLx9W c=1 sm=1 tr=0 ts=6aebb43b cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=FDZwB5iHBSRriBojFeMA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040089

Hi Krzysztof,

Thank you for your comments.
I will upload a proper v2 patch with the lore links attached and
comments addressed.

Regards,
Anusha

On 11/3/2026 11:05 PM, Krzysztof Kozlowski wrote:
> On 03/11/2026 22:41, Anusha Arun Nandi wrote:
>> SA8775P, QCS8300 and SC7280 CSI2 PHYs are bit-for-bit identical in
>> devicetree shape (ports, bus-type, data-lanes, operating-points-v2,
>> clocks, single "top" power-domain, vdda-phy/vdda-pll supplies).
>>
>> Describe all three with a single qcom,csi2-phy.yaml and a compatible
>> oneOf, rather than one standalone schema per SoC. QCS8300 is further
>> required to be paired with a qcom,sa8775p-csi2-phy fallback
>> compatible, the same way other Qualcomm bindings express full
>> hardware compatibility between two SoCs (see qcom,qusb2-phy.yaml);
>> this lets the driver bind QCS8300 nodes via its qcom,sa8775p-csi2-phy
>> match entry rather than carrying a duplicate one.
>>
>> qcom,x1e80100-csi2-phy.yaml is a separate PHY with a different shape
>> (3 clocks, 3 power-domains, different supply names, DPHY split-mode
>> support) and is left untouched.
>>
>> Reviewed-by: Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>
> 
> How is it possible? There was no such patch, this is basically v1.
> 
> If this is v2, please provide changelog and lore links pointing to the
> review.
> 
>> Signed-off-by: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
> 
> Please use scripts/get_maintainers.pl to get a list of necessary people
> and lists to CC. It might happen, that command when run on an older
> kernel, gives you outdated entries. Therefore please be sure you base
> your patches on recent Linux kernel.
> 
> Tools like b4 or scripts/get_maintainer.pl provide you proper list of
> people, so fix your workflow. Tools might also fail if you work on some
> ancient tree (don't, instead use mainline) or work on fork of kernel
> (don't, instead use mainline). Just use b4 and everything should be
> fine, although remember about `b4 prep --auto-to-cc` if you added new
> patches to the patchset.
> 
> You missed at least devicetree list (maybe more), so this won't be
> tested by automated tooling. Performing review on untested code might be
> a waste of time.
> 
> Please kindly resend and include all necessary To/Cc entries.
> 
> Best regards,
> Krzysztof

