Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792491049;
	b=1oEkimRmrMX4/KeB5hu3cQVkhMHn2RtfPIcJy5E4F2keh5JfwL8dYuHuCTmwh4hu5vT4
	 ngWlvoTuqNEoznnol4L4p+KkvOfvCIABOHCZ4MgStgXie87CqlB7C23txkuG5BWFjm0MQ
	 wErfFuf6M3ygXM8+uzP14vYDExE3Bqewlisfyn5rd/y5h7nybAPbZ7gFggXfaLTMJChRO
	 Xlqee7kNdlkYHx7eCV/O9rVOlGWaUX9fXX7/UYZ22LiNADC5jpfoLZNNoXaatOHv2ypfq
	 ZDNBV8uKWRGftUAbjUiDEAzaVYrp5QqDoZwBG0ioT4jH1qghco2YSPHHHXTNyUEVpuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792491049;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=2ws4735qh4wR/HsDhw2lJB9bz2bPEpAWvlil4rhqeZ8=;
	b=pe6XYMJsgpzV5h4XwfcPlCBUgfaPi6cYrixQCrFKNiXCtLANIyUHtKFoaCKQ0nPwOBFS
	 4QI56puLqHia4rMz75xyOzTsmdtegu4tzaHUKJsTY3FTwZfeLqH/2zf/cupC4zVQjYKg0
	 JRWrQqsOyBrwjt+bcxTkBCbiWpCZH6lnrlaj4SontHQcvAh6hCpWq6peKZbPRLsnlMDH3
	 pcSjv5fTAQ3EsFKkbcKGds+K7iCLkIjMBu15iD7he+I85966rTSiaq/FTmDnILw1Y+My+
	 hCPSQXXFspFjKJDabZdv998JhrW+3raG614K+yNQF722kWBVZxH4H3pAopueQdA3ybQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Bx+azzKj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=i1ddJ30F;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C97A60A262F
	for <linux-media@vger.kernel.org>; Tue, 20 Oct 2026 10:10:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C97A60A262F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Bx+azzKj;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=i1ddJ30F
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K8JUNM2877818
	for <linux-media@vger.kernel.org>; Tue, 20 Oct 2026 10:10:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2ws4735qh4wR/HsDhw2lJB9b
	z2bPEpAWvlil4rhqeZ8=; b=Bx+azzKjdEpWAZ29MxriNvuN/bpRtf4SUZlWdF7M
	sBmGqesvDT9x84K3FFggEf688tCYYfCBDIRh0dqL2iKUCw8wl1hFb8wkFcanZYsD
	tfGpZsuT8NiwfjTxiQxp90UAMaoDU7LOurdfXV6Rkt3OYwRZz+TdSQh82i3iC1uO
	YsxSiA5Jdp9Z8avezlbGbUFWiH3cbBIARD1ET8VAlaEdDjNBRCJ0iU/IHwyIKW45
	V3dSddkwWvDO5ExUlG4qnjLwu64D7rKSKDrYbK3MR1ckJkTWj1pgT1mtcX1HOHDZ
	50qpRgs5g25LIjdGIvIsIovUTAgowlMSfVnK1CggL2Kj5A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5pt0x9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 20 Oct 2026 10:10:48 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f2373e9b4so333825685a.1
        for <linux-media@vger.kernel.org>; Tue, 20 Oct 2026 03:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792491047; x=1793095847; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2ws4735qh4wR/HsDhw2lJB9bz2bPEpAWvlil4rhqeZ8=;
        b=i1ddJ30FBlnpMa3/PtZMQZtAr8t7fGAkTMTkn94NJsNkI48eTCXEiCj5yNO5e9aVAA
         I3/kmwbWuQjSAdsAKcwhPqbF819F8KA6usedje1bRZ+2YgmnAkUb0cj0ro3N3RjH9Jh1
         fpHusyqxaN5ftI6e+9axPFHbkWZH66+mTSyGw5N4cstg5HxP12QcXfLn/ND+BixoJTzy
         Qs84pNF0pYtoMuLA4DtIb7/tGSA/b9w+5LpFri8PE5t/h2OzkMzpnkk+DUoYYZzl6cbN
         ezDFTMIXeEgDIaEKnMwR/GIUCoHtfkIVdYtGpPZMyRIa7blII7jE+Dr8CM+3vFCiabPf
         n0xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792491047; x=1793095847;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2ws4735qh4wR/HsDhw2lJB9bz2bPEpAWvlil4rhqeZ8=;
        b=Ax7+PKwid8TAJVI3KBeCuURVPTx3nakSTJRrYcZiJFFGV29MxIp+YV1ZnCjt7e9YQj
         0PraddxQlq7MDQ471Njn8c/XV9t2rJg/y0tmAQ+nCzNKhbASuN5541WSbt0E5VdyA1ad
         LXKe19KIzVxLWTCgVOIx6j2CX+67lhTh+MzKL9UBC2p+uTfrYRKT4V5rfcD4EYPXfwxZ
         wIHyRxUl/Y9MO9d2Hsehoolc0QUgva2NSw5eOCE1X5ONr1gY5pirux+/S2aXrr7MB30t
         /WDoB4mlNdKmfKI6W64Ufd2GgxhOaTZS5Lbcgs6rgbTl4l8mJ38PklmqesWlaitOC+RQ
         x8qA==
X-Forwarded-Encrypted: i=1; AKwUvBzyZbjkQOWUhKJmZop4BtUfX0eTaNVXU2UGg6rMR1ompLMWTE8i877lkRmRVAQfHUF2J7UrTSWaeSJ7pQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYIhei0XoWkfw/IHGAvAwspRK7BL5cJ8RGSsUELLNUkW+O4azjo2
	5VPNJHgvqzd7zdQi6lOXwxY816bFvwPEdHm87UzZ+lPj2dAnSsoGQEIm2Um5jJnZ/lilpUHFiOy
	TEcxMlOICh8FYJT05/3zFuxSSEjJjHDZ3Ddrx2SxH2Zg5+CEofK6JL8ku2gvziF1oOA==
X-Gm-Gg: AYBFou2wUboozC6402p7kslvyQrn3RXY3LtSHBjUf9Hn6md0LHLReg0z7ISskkcALIc
	dqbLVrn/hX0XBG6EA2KU34Zv5I6wiGN85GIAQ199E+z54/Ej4e1S+ZjYFmDQQQVL/qIqr1o/KlT
	/Jmmg56OfLx3eBiEtMQes2zugrxlBV1UqHbk+ZBfpfpmU3lz8k62HC0aOIv0rmlwWcZMXtiyBtC
	R+RAzjxeJPdDXSzGYhTPlFhcPl7jdjul1qc1VwxXv2NGfXWf7Dy4LLJMm+DRS1ypXEg03MEq65H
	YnbHdjsW5dNOu5NqMIGC+SfjzoUIYTcSDqN/G2vDZyJ6LtVGWANGzwVMTtdPR8sZ5o/RJB8Dzr6
	lo+tT8Rqmkrefc3ibODcsTkG1QefGCpdp4ZDTjL/TZYaqVd2rNRFaszBeyWtTiPGfap77sI9m8d
	oU7LhNR34qrQHp
X-Received: by 2002:a05:620a:bc4:b0:93e:c12c:fbcd with SMTP id af79cd13be357-93f29dce8f8mr1810483585a.73.1792491047334;
        Tue, 20 Oct 2026 03:10:47 -0700 (PDT)
X-Received: by 2002:a05:620a:bc4:b0:93e:c12c:fbcd with SMTP id af79cd13be357-93f29dce8f8mr1810478785a.73.1792491046763;
        Tue, 20 Oct 2026 03:10:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be4a3fceafsm2479209e87.4.2026.10.20.03.10.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 03:10:43 -0700 (PDT)
Date: Tue, 20 Oct 2026 13:10:39 +0300
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
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Christopher Obbard <chris.obbard@oss.qualcomm.com>
Subject: Re: [PATCH 05/10] clk: qcom: cpu-8996: move off the ACD leg while
 the PLL speeds up
Message-ID: <iqwdlpjvsilp2zwvp4kljoc4txwaw6h6ndz42hgvakfcgc4lqo@ajr7xrkiwmle>
References: <20261019-msm8998-fix-clocks-v1-0-370949e4d8a0@oss.qualcomm.com>
 <20261019-msm8998-fix-clocks-v1-5-370949e4d8a0@oss.qualcomm.com>
 <c3ac769f-59be-408a-81c8-9d6a2693d3f2@oss.qualcomm.com>
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
In-Reply-To: <c3ac769f-59be-408a-81c8-9d6a2693d3f2@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=DrrDa2/+ c=1 sm=1 tr=0 ts=6ad73e28 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=et-XlBO-5GXiIU7lIcEA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA0MCBTYWx0ZWRfXxAjRBqlguRS7
 KQ59d0H5joDxOHVxP3ggkqfnk7yWUs27z2zFJ82AjsAd59FY5CKJM5xmYg9zYYjt5nRxE+b5Mjl
 yk5WLXso3Pb6M8cqEvPWBwtk4iMGBI1nWqrMtiO5kQxQ/tUKbRwpFHXN4JqqngBVQB3EQGVWFNC
 tY8Rr+xEitg+FbK5fsvcJo5QcCB9hx9CSxgp6g5OHwVPWv451MLGM6wQ0771Wzt2/3Lps0Hr2hQ
 +saF3MHuZpddAFksWYwPoAjhbYkp0hJT1mxEEi3GNsIZeX+VSAjfXBuapTp3WhzVgKDK9rXVrsL
 Lj1OXuy7tGtYiUX3QVKOlTaU7G6a5tQxoE1m7rjXhxLPWUdT+d2kPr9rs3eHFeEX+OTiopEnd28
 vytQbsM5ErP8Ou3mOhyXY8sq+l5NjD9ZRQnBHUXBPUHsnMPWARF6enRDto5+E8vhMv/8Aq8PkK1
 jR3ez7DAXRtk3VcdBMQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA0MCBTYWx0ZWRfX1BB8BM9BaZoU
 fETLsoF5tjFC/bxcGs9TwRM7YMOgjfAHeVZQDulbkx2LYujlvU2vo2DtlUYJSt2TcHyLjxFuLpW
 ntD96AzTEId2HpO7/tFXQbng4w2/R9w=
X-Proofpoint-GUID: 4hlJ6AfuibapqWHVhbBrZy6_Bd_JaFfV
X-Proofpoint-ORIG-GUID: 4hlJ6AfuibapqWHVhbBrZy6_Bd_JaFfV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 spamscore=0 adultscore=0
 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200040

On Tue, Oct 20, 2026 at 08:52:49AM +0200, Konrad Dybcio wrote:
> On 10/19/26 3:41 PM, Dmitry Baryshkov wrote:
> > The MSM8996 CPU clusters sometimes run at half the rate they report
> > after going up between two frequencies above 600 MHz, and stay there
> > until the cluster drops below 600 MHz. The PLL, the muxes and the rest
> > of the cluster clock registers are all as expected: it is the ACD that
> > latches at half the rate when the PLL is reprogrammed to a higher rate
> > underneath it, and selecting the ACD leg again clears it. The driver
> > only moves off the ACD leg when going below 600 MHz.
> > 
> > Like the vendor kernel, run from PLL/2 while the PLL goes up and return
> > to the ACD leg afterwards. Point the SMUX at PLL/2 at probe time instead
> > of XO, so that the cluster does not drop to 19.2 MHz on the first such
> > switch.
> > 
> > Fixes: 03e342dc45c9 ("clk: qcom: Add CPU clock driver for msm8996")
> > Reported-by: Christopher Obbard <christopher.obbard@linaro.org>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> 
> LLM has the following comments:
> 
> For old rates above 1190.4 MHz the SMUX output is old/2, which
> exceeds MAX_PLL_MAIN_FREQ (595.2 MHz). Downstream does not do this.
> clock-cpu-8996.c acd_safe_freq() returns freq/2 only up to
> 1190.4 MHz and MAX_PLL_MAIN_FREQ above that, and pre_set_rate()
> retunes the PLL to that value before the increase. The comment there
> says the main output is what keeps voltage constraints satisfied,
> which implies a 595.2 MHz limit on that output.

The 595.2 MHz isn't a hardware limit. It's the rate at which it is
possible to start using non-divided PLL output.

> 
> Up to 1190.4 MHz the two approaches are equivalent: both move the
> cluster off the ACD leg and run it from the non-ACD path at half the
> old rate. Above that they diverge.
> 
> Either clamp the SMUX choice to match acd_safe_freq(), or explain why
> old/2 is safe above 1190.4 MHz. The second needs the hardware limit
> for the non-ACD output, which is not in the patch or the cover letter.

Downstream isn't keeping the main output below 1190.4 either. After
pre_set_rate(), cpu_clk_8996_set_rate() asks the HF mux for the target
rate, which makes mux_set_rate() set the PLL rate and then switch the mux.
So the main output follows the PLL up to new/2, e.g. 1075.2 MHz on the
way to 2150.4 MHz, on every increase above 1190.4 MHz.

The main difference is where the cluster waits before the PLL moves: downstream
first lowers the PLL to 1190.4 MHz and parks the output at 595.2 MHz, while
this patch parks it at old/2. Both are lower than the target rate. Following
the downstream approach would mean reprogramming the PLL from inside the pmux
notifier while CCF is changing the rate of the same tree, which feels incorrect
to me. Also it wouldn't lower the peak.

-- 
With best wishes
Dmitry
