Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793101494;
	b=Loz3Qt558KUQHPl3nqy+jexUCDdC7s1L3tCbxXzTMnvtFpndWIpLB07QTUfjVCLGxuUh
	 Vj64r3KV9ZxfKwnW6RIYv8jIsRhzaIqEKjor91IKoEG4VMbKPAFIyJOVa9VTNBr08QMqk
	 e1yWaP76VlyvAb1eKnCq0ev40clex35NADLuIRigq3ZKK9vStzV1x5VQ9O73e7bA3n0Cw
	 ByW3ygSxcwWRHO7a/oWtMX2IcuioyGa2L96E/s65nr6NwYGUikCoyQGR34d85WhiEuETt
	 ukrIT0j88C+phfiwZK4XIJ6puSOOZ72jtiWJ44G3nv4Mdng3Opn9XT/lAQ3FdP6z/kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793101494;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=lE7AshOR9IvZTWb4KZq+JxDOO/khlLsKuqrhcF9jNKs=;
	b=qlGug4p9nDsjrUllEgjz6cS9zBJxOoGxmatdtyLSTNOYvNuQIuNl8rvUtyK99/wsbbTF
	 cALdBn5Gj4RXuANRzgbkm5IlToz2uZBu9IUK83ciZvorcCbpd6jsHJcT5MdFFu3t4CUny
	 VU/C7cJha0mDEpxb9uEwcs+cJ9avOkNvM2/zS46ypKTcwHcDahC6nINfPpn91dAsI/ts2
	 x36oher5ydZAiBlBWrkiS8o9USS/q9gPdsNAsX6dFkPaLNYRB4/VGwX2tz8xWtxh7gbCW
	 eJMT5JZJUQTBH3ccYJ36gFstcXPB9nrHXT2KRe+uES+qNpQbhzApkC8Jflh0lpSNt5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JECJ1hD7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=i02MCe3d;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35750606A9EC
	for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 11:44:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35750606A9EC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JECJ1hD7;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=i02MCe3d
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAdwR41061068
	for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 11:44:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lE7AshOR9IvZTWb4KZq+JxDO
	O/khlLsKuqrhcF9jNKs=; b=JECJ1hD7v8moO1XN6ecJsdDt6TuQlsG5Fw8AGyBv
	SRdm5mWhtl6JZijzfe7UdoOdJP+7kP9QjjLQMphlmGNiwqUQ29O/SHADAdC0drng
	nvZOlcFkb8PSwKF1bZtbJFygVxaXT1LYi+wh1uM6ONeX3IBCLss+MJJjE0FOQicb
	vbHBdeARg9khPu4JnTTJNa4VMO0Sk98DNk1+OjAxQvnoNtkEDqGmB+/23Jsl6KCM
	+BQaqRa0d3ZBR5UC3Xf30cV7FWGyOuQUeH1HPeJNxoL6aRlfKXiWLPblY+VWw3Me
	U29bdBvrEZhKiW8OK/Wn32P0WXPaJdCkrGbH3N2nLrPE+w==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjp2t9aqq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 11:44:51 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7cc06b9cb33so664199137.0
        for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 04:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793101491; x=1793706291; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lE7AshOR9IvZTWb4KZq+JxDOO/khlLsKuqrhcF9jNKs=;
        b=i02MCe3dtFmpLqeN2Ogia9BGC/JO/y1+/1MnLqdM0yDZ7yHtrkPdZUEpUq/1Ozp7aX
         8qKcwyyLIH816CJQslmIhED5Eh4+GXkEPQSe7zYiRk6zd831+mWisHNASWLq5DG0g33n
         umKxlGXo4IkNuVFbMJa+a4KdVIQuPPvy8xbcaNr3Lagzx/eqvvqRqXlRMQNmoFmweifq
         tibtfBIkrjEQAHJ1I6cIuCwyzWu+vkAPbK5ZMYbY9TghAT0JI8jUBtyCZ3bkRsLfZTKj
         +lmUcYhmrBs8/9qw/1QY9cAKG2elA6SrV4MpLOly2jdoSb120ByNHrIyVHGnWzva29XL
         Prmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793101491; x=1793706291;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lE7AshOR9IvZTWb4KZq+JxDOO/khlLsKuqrhcF9jNKs=;
        b=wq5Jsut5KImZRb6kndFEGtUHxRFf2QvkGQIfWBiMd68JrZx1bqs5lmz66C1LPafZDa
         6/xcjvEMK7++8HyJzfNeTNGqDM/CbdgJXUA086Kg0B4/L9Q4HS8Azzx5wwJSHWcFowRg
         2GqW3CgwxlmFJ+dTmLK6Rwhn8tLxb2j9xvoTnr/mtyi5yQmgmD9iWVfri6nIZRpLe3WR
         HLfNjnC+0TBcEdkD/tnEKf84pjNZfLu/1wDkm4RZTT/ft75GS7ZmZIbeSLOpiuQ/rVk4
         0P2uC/4rOh8gNOxALuLtwx0PGjT1OYFRN0CmEJvFqZUXEHrJZ9gxqlNX2Yr+I34g/1X8
         b9HQ==
X-Forwarded-Encrypted: i=1; AKwUvBwPjvYD8tKTw0ekFo/G3FcvOpWvrLlcOX4l8rQAqQXeOR3ynvbpeWCFIZq8wz5bFPstXZ+FVjVrok9vNw==@vger.kernel.org
X-Gm-Message-State: AFq9FYIldYNIdf+YgwngmBPoJhadFtlXwg7Fur67EWbYsX57zLO4604O
	RZu8b9YqcecAvZG7UToxdJ3VPRtFbcY8WNYn1pn7A7yoSYyCdqYZHRQxwgT0C8EZFRjAMu/AuM+
	Jd4yJcPovrTB6cQ8LFQFe5wxowdU6Ks787w0lfqbbCLw3DLe2KiSoS2R7ySloAxuXiA==
X-Gm-Gg: AYBFou2csyISzz47B+1+VCIDQT8IGEdLyKxQtKJHpPT90NmC/G+xldC6gbs7iPHmyUh
	URmTi9e7Lf6kHLs14nF5BCBs5nvHJ68KMI6KeSnxkrcNGFtCpLXmaR6fAhqenydRJOKQf9+e3qF
	4lSiCRUdabTgj2ebiYBTJILW7lZhz7Q6LCe37Wf1bu5MKs/ITYf3JghVdI1sCihP6ZOVVpw4cr9
	rCzsf2JKav8eVSpAZlXUI/uZ/Bw9MftNRN/0AwDXxtS0IKqyGRWpnblYUSyp5tMIxz6a+LkI4d0
	qzK47PeE/QmTqi4+w1P7lmS3CwTKPQuYiWXsK2xt3OaGgcqqwqooi7p2LxzAp0jIw85RVZN65Lt
	zRz68RpdiikxzRW1jgUVf5yjODXuM3zk8YxfWOmYAGVM31o9At2/2dxueoAENgTTsHTFSOXA/iQ
	ZLGUOfxz9/bSP3
X-Received: by 2002:a05:6102:5048:b0:7bf:74c1:b606 with SMTP id ada2fe7eead31-7ce5ce4227dmr2779177137.34.1793101490730;
        Tue, 27 Oct 2026 04:44:50 -0700 (PDT)
X-Received: by 2002:a05:6102:5048:b0:7bf:74c1:b606 with SMTP id ada2fe7eead31-7ce5ce4227dmr2779134137.34.1793101490117;
        Tue, 27 Oct 2026 04:44:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a8945esm2027201e87.53.2026.10.27.04.44.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:44:48 -0700 (PDT)
Date: Tue, 27 Oct 2026 13:44:47 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowangio@gmail.com>,
        Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
        Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Flemin Jose <flemin.jose@oss.qualcomm.com>,
        Mahadevan P <mahap@oss.qualcomm.com>, virtualization@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, iommu@lists.linux.dev
Subject: Re: [PATCH v2 23/23] arm64: dts: qcom: hawi: Add DCP support
Message-ID: <zg235e6lnlml52ya5fj4f4ulmamnqrlvtfs4yj7i4z4ezrr5uv@zaybpfrp5hjn>
References: <20261026-jshekhar-dcp-hlos-v2-0-7cf014efdee1@oss.qualcomm.com>
 <20261026-jshekhar-dcp-hlos-v2-23-7cf014efdee1@oss.qualcomm.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261026-jshekhar-dcp-hlos-v2-23-7cf014efdee1@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=AJjzCM5L c=1 sm=1 tr=0 ts=6ae08eb3 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=Imd885ZT4_v8IS7qKhkA:9 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: ZXtUc_E38CA5vO-94TN9PBjBPSmqxAOe
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0NiBTYWx0ZWRfX8JO1TR7usv8I
 CMZQqc5G85M1H4qnMCEtK6SfklvHrA2qGjy1gMV3m69AenEL4biTAk78vAuEXiFzHNm6EcdCNtU
 Gi5BlNopzQlpRR2ZTtHtSOQZMopsOz4=
X-Proofpoint-ORIG-GUID: ZXtUc_E38CA5vO-94TN9PBjBPSmqxAOe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0NiBTYWx0ZWRfX3zxoJeZ4S0YH
 CKYDeBsfw2+J4qLo45QnxYsxHRRbpAMpXqXvzfz1iFrnsZAQIei6ZhG0RQvFtwcmqT3V2Fpdi4H
 dbeyR30tkJMDRR9NJ/H6tlOwOzkT9mh+shS+Dcl+cu4jSxSbgjNo81RLeC3xhPKFN1dhv2uWII7
 kUD+n+Y2NzQwe47t3apmecxM1pAKyQv/pdfAoNiLfTM73RSCYg8IIWtQcyCNHt7N3/Xmmnz2HjX
 UeTJe37sgsbA0wdbMgOoYlfxpDiE9GaXkIKCoZPJ7COalp0h7izJ6YN49H3Rc+oXv0MID5ICL7T
 EFcvyan2qKbD1Y4LY+AEcTc1+cEmC3O1pY9EaJJ2ZEDE3Jwlah2hN8OhtyJrGJmu0D1FuzuLrmZ
 jjNPJuyB/SgeYpe8z0BL+QeGSQDK5EQPGCQjC92eAirIo2vbXEjcuqmNPY4etWlly+N/pYmIT7o
 MnfA5qISBT173lCl0Hg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 malwarescore=0 spamscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270046

On Mon, Oct 26, 2026 at 11:51:33AM +0530, Jayant Shekhar wrote:
> Hawi display hardware is owned by DCP firmware, so the platform device tree
> must describe the Qualcomm transport wrapper, firmware display subsystem,
> power-notify channel, IOMMU contexts, and display graph used by the MSM DRM
> driver.
> 
> Describe the Qualcomm DCP transport and its VirtIO-MMIO child,
> the IPCC power-notify channel, IOMMU assignments, firmware-visible IOVA
> range, and DSI display endpoints on Hawi. Enable the DCP display device on
> the Hawi MTP platform.
> 
> Assisted-by: LLM
> Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/hawi-mtp.dts | 129 ++++++++++++++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/hawi.dtsi    |  40 +++++++++++
>  2 files changed, 169 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/hawi-mtp.dts b/arch/arm64/boot/dts/qcom/hawi-mtp.dts
> index c38e5fab7a2c..a27003f69d02 100644
> --- a/arch/arm64/boot/dts/qcom/hawi-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/hawi-mtp.dts
> @@ -34,6 +34,18 @@ chosen {
>  		stdout-path = "serial0:115200n8";
>  	};
>  
> +	display_panel_vdd: regulator-display-panel-vdd {
> +		compatible = "regulator-fixed";
> +		regulator-name = "display-panel-vdd";

Is it the actual name in the schematics?

> +		regulator-min-microvolt = <1100000>;
> +		regulator-max-microvolt = <1100000>;
> +		gpio = <&pmd8028_e1_gpios 2 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +		regulator-boot-on;
> +		pinctrl-0 = <&sde_disp0_vdd_active>;
> +		pinctrl-names = "default";
> +	};
> +
>  	clocks {
>  		bi_tcxo_ao_div2: bi-tcxo-ao-div2-clk {
>  			compatible = "fixed-factor-clock";
> @@ -142,6 +154,7 @@ sdcard_vdd_3p0: sdcard-vdd-3p0 {
>  
>  		vin-supply = <&vreg_bob1>;
>  	};
> +

Unrelated

>  };
>  
>  &apps_rsc {

[..]

> +&tlmm {
> +	sde_te_active: sde-te-active-state {
> +		pins = "gpio86";
> +		function = "mdp_vsync";
> +		drive-strength = <2>;
> +		bias-pull-down;
> +	};
> +
> +	sde_te_suspend: sde-te-suspend-state {
> +		pins = "gpio86";
> +		function = "mdp_vsync";
> +		drive-strength = <2>;
> +		bias-pull-down;
> +	};

What's the difference from the previous entry?

> +
> +	sde_esync0_suspend: sde-esync0-suspend-state {
> +		pins = "gpio88";
> +		function = "mdp_esync0";
> +		drive-strength = <2>;
> +		bias-pull-down;
> +	};
> +
> +	sde_dsi_active: sde-dsi-active-state {
> +		pins = "gpio211";
> +		function = "gpio";
> +		drive-strength = <8>;
> +		bias-disable;
> +	};
> +
> +	sde_dsi_suspend: sde-dsi-suspend-state {
> +		pins = "gpio211";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-pull-down;
> +	};

What is it used for? I don't see GPIO 211 to be used. GPIO 210 is used
for panel reset.

> +};
> diff --git a/arch/arm64/boot/dts/qcom/hawi.dtsi b/arch/arm64/boot/dts/qcom/hawi.dtsi
> index 6b0a0ff0faa4..836970cdef71 100644
> --- a/arch/arm64/boot/dts/qcom/hawi.dtsi
> +++ b/arch/arm64/boot/dts/qcom/hawi.dtsi
> @@ -6841,4 +6841,44 @@ timer {
>  			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
>  			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
>  	};
> +
> +	dcp: virtio@9be8000 {
> +		compatible = "qcom,dcp-virtio";
> +		reg = <0x0 0x09be8000 0x0 0x1000>;
> +		interrupts-extended = <&intc GIC_ESPI 956 IRQ_TYPE_LEVEL_HIGH>,
> +					      <&ipcc 13 5 IRQ_TYPE_EDGE_RISING>;

Align properly

> +		iommus = <&apps_smmu 0x15a3 0x0>;
> +		iommu-ranges = <0x0 0x84000000 0x0 0x04000000>;
> +		dma-coherent;
> +		mboxes = <&ipcc 13 5>;
> +		mbox-names = "dcp-power-tx";
> +
> +		dcp-subsystem {
> +			compatible = "virtio,device34";
> +
> +			iommus = <&apps_smmu 0x400 0x2>;
> +
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +					dcp_intf0_out: endpoint {
> +

No need for an empty line.

> +					};
> +				};
> +
> +			};
> +
> +			dcp_dsi0: dsi@0 {
> +				reg = <0>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +			};
> +		};
> +	};
>  };
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry
