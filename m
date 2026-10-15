Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEA874E1414
	for <linux-media@vger.kernel.org>; Thu, 15 Oct 2026 09:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792055498; cv=none; b=e90VC3nI4z7YfXOnCzvSHCyd5uljN/cpj4oP7AkFMjjzvxnJTkzRsFWJ60bEiKpyHe/CtXiyPVRWRHcxGfIzRVA8mQFJAJUeC+1yZMa0u+cRJOl6YoFv8T5XoONTD6s+uzmkkQmXgMwjokHPSP2AUvURfQqbt49rbfo7FUWjA0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792055498; c=relaxed/simple;
	bh=S8Pptq+vcse9dGiKT8gs8J0Yx5ou51980cSXw47gMzo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qt7wrmtRhkw1WQTWHqNGxx1QwxR4TlPX78em1Ewfta8cWY7bmohXop/+4d3R+W2zKItHq7QtW4ibc8TMMhBD7laBHfMGwYPX8lm2vf3+GJYIjwtP6PynPNO5fxn0b++pCRlUPmAJrGoIlBQDh3I60c82fsCly8BVtQm+2aWFEzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LobXK+RP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ifNX80E3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LobXK+RP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ifNX80E3"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F7pAG53469274
	for <linux-media@vger.kernel.org>; Thu, 15 Oct 2026 09:11:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CcLXbbDcvrR52DI1NpPmmgKUewSqZ1QBwlFhGSU+Lxw=; b=LobXK+RP77qk7npM
	SkRQLrjLL4d81Yw9kZnlBtPsIEL3VghMpEnUq3STSLW9tMdybnVm5DeRZ8bUhfWj
	5oqVyU/uW795LXeoR1SCk1GF2ujQUy7sqJVXhfkaLili8trdKxSjKwVEXY51RbpP
	rNodWFFtorFIui/XlaK/X8VnUPw+SrdP68P7mb7Pg3hKh5IbpG4QMav1yqUuhmDP
	b84WNImBwKb2DJ5QIhHyas0sp8yXSv3ap+Pt68U1ZglE9fgZOB2h/z1zxg1bjSyK
	mjLi6oRL75K/1SiQCh1PReK9yu2r8p0B3CPZVYQzHdNuKahW47X4NbqMJG7lyDga
	VJD0kg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hadd7bew3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 15 Oct 2026 09:11:36 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-88c76888646so2016614b3a.1
        for <linux-media@vger.kernel.org>; Thu, 15 Oct 2026 02:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792055495; x=1792660295; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CcLXbbDcvrR52DI1NpPmmgKUewSqZ1QBwlFhGSU+Lxw=;
        b=ifNX80E3MqL6JkWLQVjAwr8uG50hiiZeTmecE9D+szBdtbaXw30Q5KXllxBK6kaFEY
         zjBnZhUwquuIubFXJ2zIi0dxcmxAdYDnvve+ZEPy6zdV7MxzxNCaJP+gJm4or7ttuTkW
         7cMQc8nBW2UeHfagCuuXHf90ROMn0gShDtie5qwPgNN/nrZvhdFKnEpekT9jIFB3wiCk
         fHjkF+NQEbZg+kEXfpx8DxtuZyU+0AgN3Z577abWjLQDazHlIsvrEDBELb3Sq1hcLrLb
         lxEkKrhUvH1Gum+1TfXjr9ourE75bw48tEFRwyNklHsjj98MIDbTFyRjD2tNm2zElydJ
         1R+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792055495; x=1792660295;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CcLXbbDcvrR52DI1NpPmmgKUewSqZ1QBwlFhGSU+Lxw=;
        b=ECMZqGEkaa3l0g6Jc+8EHqyXSwQpWPvRzWWWRJ/1QpOrOxbmlP7BRzt+mObSV6PwvV
         T+kpWDEvrx4YjbLjNs/5cipEeSdej0W1FUtn5/JM7dAkO8sQmWdEzJj1qp1JfmDFfxsq
         L4fhVk0s35BnbyZgb2utKrhQf+sHA4YVs/saPLsyRvs+1+3r9Be/GTrxLp5j26R+cJF3
         BftOgukjaYKf0BoOvPT/GQ5rq3jAFQvEmc1CYVBCBwzpl5xztD+9KkieRpxWO8ZZVTuL
         rW6O6rt4w95pV9ZTI9CfMzETz7CzVkd5yDB6k2Tuy39+tt1GI8FpVLs0O7NMEqsH5Vw3
         RhaA==
X-Forwarded-Encrypted: i=1; AKwUvBwQCYVQjy/iE5b2u81lZRUUS6C6Iq+PhdwtwV82IPb8CsYEpJ65wRaESWVttnMdFOHAZSGmrlqNVYVWiw==@vger.kernel.org
X-Gm-Message-State: AFq9FYJJ+xLBAjX+yKtUHzXr2zrV/1h4XPYqsvewqyCjyOPNjd0I9nxW
	lKYV+LRABM0gCIw6mxQS9kp7oRHUIV95T4nxfkDRd/SVolBXQhYBqRnmCO/q3YXfSPJSwjxOI93
	KD+PCZlsviGeMy8Zkb8DVfPdlo0hvjBhzED/fQvYS1bOjBkchPIok9Ehg56Np/OZqGg==
X-Gm-Gg: AYBFou2sLKtHOveRhyOI4OGNEDbMpRdjwtni/RoD5mHauj134LxzdbJAy47YgDwSbJi
	5ELqjsWJr5pixVdBeaaTRg+cgoVCfqnJd6TAaad48+yXRHyYHx0pUoaROFoLqCD7HWZo/VmETYe
	U2cNN0KNa8ZTl/JM1HOmmtLqhr0Y411Rt4fwB41A6r+Vrz6T4Y/Gb/I6+pEtU35O83GiH9yU55o
	q5thWV4VbJmvvWX3Pm15aLqIgKl5Rc+sSjNR2mYKydum8uXiyMdoIQ+VEI1loHfLoltWX+myJZY
	eRs5A7XwgcseG1Hw8tAa9Z2+IlKTE7JGogiBCcjxCnIROgYYqP5wh4tjuCjoy3taqp4tCUTIxC5
	H8R8S9jAFAmpw+sgD6Vb84NNp1dka9w==
X-Received: by 2002:a05:6a00:4099:b0:89e:37b1:b80d with SMTP id d2e1a72fcca58-89e37b1ba49mr2322666b3a.45.1792055495427;
        Thu, 15 Oct 2026 02:11:35 -0700 (PDT)
X-Received: by 2002:a05:6a00:4099:b0:89e:37b1:b80d with SMTP id d2e1a72fcca58-89e37b1ba49mr2322643b3a.45.1792055494932;
        Thu, 15 Oct 2026 02:11:34 -0700 (PDT)
Received: from [10.206.102.180] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89d804d1c10sm2087387b3a.35.2026.10.15.02.11.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 02:11:33 -0700 (PDT)
Message-ID: <3b58ccbe-bf6a-4b96-86c5-584d7feeeb6f@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 14:41:26 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] arm64: dts: qcom: nord: Add iris video node
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260919-nord-iris-v1-0-94428761ec06@oss.qualcomm.com>
 <20260919-nord-iris-v1-2-94428761ec06@oss.qualcomm.com>
 <aq_cmcYa1wL69Hq4@QCOM-aGQu4IUr3Y>
Content-Language: en-US
From: Gourav Kumar <gourav.kumar@oss.qualcomm.com>
In-Reply-To: <aq_cmcYa1wL69Hq4@QCOM-aGQu4IUr3Y>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=BaVNQbt2 c=1 sm=1 tr=0 ts=6ad098c8 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=y2grCCtr-R1DBeC8SxUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: jl9H0wbkALz_7zgFSSXnq29z4TgB4c8x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzNiBTYWx0ZWRfXzFKQOzkOZOz5
 RWOGOKPUFVq53Cy3DE6EhKbqrj1O/YfC0/LPk4pqsqhpXvCPaRoAXIVCmrg3Ph8AoDA9HB+f29D
 cP6hbH1MS7Q+xKlSciAp+CfB9Urk6G3V+Rsntt7JoyD6fTmT9/9zSzJSG7gdyjwIOUNRn0cDckn
 4rNAuF9+cvFcbADGI03yajjLxA70es4RiRLqI6nHOrMO1vbMlTSPt5Xhtrxz/55TlG08mlJQoe3
 xkNV+NwNBgXyVJh5K0WYjqrBzTezjc+dXQDb1YDBl5IMQyrce7p3APgAEW4r59KW4z2a9MnfYRr
 D6tpSLJlbmgdSrf8BoC2cmu8ndKHaEJ8aiU47C9mtCeKpWIhddY63v+L+tTd83exe+V+eD3HPd2
 PHocgD0udvKTWLA7NwTw5HTJt/SjYpI6QOMWVsFUNp5egCnHGUhJcDtE/DJcjMMCH7jfWoNb2Up
 fBTwbWhkly/0lR7zNeg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzNiBTYWx0ZWRfXyGFD53vte33c
 +unKcuFOxiZ+9Qumi4LHUI40sMzxxpVk9eJgTs61jcx6QnyE/c607yQnbX24Z9RFLw01aFj6+Af
 GmlkchmB00N73tGGxXDLToqfmjNZ2KI=
X-Proofpoint-ORIG-GUID: jl9H0wbkALz_7zgFSSXnq29z4TgB4c8x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150036



On 9/20/2026 6:46 PM, Shawn Guo wrote:
> On Sat, Sep 19, 2026 at 10:14:56AM +0530, Vishnu Reddy wrote:
>> Add iris video codec to nord SoC, which comes with significantly different
>> powering up sequence than previous platforms, thus different clocks and
>> resets.
>>
>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/nord-embedded.dtsi | 114 ++++++++++++++++++++++++++++
>>  1 file changed, 114 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
>> index 74f4e6be8652..03f827f3e5fc 100644
>> --- a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
>> @@ -1428,6 +1428,120 @@ camcc: clock-controller@9ce0000 {
>>  		#power-domain-cells = <1>;
>>  	};
>>  
>> +	iris: video-codec@aa00000 {
>> +		compatible = "qcom,nord-iris", "qcom,glymur-iris";
>> +		reg = <0x0 0x0aa00000 0x0 0xf0000>;
> 
> nord-embedded.dtsi is a place to accommodate Nord Embedded variant
> specific resource descriptions, like clock, regulator, pinctrl,
> interconnect, power domain, PHY, etc. The rest of descriptions should
> go to nord.dtsi, like reg, interrupts, iommu, dma, etc.
> 

Iris depends on providers such as videocc, nwgcc, hscnoc, and mc_virt,
which are defined only in nord-embedded.dtsi.
Moving the Iris node into nord.dtsi would leave unresolved references in
DTS variants that don’t include the embedded file, causing DTB build
failures.
We should keep the iris node in nord-embedded.dtsi.

Gourav Kumar

> Shawn
> 
>> +
>> +		clocks = <&nwgcc NW_GCC_VIDEO_AXI0_CLK>,
>> +			 <&videocc VIDEO_CC_MVS0C_CLK>,
>> +			 <&videocc VIDEO_CC_MVS0_CLK>,
>> +			 <&nwgcc NW_GCC_VIDEO_AXI0C_CLK>,
>> +			 <&videocc VIDEO_CC_MVS0C_FREERUN_CLK>,
>> +			 <&videocc VIDEO_CC_MVS0_FREERUN_CLK>,
>> +			 <&nwgcc NW_GCC_VIDEO_AXI1_CLK>,
>> +			 <&videocc VIDEO_CC_MVS1_CLK>,
>> +			 <&videocc VIDEO_CC_MVS1_FREERUN_CLK>;
>> +		clock-names = "core_iface",
>> +			      "core",
>> +			      "vcodec0_core",
>> +			      "vcodec0_iface",
>> +			      "core_freerun",
>> +			      "vcodec0_core_freerun",
>> +			      "vcodec1_iface",
>> +			      "vcodec1_core",
>> +			      "vcodec1_core_freerun";
>> +
>> +		dma-coherent;
>> +
>> +		interconnects = <&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
>> +				 &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
>> +				<&mmss_noc MASTER_VIDEO_MVP0 QCOM_ICC_TAG_ALWAYS
>> +				 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
>> +		interconnect-names = "cpu-cfg",
>> +				     "video-mem";
>> +
>> +		interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
>> +
>> +		memory-region = <&video_mem>;
>> +
>> +		operating-points-v2 = <&iris_opp_table>;
>> +
>> +		power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
>> +				<&videocc VIDEO_CC_MVS0_GDSC>,
>> +				<&rpmhpd RPMHPD_MXC>,
>> +				<&rpmhpd RPMHPD_MMCX>,
>> +				<&videocc VIDEO_CC_MVS1_GDSC>;
>> +		power-domain-names = "venus",
>> +				     "vcodec0",
>> +				     "mxc",
>> +				     "mmcx",
>> +				     "vcodec1";
>> +
>> +		resets = <&nwgcc NW_GCC_VIDEO_AXI0_CLK_ARES>,
>> +			 <&nwgcc NW_GCC_VIDEO_AXI0C_CLK_ARES>,
>> +			 <&videocc VIDEO_CC_MVS0C_FREERUN_CLK_ARES>,
>> +			 <&videocc VIDEO_CC_MVS0_FREERUN_CLK_ARES>,
>> +			 <&nwgcc NW_GCC_VIDEO_AXI1_CLK_ARES>,
>> +			 <&videocc VIDEO_CC_MVS1_FREERUN_CLK_ARES>;
>> +		reset-names = "core_bus",
>> +			      "vcodec0_bus",
>> +			      "core",
>> +			      "vcodec0_core",
>> +			      "vcodec1_bus",
>> +			      "vcodec1_core";
>> +
>> +		#address-cells = <1>;
>> +		#size-cells = <1>;
>> +		dma-ranges = <0x0 0x0 0x0 0xffe00000>;
>> +
>> +		status = "disabled";
>> +
>> +		non-pixel {
>> +			iommus = <&apps_smmu_1 0x0940 0x20>,
>> +				 <&apps_smmu_1 0x0944 0x0>,
>> +				 <&apps_smmu_1 0x0960 0x20>;
>> +			iommu-ranges = <0x25800000 0xda600000>;
>> +		};
>> +
>> +		pixel {
>> +			iommus = <&apps_smmu_1 0x0943 0x0>;
>> +		};
>> +
>> +		iris_opp_table: opp-table {
>> +			compatible = "operating-points-v2";
>> +
>> +			opp-240000000 {
>> +				opp-hz = /bits/ 64 <240000000 240000000 360000000>;
>> +				required-opps = <&rpmhpd_opp_svs>,
>> +						<&rpmhpd_opp_svs>;
>> +			};
>> +
>> +			opp-435000000 {
>> +				opp-hz = /bits/ 64 <435000000 435000000 652500000>;
>> +				required-opps = <&rpmhpd_opp_svs_l1>,
>> +						<&rpmhpd_opp_svs_l1>;
>> +			};
>> +
>> +			opp-480000000 {
>> +				opp-hz = /bits/ 64 <480000000 480000000 720000000>;
>> +				required-opps = <&rpmhpd_opp_svs_l1>,
>> +						<&rpmhpd_opp_nom>;
>> +			};
>> +
>> +			opp-533333333 {
>> +				opp-hz = /bits/ 64 <533333333 533333333 800000000>;
>> +				required-opps = <&rpmhpd_opp_svs_l1>,
>> +						<&rpmhpd_opp_turbo>;
>> +			};
>> +
>> +			opp-560000000 {
>> +				opp-hz = /bits/ 64 <560000000 560000000 840000000>;
>> +				required-opps = <&rpmhpd_opp_nom>,
>> +						<&rpmhpd_opp_turbo_l1>;
>> +			};
>> +		};
>> +	};
>> +
>>  	videocc: clock-controller@aaf0000 {
>>  		compatible = "qcom,nord-videocc";
>>  		reg = <0x0 0x0aaf0000 0x0 0x10000>;
>>
>> -- 
>> 2.34.1
>>
>>

