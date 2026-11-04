Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793768019;
	b=S/4DnhQzTtgcDzih8PvR8uqRKluZVVzib8s4epD1V+Cidr/66aX1cs9FCP4nABJUpguw
	 qh4fh6nZyGm3Zo+NIsOov8GkU8N7zwXJJzwtXTN5QYzsIhSBddGT0QSqbSZEsTEBI8R+/
	 Mtd6b/zwgLYCOxp1PmCyhdE+0I7Hl5QNrEz4K+/F5Mg8Ub3lgtAJaNRZPfUQmsbogXFX+
	 vBl3ULL48JHe9zAsD3IWBPgQ3nnA2bpAbBQqLsc9J97b+zm0d9N80cOu74wJ+apZ1Z1vK
	 rIRwlTRMXDGwmqDec9TC6mf38u1R1za3Hf0dldp3Xe8FlNZV5FzwD6UMbyd4ZmX0xMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793768019;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=wxBgIl4fVGGsYbUGSadGuKeGA8YFeGPvnpmrQUI2WZc=;
	b=gPzIjJ1sfR8I2fBYtd+V0fh7W2vezDMjb9T5Wkb5be4sMZYcsxFRMljcb9ONt7kcLLXe
	 Cr0oIFKfMqMRqlvmNMA9gSxu/uR9vNEr9jKv0JvdIoxh5c7Yn5ZQ8y9OTN47TA+/Z3gYu
	 xtxGVquvxMx/f7zLjFD/1V6P9Uc4CgZfBZl1mKfDcQYu/PCwBkSi2lJRDF/abb3VEoj+k
	 yQWU/okhPB8uskirbWGwPqwaKe9ltSu5C4UsQ/7fZVxRPM+MowDrGF2h+60Us/8avHbpS
	 s0NIXeWvuyH3Ezmb+aTskXE2rNBaZp0Kq70UWwZUtvhoo+MF9EzVYIF3lMyeauD4zpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="LtUf/+/j";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=F2NtVdeV;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CABA3606A31B
	for <linux-media@vger.kernel.org>; Wed,  4 Nov 2026 04:53:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CABA3606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LtUf/+/j;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=F2NtVdeV
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A40R0Ge1247825
	for <linux-media@vger.kernel.org>; Wed, 4 Nov 2026 04:53:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wxBgIl4fVGGsYbUGSadGuKeGA8YFeGPvnpmrQUI2WZc=; b=LtUf/+/jSxrUVpBM
	0QGauNHY8lMqgT4d3p1S1iK++TF1Dq28+WWlfD9aRf2IbyneUo81z4SlUu1Cdux/
	b/3SGzITBKoyFM0MwnB16i7Z3Uu8gvzvVlgT+G/hV4699SkptKNiq1lTHMpOaubd
	b33DE0fLlSToCvbB76etJJCcicgpC/nloN5IpI3XUs6xfhc2e63pD3RuVsKWVgRS
	N60H6HZGf7MhvWC8XZ/3450yDFnoGjGPxf9UGiA0LuN9ARK15J7lf/H2Dp0W4q3y
	R4WGM6Y/25CfT3dtii2aT8jlz+Ipbmbf6RW0YWiYoBpOHptH/e8y/1bseYqMk0AS
	vxwljw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqpuv9jpq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 04 Nov 2026 04:53:38 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36d1353fdcdso357058eec.0
        for <linux-media@vger.kernel.org>; Tue, 03 Nov 2026 20:53:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793768017; x=1794372817; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wxBgIl4fVGGsYbUGSadGuKeGA8YFeGPvnpmrQUI2WZc=;
        b=F2NtVdeViO0idDqDnf6IwdnTkGSmFo51GUEZbBlkEYYFstLG31oENqinGNOqG8h2lg
         LtrDtY5InjV0x1iEIbsQVB8GbeJnCwt/++/rIA1UBmfJd0QaMOyc1L9PEs4VcC/ete5V
         qCjTO9TODomPLMVuHzpSYP41AU23D9i/ElSngzee3JBSlPa1DKmdNtyDn36h9HRltLHw
         lxFhdQBSHo5/qk54I1TcQH5/swErc1rCVj5zQQDd6nsiQJe/juEE6HugXCZHLgbFJZmj
         dNFbqBXgGmzii17mdawihVwqr+p6mSItxG03O1j/sLEN5j1P/fctwwRytXmOGxPPjwd3
         e4hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793768017; x=1794372817;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wxBgIl4fVGGsYbUGSadGuKeGA8YFeGPvnpmrQUI2WZc=;
        b=aNWAJZZrOocjA+WIiGVrS9oOjXx3BMXYtGNfX9VeenLHfnGZMk10nLOEAq0Cc+yFTC
         cFlWYAMLu10/FRgV7ppX7oJb+XlRPT45osEwFcU5/G1KCEVaGF+WwhMVS7a2Aj42PeIj
         tzWzRg/cLgQ98Cqs53S44QTlinhGRyPCXgPjm5pWZub3QQDQ7THNcj3BAtscXYjGX0hy
         kVGYJ8judeosZ11ZazQG9Xg+E+/AH86mfmqunxLOlFBBHVGptzd4SfLPmLqWyDaWS5e/
         0DtwbUlSVhuBZmq5Ir41iikwdan5NUp5Muqzih1OIlKOJ7YkuyJvMpsmGCSsxKxtSBgL
         +Utw==
X-Forwarded-Encrypted: i=1; AKwUvBwdZ/eWPzm5QY/OcR+ShpDlBOiRbFoLPB2CAv+W4Pob9qwJym9ihoZ2XJMtcmXgtJjU/tofrrc+3qAXDw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/sCP/lgBcYujaKOBSlnalT7+D3xEL5usM3HQcmUUX8E7IFPx9T
	iFK95LzZJGggjn2xzLQd8LF0sycUzRCcsM+q4200DWQhrQ9PoWsjWW3OjX8l6pOI0mwA5bDRayH
	OvGSWpEWHEPZvk/yre7LyaPUTCOM28nplaWhMmdYuLHVOV+3c2Bb4x5vziVMgxSw/VYFUpk/Uzg
	==
X-Gm-Gg: AYBFou2nNYm8An7QG9/8Zgp1Y35yWgoa367HWuikob7xOWgGMefu4a4g0tgHuARnoXd
	k5bHlY27iZ8okwDSD7ekxcL9nk5UfIOir+Rq6UoEiJ/wEv2BfjLcGOMm0xxU7DcKaEcxfdiFwkK
	fFhnLrLR+Ez925RyP3sAOMk1s7HxJy1yXkTPC+TcOFKeaXXgVsWXxZf2roPBsMaPX+QC9Fc00hy
	hAnEfRT3moKfVQlRUX95hnNQ3oUwKbGMVRYPhB4IwgZWm5kzglZrDJfvqq1vXU1gpBqqQHD683F
	NKBpcH7TUA4wMPA6oP6kpCKMH1KZJgFIGl2ngannnrR0yCNaokNtvzPOzNJfnB+goMzLUpfjmiy
	s2lwvkmr/TRxyimbxPqkxkrxdPk6Rxq5DUsCFdP8M0muqSsAfgWl9p60ES//dY5BHFGe+SlEk7j
	U=
X-Received: by 2002:a05:7022:1117:b0:195:49ee:94c7 with SMTP id a92af1059eb24-1ac5a0b579emr20178583c88.8.1793768017254;
        Tue, 03 Nov 2026 20:53:37 -0800 (PST)
X-Received: by 2002:a05:7022:1117:b0:195:49ee:94c7 with SMTP id a92af1059eb24-1ac5a0b579emr20178539c88.8.1793768016741;
        Tue, 03 Nov 2026 20:53:36 -0800 (PST)
Received: from [10.206.111.19] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c65194sm3737394c88.19.2026.11.03.20.53.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 20:53:36 -0800 (PST)
Message-ID: <72223121-cb42-422f-8ce5-4cf9f41c5aec@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 10:23:30 +0530
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
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: lemans: add CSI2 D-PHY
 common-phy providers
To: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        gjorgji.rosikopulos@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        jigarkumar.zala@oss.qualcomm.com, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vikram Sharma
 <vikram.sharma@oss.qualcomm.com>,
        Suresh Vankadara <svankada@qti.qualcomm.com>
References: <20261103221026.3662383-1-anusha.nandi@oss.qualcomm.com>
 <20261103221026.3662383-2-anusha.nandi@oss.qualcomm.com>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <20261103221026.3662383-2-anusha.nandi@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=O6SsLx9W c=1 sm=1 tr=0 ts=6aeaba52 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=LJKXChJILo_4taeNnY4A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: sG1mofXxUilAwTG0IGuz9p7BRpkCcJEv
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAxOSBTYWx0ZWRfX6EWUU553SE/2
 xaE/3Lg9U1FmppbpLJCRS0syVNAEttlZq/3INB7ANM7sR0Ui24nFWc9B2aYyrW63Kij+gfv95el
 5Uqf6XwXcerI3sWgMS/NFiJY0lyH7gY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAxOSBTYWx0ZWRfX8t2FZmcyMkBu
 Ow0D+NnIqXO3Y+gekEcheoiovIehD2jKdyuLWde7Pebi/I6iryh5t/vi5JbcPat2jZ5g31Rz+Tz
 GiRDvrqTcuzINznkhlvs3H9BHm+vv2TA0KX8KzrRL/8JUBxYQBOUSqMO2cJD7Mm2gRAMz+C5nbx
 +wTucUfMRNxCk3wSRIqCGceR0C/TWsAnRktxo2IEPju1ib8DyUcmZXts7wlkQQhDdCt+U4/E+Dn
 uC7dXuf+9H03vmv/sJijczI5+RtjkWKrkSDnttWN5S4AGSZFe14FZTqhx3qvBcXVocUXj0pmppb
 iccjGIE6dljIS+HnU1TYTCZi3crPnifid5QfUjy5RkSS4gvvQd322xC8qNufV0e0DI1wnbePIsM
 2IHK8+nEUeOJlVnEr0021gKH8ZVp6u/+Hd8Ms+UpXj6pJc3rUCPFHAfAWNXY+ws6uvmZ1AQXCKs
 zZO4syYZXjCPQKM2vSg==
X-Proofpoint-GUID: sG1mofXxUilAwTG0IGuz9p7BRpkCcJEv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 clxscore=1015 spamscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040019



On 04-11-2026 03:40, Anusha Arun Nandi wrote:
> Expose the four SA8775p CSIPHYs as standalone qcom,sa8775p-csi2-phy
> generic-PHY provider nodes (csiphy0..3) at their existing register
> addresses, each with its own OF graph (port@0 sensor-facing, port@1
> CAMSS-facing) so camss_detect_legacy_phy() picks the non-legacy path
> once a board wires a sensor through one of them. The camss node's own
> reg-names/clocks/interrupts for the CSIPHYs are unchanged, so boards
> that don't use a provider still get the legacy binding.
> 
> The provider nodes are disabled by default; a board or camera overlay
> enables the one(s) it uses.
> 
> Reviewed-by: Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>
> Signed-off-by: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/lemans.dtsi | 140 +++++++++++++++++++++++++++
>  1 file changed, 140 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
> index 1fdb72fa5518..2a30bf1c82af 100644
> --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
> +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
> @@ -5164,6 +5164,146 @@ cci3_i2c1: i2c-bus@1 {
>  			};
>  		};
>  
> +		csiphy0: phy@ac9c000 {
> +			compatible = "qcom,sa8775p-csi2-phy";
> +			reg = <0x0 0x0ac9c000 0x0 0x2000>;
...

> +		csiphy3: phy@aca2000 {
> +			compatible = "qcom,sa8775p-csi2-phy";

phy@ac9c000 through phy@aca2000 nodes precede the existing
isp@ac78000 node.
Sort CSIPHY nodes by unit-address numerically.

> +			reg = <0x0 0x0aca2000 0x0 0x2000>;
> +
> +			clocks = <&camcc CAM_CC_CSIPHY3_CLK>,
> +				 <&camcc CAM_CC_CSI3PHYTIMER_CLK>;
> +			clock-names = "core",
> +				      "timer";
> +
> +			interrupts = <GIC_SPI 448 IRQ_TYPE_EDGE_RISING>;
> +
> +			operating-points-v2 = <&csiphy_opp_table>;
> +
> +			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
> +			power-domain-names = "top";
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
> +			};
> +		};
> +
> +		csiphy_opp_table: opp-table-csiphy {
> +			compatible = "operating-points-v2";
> +
> +			opp-300000000 {
> +				opp-hz = /bits/ 64 <300000000>;
> +			};
> +
> +			opp-400000000 {
> +				opp-hz = /bits/ 64 <400000000>;
> +			};
> +		};
> +
>  		camss: isp@ac78000 {
>  			compatible = "qcom,sa8775p-camss";
>  

-- 
Regards,
Nihal Kumar Gupta

