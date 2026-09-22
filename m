Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B1A5616B3
	for <linux-media@vger.kernel.org>; Tue, 22 Sep 2026 15:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790092412; cv=none; b=iWum7/7XcEGzrRblLCVzDc/xl+BaKj7OON7ojVvOlPBVakkvSQCTi3JwQpTeB3zxNEz+FycHNT4QqVvEj9YlprU4F70jH9/Yse/1FAled2j11Dhj5gGh5Kn/Te2k5B77rM/C5uT4VVj4QzNbaHApRIV1ZFr1KdTYlrZRdFFvkF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790092412; c=relaxed/simple;
	bh=1ox+s3r/Lp49qOJnR5SlvSJcD70klbBFmDZHc2fBQ8I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ky3mmXSGRZ5JXmqRHh+YxeKlJVHkRszXMlTcFwAd2cQ/eEKOxjWZ7HZJcXqrnU2uxGnAvBw0swnFTh0yMGcueXCwWrrI7GXeL7SfE2IuzWHUzcGFj3eSL8BcohvWQGWnFg+K+IHdvzusYBS/4h+gqRXZ7KCA+TGY8XrZ5WbexmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EBnaACdN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Mel9eLD8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EBnaACdN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Mel9eLD8"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MEjHKX449463
	for <linux-media@vger.kernel.org>; Tue, 22 Sep 2026 15:53:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Vyx3xVvWQDVKiKfZUlkZQl+55/TqlPifg4DigWt7F3M=; b=EBnaACdN35LR0TSm
	uT7siCIIr5YiLkdMaOTc9tROU7tlR1y1s+UzHutqFfBbi8+Ch3QYxsUyHahLSxvC
	ejOgaI3Do89ZrKpZB87X3Y7Vvk+nsf7Mu0rGc5bgpdfLblnByGMve4+u6tTf8P2x
	x2BHtRANSr0XizjIT+lSyqYeD6brKrPMxeih3imdpakpN4v3BE5cu/vHNEvLa4z6
	oCLQ4vZmTHpwv4QgHFjVD8MdQku3ZmQyyREBT4JyPXbSHk4i9oUYH0p9KM+SxUjw
	JaLMj4gMa70WzUgdXcZkwAIKBh79nbkbR/r7yzNQcreW6va/2xOQ/ga3dXCr4NjR
	f70nsw==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gunjyt6wn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 22 Sep 2026 15:53:26 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c97957d83bso170e0c.0
        for <linux-media@vger.kernel.org>; Tue, 22 Sep 2026 08:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790092406; x=1790697206; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vyx3xVvWQDVKiKfZUlkZQl+55/TqlPifg4DigWt7F3M=;
        b=Mel9eLD8/NyrconfXiHVeNdYM5hH2iCDDCH9BwcCkpDvlvAiN5wy8dI79K0JjLaTXD
         RdMIkQYm/Q88BTHHuO/R6dH85vNQoeQ6I/JuzoL/l1+anEXVcAb4PmjqEdvooXiV9651
         xEmw0MptBbY8+UGcumKTRQ8ulKV+GDUDxj/Wjfk3axhqqeJQOKgExpbz5f5bCGaG0y3U
         S4hFKpE8x13S7oYBcbs+gRp+mxnH1Vi+DwARQNXcxIV0HK/5eP7eDRA755nc8XUHwGPU
         PG2nDE1mB8Shcy9+caAjpuNlOxWiFIcNhNRlefu/tEQ4Q5+Izgg7j/DsaCI8CWT3TydX
         0+LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790092406; x=1790697206;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vyx3xVvWQDVKiKfZUlkZQl+55/TqlPifg4DigWt7F3M=;
        b=ruMR1ESQfkfpb9KUJthn22zZdHAYmpvNknzSRO9+UirRI+Wu58xo5RaVLcoFB9k2Gk
         QQdXBNmUoiSeGR7k9NMQ6HGVN9HOnDHLbMqjzvu9i/aAZW+qxEkzE/N4T3kqMkMtuaPq
         Nu+82r4g4M9bxcbqi1M1OqB0zcQapuKToPEmSNMzm9i+/SP0vOywV8376Vg+/qHqtgOz
         CZm+3U125c7v84AN1nujlLupREiMUPPKTqF2kJ8lmvGSJk9oArlBXXP0BeSFPT9alg3W
         W6GLHD5BynMiJrJVhKkufbsjdK65w7UNUIjMw9s0semt/HvfB6IUj7palfiu+xL6dIeJ
         VtjA==
X-Forwarded-Encrypted: i=1; AKwUvBy5F+qSQoARtSXZkM5UAZHUWecIOqpGAv1suA6tVsViRLWT+HoWpORwgdRxj0ZLCwBVho+YKWMsK+FTgQ==@vger.kernel.org
X-Gm-Message-State: AFuF++mlGC7cQ+v/JJ7yRdbg41JXMWXePZn88oIUZEtmgYGbcfd25/G8
	dBsUiGwwC8KsdJ58DQu5uItcGcV7RJW94yDQcTgs5zZ+nv3AwOjJuvx+Fyato6HNICSWX/7KkO3
	YA2gpkb+M2GPwP+2JjpmZW7MKwh7DY79N4VnSsMcS1FyfgzUJng3aRuydAKjBBH2OhQ==
X-Gm-Gg: AYBFou1NKgW6ZOH2D23Pi8c0meX9xnLz78Ue1tYqw8/Og54hKQOfpYmKweiLildxEBE
	b2mDdEHLuif31J0OKmQgp8on7oOT+P8A/l4KnSgEdWw+euKIFt9ipzNyAnW9tz/64XiN/uNWa/u
	x0Vmc1zMGH3Mf6hC4WU87cTyrDUZ+fjrE9kq43nSdswKXkSTkYRihNlfbLwx6gBYoGyeCz2hU1S
	azBH8/rGDUWtjaRrDVVVlfS5DNiceNNi/m24U/J6lYuVazpC5CWAovJqwalPBvVQtInO40ILHGd
	RStyVPCA/QyNzEDGkEt+wPiGCQVT6BSdCnt54nex7rIE3bApMjb/zlNBsTv7EfibDtI3YSihij8
	82LzVKPZMQi26Z5Rw4t3oLQ==
X-Received: by 2002:a05:6102:5791:b0:7a7:12b0:fd03 with SMTP id ada2fe7eead31-7a712b10825mr6422305137.0.1790092405828;
        Tue, 22 Sep 2026 08:53:25 -0700 (PDT)
X-Received: by 2002:a05:6102:5791:b0:7a7:12b0:fd03 with SMTP id ada2fe7eead31-7a712b10825mr6422236137.0.1790092405243;
        Tue, 22 Sep 2026 08:53:25 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a9c583022sm109114066b.29.2026.09.22.08.53.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 08:53:24 -0700 (PDT)
Message-ID: <ff798c31-48ef-4882-8ca7-5b4c8bdcf9a0@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 17:53:20 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 4/5] arm64: dts: qcom:
 shikra-cqm-cqs-evk-imx577-camera: Add DT overlay for Shikra
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20260917-shikra-camss-review-v8-0-9b9596221cfa@oss.qualcomm.com>
 <20260917-shikra-camss-review-v8-4-9b9596221cfa@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260917-shikra-camss-review-v8-4-9b9596221cfa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 4UbTsvWgQSz05Q_-GqmRF7OYzVIrpK0m
X-Authority-Analysis: v=2.4 cv=KqHYSmWN c=1 sm=1 tr=0 ts=6ab2a476 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=EY8lGxjS-5OGnG_HtjIA:9
 a=QEXdDO2ut3YA:10 a=hhpmQAJR8DioWGSBphRh:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDIzMSBTYWx0ZWRfXyHwpsbI/5NOV
 2s9Urk8iO2rNQICw9XcKbrQQU7KHE4htNjxUxfhEhtpWUnUckvGzjilMQ6/VXXsbw2xntWg/1ra
 y0+67S+H/jAli5AxCNXb84jPAJ0lEQTmM5KUUutdzvBTB5qlHrg5J53tGqe2CYpSvAwJENK7gUj
 XTTqYLtXbP80cN1ujygDbYmbQFaU/jT6DJ9jJCywpYgW7YMWGhtJJgt3a+gIBqZqyxoeBIhMB6T
 1YA0yafNFUapGplzrTAEFlw4wH5JA7MglSJOA8Ikn6EuBZ1p+u62WeMveZRnyqjxvrcq7fpKMu7
 ecdTz4yhfRc6Q1N4Wq+i56r/IwmsepWiYzG78h9A9jSSZvAoSA7u3NVa2F2+MwuROdD6SIQ69uC
 YYaPH7izi+PwU/9SpYeMLTQBB5kexrK7InqHugFzvB6zyj7h2EJv2RxOkws4tuqdZcvitmr9oCJ
 d7Mpf1beYEUttxbub+w==
X-Proofpoint-ORIG-GUID: 4UbTsvWgQSz05Q_-GqmRF7OYzVIrpK0m
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDIzMSBTYWx0ZWRfXz9IHqSmN0uEa
 buXsesT2ugzWXUFQHZDCt/hKaUOTkgjLTxT1IrhgRtBVsq8fa+Rm+ZvLPFkI536D8lgLdr66RWG
 qx2uTMKSS5FmUuJM4taJGhg9ObOXUB0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220231

On 9/17/26 1:41 PM, Nihal Kumar Gupta wrote:
> Shikra CQM and CQS are retail variants sharing the same PM4125 PMIC
> and identical camera supply rails. The only difference between them
> is the integrated modem on CQM, which does not affect camera hardware.
> 
> Add a shared overlay for optional IMX577 integration via CSIPHY1,
> used by both CQM and CQS EVK boards.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> ---

[...]

> +&camss {
> +	vdd-csiphy-1p2-supply = <&pm4125_l5>;
> +	vdd-csiphy-1p8-supply = <&pm4125_l13>;
> +
> +	status = "okay";
> +
> +	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		port@1 {
> +			reg = <1>;
> +
> +			csiphy1_ep: endpoint {
> +				data-lanes = <0 1 2 3>;
> +				remote-endpoint = <&imx577_ep1>;
> +			};

Please realign this vs the hamoa series - define a port in the SoC
DTSI and reference it here

https://lore.kernel.org/linux-arm-msm/20260917-x1e-camss-csi2-phy-dtsi-v7-6-1a63eb35838b@linaro.org/

Konrad
