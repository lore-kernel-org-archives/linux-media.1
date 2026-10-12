Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF3DB4D5A1
	for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 01:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791768359; cv=none; b=aCo5z9lUGt3c4sTk1VdXltN3Qf0waQuFTzWk3gYHiMnwUb40OtLSl+EKN25xiKWqvPz1fad+WZcdlvLRlB9Deku7f+VtTMqe3R9uKIHOs+1vyfiRjTgKzq5etLFFPaUGR3a9L+gbU3zVnZ+Dn+WxejVOscXCHqbIMhCcFn4AKbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791768359; c=relaxed/simple;
	bh=WcXPQx7tMGheRDfYV1c8+KKHPrQsEAxtPxGqErtQJPA=;
	h=Message-ID:Date:MIME-Version:From:To:Subject:References:
	 In-Reply-To:Content-Type; b=LAOcGTVDWVktxBb28HC28saSD854dV8iys5V/2rFcofIS5Xyg7hgs3Pu0rnYd3Mxag1UKdItIIxb8WbKHUhIu7hrZjWely9nAY5a3kXpOTby2/tG5sybP6VC5FaWEZKtKCspfoBdaqqSWHhay2in4hOy7ED1hJ1GXYzMW/objvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ef2doeZT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SbmGox1E; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ef2doeZT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SbmGox1E"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69BMV944921344
	for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 01:25:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+SEuxb14RGNKNzw6OwUej2/dkzCU8mOD1TxdNQEWpLI=; b=Ef2doeZT40tKHpf/
	gJ/AkFWnxyGdnVyMQA26UdzIFPCrlJ16TSSKJW8ShUPfKFtlqVwfMQehhlHxpa3b
	f9ffnFbqpBfQb5kesV0FFIwwQiCuY/awgnDdmSzuJ/7TuAKssJzhfB082f+BLlA1
	AHqK/W1IL6z4nX/bAhg7W/wbRrzNOt1K1kVfBYY1Ks4mVZuvOel9AG4fzFQzXTyB
	Z5/YeHFA+azU6JJkntqaCjIUtkQj165Q//c3LjEyzs2c9IJkn0X6mtYGNzLoslxU
	vSBBV5oYTAEpDgQp7ae3ppmfbjZwX1g5+BYB2M7HFl6qDNC6Fy+Z2RSsGIZkgmRh
	HYItdg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7cc6ccxg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 01:25:56 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc1a439db36so945582a12.2
        for <linux-media@vger.kernel.org>; Sun, 11 Oct 2026 18:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791768356; x=1792373156; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:references
         :subject:to:from:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+SEuxb14RGNKNzw6OwUej2/dkzCU8mOD1TxdNQEWpLI=;
        b=SbmGox1ENuMamfySzkpN36x9L9pubrSbLkRS7Hg7ZHX1CUEwX1D/P9oOJMnkS3wCAw
         jzxCIiaGF79lfiMtTCCP2EM2C9S3bAnlyTJFItuC7q1Bw5mEVg1igDNEkATRU6rpoI/Q
         CBU7ktpEzVI03wakKJTdT6NFG0II2j0v8ZBrCFvhxVrzf5Ar23Ko/HL4nZaS+KbT2qHo
         MAgRi/UQbathWIyJKxTijJ/5qVPxXq1cPWaowNJonObkCZKA2YFPtuPh489HpZMSny62
         dgOn/hbqCT0f2epaegRbgISnnXDcm3E/SVTTuvD5z7/g+U3uQ+gXm4+c47RNOQ9K4RmF
         0V3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791768356; x=1792373156;
        h=content-transfer-encoding:content-type:in-reply-to:references
         :subject:to:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+SEuxb14RGNKNzw6OwUej2/dkzCU8mOD1TxdNQEWpLI=;
        b=etOjzZUpCJSE2hsOCjZ0NFTkO7cVzTaR8WTy23HN2eHEgnGYamedC+fes5SQHOEh+Y
         QSXa0+l1bLgmJOccTJlUfC6To5S6Lsu2OWlE9thUWSu1I9IlxUYqz1/nY3BVEn5ckZ4K
         If91oA7DN41E7ZatsajnOTpLz6T0rccj/Jp1SzXLQn0iw3HhfVJUXER2Vdxdiy8oPyqv
         hFK/VrmAlFdCwF7RGmy0dYrDeAsKUj9FoDv3jFfQxygOYmx31lWEmLXraDk9V2vOjy03
         dG+eXLgUkN2Imrj8r88ZO/ApkxleULUTmhgv558XCUFZCxwuanxWKNwmG48xJuRegpST
         d72g==
X-Forwarded-Encrypted: i=1; AKwUvByAbIoQJp2HUsq5qcYi+40AAIS37r08egg8DFGUGMNNLJlSz1M8bIRB2R/mUWglsQlxLo98bTfhgUeQpQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYIA/7cwla8htVmpffADjMu75dchqaM2CO/Er7hy44a//bOco+9+
	u2IQyK2GizdddEve277hMXPmS5sKrVwzCTYSZugib7W7AEx3a+oN3Z06GiWITmu2CsGsNnHezIZ
	ii7bpDEiiLpnTCzrYoz6YsGfr+MyDTdKr+4VWtVJ0cLvL5z3MdDQX57vvtIWVMWqFnQ==
X-Gm-Gg: AYBFou2+Sb2vQ+z2yavAp/rufaPv2UxogdBwaV+mFOK2BnLZoVoClljpkACaWlpZQ7H
	17pcn32Y59/Ia5Tq25b7ACr/XCh853Jdbwov88T4cFB59l6CIzy1MBgAClUAbsVBilAwc3H164i
	dTayro6d9PhkcuVRvXF6RMWQdjLtjkdE2brGyYNn2MhZEcs3ReT/HEk876JX062KEztTHgXigW0
	ArRf5GfHU+U+Y2GhqoYBC75U0A23Nl3llWBx3c6LJLn6wujWGf7yYdppbyiZ2OAikW5Xf05d1Yv
	r/OFSOGkvcD8bq+/X4G1yyma22X5lRSLsInXzU3cwPL1bLGB9IDBs2cPEvqX2K4lUdY2Bjw8h/R
	8W9vGhy/vHjlxGBAjcKd4le9dGrYtFeIFKXaK45vBKTprMRszQ+YU0P8ojJU8iBI=
X-Received: by 2002:a05:6a20:4327:b0:3e1:4f30:fdd3 with SMTP id adf61e73a8af0-3e16c0b5110mr7383247637.66.1791768355520;
        Sun, 11 Oct 2026 18:25:55 -0700 (PDT)
X-Received: by 2002:a05:6a20:4327:b0:3e1:4f30:fdd3 with SMTP id adf61e73a8af0-3e16c0b5110mr7383226637.66.1791768355028;
        Sun, 11 Oct 2026 18:25:55 -0700 (PDT)
Received: from [192.168.1.6] ([117.143.161.217])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89928fd8469sm1622685b3a.61.2026.10.11.18.25.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Oct 2026 18:25:54 -0700 (PDT)
Message-ID: <5d4a3126-44c2-494a-938b-1887503c7a52@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 09:25:48 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: hangxiang.ma@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>
Subject: Re: [PATCH v20 08/13] media: qcom: camss: vfe: Add support for VFE
 1080
References: <20261010-kaanapali-camss-v20-0-63e98ce9ac0c@oss.qualcomm.com>
 <20261010-kaanapali-camss-v20-8-63e98ce9ac0c@oss.qualcomm.com>
 <a6e5dc34-c2e7-4a3c-a0e4-fb0a3a28cece@linaro.org>
In-Reply-To: <a6e5dc34-c2e7-4a3c-a0e4-fb0a3a28cece@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: jDC3Ne5qXomwrCuDMwqqkPLVEMXLulwk
X-Authority-Analysis: v=2.4 cv=XdQcX455 c=1 sm=1 tr=0 ts=6acc3724 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=K/RrOd38U9TixX+j9hIN8g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=KKAkSRfTAAAA:8 a=HmBDO3gPv43XiXRR4pAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAwNSBTYWx0ZWRfX1P+mnQmqBrSu
 FMtsY9uV0VZlAy5YuGlNF+87zjT3zkYfU8k9WPAsV4NaigPYCLmNMt5ikU0DPckNSJKggUlY4M2
 YqOt1ZGoiLtPgQ+OqixLqndw3j0lm+9ojPU/5B6u/hz7fX1rP7wSEr9Neh30BZ94YB665juPlmz
 a0DoNDdJ5/TpyiMX+pMro/KYONJYcw/nFhHVlPx8awt6H14wa+G1BU5fwH4JOA1gviTRu3H28k1
 acKSsMHCt0I38oYebfNe8B6MGoJx3PD0vkPN31qVcmK7UKhWdCi5mCSCbSAfgT5pGw07lcsNTVy
 QVApIo3YMPjO+mOlsrW7hnIWrQJzaoBOurAqPIqK2ydbcJvgBfXHXlf3h461Q4nM+FIJi+81d0b
 ik1sSz5Jkf0u7tqCOS8AIS4xgf7nbqhOJpoS8vojgkCYJ0RyOBoApXNzzU2g7Lpk5aP6RSILK/J
 pKydeMt80bqPPIVFifQ==
X-Proofpoint-ORIG-GUID: jDC3Ne5qXomwrCuDMwqqkPLVEMXLulwk
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAwNSBTYWx0ZWRfXxDoUTKlvDJ2U
 mLus4N2B8VkFLIBwlfdZnGm1B5mE1mBA9Z7fsixi72mIckXNk/5mAGpOygV/2aGNBxAS+/gm8Ny
 dMLOijUX0VOHk/IYtiv9nMTLLYLfvWw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-11_05,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120005

On 10/11/26 4:56 PM, Bryan O'Donoghue <bryan.odonoghue@linaro.org> wrote:
> On 10/10/2026 17:01, Hangxiang Ma wrote:
> > +        if (!vfe->res->reg_update_after_csid_config)
> > +            ops->reg_update(vfe, line->id);
> 
> So I'd prefer to have a discussion about if we can move all of the 
> updates to one method.
> 
> i.e. why should any of the updates happen before csid ?
> 
> Sure vfe 1080's documentation makes some sort of explicit statement 
> about an update that has been implied for some time.
> 
> My question is why not gate all of the updates this way and make this 
> not a flag but a global behaviour ?
> 
> ---
> bod
> 

Yes Bryan. That's a fair point.

The reason I introduced the flag is that on VFE 1080 the documentation explicitly states that the register update should happen after the CSID configuration and it really follows the guidance, while older generations appear to have relied on the previous ordering implicitly.

That said, I agree that if there is no functional requirement for some updates to happen before CSID configuration, having a single update path would be cleaner and easier to maintain. The flag was mainly intended to minimize behavior changes for existing targets until we have a better understanding of the dependency.

I'll take another look at the update sequence and check whether other older platforms can safely move to the same post-CSID update flow. My colleagues who have such resource maybe can help me on this.  I can remove the platform-specific flag entirely and make this the common behavior if that holds.

In this way, I think I need to raise a new series to collect changes among other CSID genN part and VFE framework part. Could I mark it as the dependency as this KNP series? Or functional dependency is enough? Thanks.

---
Best Regards,
Hangxiang
