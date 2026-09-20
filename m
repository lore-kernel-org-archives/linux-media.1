Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C1423B05A9
	for <linux-media@vger.kernel.org>; Sun, 20 Sep 2026 13:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789910182; cv=none; b=XUpNCdbFtWv8J8bfuLv+XPm66bVK1fhvCKwx63/Yc/6L9AF5NHku14ptOzEGlgo0ppjtqu6OMaeCxIc3Ae3k7llCjMz3Vi4EoTRYNIk8PkmAc0IuRRFsvHLoOwBT6ZFwNQgk4HwltrNjHjXGLdL3AWo9lgzhs8vlgiuPztb4CP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789910182; c=relaxed/simple;
	bh=Xt6eE3mXVxpdy1niUg2kBBuIQUoWkM0zPYl+iKtIwMw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kCL93tiNSPb+i0vrDvl0DeKNpFpfiT/1L10qQwV3TcaPpF/Vq4KFKYPym4ZXaew7xPcsP8wwslZXZYh99Z3yJPN5wJ9HxAbnfEEN1HG9rae4AoLX5BgIfxFGyKxCridwB8BA/FVb0nf9ZgXLX+NUEGHyyDP+yDTGCntEO5D0Fx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kDhuIokx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RnRf7hSB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kDhuIokx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RnRf7hSB"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68KBni4g2421697
	for <linux-media@vger.kernel.org>; Sun, 20 Sep 2026 13:16:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Ejeu4h5Q9V99yYBFdvooJSxj
	14uii0XMOf9g/UP93OQ=; b=kDhuIokxsn8KPNfHYbplmMNPV1YOoWeKo8HgdiOF
	xtAEnm5NZEFTwoCZhxNUywNnNyrUpLiu98HZGym5x7luExwtyxZvudQf4vQF+BK/
	m/Pwh1AajYFtcMLnc2qtmbM9eDwWNjcWutUnN37G4GRcAT/EflFzPEXnWwv731pr
	7rHecTMSH2gyilDQCDh4dFnfmf3XEIgscIYZb+LEKrUyOarPJf0vot7QyQ9MfmBv
	bXzvQbaX8Wg5QG46AIwkSZZUbhieibi3KbMqDhmx52Fu8ZA/l+X2K7BL9QwGNVW2
	X31BDumqdr0Qv/fq5D49hIjJtceKmVfp3jHET2ycfVz0gg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gsjm33104-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 20 Sep 2026 13:16:17 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d6f75c1219so48377875ad.3
        for <linux-media@vger.kernel.org>; Sun, 20 Sep 2026 06:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789910176; x=1790514976; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ejeu4h5Q9V99yYBFdvooJSxj14uii0XMOf9g/UP93OQ=;
        b=RnRf7hSB1afgLdduVI2ZYYDOEwzNokPir2HzikGPVKVO7nMQniv0ESb6DFo2JV1H7+
         /meIsabfcCoM6jkmYiBMPa+JkAyw6xIMv3aXBqy3Tehr8eBn4bV9ZYUIS/NcVq4jn0ld
         kdgvrGoDKCQssZAbMQeAK/h4IVyvbAZ39Xb5MAuj/YhMQy1rOT8G1qtmC2bpVHfEqp2N
         R5CR60+kotqjNpEJWf3trKkMwDGoplBDm92v4lvLqZwyUa+81+1D3JEe8MPkL97026aH
         7vJOsB75E3c51IsmbqX7xI8o2QPOXwIWk4Bb8SlL9R/s6upBt6YxcvWLtXXoG4WGv+4O
         0atw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789910176; x=1790514976;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ejeu4h5Q9V99yYBFdvooJSxj14uii0XMOf9g/UP93OQ=;
        b=1nsz3PupeRyzQAzAq3BpkdVQswD7wg6GBdbWBVUQl2SAKeyjLcrb2YfWVGZUJwgV3u
         BEvc9uO4psD9AuXZ9nFcX40+KIHUf6KfzLKCitYHDkEW7R5+ShOslA6JFZA+ELdfKu16
         vP+cklAt/wMoliR6PBA984NPPsq6uuU37wbFLRA1G9ilqytiftxVobRWIfezCmIRv+qU
         ilnbDQJsPycSpuoxmq9w2xBKH24Opvp5aLB3y7+fFSLf2Rooo3GxqwJcqUJYNjlP32hP
         w/E9GtdTbJnNjx7tD8mrtMqYWMTF0vzvV/tfBcRlISSP7W1nFiyCT/hk3rWD2t+ZpC6t
         NJCw==
X-Forwarded-Encrypted: i=1; AKwUvBwnRJBOsDlMHWfo2tWGtI5sWPUskmdDRRyRfAlsB/TIPjiecSkZl3qms6nb2PO4CEuCmwyjLpfzvUiQ6w==@vger.kernel.org
X-Gm-Message-State: AFuF++mIkNlP7Bjh8kKbMBNLw4wQ/H5ebk9Kts2vxXDP+QfV04bzZcpH
	mrEaD4v1QKhXreElSq3d+ezv+m4DqaMCj3KQgUCgdEWBQq9/w8YyOGjb2hfKd8VbYUdO/Y44TBh
	x5eEU/lz/qSQkEzPqzTqB8gZo696pe/fFl5Mu7noU5IptlEWDoj83QzD+SqxNqktfgA==
X-Gm-Gg: AYBFou2zB81NrIo1wB/ZTwBlQ0f6DoizAM0sQwUvJqdrc4Z7Ipb8jLYZjRVinuyFWzR
	LDE8LtwnJ3x7Q7m5HncTXdhhdghX7FK3H6ySjZJtB7muG7lQbknnBowbpc6E1BpW9z7sJvt9QT+
	qT26tF71rDnDrPNwjpy7UrefYGLdmJPhNw5dBamJjV3NNZG20FG9X2dIMN+5VKVpcuT2UFjBIae
	BDUfbeDTf6fSvNZp8giTbHpNSmL5OY6E9/VM8RQKYrEKp6AaAMYik/PFFJ8w5rHjWQZ59QxyRMN
	6501yw/vihcrMTdhPVnbzJPlrxYg/WVvO5Mo6lS9Mq0YMT5QDggkGG7sKKyZgzvJ/oby7bW0FY1
	Y040/zT0KsKmwxkDDEv2K4a76ntj9WqARKaOGmGh+UQ==
X-Received: by 2002:a17:903:2c0e:b0:2dd:c100:313d with SMTP id d9443c01a7336-2ddc10031ebmr61553615ad.57.1789910176401;
        Sun, 20 Sep 2026 06:16:16 -0700 (PDT)
X-Received: by 2002:a17:903:2c0e:b0:2dd:c100:313d with SMTP id d9443c01a7336-2ddc10031ebmr61553295ad.57.1789910175909;
        Sun, 20 Sep 2026 06:16:15 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c331aef9bsm12287653eec.25.2026.09.20.06.16.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 06:16:15 -0700 (PDT)
Date: Sun, 20 Sep 2026 21:16:09 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] arm64: dts: qcom: nord: Add iris video node
Message-ID: <aq_cmcYa1wL69Hq4@QCOM-aGQu4IUr3Y>
References: <20260919-nord-iris-v1-0-94428761ec06@oss.qualcomm.com>
 <20260919-nord-iris-v1-2-94428761ec06@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260919-nord-iris-v1-2-94428761ec06@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: upxZQj73YpA6Y3PfLtynrw1TYbTCmy40
X-Proofpoint-GUID: upxZQj73YpA6Y3PfLtynrw1TYbTCmy40
X-Authority-Analysis: v=2.4 cv=DtfDa2/+ c=1 sm=1 tr=0 ts=6aafdca1 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=cpf97Ptf5-OE3Sj05EoA:9 a=CjuIK1q_8ugA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDE5MyBTYWx0ZWRfX9hSMdsAx9jyZ
 hrUYHM34AtkjjpOkKXjss1mIs++8opu6hIVhOJwsEIOsxeLDDWij3Vxzuh+cWU0O/Ay+RTVuvX2
 CYdnsZ5K4DkWQoQmLndCTWCN6sQnCuFd/OLAWnUrlsoQ/VBHkLz2kyI1h1zOmmfKdMOFBWbsOjp
 UM5883U72MayzMdvfZBpHVamP7++I+tBmy62ixbBu8eV2hTvhaNxKaypasnjPNCu1A0wBn48KDt
 GGk1kNsY2tMr9IwF/4NmLL7wE7mY5eHKMPrqWSdperWA6a5wr622Tb4GdiJI87lXKAFRSYdAAQC
 kYLdtvl+2qRokEyM3cT8yvi1hQpqvQsZmkXWZpJHbmaSGfb8AFJvnqEaST0lF1ywOWKDWu0MITL
 HFdfRjGbPHgcPLXRjCOf3wLpbHMJMywJYSxaEGZkVRET5rDcTDrgm/mF6GQoxUFUrKTrkG7Mxwt
 uh6WytHNUp/VSF+jPfw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDE5MyBTYWx0ZWRfX0eUpsKPmgkoE
 MfY9pxvJ8n7mUVkZrxBQIsLNzTvd4io5fj6z70c0KqGhnqeXVUGCvZPq51dT2uP0I05qPrt5AoP
 DSlZpaqjtZKkIArg99zted+gsiBGmKQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0
 suspectscore=0 clxscore=1015 phishscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609200193

On Sat, Sep 19, 2026 at 10:14:56AM +0530, Vishnu Reddy wrote:
> Add iris video codec to nord SoC, which comes with significantly different
> powering up sequence than previous platforms, thus different clocks and
> resets.
> 
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/nord-embedded.dtsi | 114 ++++++++++++++++++++++++++++
>  1 file changed, 114 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
> index 74f4e6be8652..03f827f3e5fc 100644
> --- a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
> +++ b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
> @@ -1428,6 +1428,120 @@ camcc: clock-controller@9ce0000 {
>  		#power-domain-cells = <1>;
>  	};
>  
> +	iris: video-codec@aa00000 {
> +		compatible = "qcom,nord-iris", "qcom,glymur-iris";
> +		reg = <0x0 0x0aa00000 0x0 0xf0000>;

nord-embedded.dtsi is a place to accommodate Nord Embedded variant
specific resource descriptions, like clock, regulator, pinctrl,
interconnect, power domain, PHY, etc. The rest of descriptions should
go to nord.dtsi, like reg, interrupts, iommu, dma, etc.

Shawn

> +
> +		clocks = <&nwgcc NW_GCC_VIDEO_AXI0_CLK>,
> +			 <&videocc VIDEO_CC_MVS0C_CLK>,
> +			 <&videocc VIDEO_CC_MVS0_CLK>,
> +			 <&nwgcc NW_GCC_VIDEO_AXI0C_CLK>,
> +			 <&videocc VIDEO_CC_MVS0C_FREERUN_CLK>,
> +			 <&videocc VIDEO_CC_MVS0_FREERUN_CLK>,
> +			 <&nwgcc NW_GCC_VIDEO_AXI1_CLK>,
> +			 <&videocc VIDEO_CC_MVS1_CLK>,
> +			 <&videocc VIDEO_CC_MVS1_FREERUN_CLK>;
> +		clock-names = "core_iface",
> +			      "core",
> +			      "vcodec0_core",
> +			      "vcodec0_iface",
> +			      "core_freerun",
> +			      "vcodec0_core_freerun",
> +			      "vcodec1_iface",
> +			      "vcodec1_core",
> +			      "vcodec1_core_freerun";
> +
> +		dma-coherent;
> +
> +		interconnects = <&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> +				 &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
> +				<&mmss_noc MASTER_VIDEO_MVP0 QCOM_ICC_TAG_ALWAYS
> +				 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> +		interconnect-names = "cpu-cfg",
> +				     "video-mem";
> +
> +		interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
> +
> +		memory-region = <&video_mem>;
> +
> +		operating-points-v2 = <&iris_opp_table>;
> +
> +		power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
> +				<&videocc VIDEO_CC_MVS0_GDSC>,
> +				<&rpmhpd RPMHPD_MXC>,
> +				<&rpmhpd RPMHPD_MMCX>,
> +				<&videocc VIDEO_CC_MVS1_GDSC>;
> +		power-domain-names = "venus",
> +				     "vcodec0",
> +				     "mxc",
> +				     "mmcx",
> +				     "vcodec1";
> +
> +		resets = <&nwgcc NW_GCC_VIDEO_AXI0_CLK_ARES>,
> +			 <&nwgcc NW_GCC_VIDEO_AXI0C_CLK_ARES>,
> +			 <&videocc VIDEO_CC_MVS0C_FREERUN_CLK_ARES>,
> +			 <&videocc VIDEO_CC_MVS0_FREERUN_CLK_ARES>,
> +			 <&nwgcc NW_GCC_VIDEO_AXI1_CLK_ARES>,
> +			 <&videocc VIDEO_CC_MVS1_FREERUN_CLK_ARES>;
> +		reset-names = "core_bus",
> +			      "vcodec0_bus",
> +			      "core",
> +			      "vcodec0_core",
> +			      "vcodec1_bus",
> +			      "vcodec1_core";
> +
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		dma-ranges = <0x0 0x0 0x0 0xffe00000>;
> +
> +		status = "disabled";
> +
> +		non-pixel {
> +			iommus = <&apps_smmu_1 0x0940 0x20>,
> +				 <&apps_smmu_1 0x0944 0x0>,
> +				 <&apps_smmu_1 0x0960 0x20>;
> +			iommu-ranges = <0x25800000 0xda600000>;
> +		};
> +
> +		pixel {
> +			iommus = <&apps_smmu_1 0x0943 0x0>;
> +		};
> +
> +		iris_opp_table: opp-table {
> +			compatible = "operating-points-v2";
> +
> +			opp-240000000 {
> +				opp-hz = /bits/ 64 <240000000 240000000 360000000>;
> +				required-opps = <&rpmhpd_opp_svs>,
> +						<&rpmhpd_opp_svs>;
> +			};
> +
> +			opp-435000000 {
> +				opp-hz = /bits/ 64 <435000000 435000000 652500000>;
> +				required-opps = <&rpmhpd_opp_svs_l1>,
> +						<&rpmhpd_opp_svs_l1>;
> +			};
> +
> +			opp-480000000 {
> +				opp-hz = /bits/ 64 <480000000 480000000 720000000>;
> +				required-opps = <&rpmhpd_opp_svs_l1>,
> +						<&rpmhpd_opp_nom>;
> +			};
> +
> +			opp-533333333 {
> +				opp-hz = /bits/ 64 <533333333 533333333 800000000>;
> +				required-opps = <&rpmhpd_opp_svs_l1>,
> +						<&rpmhpd_opp_turbo>;
> +			};
> +
> +			opp-560000000 {
> +				opp-hz = /bits/ 64 <560000000 560000000 840000000>;
> +				required-opps = <&rpmhpd_opp_nom>,
> +						<&rpmhpd_opp_turbo_l1>;
> +			};
> +		};
> +	};
> +
>  	videocc: clock-controller@aaf0000 {
>  		compatible = "qcom,nord-videocc";
>  		reg = <0x0 0x0aaf0000 0x0 0x10000>;
> 
> -- 
> 2.34.1
> 
> 
