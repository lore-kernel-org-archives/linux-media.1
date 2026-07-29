Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 299883803C8
	for <linux-media@vger.kernel.org>; Wed, 29 Jul 2026 11:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785322877; cv=none; b=IEp7obvaYYDG4EPKYdlg9Qxd2K1VtU4iQeUKGp5uAz0kd4JvoTkZk5iY3DMWE2kPrCizIaRCmYkFH2JH06OHwha+Gw1lahJbZ0Ck5zWdsMrFtbDAn/dAO+FfDWsd9Y9i2h/R72lMcPgWfVXF2/ZPQhdYDnm8nfph1ZFgo0Dn30M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785322877; c=relaxed/simple;
	bh=0LkBYfAZsJhifD4zPW/pw4O1lnq0kFjI4F2kXScG2Ww=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FXoyB/RYYmi5dfcpIbyDP29MEKt0bJRxBzE+73tERWI67GaNVEnatLv5/Z+BlW8woPTVLxdptnZZ9ozc+uiWw8b5sMQEAVcgEx5YvhClqi5T3ZBJrky4+h27RkmIaoEAnGTdUbIiMnYeUFCSo8YSc8IDP3L4IN8d0o9oa++EaZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NeYLVEjh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NGOjVwqs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NeYLVEjh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NGOjVwqs"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66T7f6Ff1088967
	for <linux-media@vger.kernel.org>; Wed, 29 Jul 2026 11:01:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0LkBYfAZsJhifD4zPW/pw4O1lnq0kFjI4F2kXScG2Ww=; b=NeYLVEjhcVvjgyC8
	Qw0yx1EgRkr5w7rXfko95cuXAe5ephuRwZkCDm5CZNbpDCgNbpLYU8ac1ayi/emu
	crLVhW3JkVFYOVH1xuRb8EL/3SkMeqtdRp5RZLrBrbKZdL6Lm0V/ocxWZY5sLiaE
	/HcZKarqMwB8i0tbvsh18Q4mXYYlD9JwMFnfosu5akSln6SeQ2TdHS87hOSbzSbN
	nZISupus4n3KpSnTCh6/Y1V728gPEamNNWfsR7rjJt88oW3UBGxGCkQ/B+c5X/yR
	is2p14iTAlVDjGRj0gC1mHqLeyAitRQNcyqj1HAKTZMseXDDDk5HtlqGZpEPuLYu
	7OE9jA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fq5sajfx5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 29 Jul 2026 11:01:15 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cb74d5db64eso868640a12.2
        for <linux-media@vger.kernel.org>; Wed, 29 Jul 2026 04:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785322874; x=1785927674; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0LkBYfAZsJhifD4zPW/pw4O1lnq0kFjI4F2kXScG2Ww=;
        b=NGOjVwqsWOdjofBYDeCYBJrsBdBoPJ5+3WXNYqQxIh7vfjgvwR0YdiAurShAxBMh0c
         GSt8fj82xhS722nPBCerCo/lrCaaAWmnaczJ0nIrrpweCEZdnVW+JYwyK8fhW07lmgz8
         V3YL9LgfWxIwy4otYTodHB08H+LzEEp6WVK1tZ70ivnqdt1kw2pDT1qQkgvoopypXvS0
         YH2sEw8vGwbJfckQ2LFs99T+Z1NpuNRzRZQUXyKZDsIY19rhZnyro/8vcy/nuEGiW+vY
         UtcA/lbMaIjqP87xBu4yN3waECEzZPNMFDu3F5l1tI/IAWhu0Ib02JeCspu/yNrbp2li
         DQWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785322874; x=1785927674;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0LkBYfAZsJhifD4zPW/pw4O1lnq0kFjI4F2kXScG2Ww=;
        b=D2G/dJNFOrCUYxAqp4jcqWZ/8XrSyowrbzRAGYCHLo4hcnR256hRt47e2prD9FDnrB
         P1SI1kPCUpetgr+io6smxq50c8WGHtCDRrYw/O/B0NKGK1tkBbx9kauxa6qqi+MhCBVO
         FqSP38zJUf5HrAclFUJNJ1DOL5VJH+vxDh8soX9pkMdMpSleJaowVto7NPqVpc/5yCKS
         QbuObYCOxQZJN8Rs9x3Y84LeRfhr8oymuVPwurclk7Nm9sfL3NjZIsFs7bUQ81Dd6LSE
         419QyVYs5y+49MEDB0cfkEu1L0gnJfd2gaQYcmvYyd2QotFDUV8Fe8DY6cTO5P/QcI89
         QQyQ==
X-Forwarded-Encrypted: i=1; AHgh+RpZkTaOPv0Kz78t1e0TweShtkRO44+lbfbZDSGKSrY3bxCU2wGmL/w22bTrD38ZJ3BYF6RfRCceZ0Dp+A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8SqvXUUsa76EcmDSaQw5ZDraGr5S0nGUskPYBB6+2tHXau+9e
	hDGD7htGKGepX1H5YMoE691r8afNE/xjWoNVqCZbrAIt4ijHAy7VNjkPM6x/z13uF3j63WKG6Xo
	b5mAQIPgum4eLowqpVWSwpSMcJ/KdNYU0Im5c2g70UCQezUhpeYZhGau4VQroBNKVKQ==
X-Gm-Gg: AR+sD12WzUvOwHAXn3RGeJ/pGqY9qMVDuF80CaXEOYPipVaE0tyYgZ4L8awawQrc7xm
	B4R5sRSnKDeoXjtibSCdhSGp7Xxxv/nxibFvl5jWI4ehvvUl5Va51TeVD6uicz5MvLdVfYw5se9
	jq/zdNAROR0VLHIfg2i6WaE1gqe23e9MzyOfs4BGkRBnf8Qd0A4kYYAK0t8AA/t2zFos/rX9S2I
	/SPIL+g/OSptPV9Jo/y9C//7ukoqHfWzI1vFbYf6hJrXKiwuw340sRBz2mv+P9tgiRbsiiUtQqu
	fQJUR/JUppf8ixRKK0Ux4nW2uUm5ikdq73A8IVIe9s2y+bSCL2WN5E+qGMPVvIa2j2FfrmV1xHq
	yNZ3qlsEFBRv9mLI8hmATC3ItG28Ee2Va
X-Received: by 2002:a05:6a20:9143:b0:3c4:2fe1:fa28 with SMTP id adf61e73a8af0-3c8ba63c421mr7492072637.71.1785322874335;
        Wed, 29 Jul 2026 04:01:14 -0700 (PDT)
X-Received: by 2002:a05:6a20:9143:b0:3c4:2fe1:fa28 with SMTP id adf61e73a8af0-3c8ba63c421mr7492019637.71.1785322873871;
        Wed, 29 Jul 2026 04:01:13 -0700 (PDT)
Received: from [10.206.101.140] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504dca6a8sm8990545eec.29.2026.07.29.04.01.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 04:01:13 -0700 (PDT)
Message-ID: <cb344e15-28c1-16de-b871-a39c01d52345@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 16:31:04 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v10 01/14] dt-bindings: media: qcom,glymur-iris: Add
 glymur video codec
To: Bryan O'Donoghue <bod.linux@nxsw.ie>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org
References: <20260726-glymur-v10-0-de451559e88b@oss.qualcomm.com>
 <20260726-glymur-v10-1-de451559e88b@oss.qualcomm.com>
 <cTyvVlG4njDAALGERZCnJMS54r5ZomPQ6aLejsdTWw3ifNJ3yuz38KU4j9_PrlabOH4e0Oo4XsuftZkODeXPg1ecfCRdlKHTLkw_JWXWnRY=@nxsw.ie>
Content-Language: en-US
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <cTyvVlG4njDAALGERZCnJMS54r5ZomPQ6aLejsdTWw3ifNJ3yuz38KU4j9_PrlabOH4e0Oo4XsuftZkODeXPg1ecfCRdlKHTLkw_JWXWnRY=@nxsw.ie>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: FI8map-XXSbJatwSHxxQHjJxFXuizSOv
X-Authority-Analysis: v=2.4 cv=C5fZDwP+ c=1 sm=1 tr=0 ts=6a69dd7b cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=Mf6ET5Z485SzACLcFDwA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: FI8map-XXSbJatwSHxxQHjJxFXuizSOv
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDA5MCBTYWx0ZWRfX0znQ7Z9tOFX/
 UQrvWGvzqWfjGtHqzZyIDc/S3TCZ8NIh2YpbgJ2UFHpJaBz7es3My4G88D1iG4z7MT+ghBZshGX
 aYe+gk9/e8g2WiucBqQ49BKw2ePeYbw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDA5MCBTYWx0ZWRfX4WpGjuF1R0XU
 C5YeBCBoHEUSSSpIkoD3eGs7ZdaQz0nRwl1vocfCvu+ET8fFQzAuJHZfxqrTBLlkPpg/6O/KmH7
 xgra5eCf6LjZZ94XiPJTLRFK9zfPXIspSLfpa3vl7uX6RXg6t2/oQP8aQ0FkJ0g/ME0jXzoOf01
 +2ksffyeb5OhtDPj4dp+9MsaSck4iu8ebxLFb8isl2M+4fH+0FO2ZaUlg3hKLsI6r9f3xo/8AFl
 TbfetlgmQlVLfSJdQXUm8MJc2ysu4XHIO6fk4W5w1qk5CZ84eKOZvLsKzGnyVhHvA1HDyA/Rc2j
 Ia+KzUf3uAjerYi/rFu3mPsg3NST60x7WTtS/ANsx4EVA1Ps8+0/izwPNi9i7jEc+4IrTOABOS1
 5Zy2XgicuW7dVNoNgDq6Q3uukEZ525DwqTZH+afLVE5uzq80A/ieqzMKfDeKmoFa9VFnDzQXa2N
 FniU3e32vmmAp2b8+rw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_03,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 malwarescore=0 adultscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607290090


On 7/29/2026 3:38 PM, Bryan O'Donoghue wrote:
> On Sunday, 26 July 2026 at 06:50, Vishnu Reddy <busanna.reddy@oss.qualcomm.com> wrote:
>
>> Add device tree binding for the Qualcomm Glymur Iris video codec. Glymur
>> is a new generation of video IP that introduces a dual-core architecture.
>> The second core brings its own power domain, clocks, and reset lines,
>> requiring additional power domains and clocks in the power sequence.
>> The current maxItems constraints for clocks and power-domains in the
>> common venus schema were sized for platforms available at the time of
>> authoring. The glymur platform introduces a dual core architecture
>> that requires more clocks and power domains, exceeding these limits.
>> Raise maxItems for clocks, clock-names, power-domains and
>> power-domain-names to accommodate the glymur platform.
>> The glymur platform-specific schema have fixed constraints for these
>> properties, so the common schema only acts as an upper bound.
>>
>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Krzysztof's RB has been dropped from v9 to v10 here.
>
> Is that purposeful - all of the other patches in this series have the relevant RB's retained.
>
> Using proton mail web thingy so my email may appear weird idk.
>
> Anyway please indicate what is going on with the yaml RB's here.

Krzysztof commented to drop it on v9 as the binding was updated significantly,
so it was removed in v10.

> ---
> bod
