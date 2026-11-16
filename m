Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794796700;
	b=R24jFk5qWYuWBYb+veQDuXShyX3hRaPtlISbCqYsd+gHgvLD5AsAsJH6mdnGwroe8Dk+
	 nWhTQUOr6H5h+K6Rv3l3AcdVLdkEeWmJhAbOcILekQsZYmn7YwazuMYWH8uE2pltUeaXO
	 Zt6QDAQ5rL1fl9YZf9K55TdmhQ4qVAlBxij715hy4WUDhdiBg64LOz+3l5mCmLAjJRQko
	 5jKZaut11lUAd1bmWNtFbFpPde8HJ7jMADrGgZTsPBLgZESxHCjg6OoiPNeZ+9cG4tf9h
	 Pwng3NTdvxFKKi2Trd9OlUDkssgTxu3+GFyl+JeSWFZ18zwqom3xxla/hRi6ZXfyhyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794796700;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=TPjyQUk+vMBvodq2mBZyZe6FH5D4rzEe4fEpLwevuWA=;
	b=mjFxcnZydtYhkV2bWV1TymwHeFtpKxopMVDALpZ7nMGyl80qb6Od7KCAR8zUhTdLGC7j
	 KsfRpeay3QGtkwtOzNix+Kh6FKH0S1wvvf1tzp2V3/9gEoBLbLhrf0Qk3aGtz2JRvcG5H
	 Coml45MF3jlpfKvaq3VsemGW1SaP5hl3nrJ+Rf2NGO3hMDLY2+0TDp5mkuEpZOBtWylzt
	 ibzHF2qC6LBI6K8zDWKXzuxBseeur4IL7DvIT6xq63Xo25VLYp0HgB6zdJLGfOi99pMmR
	 IsBJl7+H/T2lkOWDvDA2fGdPpLOTtUjLkapJKa93KRCavX30hQlaTfxXmdRFLkgyvPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WJrJOScF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L2MJ+PvC;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C4A5606A32A
	for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 02:38:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C4A5606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WJrJOScF;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L2MJ+PvC
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG1LFR3074221
	for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 02:38:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TPjyQUk+vMBvodq2mBZyZe6FH5D4rzEe4fEpLwevuWA=; b=WJrJOScFWbmhsj6y
	AXFvn9SBm43IzYWGZMwIAmxaGxjIXxdlt9wkxfaTSbQ7E07Q0BxLROlUAfuguA80
	EmRTzEg/vKjuBQwh6zpA3hekDlZWsN4v97sul0/C/d3k+hiHtr6ZpjPb5W7rnR9h
	cnJr2qP0IUs0zf5SZEytlzqfqrfUp5LKlRQXplO16NMFIyoV72mI7tBcyJ+9Kzsh
	XCez1LSHjOKwOQr/TscCiudCBtJdt903ne639VG+gBHMZ4Z2RAuB4fmBINzLHpvQ
	ivVLHIJWMnuTCc+nVuR4SNNNoosywSJYae8TVupwaAtor8SM22VnlQjRgUUtsf+1
	OH+qUw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhhjvfhw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 02:38:19 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9493e89d4f9so556870485a.2
        for <linux-media@vger.kernel.org>; Sun, 15 Nov 2026 18:38:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794796698; x=1795401498; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TPjyQUk+vMBvodq2mBZyZe6FH5D4rzEe4fEpLwevuWA=;
        b=L2MJ+PvCZq5kFb18qBpX7JTf0iQ8hVlYPEUP3yAq2FqFXfkLwDPiclDCRp6/QN6zhv
         ZEUK0xDimgat9/EIfD91bkycRHWIboTNAspoit94Oyrb3aWc3UTfVXQvZ623C4ywwLCr
         Q+ESN0ac8BwAafWDY6zl+TUr0PZ3Bz7FcGjs2yi6WnYGyzvMi0OMa3K3XP8SCv2MctlS
         yyGmsPxn3HBJVR90AvfjECN9HgIooxR2mqDHg1JORqCX3z3s1RNFP8XTNjIr1Bkvqk4z
         B3c4IXsVnuHIMiU2K256jDt6IRChLUxFFD0Edjxi/RHx3SnNN3oVsh60CY9jfpXzfD/J
         VL2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794796698; x=1795401498;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TPjyQUk+vMBvodq2mBZyZe6FH5D4rzEe4fEpLwevuWA=;
        b=qU+6pXNeTQs+18z7aMc7ci4o3MxEvgB3iIw7eKqiZSDcH2TA088hh9lYVqfgCx7711
         4Vnbi7IhrmIeO6IaeegjPcfkTwUR33/9U0zI+Y5cq4ocGDgqFjxgVeQY9lNuyBLCIdDB
         MdzBBV661CeWzxFa5EuRI0my68F2opDwl1VNMF5vg97CBdL2KFXPD2Yz/ivePwr60HQh
         zNAeFjubZm93Q2M2SShDfguFTu+WGD9uVF6CQTT8zO419nshrtUZne4UDTeY8SzpngC/
         G0307QIKVMCqJ1c1xtMtU0gXGsJVFcCD6Un8oc2VKWTqeNGu4WQIwRYt7gV9UvMo/jsC
         dNAg==
X-Forwarded-Encrypted: i=1; AL+hErGbkhMdU4hNC8B1Y4Cqw7kir+9srFQUbq8tue8ANHINH38nvKw+QyjFRfoPVZ26S2sVvIN5b+NxLFO+UQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+xhevxAKTLPCuytsvXbF9gwRloAJSAijNILPSyVDO7azhLvPR6
	RYqH7vJbaxidLp32v+i6ihDwGogQJyGKCYHGszpRIHPTFX+Lkej5QVKoH6rZ+AlU6/e0zFZmUlk
	eKShAr3zrHAtXBDmlAVe3tQtGvtrYjSXo7/yFzEjNYBOHPGXzvVAvfepwPIBVu/EUzW6PI473Lw
	==
X-Gm-Gg: AYBFou1uKpjNurshU1EcHtet7yC+h5fjT4agarDJrHbmIr6Q3IKRT3PFmHbzOg5OuaH
	TxWGbT01iFBkjObE6B/mCs858Qa1TYkeNETe3JKpKMICPeYFZMBvOBy4mw8WI38lKClMLdwGZZL
	JkfonPnyRNA1Z4XWElxn4pOJzkbXOdV5ROQMJTSJFkUvHUO1baiJwA4U8IVTLVhznEsI8RegaeD
	aQBziEbA9BuKinBLs/4mst2wCaUAPLHPp1mzKKX6/vVy3wwiv4EpaxnzGfKHlPpg8POBYzpd/Nl
	jD1IxQg6ioKfx7YqKyBShWVZqy9Qp/ZObzdMZNK20d0bLDs4I6oEjAO5f0CAGWuDtZJDuRn9TQN
	27Zug2QUfTRp1K6Bz53fXPJLIUZd0OyQ/bm20hZDytv3XmVAseEoWroFo44FmzH69dMzG1LjL8Y
	TJjB4fqD/5qn5i5HGS+L4ky7aC3cSpAmI+KQ==
X-Received: by 2002:a05:620a:370e:b0:949:7502:6a8 with SMTP id af79cd13be357-94975020921mr471816785a.56.1794796698182;
        Sun, 15 Nov 2026 18:38:18 -0800 (PST)
X-Received: by 2002:a05:620a:370e:b0:949:7502:6a8 with SMTP id af79cd13be357-94975020921mr471814785a.56.1794796697746;
        Sun, 15 Nov 2026 18:38:17 -0800 (PST)
Received: from [10.38.240.54] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9497a4f1bccsm186560185a.36.2026.11.15.18.38.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 18:38:16 -0800 (PST)
Message-ID: <d784b5e9-af98-40a2-8670-6c12208983dd@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 10:38:07 +0800
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
Subject: Re: [PATCH v7 01/23] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add
 SM8750 CSI2 PHY
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20261114-add-support-for-camss-on-sm8750-v7-0-8ff2a11835f6@oss.qualcomm.com>
 <20261114-add-support-for-camss-on-sm8750-v7-1-8ff2a11835f6@oss.qualcomm.com>
 <20261114-voracious-capable-guan-99cacf@quoll>
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <20261114-voracious-capable-guan-99cacf@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAxMCBTYWx0ZWRfXwSZKjTo9pBEq
 an67hnxzI5RvC7+SmW+QJLKgTaFvys6kVSLZ4HCA/QKYTwINU3FqIBX577lJIpW/eG8KhZ23Nrt
 o9DZcGlElw04eQfMs+leBx/ZVCKuo1Ke4eXhF0qF2Sa9l7uSZSVfHdTlHImRkmefqe8ITcU2ewo
 fw8jRE3IWNY+oFZVByZCSL6pciNTHvtrgYnT7I2lK2/Y81KrkAktZ+MQ6OXI0KAxh+gmgC4JwDQ
 Ur88P9hY5jaEfUxd47ySUtgmuZwAgsH3Hx9KdH/MpZrIRQVRcsdlrJcoOhCJNuv3Sg3Pujo+9Hw
 OjFoHiPR3pIYcXlKdZjTMJW9ruc1s/wpWtySl9X/P56rrANgBo/9E9Xpy4YJYoNE2Pr4LJu1bpz
 by2Sy2yNjXsTndB1UKxjM98bbVlWRPgCLqG4qmRh0QR4r/uR8AeyHtvwypxeZWsvPDmpxFL324r
 G09xfWpdLmUpRXqgxYg==
X-Proofpoint-ORIG-GUID: Gvfw7vpC1xxBiIlsYs3MP-eZ_OBnwD9b
X-Proofpoint-GUID: Gvfw7vpC1xxBiIlsYs3MP-eZ_OBnwD9b
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAxMCBTYWx0ZWRfXwJZzuNl/fT0h
 BGO9ybmDA7rrAznZxp1hazjGDlaJNxMOgnb6GsH5Nq8wozE9dqpH4BU0vE5TjXAm/cDvUU9K6Iv
 9FOW64lL/3X+EFTnllPmrEdN5wx4AqE=
X-Authority-Analysis: v=2.4 cv=X9rHu2Te c=1 sm=1 tr=0 ts=6afa6c9b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=4xkCrKK1q9XhPcYNJToA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160010

Hi Krzysztof,

On 11/15/2026 2:11 AM, Krzysztof Kozlowski wrote:
> On Sat, Nov 14, 2026 at 07:29:18PM +0800, Wenmeng Liu wrote:
>> From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>>
>> The SM8750 camera subsystem has six CSI2 D-PHY blocks. Describe them
>> with a standalone "qcom,sm8750-csi2-phy" compatible, so the CAMSS
>> binding can instantiate the CSIPHY nodes as separate phy devices.
>>
>> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
>> ---
>>   Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml | 1 +
>>   1 file changed, 1 insertion(+)
> 
> Does not apply, so should be squashed with dependency. Why having it
> separate?

Since Bryan is about to apply the dependent bindings and driver changes, 
I kept them separate rather than squashing them into this series. I'll 
rebase this series once the KNP series has been applied.

Thanks,
Wenmeng

> 
> Best regards,
> Krzysztof



