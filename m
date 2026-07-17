Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 503F13F9F28
	for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 12:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784292897; cv=none; b=ECllyan/AB0ePOBiUzhWQxQ9zSqNHAXDMOLlLqu+Mtkbc/wl/MEmwa0duYZHxqs18WcTS4wZy7oRlkyRf+5aiTv5c+960triOkYz/p+fjZpg5R8zMIA/h4hEALKbJaiSdZ8rmh0T2u1Os/o3lDG1V6MWcvqB4LrhX79A+irv1oE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784292897; c=relaxed/simple;
	bh=FMQbLCZIVBlFvilgBWXJ5CXf6kwmbRy28h87UQ9QJMw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EcuE9I5mSPeHWLVnigu5K90iwt/3ygYsHTA/I9dELP+asup7mS+Wv10/P6klpTVeUklgyeiM20tJVsCzn6wezpdtQGMT87Ogk1Baw0ADAWTuIc+Gp5CPRbtIYll+7txMruyqqN4d/H01FQ8DQJ8rymxPa+ptb8E4cV/DnwmvabU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PRrKUIGR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=etmD0FQV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PRrKUIGR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="etmD0FQV"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HCSrsU1781403
	for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 12:54:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/I/1fyZeVVo5EmsKe3AogbAV9WwrxlVkfS7F6TW8TAY=; b=PRrKUIGR9xdwudUW
	9fDE/gw5+B+sqwu9jOxj1pQ+tX4fy8h62bDQnkrwIMoDDxSoDsf2VO3CKerPJg+Z
	uFo9eEQlMlL4VVUFVXPt0eihD/aOD89dLS2bbgAaRqogx4WyuQxmoISfpvzW34ic
	3dKehvy6AXVW5nqSf4v5pN5EsGJlZmXd8lcvI6O8h7mQJz/5QRvCybEUzpVlXfTi
	wQ8ndfqMGcVF40NjoIBK2C8ZwB6ZQsIKEMA0a9nAQjIOPtqmAcTJvpCk/GSGx3Gt
	gv2aO76NZGesmji9rJrJDy8+TIQn45/2qOCyO28as980xmppQNO1tYyB43YgvCVJ
	sKh/JA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fff9gsc18-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 12:54:54 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-930a312222dso46011385a.2
        for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 05:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784292894; x=1784897694; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/I/1fyZeVVo5EmsKe3AogbAV9WwrxlVkfS7F6TW8TAY=;
        b=etmD0FQV6TuUKRLWobSFwhcNgDcqBCXbJaxf/g31Hwazd3+V5Sh6mTpc7l/N/7EQgN
         K4Lzf7LwPB3u1EfH+yqI74i4oh9QwqPI5Auto6eLzlGBTA+xTmpoytcMZR6cz3NcxOJA
         q5xQdTL1M563PJvakfOF959K3+2lyOZ12JF4oHijn7s/qwbmr+3A1qYzpeBHi0IMuXAR
         1UT58DwMslrz7FlRQC0YUPE8ncwJfPU6rsBIIkv6aO6as04EoLZI7uj4mWQHN7kzbNBx
         TUdEd/xyr7IffXR86uPUOJz9CZTTICUOF5td2GPOfTL2Bx1fDh5nNrQlw1+FSruLyGId
         Xqmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784292894; x=1784897694;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/I/1fyZeVVo5EmsKe3AogbAV9WwrxlVkfS7F6TW8TAY=;
        b=S3UfC/AQm5BCz+jEF5MEVWQBNiT0PfKjeeHZmDhRc5fUr6Zuq57+upHRHxGqAao/nS
         KuvrvK+3ivRX5YKOLprAI5bn7UHQMVpjtH+QXAMlq1qMCiMCw7KTUKrSE570Ez1Ck4Rb
         8Mey/4F1a+1MMHhl3bzLR+8Prkg+0ScNiB7EcJWRqOxl/nTShCezTHABtTpeKSJaBREK
         J1dCa5oTaVOTudSTu9AffQDeNLB8o/yuXG5THiiINsl7ZHukgKbDjwv8udlfnoaOn52j
         wKuSEa9Tauo9ngQnL73dfO3pEiFBZ9VG0JLF/PEn9tqS7Zcpad0YTc6jbwMTpn+8gWr3
         kE6Q==
X-Forwarded-Encrypted: i=1; AHgh+Rqgwis/1jmgg/XrTjJsG/7T0FI6XUs+yMpeQf80B6rHeh/ZNms1UZPfdvmqvi43IMHLmZHqilhb/hHmkw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyHLZ9CiaDr8PON8ddB8T2kZ0iPiLRMs1RGqTuZTxlPL6Se9/il
	wXdWkpHe8E0eTeunajG141KfmkL5AlpWir4FEiRLWtNGdSGg+36ziBmOO+vb7X3OaCVmsYhKw+t
	njF33W8d9cjnDNAuwOhtK8JeoJuncC8kHoh3zcD2+H3rvJYyXptfvOYsvyx/p6n/NOQ==
X-Gm-Gg: AfdE7cm4aqKRSpU6O7sX5hw8SciWQ9EQn4bD/VmhVVUv62j0LDl9UId+sPWk6DhX1Hk
	xOVo2VIS+geZBQu22nfxwdAkdAI1Ox23RosF5S2iSk899Hn5l3oDVY5Y4nFsa1uptgowQwyHhBT
	a6emslmedsdG3oJO0OI2N4JQH0Dqr8QjBfy7UhEt0wMDaaqUxr9A2tFu30bpRcasLcQE4/BIc67
	wBkh5H/Og3Zg4PBEGHGndDnO9aOLlOY0+Q8jfdXFadc9NHCasGIry5s617QACTytO8SFbVynjLH
	K3NR0oMQofYuaIBtiNZqA1NOz7d7fALVw0DbgrQ2KJmzAUdzfe0Hs3QWxGS486qqxBmR1gEbPh2
	0Zq1NeoXaobr2SzrPmkLhchde
X-Received: by 2002:a05:620a:2711:b0:930:aff2:b1e8 with SMTP id af79cd13be357-930b433be83mr209108385a.8.1784292893670;
        Fri, 17 Jul 2026 05:54:53 -0700 (PDT)
X-Received: by 2002:a05:620a:2711:b0:930:aff2:b1e8 with SMTP id af79cd13be357-930b433be83mr209105585a.8.1784292893257;
        Fri, 17 Jul 2026 05:54:53 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69e6fee3304sm673740a12.5.2026.07.17.05.54.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jul 2026 05:54:52 -0700 (PDT)
Message-ID: <e6a6c504-40f2-4510-901d-77d88ac4ac5c@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 14:54:49 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 13/14] arm64: dts: qcom: glymur: Add iris video node
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
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
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org
References: <20260715-glymur-v9-0-8cf2cbe12a07@oss.qualcomm.com>
 <20260715-glymur-v9-13-8cf2cbe12a07@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260715-glymur-v9-13-8cf2cbe12a07@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDEzMSBTYWx0ZWRfXzy8812EBK9JO
 KzlWQ3pJZtlsWnt+3BS67l+QifasS9BoksfozOh++mr/wwuyNsjGeCuZAWksRqU95MEc9g1UCYm
 w9IlDRRO+r+jQeM773172h2/zDxATx4=
X-Proofpoint-ORIG-GUID: FHpsrpZVFwy8sPxaNrLdSbFV9a1WfL8Z
X-Proofpoint-GUID: FHpsrpZVFwy8sPxaNrLdSbFV9a1WfL8Z
X-Authority-Analysis: v=2.4 cv=TaumcxQh c=1 sm=1 tr=0 ts=6a5a261e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=xYufHl49NKEuV1FEiosA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDEzMSBTYWx0ZWRfX14WuHdLJf/MW
 tBlQ5wc1roM0Sy02TdV5lFVxlJm89Zvil7oeJlvdahq+Rt1q36Dl+++ByVAfXIo6W1vSsZMqune
 mTYPF3Ut/SzxURlo3I8eoU2W0usq/Lmi5Sg+xoXQmFEErhhIogqXdZNLHKV1sjM9hpUOqJTjPdy
 sx57wzFTsvXfO9CyHLOPnSzUDKV0kzTvRKGsaB9EvixZcHvLWZnXtxNpljBJwTUlRiE1VTnwnqm
 EaQqPp6wMLlwhK55mFUVKFOIVTYkRd4lJF/joP7vppdtjabdJIc74gPq2HStVVSOBgoSbV0BHN4
 NgL0w8zipHjA1sT4Mbp0GN4Lboe4Q7Ptma9bSlg1S/sm5bdjTRLbf6BmPwb7jAPXkSO44WDtWE3
 xLdXRWJGqlHBl8qgW3scsmtpXRvo425X1ctzxlTmFpZWZmGwUumktw9IYipLNVLLo2ifLTE+qm2
 nnvGh6K2xnKl8LdxvfA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_03,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 adultscore=0 phishscore=0
 spamscore=0 bulkscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170131

On 7/15/26 4:10 PM, Vishnu Reddy wrote:
> Add iris video codec to glymur SoC, which comes with significantly
> different powering up sequence than previous platforms, thus different
> clocks and resets.
> 
> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Tested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> # X2E94100 Asus Zenbook A16

[...]

> +			/*
> +			 * IRIS firmware is signed by vendors, only
> +			 * enable on boards where the proper signed firmware
> +			 * is available.
> +			 */

I still find this comment not-very-useful

Konrad
