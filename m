Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB197456DF5
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 16:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785427284; cv=none; b=eht4vNb3iTo8VrwNsMxbYUz6KsqjLx0UYWpupNc7AlvGxbm46buulQUAoYLaao9Swb8dK59nz/Tzbo6nkeprFxY6rg0yyAHyAulDuVY+83NNg5nvP3qELDHCV4P5ARaLMuBAhwwbzCIOiWMwOekRiyMGBsFDPMhyc7wXveR/EuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785427284; c=relaxed/simple;
	bh=giKwvRI8qxVC7rCJ6Z/KGynqwYL6qShpon0w/eDXYXg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WJrHwt8ChwmavvelcfYhRzl6XouwXlA/B5HcM8QDQLTtAp0Q3silkHWGIg+viv2YovWVSXucc++qp4Higue3xE3by3ZCdYrCHFk2DGC+SpduMq5hnOF1aIxQ6d+MPuqSE2lSLZcCP3m6a+8jul8z2EVDbMMQXwETaty3ZkjWNbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MYjTGfFn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QeY0+yAc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MYjTGfFn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QeY0+yAc"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UFQlgV1414038
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 16:01:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=M9+P1xkDs6ffjkHeEwyvoyg1
	dXyOKoXHj7QXs/dq5IY=; b=MYjTGfFnI56GXXWfdYn6ACvVBgRmBx8Wxef2qfK5
	V6v/JU+wapIWKFUQeBDbRk5WdgGLrUgQ57fL+hkOgqc2xBJjtNQGXDYSEzHgdcCc
	+a71hQqIjvEArClFD4QzqQVUH87+j4Au/yVHcKNFLw7NmrZoZmFFixWEBXj8ZwHN
	BBCFaLwqj4jRuX5Qj7NjuQjurrX/k/+P1Ds2OcWf9W3iTNHLgJ1meCWCbriH0vWY
	AyWz06bIb0evP2YY4lQSdvlcVsClcn9I+F86kyQ675PtUOMrpSwOhj5AJQcYGK4m
	+gS7YhVXeJnAvOty/mnqn7Kg4y0j6yIxaLO2iTlY0HkONg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr891gjex-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 16:01:21 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7382fc429f6so2213251137.2
        for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 09:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785427281; x=1786032081; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M9+P1xkDs6ffjkHeEwyvoyg1dXyOKoXHj7QXs/dq5IY=;
        b=QeY0+yAcyic61eBa8So3QdiqQwKF+iCkSc9x1GgDnJS5Er61Fka+BK2BYk/ifTfoXY
         jZLMARuqSnclsvvNzXlugGKIfSxtN6LCeYYP0XFltbo4Q2AAm1UijaxZfM2aQFOwS9iC
         4bg7CIOUK9BNhYUtrYCXVzpaxTV7ftb0MT4z28O9hS5jRA6K+N68i4xm0joAJZ38uZ7L
         GPJTTmMcKkbUYL3EN4opI+4TVKpG9M60hbYN31UkGioXukP7dp2I4GPmvGx3Iywr04Da
         wPbfVcgtWPURCjHkLLpGs64B8FuGf1HFnUoZIyrgwiutN3QqWSSOn5n3QR6wsYHSSyqw
         UdPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785427281; x=1786032081;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M9+P1xkDs6ffjkHeEwyvoyg1dXyOKoXHj7QXs/dq5IY=;
        b=cfC85/YGQbsnQ20LXt0c5Wxbdv7TLKBWIGjnuO0p/Bh0MEQMAAv/Idc3GbRG0k3cjU
         xfvlYGmGOKB6YLZXfxbFsVdA9rFb2xDPx87eHFFCXNKBc5hXU5qztcQrC0aEsggEiKTX
         7LGmeWCx5Vz7FqTTUDqIMJhgWNyfMppetokzRZAGYOK0+a6a2pNiNjl60D/whYyyWNrm
         9Ow89yajrQgbbDAqwgwbN8dPsO1tfU9Yb7TNRWr0J01QwnBsV8dFnArvWcsb7jjcJFM1
         P2WgA4VZCe2/0EjoRgxiQ/Ik3NGQxPgR+KjbvRPnnsA6jDiFA/qNyTuMejKPQCxELLAs
         w9Dw==
X-Gm-Message-State: AOJu0YxAQyAZoFxxROFTDRu+8aT//uLmGdfkc9UrSc1fbLlc5VepIZRE
	uALiBCpNhdnKAB4rrvusJwCUisjzWv23uFu5mjJ5WH5ka2UVA1zlhb7nkNBLbF1H0Ul+3Cs/mMF
	zkE/X0Vx4Jl2Ve2KGKFB/9A/uugV0b3aK41aKQEzKiG3KDF24Zki7OO2Ok8Q9n6ygWQ==
X-Gm-Gg: AR+sD11X7aEci1ea2rwY2yC6Ad46KedtEYXVqDPADJdvvw1/OS4rUEz0nRd41hn4lS6
	JdUCNLOW8Ct34iP9gSPxvd+WwalsOkinVZLskmat3PJTxYmf+DTfl37oTR2I0Hh1ojNdpFbetqm
	1jgRMqb6Y6DnsDkDyDb51YXQ+BeEtZmAIN+CUREE+VsjAN+YzmoFy+Zhv5xR7GrwA/7CmKmuSh/
	GinBlyvzeLNfKPs61O8EjBuSXptkq1fG0zID1vAPSZduOjk5o1dyQMM2EmDIbwFYdrG/Vqx+LZX
	60EH4FptYbR9o43QT23r9NBuK21ySi7Jp3rp8PuWZjs9Ae8vSNneCkxG7WHnucd/hGoQcpnmmiE
	MByVenTdguTUBbPMexCj5POemKtF1W7F+hqASuVcnxNMn8nPDIxMWdq5LfJobq/odGoWx9p73Xu
	aUGHV0tFm3/dfqLA==
X-Received: by 2002:a05:6102:290b:b0:756:32ba:1a87 with SMTP id ada2fe7eead31-7574dcc38e7mr1247122137.1.1785427279272;
        Thu, 30 Jul 2026 09:01:19 -0700 (PDT)
X-Received: by 2002:a05:6102:290b:b0:756:32ba:1a87 with SMTP id ada2fe7eead31-7574dcc38e7mr1246612137.1.1785427275568;
        Thu, 30 Jul 2026 09:01:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2db9ba724sm450733e87.45.2026.07.30.09.01.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 09:01:13 -0700 (PDT)
Date: Thu, 30 Jul 2026 19:01:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, bod@kernel.org, mchehab@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, loic.poulain@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 3/3] arm64: dts: qcom: sm8250: Add JPEG encoder node
Message-ID: <ln6tr2vwv6zmoo3kcivjjf3rqjxqm2fltwcpn4kk3iphc4rzlb@qdpop32fjm5l>
References: <20260730150524.2659577-1-atanas.filipov@oss.qualcomm.com>
 <20260730150524.2659577-4-atanas.filipov@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260730150524.2659577-4-atanas.filipov@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDEyMCBTYWx0ZWRfXxhvmpDHa/xwe
 lz/LdUlSqtaTbZaHK3WpgxswwQG5Xld5TNjDYtIrjsypYBmzZK5X5tPlK1zlQQes1QWJAFIbcce
 YqExYFuZCxgcvTK3eGm8jFTIT3Y0ZKkK5LpAfJqYrn1EOclzd4KOe3L8kdS/HD9YhMPa4QFN3uP
 AG2H/QcLggfqgw+aMb+3rFhC9FgidUYI0/ck0MfADL5jeVJf5FKzqxYExjvtvLTt7EhHxE9mv5W
 ErfaIXtDVnRbOaFrd8bYiKCAuLxPjrQimMD6XsqsDLnqyNb0uOxQ0CICOWD/xLKFaC7M+jtAmn6
 YvCtrpDZZsES5jTZ041+Fi7j73iJsL4XzQjNjN0j/2JnmPDlLYFfsxHQbmhOfgrufQ71iG6B+ys
 R6lm+xeLysXttPaS4thJhZYXHeDZe/w2R6lkufjNj48n6uQo0iYrtJIrVRDkaNn8U1XBdcEYQMo
 euBf1gpY+AGvCquK1ng==
X-Proofpoint-ORIG-GUID: VvD8IYuGB9fbKPwRs8Wb6JTUZ4GUTF5F
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDEyMCBTYWx0ZWRfX2rJp7ksMbBaC
 CB0abQ1NBkKZNL0UB0QOxZTHmw7S+Jlv9sLsIGxr9NPjsFVn11yxyfOEudmNMdz22GbWWitznLX
 kp7fR+24MwnHgOxxNXhMoV/oWbUoAkY=
X-Authority-Analysis: v=2.4 cv=PdzPQChd c=1 sm=1 tr=0 ts=6a6b7551 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=9uBV4kYI648O5uXVwFYA:9 a=CjuIK1q_8ugA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: VvD8IYuGB9fbKPwRs8Wb6JTUZ4GUTF5F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_04,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 adultscore=0 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300120

On Thu, Jul 30, 2026 at 06:05:24PM +0300, Atanas Filipov wrote:
> Add the JPEG encoder hardware node to the SM8250 device tree so the
> qcom-jpeg V4L2 encoder driver can bind and operate on this platform.
> 
> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8250.dtsi | 72 ++++++++++++++++++++++++++++
>  1 file changed, 72 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> index f11da2ca4181..d42b29419320 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> @@ -13,6 +13,7 @@
>  #include <dt-bindings/firmware/qcom,scm.h>
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/interconnect/qcom,osm-l3.h>
> +#include <dt-bindings/interconnect/qcom,icc.h>
>  #include <dt-bindings/interconnect/qcom,sm8250.h>
>  #include <dt-bindings/mailbox/qcom-ipcc.h>
>  #include <dt-bindings/phy/phy-qcom-qmp.h>
> @@ -4486,6 +4487,77 @@ cci1_i2c1: i2c-bus@1 {
>  			};
>  		};
>  
> +		jpeg-encoder@ac53000 {
> +			compatible = "qcom,sm8250-jpeg-enc";
> +			status = "disabled";
> +
> +			reg = <0x0 0x0ac53000 0x0 0x1000>;
> +
> +			interrupts = <GIC_SPI 474 IRQ_TYPE_EDGE_RISING>;
> +
> +			power-domains = <&camcc TITAN_TOP_GDSC>,
> +					<&rpmhpd RPMHPD_MMCX>,

Is TITAN_TOP a part of the MMCX or CX domain? In the former case,
please drop separate mmcx vote here and let it come through the
titan_top (it might require camcc driver and node modifications).

> +					<&rpmhpd RPMHPD_MX>;
> +			power-domain-names = "titan_top", "mmcx", "mx";
> +
> +			clocks = <&gcc GCC_CAMERA_SF_AXI_CLK>,
> +				 <&camcc CAM_CC_CORE_AHB_CLK>,
> +				 <&camcc CAM_CC_CPAS_AHB_CLK>,
> +				 <&camcc CAM_CC_CAMNOC_AXI_CLK>,
> +				 <&camcc CAM_CC_JPEG_CLK>;
> +
> +			clock-names = "sf_axi",
> +				      "core_ahb",
> +				      "cpas_ahb",
> +				      "cnoc_axi",
> +				      "jpeg";
> +
> +			interconnects = <&gem_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ACTIVE_ONLY
> +					 &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
> +					<&mmss_noc MASTER_CAMNOC_SF QCOM_ICC_TAG_ALWAYS
> +					 &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>;
> +			interconnect-names = "cpu-cfg",
> +					     "sf-mnoc";
> +
> +			iommus = <&apps_smmu 0x2040 0x400>;
> +
> +			operating-points-v2 = <&jpeg_opp_table>;
> +
> +			jpeg_opp_table: opp-table {
> +				compatible = "operating-points-v2";
> +
> +				opp-100000000 {
> +					opp-hz = /bits/ 64 <400000000>,
> +						 /bits/ 64 <100000000>;
> +					required-opps = <&rpmhpd_opp_min_svs>;

This looks a bit strange. Are you sure that PLL levels match the MMCX /
internal clock levels? I think you need to vote on both domains.

> +				};
> +
> +				opp-200000000 {
> +					opp-hz = /bits/ 64 <400000000>,
> +						 /bits/ 64 <200000000>;
> +					required-opps = <&rpmhpd_opp_low_svs>;
> +				};
> +
> +				opp-400000000 {
> +					opp-hz = /bits/ 64 <400000000>,
> +						 /bits/ 64 <400000000>;
> +					required-opps = <&rpmhpd_opp_svs>;
> +				};
> +
> +				opp-480000000 {
> +					opp-hz = /bits/ 64 <400000000>,
> +						 /bits/ 64 <480000000>;
> +					required-opps = <&rpmhpd_opp_svs_l1>;
> +				};
> +
> +				opp-600000000 {
> +					opp-hz = /bits/ 64 <400000000>,
> +						 /bits/ 64 <600000000>;
> +					required-opps = <&rpmhpd_opp_nom>;
> +				};
> +			};
> +		};
> +
>  		camss: camss@ac6a000 {
>  			compatible = "qcom,sm8250-camss";
>  			status = "disabled";
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
