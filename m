Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BCD144E66F
	for <linux-media@vger.kernel.org>; Thu,  6 Aug 2026 11:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786014861; cv=none; b=t69nD7d/2Wn9ESU4jv13y6KsYLo1r9+6f/2tZ0PEtVRq6jljGq9pGKEDaiOEg3pJPOIn6OF7Ddk3WJ9ln0CEJGvKfZbR/N0GCdeUJ0PUyrg2TuuPCiJP4qDsIBOrjE0gM/CyIJM/k0662iBfXQvMlpLugMHOjiDv0qMQXl6hFEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786014861; c=relaxed/simple;
	bh=j7XXgsxDLgXqCy81RbmQByuS9M4pI41X2e7HACAMHAM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BZ3uBrwVcdi6xKJCGfmKf5w3tzG4LvZJ4X2sqQlGOBbmZTATZURAFJuA35+ZrNM0KrrBgLCoVUsX4n92qvMBzZ7pxkctWAgz/s+7e3JQa4rJz5yuuZgTqMCwgXNJF8S1D9YVZWU2hrksDhIALfKXi6scPSQbrjLaqsjMNE+YP/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XcHoUKs/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ePzvH37v; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XcHoUKs/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ePzvH37v"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769ndPs1578698
	for <linux-media@vger.kernel.org>; Thu, 6 Aug 2026 11:14:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yw9j1qGl6NArU1efc9s8bFcu
	JKH5i25QV+0n7McKYVo=; b=XcHoUKs/veUguy07LVFalVzgLdkihV3soJcu7cgr
	9CHG2CkHAYAxVfr0MljVut/Dqlzon4yJvf0UFxySpWWg4h2KmHF5P1i/Y8xD4rFX
	fbYkD34Glww7WIOnGeLu/YvQNQcw/9Csj/qFh5oQJpmN0nZhDfGtANPtMt5+fzaV
	MOaYhnVhKP+EnMtSqF6sJ+EbUZbM8x0EzcEttbB72/f5WcCs/Lt3SkwsxELmZv/j
	++NeJ64p22LVVTYKkuYoTx/eRU0MacPkJal57aMN2ioUPhbNWlk3qbYlrkgRTiUD
	fhop9LmdvNrs+b1Zo9Mk9e4UWWTnaifvHS8GFtdTAUApDw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvju8hthx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 06 Aug 2026 11:14:16 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5283fa0656dso10749141cf.1
        for <linux-media@vger.kernel.org>; Thu, 06 Aug 2026 04:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786014855; x=1786619655; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yw9j1qGl6NArU1efc9s8bFcuJKH5i25QV+0n7McKYVo=;
        b=ePzvH37vWQb9zYoTdSvlatXqQfYW0+ZTd1qab25c8Oxnj1aaS1sDPkGfI8+jkni8To
         WQFtTKWFYBee1c0/2j82cEAEw9zAdl0qIG21l03LU8zqyqFOFwRaTSBXvtDRWHJTEQvx
         nzKMXX5hQ5YD7H/n7NlmZvVSvalHEfO9VxLfm8JV+t348OFvGNMXzyxMzM4L0sS5QWWF
         nzMlzg33DHPzNQSU9Ntl5mlEbDCcE+6HVco+zjaNbOsV3fJF7D106Zj7oR6j5EMMziZ7
         4GR3Jwcflg9W2A33+u+6cBnNEnTPSGY31ilRMnvFpEwKd+QwNADgkKVV83zagLFz6YWi
         MmFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786014855; x=1786619655;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yw9j1qGl6NArU1efc9s8bFcuJKH5i25QV+0n7McKYVo=;
        b=VH9SBKpCtSwDjZtN4s1OtEe8gdg8BmIEHF5tG845OKf2Pg5Sm5zdVkTUXGjmg5+nOB
         JgpYQEd801V8REOeuFQpCRsw0ruek+4DxrYdjwV0/XaTn4XUBZXHIEoPybezoxzcsLvk
         fVwtT/zZfdKc9RBmerbwYnyzSFdwJHI5SZP8oQe6nMxt1YQcQhIhIRQsIhz4ApCTxtU1
         /nV/XGJA+25SSJZXu4anih7wbijs7u4/erskqfbLoA6je5YeCeslR1eg14DqkkjU+bkV
         PbG4hU7EoIWJMW8COJsVp7NipnXVOpDSfjuusFzCfbfoeDqVN8E9pt2NIdjwPc7OdUIG
         hitg==
X-Forwarded-Encrypted: i=1; AHgh+RpcvTeJ42byY+ZYCbB5yRUQDD5lZhYpBw+iavve/C5uBBBHEv9cv0mjp5/jrScSpHxV0Fd1fZQeX0ynbw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwiFqUtzx93FD/y8JTmG6ALE9YtFwC7TPFPT07Pr5p+Y7Uvs6oL
	QdbSqpBy9PP7BWilYrxTkBwxQpqpW5nM/ZYtJ2W8yQvh6ogzIvpZ4tf0T23W2MV+Cqkz1uMtQSv
	QQjuuHBDyq0Xo6V55LJFhjXEPRtYtUSFOThyKiUIlY+CsnMFdPc5+5kP8YqN5D/qhiw==
X-Gm-Gg: AR+sD11in4PWuammcPh/Z8MSMg39MZwQjcPpILL4hNKf4MPgsCSYi4WnfUmR9eVgGE/
	cdRCEXNbbLFB57VFtq90CnP6+y1cfcLsSwEP9zCzKFEsQ1K7VdEm451bEGetTyOqf0hDxswy8r9
	RzRkxID4BSpvR31Dcn/nEZk2vHlzXkuYUWA5Uiw88XLMNR4JFrtbFdKM+RlT0N9QKKF85pw4qCp
	lp6CugNZlpE/2qaOBes2IEBvITbxWsssU8j8gjIcea9fIvB37hma95G9a1p5YUwUbqmcAFvTQSm
	Z1Ij4MWiJ9OPsg0ONA2erXSkiKeR6ELASo519EqWIcwvUf55scTSY1NHCrse7WnWteStL0s5Bx3
	i0vo4SOZqjK3XRqcArTH3z5bvyyccxQL0803U32UCk3l9Vq6j4iFEl4FnpDgtqzOr6P1Ew+zzdJ
	JgHtFNloM0EQShrg==
X-Received: by 2002:a05:622a:598b:b0:528:38b1:b550 with SMTP id d75a77b69052e-52cfb04984bmr65695401cf.16.1786014855350;
        Thu, 06 Aug 2026 04:14:15 -0700 (PDT)
X-Received: by 2002:a05:622a:598b:b0:528:38b1:b550 with SMTP id d75a77b69052e-52cfb04984bmr65692081cf.16.1786014854896;
        Thu, 06 Aug 2026 04:14:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2f62c92d3sm676901e87.79.2026.08.06.04.14.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 04:14:13 -0700 (PDT)
Date: Thu, 6 Aug 2026 14:14:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, stable@vger.kernel.org,
        Daniel J Blueman <daniel@quora.org>
Subject: Re: [PATCH v2 01/12] dt-bindings: media: qcom,venus: Add context
 bank subnodes to common schema
Message-ID: <nht5phhqatbc35rh4l4r5lbf5bytgb2zmesv433zjscs5ye7rs@6y4bczl23nao>
References: <d6ffacaf-7f83-42be-a3cf-40ce00810ca9@linaro.org>
 <Ia82wa4IJDPkQZpTCt4MDMqtq1VGZ7DqIaJFNvV0MjaT3jjWrbD_iBs8RU7pqrIz-ZTMSK2irncUv7-PZ-fvkg==@protonmail.internalid>
 <8130900b-c9f2-4f5a-80f1-1e8567ee1b72@oss.qualcomm.com>
 <f252d83f-e0e7-4061-8da8-d2650f1beadf@kernel.org>
 <ea0f1777-4615-415c-86d2-2a792ea42b3e@linaro.org>
 <41163185-09e8-47b5-9ece-c6503cb48920@kernel.org>
 <72b267c5-6490-453a-9900-b196d1cfc5f8@linaro.org>
 <2tWmEJ8s0nm8efbgvq24Zwo1vkuH4Na_gC6stCr9_O1A9k9JcA2-TFN5qziPoORYrCKyDgjscvGyO64HI6qVqQ==@protonmail.internalid>
 <72b4edc0-dc80-484d-a2b0-88ea11ae001e@kernel.org>
 <995779b4-925a-48a1-9288-930e0a10b7c5@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <995779b4-925a-48a1-9288-930e0a10b7c5@kernel.org>
X-Proofpoint-GUID: O8zV9RCS8jT2j27FllnsmoyK4SBDvgLH
X-Proofpoint-ORIG-GUID: O8zV9RCS8jT2j27FllnsmoyK4SBDvgLH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA4OCBTYWx0ZWRfX0M8nzEQiPZha
 EbhLJtsrYwLwt8P1X5JIE5vWvgGcgu+dhuEH/ftyFlXypfRvL2G7niz4LI3x5SuLBywcaNNwvOX
 1w7YKiKGPt7Tiwzk+zfvwYKYPGahParf9vMaSilvMd2IEGCWG7QW+oRGA/krhPfKhUlf8wCr2Qi
 9+bSmHdhZOcgBiCyEBlgTD3Ni3l+IX74i4ArQ1LB9DvKsi2yybzn0M+HTUGxCgaUVCcfjNfoaSx
 U1joyaATTQAxAMjkndLLaBGRoymspkwr0DHFqwh2L7SICNXcuPdBCFP3B40aehebB9i6hFPG55m
 GSVHf1egC+NGy3sUgqdF4XBoo4uzu72Rz3EJ9BjXa3cnyj0O0Lnl2F+lKhjAS+9sFrAQxbdqZJe
 /9KiJNArXRsD/QJ+0RLoRFw2x6X14MOLLgHvvg5dT7moaVLItaLRpVAggMzz2NJeXDdl+KjJDvu
 /dISzyqJgXnhTb8lEMA==
X-Authority-Analysis: v=2.4 cv=K5cS2SWI c=1 sm=1 tr=0 ts=6a746c88 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=tw2GxrdeZerpTHTxB70A:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA4OCBTYWx0ZWRfX7mdXTnLAiEyT
 pnOMCjhjBiVCTI4Bo9uxmOGIJlwaxxjXp6mDI4Fg9rmeT+RVFCd2mveaYQMPAd8d9S9C5YAnIXl
 Qaeh9GIYwBNxAx880g5uaYLAHqTes14=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060088

On Thu, Aug 06, 2026 at 11:50:01AM +0100, Bryan O'Donoghue wrote:
> On 06/08/2026 11:32, Krzysztof Kozlowski wrote:
> > > Yes -master.
> > > 
> > > My issue is how long this will take. Several kernel cycles and the
> > > debate is ongoing.
> > > 
> > > Daneil's fix has not been applied which means the replicable system bug
> > > is out there in the wild, not addressed.
> > > 
> > > Daniel's fix could have been applied and rolled out to all users in
> > > mainline and consequently stable.
> > > 
> > > Instead another architectural level fix is still under discussion, which
> > > is of no value to end users whose systems can reset in the meantime.
> > > 
> > > Its just not responsible behaviour. So I feel both of these drivers need
> > > to be marked as BROKEN unless/until a fix lands.
> > > 
> > > I'm hoping the vidc team will come up with something else.
> > I did not object taking a known fix for the problem for the mainline
> > kernel, regardless if the fix is optimal or not. I only objected the
> > reason of taking patches because of something in stable kernels or
> > making backports easier or whatever other semi-expressed reason, which
> > is not the mainline-kernel reason.
> > 
> > Best regards,
> > Krzysztof
> 
> I'm all in favour of rolling out Daniel's fix.

The biggest problem with it is that it looks like a hotfix or a hack
rather than a proper description / solution. From this PoV we will land
the fixes for all the boards in mainline and then fix the same issue
_again_.

> I don't want to propose BROKEN but at the same time the timeline on this
> demands action:

I think this might be a solution, which everybody dislikes, but in the
end it is true (for both drivers).

> - Sub-nodes proposed around December ?
>   Which means the system resetting bug was known
>   and understood but not promoted as a bug requiring
>   resolution as it should have been.
> 
>   Fine people make mistakes, that's life, lessons learned.
> 
> - Daniel's fix posted.
>   Not endorsed or rolled out. Its not "perfect" but
>   it is certainly "good enough".
> 
> - Now more debate on sub-nodes
>   I'm all in favour of that but NOT at the expense
>   of replicable bugs from real users.
> 
> TBH, when I start to lay out the timeline on this, I get annoyed. It seems
> to me qcom has understood this bug for nearly six months more ? and mainline
> is still waiting on a resolution.
> 
> So I'll leave it up to the vidc people to decide. But some kind of deadline
> needs to be put on this.
> 
> Close of business GMT Friday - either something mergable lands for sub-nodes
> or we replicate Daniel's fix to all platforms. Failing both, I will have no
> choice but to set both drivers to BROKEN.
> 
> Stability has to come first.
> 
> ---
> bod

-- 
With best wishes
Dmitry
