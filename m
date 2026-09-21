Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE4F35AC3E
	for <linux-media@vger.kernel.org>; Mon, 21 Sep 2026 05:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789969266; cv=none; b=o6sYZFQB1NAHcxSVZDI6Sv/vKdn51tORWZrEaplVw1D9hcRffdA1CbJZEp0ykHAE2PzB7zOoVYboW3pbHTCUmlMkYdIVe6KEsMkeGGudrXOktI45sYupYfcoRyTqyZEqVVv7fefLQctcDX1mnamYpHcxKw+dsbmk26U7OO1xaNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789969266; c=relaxed/simple;
	bh=d3HVsWk02OgPZg4wIfAf6CTsMf4Z1Rqgb9pdc8/ud0M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gtIl0oMCMUxF5K4kzO/4TcMsmYeW/4uCuQkfuJmHuM+6pG0bPEGyo12HgpgiJmjsRDaLEuJ/yAs5uMBgQz3wRGTmdK0zDKxAxbUzfEwhnStjGeCIOXiVumdGZ8R5OQjrD6RXgRrBCN+EksiZGhsuwBCjI4oLiAnn0ZosOzTE7A4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BrurabCZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cz5cRno1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BrurabCZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cz5cRno1"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L3ZTs5635393
	for <linux-media@vger.kernel.org>; Mon, 21 Sep 2026 05:41:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w5O1q2g0NwbsDyABvfhBt2IxcvC+noAvU+RSFr0J+CQ=; b=BrurabCZzZ5zl1yA
	xhd4j1v5Ifv5KQxUChIUcuOI98tJ3cnxA1BMT/zjnbjBs96p6zf84apN0LJJedvj
	OnK01pv9dDK1foFWo7IeerWKkxuIOIZfxPiE8sKK4bEoCkGCPkJVg3PF5W7RS9z/
	8FKxCOXou5PPsRaO9Zt2IcHVCrqYbcrN8J/W87amn4hlTjSby9/dTGsetrNxRSJV
	rjdHxEIhduOp+bA2kTmuZeAkXs9trgZoezxZekAlLhozEK+wrDk6lF0+thhS6TkF
	s19kSKFaQFlsFYJrQes1KKn6auoFpDTq7kg+2ehdMvKhK75up39s3gGgUqSNH5ny
	9cXiwQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gshyxvwg1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 21 Sep 2026 05:41:04 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c89704da8c7so3524158a12.0
        for <linux-media@vger.kernel.org>; Sun, 20 Sep 2026 22:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789969263; x=1790574063; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=w5O1q2g0NwbsDyABvfhBt2IxcvC+noAvU+RSFr0J+CQ=;
        b=cz5cRno1U0PKLq0T0E7P5Wsph0pEitpuB2qQV8Vpno6uMV6j7PVTkOdrLn+nFnu5p6
         dNC5/wCv+a2koDvjRn7qjm9O6TUWvE6dwPfvsvQVSiESxSwv5DUdphK19AeRh1AluM71
         44ckB4jUTvGirgPjlo653CuiwVrpk2HDo4MSLDir5bzJvHSxjGWjyCc6ggPNPHPW+PmY
         fQaQq/OPICpDHQqROYUn/A7niC86TtFngUlJMZ/htVpjZ/dNx30bKxx8T1xNz6/QtOet
         6xt+Q88JvPZVlZyadFvek9tkvC8S0Qvml7EbCQKDrcTZ/QwvO6lhGVX+zqsktA6IFSMr
         NvOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789969263; x=1790574063;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w5O1q2g0NwbsDyABvfhBt2IxcvC+noAvU+RSFr0J+CQ=;
        b=kVV/UHpPUzQAXW10jREWJmp0LmARNzxjP0OFyqzYj1Wg7dts3K61XvV62eZa84evqK
         nXwbjrNcVTeRbj9w3ZIb7m/pKbP0ImLZF0VEBJgoPbjKAIPyS3RWF1sKlFaM30OEGJhn
         0I471F1LbSUaH1Z3xJTM2GZ4rJltM2GAmhlAE8RodzCrZJSrd0UfYcwKpSM3GvW08mrY
         fZgIVkbxxhLaFvcfWXLYljmwKqWUOjBuRnSid4PhHY6kHSDSILjVaPU6+9+C2WQsRGFF
         o0ZW4przyI8R/NiAmLdcS/LZHgHZymIxmYkTskIBZ9Vf1209vrGnYTwf1VZH4qV9hYUE
         dtiw==
X-Forwarded-Encrypted: i=1; AKwUvBywqHCdigMymW9Coqg+bgfviE+kwU6l6aLZcOfg7YlxeZMVmeVJmrxaAi0hcs7Mvi5sdtp7WAfC6IZDXA==@vger.kernel.org
X-Gm-Message-State: AFuF++kubvMz1vIBpZTLOGw7ZJ6XgrJr39ID2Q5nXlkGXaTcoB1TayMw
	vH9Pfeo3fZd3FaVnDI/7xkdlER5wxJmvP5unI35/oNPHFUHIOMKqT97BUEsFcjwlLeJKPnyW4gB
	xzRen3iElUnNMBeonCQK3dC0eJ3jwL/D2NDZz3EITCOR5JleHIwmetHdtHGkoBMBGwg==
X-Gm-Gg: AYBFou18GCtn8A4PAHCb1zvg/iFt6FgzZbpVQBcFZYvWwFfthkp2mNzDo8+2IGyk8Qi
	sClnJ2HJO0YU4mRTOpQBBz3m7CKcOM+25cIVjqpZp384uUktThdL74IHCVQnL4R53RUF3hSVvYe
	AFOYZyvhirSYM87Jur+O/lUJs7czDQHqtk6FK6qSW2CdnPan0WInB626j5VHJRSSl8byYDR9qrl
	sKFo1yChmZq8b0YxJE9nu9chGOgNIgIvfOsempEhB0avupACwjSUTD3w4F5lx21VX0m6xhv4CRO
	P/NyYnCxPwXwdbb2sRuWACh9LA2bLCl9wICD0W1JHX5OILLv/ncHomzSKV6fEKewaMLrk6oL2YI
	+KbWsQw3buIlTyIbaW7TpnGdZvrtKslE=
X-Received: by 2002:a17:90b:17cb:b0:38e:57a3:f218 with SMTP id 98e67ed59e1d1-39e54d13343mr16318609a91.13.1789969263270;
        Sun, 20 Sep 2026 22:41:03 -0700 (PDT)
X-Received: by 2002:a17:90b:17cb:b0:38e:57a3:f218 with SMTP id 98e67ed59e1d1-39e54d13343mr16318581a91.13.1789969262785;
        Sun, 20 Sep 2026 22:41:02 -0700 (PDT)
Received: from [10.206.101.140] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144e14dd04dsm6579012c88.7.2026.09.20.22.40.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Sep 2026 22:41:02 -0700 (PDT)
Message-ID: <43e757dd-17f7-5b03-33e4-5c567e164be2@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 11:10:54 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 2/4] arm64: dts: qcom: nord: Add iris video node
Content-Language: en-US
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
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
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <aq_cmcYa1wL69Hq4@QCOM-aGQu4IUr3Y>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=PaRqFShd c=1 sm=1 tr=0 ts=6ab0c370 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=vTOospmqq8J8sbT3TakA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDA3OSBTYWx0ZWRfX5TDPK9CuJ2KU
 bmqqrCTc4fdy2mJMuUFEkOK0IEZAkR8egFjvlFuTLVZxXyn3p1J+g6/MG31yDrHTcxNJNi5gUDf
 w/F+6ERYrB1ziZb/P7DDdEKUuSzWCAA=
X-Proofpoint-GUID: ElkcELdrOkk0ERCq1_eq0V6toySxv7ww
X-Proofpoint-ORIG-GUID: ElkcELdrOkk0ERCq1_eq0V6toySxv7ww
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDA3OSBTYWx0ZWRfX0kUZBbAPQSrQ
 zxFzcXKHVmN+puUhF/XXykW9n/9sR7AUpc4f8JwK6RdKhryrYSFDbIcJfoUl8U6ecUt2xY2rZp+
 s470k8WSt7lHqUXHguRXv5/HWvlP9PE6BTTKp4402KdeiWWcF6PyLYoqIZW1LgEu3MyT2HETHVH
 VHnPyW5WscrYj7IvmZEdAdWd9dPCt9NQYkC8+cd47tsH4uFpnbS/atled6Qq2x5Fd6Ng9hFPxEg
 36wCqWEkXcrohbU6L42pg6dKSH5g7XMQ07OMD7VFJebZ5M3e/SoIYbLIDSE9NowEKGolK8VvHXX
 hacKu6idSJQJtd0muM+lgU2f9zs8+uGEYmp3dDovpgWqeai0ifAidXwrordErS9B4Kfd7B+heLX
 MNJ3I6pLqhwL3pqUcKeq8ktGhexgFmzSRvalDRdSvlvq77aYxT1CXTgXttInmP30Q9gwCXuhCyS
 srX4UFN++gMUOBzf45A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 clxscore=1015 spamscore=0
 bulkscore=0 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210079


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
> nord-embedded.dtsi is a place to accommodate Nord Embedded variant
> specific resource descriptions, like clock, regulator, pinctrl,
> interconnect, power domain, PHY, etc. The rest of descriptions should
> go to nord.dtsi, like reg, interrupts, iommu, dma, etc.

Will check and move it to nord.dtsi if no issues are found.

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
