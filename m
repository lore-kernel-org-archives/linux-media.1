Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792487054;
	b=AItdsQAzMbfVZPJP80pDAMJTify+qi09HGfU2W23gpjDH167C7zumI9wUlh/eRbuRdH1
	 qUsUzwEoAiGKb6Ho6TSLmHc29DmHU6n0A14t8s5JgnWS8HmXv8TL0ibUAHegDxkvIjLbJ
	 Ua59bosXkXO5otGXNa0gl62IWPPU3ZGhjoLskN5W0p30nmao0GxFsKEv+z0yF4eVwGszX
	 fdMb3Ohk4DzwUY4OFUyn/x0JR++rTgva6+nZ8qvOJKIowsefOjCiMp1FPOPV7Nit2gB3H
	 A62xudQP3SesTduf1XNwsu5Srnp0hhx4iWltDyiFrp+Ws3yMHfp+naKOZ+OWGkj2kpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792487054;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=wzX1TW2NwI+yWssGoHbGc+/K6ykZuk0NhVu5SB7QmUk=;
	b=YkV3yMcUJQAL0nNYcUpVdX5pecJdDh4pNkp/ZclkBrVsUVW1CTZY4s3efdgKncd19HSC
	 fGQPbsWT9wUvCf6LfG6/YyB0zB7ya9EK1wFfywm1rHEBUi+iIaktYKOhargIzcFg0/vG3
	 G9oEDzhz87Ndqar1XeTwi8zeDmjeCuhrSlKgpr468uIMNm4d0UFfpWon5fZYFSr7X4THd
	 /kuSKsC1oUQrbKzGoS+8UHpa8y5Ow8JQIF774JD2f832744Ayq39AdXwVAjtQ25MDbxAm
	 6k3jfVMZ4PXFbi5F8jfLjtvyXMO7XSZxviENcWnMgG7Xzca6+8rR2Da+Hb8uxmjuknw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CP0BhtAm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bSpvEH87;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE50606A31F
	for <linux-media@vger.kernel.org>; Tue, 20 Oct 2026 09:04:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CEE50606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CP0BhtAm;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bSpvEH87
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K8h9BC2877675
	for <linux-media@vger.kernel.org>; Tue, 20 Oct 2026 09:04:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wzX1TW2NwI+yWssGoHbGc+/K
	6ykZuk0NhVu5SB7QmUk=; b=CP0BhtAmyCT6JyLAkmqWdyIfIqbOfM4Nfxl5Nrdu
	KmRJTmyZosrBtw/iaRX1wdVgSBjVPmUIMVhWovX6ncpqb9k9WXXADINBVivRrH0q
	TbLtJ84eSTo0UiODkhGpq4usdA8zwPF8z83+bxw26VUz8YVWBXoT4OUEyYGJV6Hy
	OgFc1mR7lwPS/vEnfHXLIdHIAO3H+a5M657e0Cav7BGQx7B6qT0TPsmMJxpLhtty
	uuZHLlvmiZB+dNueEAJs3pxrSQyBMvj80JBx9FHzhsiKpg8dHXXPrNyE39DliMTJ
	Z3DLcT0g7H9c2ntNhXDqgb+0OGyskd802zcs65EcThsnsA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5pss5w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 20 Oct 2026 09:04:13 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-934963b2bc0so616473885a.3
        for <linux-media@vger.kernel.org>; Tue, 20 Oct 2026 02:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792487052; x=1793091852; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wzX1TW2NwI+yWssGoHbGc+/K6ykZuk0NhVu5SB7QmUk=;
        b=bSpvEH87sYF5X9Do9f74ghqyunqFSAT5x2b5vT7JYTeuCIK4yND76EmlHKuX1E2t1W
         zdLOmCaCEg3BctVhP6zkJ9NubH8p07JZ9b2DYi0qkUr/GjauUelho4ssezuiIst0asKW
         AyqeSqy+e6mGg+vjewwHEEH3igSEFtLtgvRwEBRnckY9aC2P13f1QywEVoQZlAWJToZF
         Uat9pTO+aVyo+JvJxYMkiHXYZw9F/qYijHVa9nfwZc0FWs0001yyhPS6evjhaLX94B9c
         nwG4AtYlpOachqr4KjTuycuMZTyZY2eKMz8/qUnZmZGWMfv0Y8MIoPoahAGcKQNZkrJC
         CWJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792487052; x=1793091852;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wzX1TW2NwI+yWssGoHbGc+/K6ykZuk0NhVu5SB7QmUk=;
        b=Qwh230rQ50cyk0RjAfTuIYC4tcUr3oNn3NAmGMy8oHD2Rbdrz1ValAPJIG2jyMIrnA
         NHvV/aswLiZWfWUmCkzIYwIl6KPIyAvdNifEfYKLt7IQNyBr992azG1xVHXhJ3y5OcxJ
         6LSFqbQnY5xtcrvWA7xpS55VrRJL3So+fqiYiJ5J0/AzhPqjUO3GGdDjq2HBPdx6+n7m
         MWqZZdM91JYxaEOlpPV7dv4ATsoYbVgkKphSiJJih66N+ehuUlQmZ4Mkh30zV3dmEtEm
         E03Kja0ycIKr748WNbxDjzHZDzDOhTuXlUXFCOyfetiN1Cklql2yCeiRGR7Ifv3y+M6z
         ktCQ==
X-Forwarded-Encrypted: i=1; AKwUvBw3Q2tYQmEC4RkWYGjid9u13CdbKP+a+bFqLSPTOQnUmZsXbcwpFHQzZ+QIBFO9B8bCjYI6KLP78Fv4eQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYKW+VwJ11H0uyrm5HF5ZU4Gmp+jDKWdi9KPtbxm1Xe/dZXO/XAg
	ja69/p+DjQmBCUNbyjA3bhQmhYOz+exrdybyoyixLaod1t5vwHb/De8rLjDnlVyeKZPt+koFAfQ
	pLvg4HGml+9e0S0ViE4Q12L3G2QYkFNz44wRlIe31EX5MYETAzslpp9oBqYV1PMOsfA==
X-Gm-Gg: AYBFou33BACi5Tfge7izvCDpczWrWMtLXT5tw+yaUqcbdd1poydyg5GRA/i2pZg3jy0
	WKv70agJpNty5IxkOck3hRmf/LoCQuv1CrxKWsiva/EZZayvG9hJeGnCbankCwhpcY6CAP41IYi
	SJGv2PpFuRhxOjnCujqZ2Km4NP8VmAE/rayCgovZbqeJM2riaqvz+XAb5gYety2niUQfHm4HEAP
	N3cm0KIzgSp6wFn64jQ55RSvFDSixNYQT5TO1muAMr9e+tFVjjmoASyTYUoNhbiBZkYDk9RNXfD
	KZLuFLqN6/aTzkjmSXRsWb3JQPj7L4AaKUrAdF+F2gs6forF7Szed6Zh//fppxuF2zkylzMW1Sk
	A1Y/Un9s1COG8dV8mbh6U6E9aIyl0eVjK6Kyq8fnKrhnm7C5Mhqqdf/DhtZuk/wXa35CW6i0GJd
	TKHwgSWbhJZ8Je
X-Received: by 2002:a05:620a:17aa:b0:93f:277b:313d with SMTP id af79cd13be357-93f29b9742bmr1724722385a.2.1792487052072;
        Tue, 20 Oct 2026 02:04:12 -0700 (PDT)
X-Received: by 2002:a05:620a:17aa:b0:93f:277b:313d with SMTP id af79cd13be357-93f29b9742bmr1724715685a.2.1792487051406;
        Tue, 20 Oct 2026 02:04:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be4a434e4csm2531830e87.42.2026.10.20.02.04.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 02:04:07 -0700 (PDT)
Date: Tue, 20 Oct 2026 12:04:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Joonwoo Park <joonwoop@codeaurora.org>,
        Imran Khan <kimran@codeaurora.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ilia Lin <ilialin@codeaurora.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 06/10] clk: qcom: mmcc-msm8996: keep mmss_mmagic_maxi_clk
 always enabled
Message-ID: <vs77pfhgismmyrx4ftmsrl5hylwcjpxirnjdw46c6wu2jcvczl@4wbizp5p247u>
References: <20261019-msm8998-fix-clocks-v1-0-370949e4d8a0@oss.qualcomm.com>
 <20261019-msm8998-fix-clocks-v1-6-370949e4d8a0@oss.qualcomm.com>
 <3de40458-7d7e-4cd8-a200-746e4c2adb13@oss.qualcomm.com>
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
In-Reply-To: <3de40458-7d7e-4cd8-a200-746e4c2adb13@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=DrrDa2/+ c=1 sm=1 tr=0 ts=6ad72e8d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=_XvO8LXBJ3Q0iDersrIA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzNSBTYWx0ZWRfX8DFrdgv81yMg
 o2pI9sRHkIMuUfkaIM1b0HpsXSxFY+knzd1ZRO9WFydCToqIhbRAOGMz6ESHUcNQdFb3qcUOosd
 yAy6IQ3EXNu6/xEvAWnkJ1JTe/a8w+8R2CW2d/uzpgMCvZsjFzgcbHHFAO6B50fJAjtAbsMEqdi
 c2GyGkqCLz9dvV5uUX7NNxgp0/UZ8ERtkb/Mvkm6FgVA/1SlpWtUSYe/nuxXgUSDxeeY1nzK99H
 r/ibS5gcEHm79q/Gm5EL/smu/UOXCvXHfpCaEfChVtKAgu+zfEyIUQBvz1qXYOIMiQ5jWSUfOxc
 lRbUipuZZXA7rlyEWgO6THVDh7iAj20uCYC0ekzuhO8+a/IE36tpUwqprIxnuHsJXBqZYu+DMOk
 6DvywS956gbcU/YAtNmXADj+MxXurO7cPmVzetThH0WocmWv5PxTxdnL9N1BYVS7Jz4a9VFEDWQ
 aiCYYMRcBMywHQUawkw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAzNSBTYWx0ZWRfX+F10rb+suYuk
 SC+mIUsGH1hEEO2JgoH2ErP60ced8bx4dsHpuqaxHpa+o5QRhjNi2345liNjWhbEtYlEiIauV6K
 LFLmJn+NS1LaDzabPAr2CWy/dfoK7ss=
X-Proofpoint-GUID: UpY-IJwHuR1HiqTw4t4AZjACUnhLr6ZS
X-Proofpoint-ORIG-GUID: UpY-IJwHuR1HiqTw4t4AZjACUnhLr6ZS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 spamscore=0 adultscore=0
 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200035

On Tue, Oct 20, 2026 at 10:35:36AM +0200, Konrad Dybcio wrote:
> On 10/19/26 3:41 PM, Dmitry Baryshkov wrote:
> > Enabling vmem_maxi_clk fails with -EBUSY, the branch never leaving halt
> > ("vmem_maxi_clk status stuck at 'off'"), which makes the VMEM block
> > unusable. The MAXI branches sit behind the MMAGIC aggregator, so they
> > cannot leave halt unless mmss_mmagic_maxi_clk is running.
> > 
> > Commit 7705bb7176b9 ("clk: qcom: mmcc-msm8996: leave all mmagic gdscs
> > and clocks always enabled") marked the MMAGIC clocks CLK_IS_CRITICAL
> > because there is no bus driver to manage them, but missed this one: its
> > siblings mmss_mmagic_ahb_clk, mmagic_video_axi_clk and
> > mmagic_video_noc_cfg_ahb_clk all carry the flag while
> > mmss_mmagic_maxi_clk does not.
> > 
> > Mark it CLK_IS_CRITICAL as well.
> > 
> > Note that the halt bit is truthful here and must not be papered over
> > with BRANCH_HALT_SKIP: touching the block while its AXI clock is off
> > silently resets the SoC.
> 
> Will the right fix forward be to grab a handle to all of mmagic
> for MNoC and activate them as needed? CLK_IS_CRITICAL is obviously
> a workaround

Most likely. Some of the clocks might need to be removed from the voting
model at all. I'd say that it's a separate set of fixes, possibly
affecting other platforms too. I have it on my todo list, but it's
long...

> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

-- 
With best wishes
Dmitry
