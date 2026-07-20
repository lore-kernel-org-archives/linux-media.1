Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F31B439349
	for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 22:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784584871; cv=none; b=q5R4oOIUccTjA4VSDGeMH6Gq/ersVdAPDon0xdEQU4rJwi+hQXWGzs+3V46tNMYbeVXr1dJg6P4q5IhPtOM23BijXtsegmfgNw0R7oqx7N9w8fs8KHpohUURt+MpDeSamDAI0qWlkBedPIy2BkOoBpRCKqt4cdQQGeueH5DEH/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784584871; c=relaxed/simple;
	bh=nXYn4tA/GAdByxO836CB5rzbiFWKaDtYily2blwiFNA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mNV7GCPp+fdKvq/cM0a5M5Q5V41LfRU5jfIHqHinofdJHMUzyvmF7soIISGO/C0U04tNL/gyyO1/5SoxfQb/Dz3abZY2yuA6MG4qXHt2PRf2zB0cBqHS7uyeCcZacEg4t6IpyOk+eiOHCG3lzQeH/oNNXZUc7fdclCMMqfuzGhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mssAy0/i; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VXIbdrR3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mssAy0/i";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VXIbdrR3"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KJTmGX3106828
	for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 22:01:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Quf25WWyBMlHRX3MWi/eB+cE6gRpot0aHn286hMxyPc=; b=mssAy0/i/mniwKDq
	+Njx8gTueVtyls0hVI3jMYexs/vk2/drSuGfrv/o68xrx8/lerR0kM1HpVJc5m1b
	z34nCIX1c3NeIgxyQE/7H6rQCChXRcsNWgAqQHjG5kDQib1Xc6DAOf7fWDvmZvPm
	J8zLbchUqo8Wuk8i7oktlzSFHvM2Fvd5AVGCuEHY0NGjGFDBe1+sUEgxhtVv5imE
	swvkg5h83HUeSZw7Sgy0KP/mOSIQ0bzIzwu/DBzwysiQbrUXOYv32YLUFrW6fZ5t
	SjMsBvjs7wpJb/bMh49yhxrzu4YBF87D2K0uHiQ0yXXsRdxcduzAU1MXng5ubD/C
	tDA+xA==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhgs53880-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 22:01:09 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5bfc6b860a9so3396643e0c.2
        for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 15:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784584868; x=1785189668; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Quf25WWyBMlHRX3MWi/eB+cE6gRpot0aHn286hMxyPc=;
        b=VXIbdrR3OHYb83r8fXwiLAcFzTW5jpi+hyEecwrNODaupo73AL20Qm/0RwXZCNqCLB
         pDxTPsEdh7KShIHDCleBZpEGSrcTMWMGPQZq/FkRpRcH7OWbg40z1qERWUPVrsHvS3w+
         w7GMi2R2oSv/c9ZNVRyINmNRD8ojfNl8PN1OEXh2lMXvM1B73mZxNn2l6Y+dWeUCHxC6
         v2axrRveEoH7sxqpWyYTlnp7ET1rXxy6r1wxmIgRyBIhwpV3cyFoBAWjCxTgDrX2UlRo
         9ooOwAsQ1JZwJ1+JWOpUgwByyKx/BRZ5nJZuh4ax1WIQ684YvCbJbpBueSiTQjO6QUJw
         YIQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784584868; x=1785189668;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Quf25WWyBMlHRX3MWi/eB+cE6gRpot0aHn286hMxyPc=;
        b=Qjev4mPVNfqc5U31pEWXqSQUqOXVt0qGJcdO4vQxfU3m4fAnT5iW4144fwbw/EEfzm
         E4M+vQDwhWVSAxPQCD1iLVQNenLcE4yqza6lxZf3ea5gtOOnPadyewOPfffB+acI0P2I
         27eeCHY5WnTQteOoSkturNoI/jbJjBqErJ4V2ucDGypEH+vqn0lMCrZ3CU4MhmR7aqlG
         mm1apHzqAmZ/X2pgZxQnvkMc7dsJozVWsiHT3keUXkNhYwO1wPEcXfBROLQueZ78EAna
         HxdAt4SpBWHTPmJrnVrFtRgbLTx//TyNHBbYLjKeNRFqbxDm3uq0xsvlIzcp59Lz4qMD
         +FAQ==
X-Forwarded-Encrypted: i=1; AHgh+RpbWMgHyHq9Utr4ZZlaTvo7/WhojUbFUDLQicAzZlOm2TidIcyv2B3jViTiCeBcsMoXcYYefYJaAqpsjQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyPJo4jRsdPfZZ7rwbKAqHgQHQz/V3WzDh6ax7ujNhiKSdWRbq9
	9CnM5AoFIZC+TVS6c6q1wda5pBO+QZiWN1COF0a9srjdnsk4HnzH+gjTc05G2gftUjW0XchFtJP
	euy7AAK+PiET8/8wneq7qRClr87nkVZz8T27y3pVcHKxnEHwSwTaVrKRV4YnkjmnK0w==
X-Gm-Gg: AfdE7cnkEyTqh8KKwEAqBK5Ner5KalR35UyXtDZNHkQfns175GLFfqXmJBzswaTRdP3
	l+gEA4RoLHMZy9GvhtZYjlbCUba6MCY9DGEzOlMya/UVVEgB6BPHnYyn4vc8DXYXxyPIlW0rhRT
	yZxWk/phd42OyQ1YDCdPhHrzwuDYcIDvswOZQ8Ugbdq+g0n7tg82ZOZM7hCrswm/APemIZfWk/v
	TjcYIC6CUv7TFC435p20wQvDhN0c71UBUGJ/G7hOszD2mmfyCEOEn4wBSP5ljbB01KuGAfiSFmi
	u9fTIQE0p9LYsql/KaFKY2TYrApsHV/PdqzzJCx55e4vNyrV9CQl3OdpqRpmKhSK1DQ+mmH1Czf
	H2YP/8gceFHBR/xP7vUCxPXrfJRDKRdHPGvx9AXY+hAz/MRi5S9l2LEeONzxZnAkBsNch1f2S+z
	5pOR4RgnCGCUR0VA==
X-Received: by 2002:a05:6102:2928:b0:737:1ca6:84d1 with SMTP id ada2fe7eead31-7475371037bmr4225662137.24.1784584868271;
        Mon, 20 Jul 2026 15:01:08 -0700 (PDT)
X-Received: by 2002:a05:6102:2928:b0:737:1ca6:84d1 with SMTP id ada2fe7eead31-7475371037bmr4225635137.24.1784584867709;
        Mon, 20 Jul 2026 15:01:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a24737cdsm316213e87.77.2026.07.20.15.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 15:01:06 -0700 (PDT)
Date: Tue, 21 Jul 2026 01:01:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kirill Ermolitskiy <00vopoj00@gmail.com>
Cc: Bryan O'Donoghue <bod@kernel.org>, linux-media@vger.kernel.org,
        vikash.garodia@oss.qualcomm.com, dikshita.agarwal@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org
Subject: Re: venus: encoder job execution hard-resets SoC on =?utf-8?Q?SM7?=
 =?utf-8?Q?325_=28sc7280-compatible=29_?= =?utf-8?B?4oCU?= extensive
 analysis, need wrapper/GDSC insight
Message-ID: <zfcbexld5clt6rrvlhfgtjztxus26vwsbceslye4gsb2gopdvz@f67onnyhpskr>
References: <CADRRrN12FvS3v3c3on69XLErB9i8ih=LgJOGaKhYYT7KrZKe2g@mail.gmail.com>
 <035192d8-9d6e-4e04-ad1b-56f52c11933d@kernel.org>
 <b6rUao5eYcEHwZ_P1JyyUjJUtwY-yJnWVfxHUa9sHdWOmlMoXSLxjMoscSmOu0V5VkwrO7q4TnNzRvoFP5RpLg==@protonmail.internalid>
 <CADRRrN23tWrKKnPDdsO_61QQd790z2W+2ejZ-s1iZkJh+=oHhw@mail.gmail.com>
 <f4041aba-ccbb-4126-a65b-a385e882949e@kernel.org>
 <36vhfeWCV4PqtDGfEur9lR9MVGp1d_CMjIb_Wr9zTFbeNM9QPzCJsn1TzyTYnZfbku-iwBZo-eDdLasYJ5hE5Q==@protonmail.internalid>
 <CADRRrN35SjSPqYH+kUowf3RCcKgnGqVQAKTd73vqMLgdz1q5AQ@mail.gmail.com>
 <1bc74fac-859b-46fd-91ef-16c40c8f9a7f@kernel.org>
 <CADRRrN36-iWMdOBxDHKjV_SCs2U7jH6YwJO4ycTe5_w-2QTTyw@mail.gmail.com>
 <CADRRrN25w3Tgnnoi7FD3U69gVyf9COO_m+k9rdX9GOcb6asm6g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADRRrN25w3Tgnnoi7FD3U69gVyf9COO_m+k9rdX9GOcb6asm6g@mail.gmail.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDIzNyBTYWx0ZWRfXx1NIRra8chzE
 w5dyC7noUpJVdkjxUlhYCfC53baRN/a28vYH1qNKQkBg9FH/mHKEYgzS18v46CGiX2qYKc68oV6
 f3wvkTg8VsKV6WkIhjZZ8YNqGmcYSbY=
X-Proofpoint-GUID: wo9dJVdO83P1YPMDPyopv0rNYR4VMUDP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDIzNyBTYWx0ZWRfX5zt3GFFh1kgg
 4XZKF2Jr/pOQ17nXz0u5J2hcnTlgghNPOWEQwPIQ4A7CfXid6x9AA4wkcBy/YB6clZ+1u1FkaD+
 4z4SDeyrGC2kdR5MARhlg8NLeuA60cgguFAuTO92Oa0j2vc7SOq9hU4tjUK0ixSWOAiMwrGjqfx
 NOepfMENI7vwmHkxYMpxFyoYGi2fkvuOixdwnUhpX6C5RSBiYY08xmju6OETj33H8BENrKcw+S0
 SKgISPJo/VMrqJoE5vJaE7xWdbH2x/8njGcLgm1DEoVFTQXFdEfZ9/lDDPra1PbnBZkylSIefXa
 CL/4+Y88fAIy/UArBQEW2zUnxMXJdBJoeNE5WupYbUTiKdvgobjWbllgLXDCIBPRARK5Q2sZ3N8
 qevo12OppPa9HxCJef7lHDpky997UaYOorLMcf0ywI1qx2xlI2pgNeTqexMzGynwoG3onEuv+17
 37ADselEAq+sGWpYQzg==
X-Authority-Analysis: v=2.4 cv=CpiPtH4D c=1 sm=1 tr=0 ts=6a5e9aa5 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=5KLPUuaC_9wA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=zbWqsRPLY0wYEQuEYD4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zgiPjhLxNE0A:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-ORIG-GUID: wo9dJVdO83P1YPMDPyopv0rNYR4VMUDP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_05,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015
 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200237

On Tue, Jul 21, 2026 at 01:48:17AM +0400, Kirill Ermolitskiy wrote:
> Re-verified with iris (CONFIG_VIDEO_QCOM_IRIS, venus disabled; ffmpeg
> confirms 'iris_driver' on card 'Iris Encoder'), this time with all
> current fixes in place — the IOVA reservations and video_cc_xo_clk apply
> regardless of driver since they live in DT/videocc. Identical result:
> silent PSHOLD reset at the first encode frame.
> 
> So that's now confirmed twice across both drivers, with and without the
> accumulated fixes. Decode works fine on both; only encode execution is
> fatal. Ready to test whatever you'd like to try next once you've had a
> go on 8250.

This sounds like the issue which was hit on the QCM2290 because of the
lack of secure context support...

-- 
With best wishes
Dmitry
