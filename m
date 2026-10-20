Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792530284;
	b=W6E1Pd8lQDJKj19R6+4wBNL/xjMqFzQm7aFttpBom/VEiz070fECCTJevOBS/3cO+SuW
	 cKwKwR3rvmSYrBX/7JvTmLoNBykAmW07FsjvDCJt91QQjE7lLXLMmMR9CSIjsqA0IR8XG
	 /tGmTTJylC/3ELTYRfOHwrbC9XiBrJGSls2kxzCtXqeVXbQ2aaoPWc4Cnuf9xk2dKRqxo
	 ps2ZuS9SwBCH4lmsZUqe+vlJX9CHQqUxpryB1wmEHapFb2kdUJdLWwe2IfMx9r9DYYHx8
	 7tRBzULSKB06cfJQKj+y8Ttx9z7X2r8Orz+FuXKJfwg3JjQZKz23Cj2bJtZowNeXDlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792530284;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=W0kb4Akw+bn8BPFIkHjW3CrJjYWME/XFWI4jMhrgN6c=;
	b=qITp11qI5uSD4bpCoVw56G0u1pEbFv0HpjyPp2k3SGFvS4tNimsvpqF4QMnH3qLmg8iz
	 BSEEXtg7I4LFhdpQGjKqxz/yBlzR948OVoBH+whLK54nwQ+xfqFmzo1KZgW/qqSvrN8Vq
	 4WJEh4LS6JBl8bfDYIl6Zuio708XZXv715MQfOzKa9TacmW1Go3fxdqcQecN55T9JsaZm
	 WGy47eWyxyLVAln81veuNJpviITmjH1WesNeZA6MwpHY7Ge8p85mBol1Cr78IOsYCsPCb
	 QdMA2snT4r7kCQLNbRFJqJ/2mqBeQSy20QTkQ1rge/TvcBGtZ9hLL4S/fGCEgOvwCtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OdEK5b0u;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="JBUDaYQ/";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A061606A31A
	for <linux-media@vger.kernel.org>; Tue, 20 Oct 2026 21:04:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A061606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OdEK5b0u;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JBUDaYQ/
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KKtkST1890338
	for <linux-media@vger.kernel.org>; Tue, 20 Oct 2026 21:04:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W0kb4Akw+bn8BPFIkHjW3CrJjYWME/XFWI4jMhrgN6c=; b=OdEK5b0uuDC4pl1H
	rNfBFMks4raI2FTAL83yd+QaQu12fO2psfxpI+toA/wXxROva9zEopDXmpWT5h/B
	78RDs+JmsgRaQIS+o1S07XMwyndu6UuJ8KTcYyn4TQ8/Tjj/Yi1GZD4qBEhnKxb2
	IhPHLAiB5/zjJi1btP/IkvZ7Pt832Jcixk8FSdC89XcekOjN5L+kaZWLy9L9GLiW
	F9FPWhPX+mbwURIA+levjeMClatWVGcyAHCI9htozT8qPM/7LGWy1VznoOeyiWLL
	rjllWMgN94URv029cnS5fN2dSdbK+mPghpjqX0Ol28T8QrUmIFN2qHkDY1rKZ1l6
	6a7nbw==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hebyd0yhm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 20 Oct 2026 21:04:43 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-151ba226e1bso77412c88.0
        for <linux-media@vger.kernel.org>; Tue, 20 Oct 2026 14:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792530283; x=1793135083; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W0kb4Akw+bn8BPFIkHjW3CrJjYWME/XFWI4jMhrgN6c=;
        b=JBUDaYQ/055iKTXH/cMyeAur64PaANtLKJOAUexn+Z7eIbYGq/AEJhW3K40RVUfQyg
         U+32qMtxHr1hXkCxfXCQkIV8cDgSJtEbfkqU5WHVkjBdGKGSk7seppH4WVXzF0bNC59m
         daoyWPTNNH1gsU0J7iWg/CDG+E/jjCoD4ktbgx3xHH6+x69nDPszbWj+fFnAagixW7RY
         8RPFMEBV8Qu37UiBxWMhKM7jAfq7HNSHdcYAjMcuCivIAT/VNbsNUZH+JwcwsS7oiqAo
         QOqgeqEgPEDNZPhSld5ze7ZnTBEQWdvTcYzGlHKepbv662rA1w9JbKt5kJmq5g7MMZtX
         7Tlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792530283; x=1793135083;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W0kb4Akw+bn8BPFIkHjW3CrJjYWME/XFWI4jMhrgN6c=;
        b=Jzh0Fto7ofBJThmVZ0JrEY2YtyE6FwyTbI1zV60sM+TuKg+hcekbToiFOtE6riqYIb
         N2NDBabHtTIb7vVrcKPQB3ESFn9xpy6dff1EX9eY6DpzzBwCAlHQbyBmOdJsdujVFVSO
         f7sv4UW8ds9Eb0GwBiwFnIuvMH1Di3F52DamDR79VO/goONPJWDxJ+kL/KEdvbbxzyGP
         uG2oXWfgRlTzER7TMIrF0ojaHYfAifBDvpSj/8V4OjRfIn/mSI/ZXC/ont/vlvV6h48u
         e9zNQhu2TaA37z8WkWZPNKyK9yGy8JgmsB/wGEJXbL6tuzL8nV5wR0KMLj0rRQptE+E7
         iRcA==
X-Forwarded-Encrypted: i=1; AKwUvBwlldvYdYrYCuuFylLTE0UicLYLKZ54vDkVmMIOS9zmIntFPm6ZyHzTH2zRrMnfF/YgV7alvJ1i17vHSw==@vger.kernel.org
X-Gm-Message-State: AFq9FYItEGNYWPoWAChpmgPiidLqP7nkTsPr6Tt/qsPCoE/aPwK4VpZd
	NrHW3zJqRaZ9QMir7lo9QOds7Ix4ujz9oI9oRQfv8l9D4q3gHTe/+jPyvazeZd/YCuIEdGj4W1n
	SHand0pZf8QT+vG6ydR5md7EwRCxlTh6d3Fu6rTFPCFVXUc2nIkvkCnnOaT6IQFYCVg==
X-Gm-Gg: AYBFou3eEljIhuilpYErECYBIApLAfwuiC3MmOPhkL2BMGmrZWwjZY64klm3XCo6q05
	4LizKLG9RFjxqAfgwAlO4Lkqn1N//hjhF0pfDcMDDJ05/fal2KuX5x1W4tV5BzunP7dGsRBNSi2
	lI1/5wP9tbXGDsBmUP6YzC7JXfJcAuo3GkuvPWsyIPuxG7z+pK5YvOlCubZdNST/+dBNQk0UBqy
	x1M7cHzPLetrjsMKjfWz5sOQ71Rqkg2eE8zFUPSssDpH7vxSrTYX2AZd3ghsr3vEzX6H81TSyjE
	vJuAVKYlUhuM2KM+CQLCm7vvffbOv3c59Y4tkmFd+SA81Z1PEJ/TIZf1CFtJXVMdcnHGeC6iLD4
	8fjIYY6HWxyFcocEwngeVPQWLjilMAXdZ3e+DMwyFmxDYMkXszvbK8zkLtw==
X-Received: by 2002:a05:7022:691:b0:149:d501:b990 with SMTP id a92af1059eb24-190a599a59fmr60057c88.25.1792530283121;
        Tue, 20 Oct 2026 14:04:43 -0700 (PDT)
X-Received: by 2002:a05:7022:691:b0:149:d501:b990 with SMTP id a92af1059eb24-190a599a59fmr60003c88.25.1792530282524;
        Tue, 20 Oct 2026 14:04:42 -0700 (PDT)
Received: from [10.71.181.181] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903e02901fsm1009238c88.22.2026.10.20.14.04.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 14:04:42 -0700 (PDT)
Message-ID: <0c6b0b6f-af1d-4b7f-8494-01b1990b2d52@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 14:04:41 -0700
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
Subject: Re: [PATCH 3/7] dt-bindings: phy: qcom: Add qcs8300 to the CSI2 PHY
 schema
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: bod@kernel.org, vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org,
        mani@kernel.org, gjorgji.rosikopulos@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        jigarkumar.zala@oss.qualcomm.com, loic.poulain@oss.qualcomm.com,
        vladimir.zapolskiy@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261016235502.2274268-1-anusha.nandi@oss.qualcomm.com>
 <20261016235502.2274268-4-anusha.nandi@oss.qualcomm.com>
 <20261019-majestic-gorgeous-sheep-a9eae0@quoll>
Content-Language: en-US
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
In-Reply-To: <20261019-majestic-gorgeous-sheep-a9eae0@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA4MyBTYWx0ZWRfXxRKb3fsgYN44
 K84cJe9o5NfZMTEVOvjllTPEI87xD4lZam9X9Dzda92BY08Av9J6k13Vcf6P6kT+UR9Ak1wICnE
 XbPQCjkbG0INGD9r39eeK4ZjPehz1hA3BOQv8tCLbP0EitRmiYZQQ9DM9bcsYYQ2pc8HJQiSxkF
 DJOSg4msjH4pAjiN8znJJ0JzG98rXPPe3TcMiGDJ9MtFhZAegu7oIXsxsMD8spY2Hsvd59JYixf
 YVpj2dOGlty+HlSasKTcw7NbJ4mnK4AJLgeIgQ4Q4ZBQ9kZnvIpK+Xc0TO7a9y+5L1Oq9VDXn/y
 23RDnsioXxcp5SQyr6Cj/BfDQeDj9PU5fDR+QvuU2RMY32ThsDSQFIKrpAvCqV6xfH3LWCj4v02
 x0VM221C/TDIBJPPfo9n5L//bAcpmHtmoZRDpNjsdDil/6udZ0AzlmUnbQLqeLcW/xvGsMIu5Yj
 DBPq64xF1bEoLC3LDmw==
X-Authority-Analysis: v=2.4 cv=TdsDJhQh c=1 sm=1 tr=0 ts=6ad7d76b cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=Xvw101RpNOGDi7fnrawA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: 0bzHQFIV_RUl2HiwPdhSKf1SJYuyrCxZ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA4MyBTYWx0ZWRfXzYuu8UNy1rKe
 7cUpU1wVdoHGt6Bp5twovPR+2UHDUk4y7R3KEUz+zs4sjBpPJq+GJ47HSPC7Zc33bhEeOUOXIzJ
 P4pClSqPheEwDbyZidvh2KRO0TTrf0c=
X-Proofpoint-GUID: 0bzHQFIV_RUl2HiwPdhSKf1SJYuyrCxZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_04,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 phishscore=0 impostorscore=0 spamscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200083

Hi Krzysztof,

I can drop this file if there is a generic yaml file.

Best Regards,
Anusha

On 10/19/2026 12:18 AM, Krzysztof Kozlowski wrote:
> On Fri, Oct 16, 2026 at 04:54:58PM -0700, Anusha Arun Nandi wrote:
>> QCS8300 uses the same MIPI CSI2 CSIPHY as SA8775P --
>> identical D-PHY register layout, common-control offset and clock set.
>> Add "qcom,qcs8300-csi2-phy" as a second enum value in the existing
>> schema rather than duplicating it, and generalise the title/description
>> to cover both SoCs.
> 
> Just squash the patch.
> 
>>
>> Signed-off-by: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
>> ---
>>  .../devicetree/bindings/phy/qcom,sa8775p-csi2-phy.yaml   | 9 ++++++---
>>  1 file changed, 6 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/phy/qcom,sa8775p-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sa8775p-csi2-phy.yaml
>> index b66ec2f14189..8e60ef0714bc 100644
>> --- a/Documentation/devicetree/bindings/phy/qcom,sa8775p-csi2-phy.yaml
>> +++ b/Documentation/devicetree/bindings/phy/qcom,sa8775p-csi2-phy.yaml
>> @@ -5,18 +5,21 @@
>>  $id: http://devicetree.org/schemas/phy/qcom,sa8775p-csi2-phy.yaml#
>>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>>  
>> -title: Qualcomm SA8775P CSI2 PHY
>> +title: Qualcomm SA8775P / QCS8300 CSI2 PHY
>>  
>>  maintainers:
>>    - Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
>>  
>>  description:
>>    Qualcomm MIPI CSI2 D-PHY. Connects MIPI CSI2 sensors to Qualcomm's Camera
>> -  CSI Decoder on the SA8775P (lemans) SoC.
> 
> You just added this line. Changing something you added means previous
> patch is not correct.
> 
> Best regards,
> Krzysztof

