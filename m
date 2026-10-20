Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792479476;
	b=glMQdUpW6NODu6GL2lSlE65ZYOKSVb9kXTz4b3Xzz1Hc0ShgTB4L2GfR30wPf5GVTl67
	 BjsierjHN0JM0I4Ikx+oK+EbsbVQpNCbkBjt13/MdMs1H66He43KxlB3s5C7PiRTUd0E+
	 CEFwbKmoSTJDXnJdYWZxjHFplgelVuv6kJXtYalDAS8xrexXMZWht5dBPlIy8RzcWX8qD
	 D4Yg68Oy9FnB7Ig30eNg9AqmmFKY/sjgySzf9+YR4lJkn3MYpFKnkt0diR+P3biWbRPHI
	 PhMvYd1AIiz3FVoee39xx2S6HPBE/DnjLdTzln6zNaFVCS/tnM76eOZ7CThtvPhTK0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792479476;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=OtJqhIVzyYbiPCDKFzmgjolR1igdute387IZrN4FPCI=;
	b=oAuZWW+eL+fjUhaH/umf7Nac9HMU4dKsJJqK9DWTy2CvYa/yPWHaInxENPT9QQyNeK0E
	 Q8Kab9y0UrvowT5oXfyJzgjksfUZtQ1mCIia7p8OrauHVD1vdqhAzI/KcR7rA86goM9IF
	 3OohxkCvamiJytNROnqplyFp/iiddDd1gAGjGFZasMJdtfDbPbElwFn6QmKJE/WUmV3nq
	 ceke5QjPIzSHotD3xdUlS8LpNvAxfMxPr9S9bmL1PyReVzU8SCiFnGuZz88LeoUTVpswh
	 Sa3XH3EjadQdCw7POQXZpQWR+979tPT+WlAMBF+/5i6XEPlnJRPG0gi0a/qhNzJ6bcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TsMk+zH2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Z/dBO5I+";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 899A760A3830
	for <linux-media@vger.kernel.org>; Tue, 20 Oct 2026 06:57:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 899A760A3830
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TsMk+zH2;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z/dBO5I+
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0tB6Y2877684
	for <linux-media@vger.kernel.org>; Tue, 20 Oct 2026 06:57:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OtJqhIVzyYbiPCDKFzmgjolR1igdute387IZrN4FPCI=; b=TsMk+zH28Jf1GdAt
	qoT/9lY3gFvz5TLeqhj1zhjWRu8+FqDdFNWulTwLsbYzVQfTU6IDshTW+IeTyGJ+
	kGSkRSxfp9vdnpQfA6lqD7pcxLR68OI70Mt9465AN5Y4h+WHqk31V/iCoHYhjYPe
	eCAqYmFn0QatzSGuVb+N7sL2joz37VzaG9jN73cTO2yhVnPnwDLHfYnAcUWsGj8H
	oHsjd1ZKOlveUSCrwbVhWnGMpzM0gETFBOeSfWHbnwjx/FM9Lt3ep9tXd8VN+iCW
	V+KQjGhQGEdjHvwomdCdKqM16NSmWCMWbPXigbxkYa77AvqIE6TzC90koYj9YjEN
	1Zix4w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5ps8rr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 20 Oct 2026 06:57:49 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5356c6d98cbso10453141cf.0
        for <linux-media@vger.kernel.org>; Mon, 19 Oct 2026 23:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792479469; x=1793084269; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OtJqhIVzyYbiPCDKFzmgjolR1igdute387IZrN4FPCI=;
        b=Z/dBO5I+dtbYNTgmYzziHAI8BMH1JX0OrFqcV96d/B1CRKjF+cR9VIdJGPYUCBg2Ee
         NUkRp1QCzFpAdSPXPuPZXXpqgszMIXFsy8+QhRD9HQwgPyD3PJmbIRGaThnG0xJLgyY6
         H7uf+gbrFexPSvORE2cJJ2cmCFCaR9PC5xKvkvhDps6zmbNo9PNcdwMXWhK8T6EMq4dm
         y17E6nBcfeh8bFIHwOntr0ueRPXxf/r9Kfl7SygQoBurdiITbjGWWswaVucls0QoV38u
         JlW9AUX5UItVg2AVqeNgtu3XRhNu307ViotZ8EpGh8BRif1TOy6ehgV2DdMmDXkpJFcB
         otfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792479469; x=1793084269;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OtJqhIVzyYbiPCDKFzmgjolR1igdute387IZrN4FPCI=;
        b=lmF4a3rmadGLQkdWkAo1fyPkbKGNKWyGLBvGbXu3vPoZKxdBLcLCNwZ9gBIoknsdE1
         x12JdX/dGjFUBpcI5iKCGu5T5i19DNepcWEIKMZ4tWq0tWmoP0WZdp16jzPwZqkEUsB6
         o6TFZOQ5s2wX9nINYCVBGMFzaL7DSWUQ/qDVqPr50fpIXDx4Msu1o/QVH1CiVyWIjx7e
         jGic+544shBf+xYppZ+eqSe2KRq98x7QzrKPb+ES/6BfCLkKCwgKrbabeyG2EorwoSWf
         mcpmMTCL1VPBHrHu4rU8+VK1HQ4jmWTjv1gZaTdOTxMnzF65FBbRQAyZKlD1HlkT/JF/
         HDrw==
X-Forwarded-Encrypted: i=1; AKwUvBxmPvoAx676+40g9IaEd45St9YxXF8jjKoAzIGjShCIoP1Zhsv2yqgiVUc31kEYE13lJ8Jp5P+fpGy2Pg==@vger.kernel.org
X-Gm-Message-State: AFq9FYJ5w3ElIRNWn8QKCa5tZZJGYjcSuf/VWvb2BVZCMQ2AOI7sgOX+
	AeK3wYU6Z25VEdAoqycadWXVgwlbr1rY4B3TxcNVseiYDL15yCA8WIUCjXwjGL9qSgh4n6l0EJe
	JQC7luLUDDq/KPvEhHyMAJQ7eP0+PIZIDq+rCfO1qVKbCGtre5gOZQxe8Hfa4edUk0A==
X-Gm-Gg: AYBFou1ZsSXL6UhhMFU8Do/p6MPEjvJ1UZedkQ7rJLvzwJLV1ssubBEm9B3wFN5+6Am
	Qtk2DtEP4MsUeN/gS422l23aX7JCIkiatyn4EhO5f4Vm+V4a5mpV78HuOR+VmGNNQfW7Mh6cVU+
	KEpCAhCLoRlvu4fFXx7/mR7qscIYnJ2Av9khdJLtDLCBzik9D4k5ZiV4FatngFzkyccAA5GdmG9
	VWUGsDjCYHXbPYDexgNDE8D15OvdrNFLetKy23yt1fF2E+n2WbofXbj+H7ip5Z73gBDLHOHG8aZ
	ZQIg6CEjWI+DicOY8z1uUzo3shvjITy+ABKLSN1Q/6N2JaH6lM31Cx5/71h0CXgpNtAxyYLTep1
	o3PgqR6nOqBLTvKV1LOm1zQ==
X-Received: by 2002:ac8:5701:0:b0:535:fd16:4393 with SMTP id d75a77b69052e-536461cc281mr179117511cf.5.1792479468643;
        Mon, 19 Oct 2026 23:57:48 -0700 (PDT)
X-Received: by 2002:ac8:5701:0:b0:535:fd16:4393 with SMTP id d75a77b69052e-536461cc281mr179117151cf.5.1792479468091;
        Mon, 19 Oct 2026 23:57:48 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4090dd10d4sm453415966b.27.2026.10.19.23.57.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 23:57:47 -0700 (PDT)
Message-ID: <45b92e2c-a310-4bb0-ad8e-2fb5b162fbe1@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 08:57:43 +0200
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
Subject: Re: [PATCH 07/10] clk: qcom: cbf-msm8996: program the MSM8996 Pro
 post-divider
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Joonwoo Park <joonwoop@codeaurora.org>,
        Imran Khan <kimran@codeaurora.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Ilia Lin <ilialin@codeaurora.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20261019-msm8998-fix-clocks-v1-0-370949e4d8a0@oss.qualcomm.com>
 <20261019-msm8998-fix-clocks-v1-7-370949e4d8a0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261019-msm8998-fix-clocks-v1-7-370949e4d8a0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=DrrDa2/+ c=1 sm=1 tr=0 ts=6ad710ed cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=RnTLsUR5sZSAZyuXL5kA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAyNyBTYWx0ZWRfX40lpq36a6zHh
 MGmP1yvigDFVsy1SW73xcErnZ1jmQElXDfrGH8aeJMqGuaQf1mQ+t5BIKb3J46S1lxuAwvOVlWy
 CEjzC3EGg7TTC2UR1C2F4AmNFQ+2pGB5CAX5MMgV/74hKugpPbxVmvphg9tOcTBhKo30T7AdkPd
 dQSGzemvZzgrZIEJkoiY3l5zUfeUgPuFoHk58nZFjk3n5RsfcDebEEvt1Kwt+ljrcjVG32gPRcY
 xE7XgMejJyxDyQofWBXF/OgEv30XAQqLLjeNw08lKleu6bq97NF4e/8aimD7wyOB1NazIFoz+sR
 7gLSZ138/+YvFukCMfrmioIB2EmbRcmTm0DwY3/ourDy3e00LeIn3J6bg3S/WuCZ/ZaOnevSMbu
 csHbOsGSFTUf24oCWUSiWgqWHeZA8qJaeB3YosCGthNaTkl3Ah8MUWAuLm4f+faWhJILxulJXmK
 gEuBshIhImrJu+G+t7w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAyNyBTYWx0ZWRfX6WfzUWFmvhr0
 5/vwflCSZf8h0YHnAmTOowOWL+ddU5U5tSJKlv8e4y8Sn6eBZcIODPP4O7jstZO7WsO1Qfl7oDp
 e+A//txDzO+dmJ3gZwq3sBdmnDdzll8=
X-Proofpoint-GUID: cb9VHxwPxmCwav0UeLxR65kYz0d4TRSg
X-Proofpoint-ORIG-GUID: cb9VHxwPxmCwav0UeLxR65kYz0d4TRSg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 spamscore=0 adultscore=0
 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200027

On 10/19/26 3:41 PM, Dmitry Baryshkov wrote:
> On MSM8996 Pro the CBF runs at twice the requested rate below 600 MHz,
> at the voltage of the requested rate, and the SoC hangs once the fabric
> is allowed to scale down. The Pro post-divider of 4 is only set in the
> PLL configuration after clk_alpha_pll_configure() has already
> programmed the hardware, so the PLL keeps dividing by 2 while the clock
> tree divides its rate by 4.
> 
> Set up the Pro post-divider before the PLL is configured.
> 
> Fixes: bc48641a68dc ("clk: qcom: cbf-msm8996: Add support for MSM8996 Pro")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
