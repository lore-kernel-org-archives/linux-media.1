Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 216494A2054
	for <linux-media@vger.kernel.org>; Tue,  8 Sep 2026 08:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788857186; cv=none; b=BfdrgmpF2bF1hqsSS6N1cLAM1yGYtOu5/tZuBV3bjw4PUra+G40HGZJiF4nRk8uCcBLW/H3QNOqwbtVMpDDezTLeaUHRCUI0ImhQoV3PUGO7NQlapeOwWVkey57rQump+0XyJ08c2rqLX3ExectTSTB1tLuEnHzxSI5ZQP/or6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788857186; c=relaxed/simple;
	bh=utzLf/vlmEQYRrCUTZYwl9rhKpbvMCOBl0vcW5bvdaQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qc00omLgYJ934ub/RHFryIvN62cWmt6q6ndviY8FiVRtsSmZUoTy18MZnuBl1XsEBo2tH35/97IGhqIRPHGbSQ52q1TAXCE9uIs+vASbsBDhvQkAG1UgIX0fXCASEXqDqmZpBT2zBOS3wE/wUxwltt+cd2yKekilBHlTiVqAgLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SFHyii2m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Oa7UIqAH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SFHyii2m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Oa7UIqAH"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6886LrmJ2154237
	for <linux-media@vger.kernel.org>; Tue, 8 Sep 2026 08:46:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XMMJeXnoAXfYPiF6XqiCcv6X6ah8mxOOiGGLqHEPM48=; b=SFHyii2mUS1mS5CG
	AbIXKddF/qLIqvEzIQz3z8iMsRlk4jbOW+I/ossub8eSxWP0acO8c1jqvSfCDgFE
	CnPMc9FhHBZ3YBFShUGzjV36BC+vNK1PUBDYapx2yftc9/tb14uW27eM8QrCZJ/I
	Inb/QqBweCtF8+U743u43gVOYauI9XDgq1g43C89ZzqmohdhEzR7NrDLkmVY/dxx
	Yk9wEF7XNhoRT26LTTMC+tHqX7eMnEaboQx8OSXOw46pr6TsH8HR1+ESZBjjwaI3
	0Vf4Xxq0M+70XAGWbBbg8RoaMZp38TxRHV7FenCp96+lSOsOMIiETiRPy632+OU5
	7pyvKg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gj1rwjhyw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 08 Sep 2026 08:46:22 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9390a2c895bso896348385a.0
        for <linux-media@vger.kernel.org>; Tue, 08 Sep 2026 01:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788857182; x=1789461982; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XMMJeXnoAXfYPiF6XqiCcv6X6ah8mxOOiGGLqHEPM48=;
        b=Oa7UIqAHRZU02+KNpV3kqpX7iOBVsQegpDhAP/sAcgQgOGyWj9v2+Ow1BpKWUXDT0x
         G0l1qUe9PYqVoOkN2/TYCjiV+LKcTSS3LqmbLPF7b0nJ6vYfErnDHRog6ObToYOdNB2z
         s2/utIws3s5JSgkB/73sHsTCFUDBgEXJWhkkGI+K5wQlgs61pBDLsW4wy5JyfONCPDQQ
         nqI2FH9k39RIMhZqar+zYAGHnOcPoJL53M9YIyzgPdoogTR5n0ow8wjIlKUqsLw5rewC
         dp9BxQauvWSfELrbQTedvZuQQuu72vjCUlqgBvbWTlEg0GpIOfI0epcWPCisdRSJzsL7
         RPNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788857182; x=1789461982;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XMMJeXnoAXfYPiF6XqiCcv6X6ah8mxOOiGGLqHEPM48=;
        b=Fiuxpy+fNv3VsRuUIpH7RIOwc8Sy7Noj1X0qIBrqYRdaHLcErQ0C7/L4j8iSkcYzur
         8cIF3uNsKhi3Y3EFdBxjJTdPVtsB+oGO0mjd1V6NeBSR2CRmSKeeg03s+66HrxCqHwfU
         3FlHJGZ4scN5SlDoGN8aT8sNXN6bXhtcpN2jLIu/ppckbXCjNghuv0DtSwOmoijsqAWq
         +zu+WM+qn49/lMJg0kCi7ScGIjqfs1B3S5abr9Y7TptZIAcamOMlxPLXibRD26GjyWW7
         rj+Fu+1IP0JL+ocKfdLBB/Vh4eE0SbH64lR/2p97Ks6u0Jqql+euNFHQzUXrHdbpyAv8
         Lg4Q==
X-Forwarded-Encrypted: i=1; AKwUvBwqsAy4zwKdGLu1hL7S0drytiIDFWp/LgXqJ2PUQHfqRHOFalrnzwMyisIUl/mss9Cp4Lms5WVPt9Nu0g==@vger.kernel.org
X-Gm-Message-State: AFuF++kUBG579zxu6Ka5dvyyucATQsl3blgEUb6QcQM5JDewwmaJYjpK
	+YSJLiq+iy/qmT1YdFkLMUshfxooL8GAm84zB4hmx7+izyQnbN6mrMycVNaiPf52z3fbSb7PDif
	HtBe6+4wSGCv4Z4URffg3WdAyomReUsAH0fY0MOeaZ8rsr3w9nfYbGWGe2vsAN5Ukx+RHs6urLv
	l1
X-Gm-Gg: AYBFou2I5PuLuJjQQEEUmsY5Cr97Cban6MlPmXpPrRW2Y3s8qndTgRL41HNXdKnezhx
	uc0bYstidEXyBcWAI9ovMaalFR2fehyKTbQNXUQdO9CCzayu+ZKdi/mOUHyWfeCGJb3cexMxDr6
	wdHMV/xCf4T5+zCSEw4t+2Jvr69zs4ekcoW0CZacrQStmV01paOIj7yl6Bv6934cFj814lSyi10
	b/Rn5MxnZ7WYKCrflh/l/nehpqXgwqW947Fu3mJM6eG7sgBG8rGS2AELdi2E8942qSHA0IDA6Qq
	+GaczohyJkVQ6tLA6oAVjREuPyF49+d6lSRq8B8L75x2LgtQPmz9nujcZeDdepzhTc12QVwW8c4
	1r3oDv5RSePUIZRZxLS9DyBv+D1WEXJD35YsJfqF/ig7scgGmdcQ/RsRxA9i7q78=
X-Received: by 2002:a05:620a:f0b:b0:939:a1cc:f234 with SMTP id af79cd13be357-939a1ccf31fmr1467896185a.5.1788857182055;
        Tue, 08 Sep 2026 01:46:22 -0700 (PDT)
X-Received: by 2002:a05:620a:f0b:b0:939:a1cc:f234 with SMTP id af79cd13be357-939a1ccf31fmr1467892285a.5.1788857181484;
        Tue, 08 Sep 2026 01:46:21 -0700 (PDT)
Received: from [10.38.244.120] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9397fb62710sm1098621985a.28.2026.09.08.01.46.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 01:46:20 -0700 (PDT)
Message-ID: <4c43c80c-d8c3-4738-9a5f-0b3e1c19679d@oss.qualcomm.com>
Date: Tue, 8 Sep 2026 16:46:14 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 05/13] arm64: dts: qcom: x1e80100: Add CAMSS block
 definition
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20260906-x1e-camss-csi2-phy-dtsi-v6-0-067f2ecc4630@linaro.org>
 <20260906-x1e-camss-csi2-phy-dtsi-v6-5-067f2ecc4630@linaro.org>
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <20260906-x1e-camss-csi2-phy-dtsi-v6-5-067f2ecc4630@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ga8nWwXL c=1 sm=1 tr=0 ts=6a9fcb5e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=KKAkSRfTAAAA:8 a=-P7vb124-MV0i9wHP64A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA5MiBTYWx0ZWRfX3EzOkZxfINMX
 IS/I7OYO0fKuiJsrhmHcB6cVtB633rRovdPsO+2lmYltGrOXOQ43Y7mM/JvPE0mZ1OIVcwE8LZs
 5MhzalQrIcRrP4qaGbHXrAjT91WI15EpNMkRu6yFQiTivkCN8MXuMIy+VVc8L1VaoRFYs0ER/Vu
 +OSjzyVeFOsqdR9KBvy8egnoe3pvMlSsDR0ySiYkWs3rEFosEX9BDeLxqg333HM9b6uSkkmZ9KN
 roi09zR4amH/Ka7C+3FhWbVxs+gG6xmNIiF2yKZibaEc6zW8OhOBjIBPMfFk3vetROOjCiEJzp8
 dUYwHmJFGxjvVj30+usDnDd5GVCc0frwHc3gMo6pg5jRaiu/fStM9Cp0kNh7cjVkO49j+r4i1u2
 To4LmQLAFDHBKzoWyKcMkZdeQRReeG8YODuYcrhqIbNDh/nYHrbJ53qYuBJLvqc4xbrUYzkFuLi
 sIPIDqcHyDNr12NDXGA==
X-Proofpoint-ORIG-GUID: aVxb3GQXZp4dwrcDK_R9LAHy4Xr5VtH_
X-Proofpoint-GUID: aVxb3GQXZp4dwrcDK_R9LAHy4Xr5VtH_
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA5MiBTYWx0ZWRfX9W/4O6GOgKoV
 rIOR2RXDcBPajaR33Jae/fZKPzfTJDJxHl4EFjbvul8Arr9cetOLVnClFYKz/le+FoeIMYsp02r
 BAgqJ8utXa1nN54zo8pEanD+223hR/Q=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080092



On 9/6/2026 10:20 PM, Bryan O'Donoghue wrote:
> Add dtsi to describe the xe180100 CAMSS block
> 
> 4 x CSIPHY
> 3 x TPG
> 2 x CSID
> 2 x CSID Lite
> 2 x IFE
> 2 x IFE Lite
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/hamoa.dtsi | 322 ++++++++++++++++++++++++++++++++++++
>   1 file changed, 322 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> index 9a854da9550c3..75366afd1b5b2 100644
> --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
> +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> @@ -16,6 +16,7 @@
>   #include <dt-bindings/interconnect/qcom,x1e80100-rpmh.h>
>   #include <dt-bindings/interrupt-controller/arm-gic.h>
>   #include <dt-bindings/mailbox/qcom-ipcc.h>
> +#include <dt-bindings/phy/phy.h>
>   #include <dt-bindings/phy/phy-qcom-qmp.h>
>   #include <dt-bindings/power/qcom,rpmhpd.h>
>   #include <dt-bindings/power/qcom-rpmpd.h>
> @@ -719,6 +720,50 @@ smem_mem: smem@ffe00000 {
>   		};
>   	};
>   
> +	csiphy_mxc_opp_table: opp-table-mxc {
> +		compatible = "operating-points-v2";
> +
> +		opp-300000000 {
> +			opp-hz = /bits/ 64 <300000000>;
> +			required-opps = <&rpmhpd_opp_low_svs_d1>,
> +					<&rpmhpd_opp_low_svs_d1>;
> +		};
> +
> +		opp-400000000 {
> +			opp-hz = /bits/ 64 <400000000>;
> +			required-opps = <&rpmhpd_opp_low_svs>,
> +					<&rpmhpd_opp_low_svs>;
> +		};
> +
> +		opp-480000000 {
> +			opp-hz = /bits/ 64 <480000000>;
> +			required-opps = <&rpmhpd_opp_low_svs>,
> +					<&rpmhpd_opp_low_svs>;
> +		};
> +	};
> +
> +	csiphy_mxa_opp_table: opp-table-mxa {
> +		compatible = "operating-points-v2";
> +
> +		opp-300000000 {
> +			opp-hz = /bits/ 64 <300000000>;
> +			required-opps = <&rpmhpd_opp_low_svs_d1>,
> +					<&rpmhpd_opp_low_svs_d1>;
> +		};
> +
> +		opp-400000000 {
> +			opp-hz = /bits/ 64 <400000000>;
> +			required-opps = <&rpmhpd_opp_low_svs>,
> +					<&rpmhpd_opp_low_svs_d1>;
> +		};
> +
> +		opp-480000000 {
> +			opp-hz = /bits/ 64 <480000000>;
> +			required-opps = <&rpmhpd_opp_low_svs>,
> +					<&rpmhpd_opp_low_svs_d1>;
> +		};
> +	};
> +
>   	qup_opp_table_100mhz: opp-table-qup100mhz {
>   		compatible = "operating-points-v2";
>   
> @@ -5629,6 +5674,283 @@ cci1_i2c1: i2c-bus@1 {
>   			};
>   		};
>   
> +		camss: isp@acb7000 {
> +			compatible = "qcom,x1e80100-camss";
> +
> +			reg = <0 0x0acb7000 0 0x2000>,
> +			      <0 0x0acb9000 0 0x2000>,
> +			      <0 0x0acbb000 0 0x2000>,
> +			      <0 0x0acc6000 0 0x1000>,
> +			      <0 0x0acca000 0 0x1000>,
> +			      <0 0x0acb6000 0 0x1000>,
> +			      <0 0x0ace4000 0 0x1000>,
> +			      <0 0x0ace6000 0 0x1000>,
> +			      <0 0x0ace8000 0 0x1000>,
> +			      <0 0x0acec000 0 0x4000>,
> +			      <0 0x0acf6000 0 0x1000>,
> +			      <0 0x0acf7000 0 0x1000>,
> +			      <0 0x0acf8000 0 0x1000>,
> +			      <0 0x0ac62000 0 0xf000>,
> +			      <0 0x0ac71000 0 0xf000>,
> +			      <0 0x0acc7000 0 0x2000>,
> +			      <0 0x0accb000 0 0x2000>;
> +
> +			reg-names = "csid0",
> +				    "csid1",
> +				    "csid2",
> +				    "csid_lite0",
> +				    "csid_lite1",
> +				    "csid_wrapper",
> +				    "csiphy0",
> +				    "csiphy1",
> +				    "csiphy2",
> +				    "csiphy4",
> +				    "csitpg0",
> +				    "csitpg1",
> +				    "csitpg2",
> +				    "vfe0",
> +				    "vfe1",
> +				    "vfe_lite0",
> +				    "vfe_lite1";
> +
> +			clocks = <&camcc CAM_CC_CAMNOC_AXI_NRT_CLK>,
> +				 <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
> +				 <&camcc CAM_CC_CORE_AHB_CLK>,
> +				 <&camcc CAM_CC_CPAS_AHB_CLK>,
> +				 <&camcc CAM_CC_CPAS_FAST_AHB_CLK>,
> +				 <&camcc CAM_CC_CPAS_IFE_0_CLK>,
> +				 <&camcc CAM_CC_CPAS_IFE_1_CLK>,
> +				 <&camcc CAM_CC_CPAS_IFE_LITE_CLK>,
> +				 <&camcc CAM_CC_CPHY_RX_CLK_SRC>,

I think we should remove the SRC clock.

Thanks,
Wenmeng

> +				 <&camcc CAM_CC_CSID_CLK>,
> +				 <&camcc CAM_CC_CSID_CSIPHY_RX_CLK>,
> +				 <&camcc CAM_CC_CSIPHY0_CLK>,
> +				 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
> +				 <&camcc CAM_CC_CSIPHY1_CLK>,
> +				 <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
> +				 <&camcc CAM_CC_CSIPHY2_CLK>,
> +				 <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
> +				 <&camcc CAM_CC_CSIPHY4_CLK>,
> +				 <&camcc CAM_CC_CSI4PHYTIMER_CLK>,
> +				 <&gcc GCC_CAMERA_HF_AXI_CLK>,
> +				 <&gcc GCC_CAMERA_SF_AXI_CLK>,
> +				 <&camcc CAM_CC_IFE_0_CLK>,
> +				 <&camcc CAM_CC_IFE_0_FAST_AHB_CLK>,
> +				 <&camcc CAM_CC_IFE_1_CLK>,
> +				 <&camcc CAM_CC_IFE_1_FAST_AHB_CLK>,
> +				 <&camcc CAM_CC_IFE_LITE_CLK>,
> +				 <&camcc CAM_CC_IFE_LITE_AHB_CLK>,
> +				 <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
> +				 <&camcc CAM_CC_IFE_LITE_CSID_CLK>;
> +
> +			clock-names = "camnoc_nrt_axi",
> +				      "camnoc_rt_axi",
> +				      "core_ahb",
> +				      "cpas_ahb",
> +				      "cpas_fast_ahb",
> +				      "cpas_vfe0",
> +				      "cpas_vfe1",
> +				      "cpas_vfe_lite",
> +				      "cphy_rx_clk_src",
> +				      "csid",
> +				      "csid_csiphy_rx",
> +				      "csiphy0",
> +				      "csiphy0_timer",
> +				      "csiphy1",
> +				      "csiphy1_timer",
> +				      "csiphy2",
> +				      "csiphy2_timer",
> +				      "csiphy4",
> +				      "csiphy4_timer",
> +				      "gcc_axi_hf",
> +				      "gcc_axi_sf",
> +				      "vfe0",
> +				      "vfe0_fast_ahb",
> +				      "vfe1",
> +				      "vfe1_fast_ahb",
> +				      "vfe_lite",
> +				      "vfe_lite_ahb",
> +				      "vfe_lite_cphy_rx",
> +				      "vfe_lite_csid";
> +
> +			interrupts = <GIC_SPI 464 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 466 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 431 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 468 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 359 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 122 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 467 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 469 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 360 IRQ_TYPE_EDGE_RISING>;
> +
> +			interrupt-names = "csid0",
> +					  "csid1",
> +					  "csid2",
> +					  "csid_lite0",
> +					  "csid_lite1",
> +					  "csiphy0",
> +					  "csiphy1",
> +					  "csiphy2",
> +					  "csiphy4",
> +					  "vfe0",
> +					  "vfe1",
> +					  "vfe_lite0",
> +					  "vfe_lite1";
> +
> +			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> +					 &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
> +					<&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> +					<&mmss_noc MASTER_CAMNOC_SF QCOM_ICC_TAG_ALWAYS
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> +					<&mmss_noc MASTER_CAMNOC_ICP QCOM_ICC_TAG_ALWAYS
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> +			interconnect-names = "ahb",
> +					     "hf_mnoc",
> +					     "sf_mnoc",
> +					     "sf_icp_mnoc";
> +
> +			iommus = <&apps_smmu 0x800 0x60>,
> +				 <&apps_smmu 0x820 0x60>,
> +				 <&apps_smmu 0x840 0x60>,
> +				 <&apps_smmu 0x860 0x60>,
> +				 <&apps_smmu 0x18a0 0x0>;
> +
> +			power-domains = <&camcc CAM_CC_IFE_0_GDSC>,
> +					<&camcc CAM_CC_IFE_1_GDSC>,
> +					<&camcc CAM_CC_TITAN_TOP_GDSC>;
> +			power-domain-names = "ife0",
> +					     "ife1",
> +					     "top";
> +
> +			status = "disabled";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +				};
> +
> +				port@2 {
> +					reg = <2>;
> +				};
> +
> +				port@3 {
> +					reg = <3>;
> +				};
> +			};
> +		};
> +
> +		csiphy0: phy@ace4000 {
> +			compatible = "qcom,x1e80100-csi2-phy";
> +			reg = <0 0x0ace4000 0 0x2000>;
> +
> +			clocks = <&camcc CAM_CC_CSIPHY0_CLK>,
> +				 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
> +				 <&camcc CAM_CC_CORE_AHB_CLK>;
> +			clock-names = "core",
> +				      "timer",
> +				      "ahb";
> +
> +			operating-points-v2 = <&csiphy_mxc_opp_table>;
> +
> +			interrupts = <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>;
> +
> +			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>,
> +					<&rpmhpd RPMHPD_MMCX>,
> +					<&rpmhpd RPMHPD_MXC>;
> +			power-domain-names = "top",
> +					     "mmcx",
> +					     "mx";
> +
> +			status = "disabled";
> +		};
> +
> +		csiphy1: phy@ace6000 {
> +			compatible = "qcom,x1e80100-csi2-phy";
> +			reg = <0 0x0ace6000 0 0x2000>;
> +
> +			clocks = <&camcc CAM_CC_CSIPHY1_CLK>,
> +				 <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
> +				 <&camcc CAM_CC_CORE_AHB_CLK>;
> +			clock-names = "core",
> +				      "timer",
> +				      "ahb";
> +
> +			operating-points-v2 = <&csiphy_mxc_opp_table>;
> +
> +			interrupts = <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>;
> +
> +			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>,
> +					<&rpmhpd RPMHPD_MMCX>,
> +					<&rpmhpd RPMHPD_MXC>;
> +			power-domain-names = "top",
> +					     "mmcx",
> +					     "mx";
> +
> +			status = "disabled";
> +		};
> +
> +		csiphy2: phy@ace8000 {
> +			compatible = "qcom,x1e80100-csi2-phy";
> +			reg = <0 0x0ace8000 0 0x2000>;
> +
> +			clocks = <&camcc CAM_CC_CSIPHY2_CLK>,
> +				 <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
> +				 <&camcc CAM_CC_CORE_AHB_CLK>;
> +			clock-names = "core",
> +				      "timer",
> +				      "ahb";
> +
> +			operating-points-v2 = <&csiphy_mxc_opp_table>;
> +
> +			interrupts = <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>;
> +
> +			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>,
> +					<&rpmhpd RPMHPD_MMCX>,
> +					<&rpmhpd RPMHPD_MXC>;
> +			power-domain-names = "top",
> +					     "mmcx",
> +					     "mx";
> +
> +			status = "disabled";
> +		};
> +
> +		csiphy4: phy@acec000 {
> +			compatible = "qcom,x1e80100-csi2-phy";
> +			reg = <0 0x0acec000 0 0x2000>;
> +
> +			clocks = <&camcc CAM_CC_CSIPHY4_CLK>,
> +				 <&camcc CAM_CC_CSI4PHYTIMER_CLK>,
> +				 <&camcc CAM_CC_CORE_AHB_CLK>;
> +			clock-names = "core",
> +				      "timer",
> +				      "ahb";
> +
> +			operating-points-v2 = <&csiphy_mxa_opp_table>;
> +
> +			interrupts = <GIC_SPI 122 IRQ_TYPE_EDGE_RISING>;
> +
> +			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>,
> +					<&rpmhpd RPMHPD_MMCX>,
> +					<&rpmhpd RPMHPD_MXC>;
> +			power-domain-names = "top",
> +					     "mmcx",
> +					     "mx";
> +
> +			status = "disabled";
> +		};
> +
>   		camcc: clock-controller@ade0000 {
>   			compatible = "qcom,x1e80100-camcc";
>   			reg = <0 0x0ade0000 0 0x20000>;
> 

