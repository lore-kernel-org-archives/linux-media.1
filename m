Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792659719;
	b=5Wqlkk9fjWyOyRpN0+DRmrE5isZhdGJAl/LrT/OjmQyO11rJztXuaTBzAf251kEufEPC
	 GieAWR1CZz0lwJ05aYVxNCnQQBor914uhCMM21v4dcEqUAK/nDOnC0NiQpwcPMqZQY5SX
	 r0N9CAySip2Y5VhOl2G1jLlgp4xwmvuD+QXn9Dzsjd5+fQ1/o5GRXKMCwl5v2tSZG2fRg
	 OCaY+vlR5kOfD0JCE6xsgCtPEVvabiGG33rKKg2kA+eDGBNspvl6b03Jsx+k6iNzIiMVQ
	 0QffbWqwxGaZmaMu+LZBIEn6qCd8G8Vz3HsnCV+9EzmJa/TP8V0A4uNmG3+jAeam+iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792659719;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0I8xuwfQs8v33QT1wAE3DJ/yMu5gOBSm0L3A0Ja5e0k=;
	b=jNjNzd0Rg1F0qkwFaZ6pSB1Kq5pBWEXmml9D+0Em+6XFRa+LgvNb6ldv0YzhKKXvHwQ4
	 7syQCh/j7WyvdxYSW66hWbMCJyUlHnSJzc67um71EX6LKu/jfGBsQWHuv0foy2m/dbvKx
	 d0LBNeJE10FNG+ID3dWWoGzPAOnTePwcIXzLSwnRotOF8aegQR67s6hs5rJNJUOOcjDA7
	 GL5hz3UirYVcJ5cg8xQ1ZyYRwjWyl+BcON79kpKnmuwsLWBO+fQ/6NKYjDi+syOPXN3Jx
	 mmsG2DuU9E1Qvs2Y7K1U+fdue5NSunnvqGP3PX9hyoIS7tQlM9934VP0GfqWrVKu17w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HMPoQa2g;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LEjBTUs4;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53AED606A320
	for <linux-media@vger.kernel.org>; Thu, 22 Oct 2026 09:01:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53AED606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HMPoQa2g;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LEjBTUs4
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M704bk1561361
	for <linux-media@vger.kernel.org>; Thu, 22 Oct 2026 09:01:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0I8xuwfQs8v33QT1wAE3DJ/yMu5gOBSm0L3A0Ja5e0k=; b=HMPoQa2guFdKcKJ2
	G8GejBQwAZfoxwjD6s+wDvWlEfmNChBNdsPgLiuINwK0Wm4CJsw2J6NCpLBrF4H3
	XXHfLsVJE+tYVq/P6iUmb2Qat9w7VzhIQ6hcfX472BSG1JJ/BLa+BglC/NHOS7+u
	O1APBbyb9DhHGCfilCdjyzc5s8SFX/FrcXbPKBK2k6inoeoYglLc/mfaF4Ac+EmJ
	R9YUGCjvL2/ZTjlKxVRVQlkAuiTdiI/L6EC4X7V9p4vTbhIOPp1COojbYdOPqIbj
	zuk+Nb97SgbKOEVNmqLkVT4NBH4kcw6dtADDSgUjs2JSwgPGMt7q3oEqVAHuNy2h
	6c1UNg==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93ahm2e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 22 Oct 2026 09:01:57 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-9906ce36960so23094241.0
        for <linux-media@vger.kernel.org>; Thu, 22 Oct 2026 02:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792659716; x=1793264516; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0I8xuwfQs8v33QT1wAE3DJ/yMu5gOBSm0L3A0Ja5e0k=;
        b=LEjBTUs4gSLMnZVa7pKvd0iDicVuN4kXD2/hXkx5YUYWPL7yhjkXTZ3fdFu6GdUKCm
         xh0L/MC2RIYobQ4ehnwBWxgMdWgpfu0H1NS663dotUnpfkeB4tYvbgxCX1JEuOK/8FvM
         JrQaqnI1DdnVK3C+Mjfw1onHsH51MyazQuezxcOA63OZ0DedzhQd/j8W0ivR7L4wA0DO
         wr15OYnx5ZSq3a8D9+x2UwSgLJ2fl7WZP0jP4EmiQYSuI/gZ2sKMir34sP9+nhuTd7b7
         Jt1FIAG4PNidBdYrh6mtNs+D3LqBSLdIR9QHuFf0R3NFlRwWqQ7WQ8I0ydEWol9KUqI+
         V/jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792659716; x=1793264516;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0I8xuwfQs8v33QT1wAE3DJ/yMu5gOBSm0L3A0Ja5e0k=;
        b=NSxcWBsf9SA3XpvfyTG0Oq9SwnOImyqsmkHNaeh0FvQWGvh3asdprmbMuhgqSFCVo8
         xWh8z3az1ETIARlUOeHmQDGUMjVOdzZojBINIhC9nEJ36EXPzgtiZkkVVcuGE1Ebnzse
         umBCY0r/0NYtb6iZvDJjmfonD1CmsT+nAe37g6ZFpA11ltVWD8tuBavw7oF4TlW/DE/P
         48Ip9q+GTxOtVTNc29jgfUUtVLoygcGO4xWN6H4Pk1CfcXDlmiPCNHd9SADaK5c4gaxI
         EuXK066BYzjdF8nfeAf5W50zdbepUiQ8MgmcCJvyO4zeYYHLGqiIFstvI1jwC0zBEYVQ
         BMow==
X-Gm-Message-State: AFq9FYKmGeFHbTmsXsPuzZT3z1vZPeAcYtEwlkfghPRoWbSMvxYkPOMJ
	qd5gIbJQmHa8zbbif1ZsBsyoSVCwzpPv4Lke6+9kjMuR+iGhqUV8dABAXCQW1n33LFAKYN7Z2bn
	JwT3afpK/SF5uXSNAxdETiruA2B+UGOAmmCZNAmtlAhhuFgapVLWpjGBCxq6YoG31rQ==
X-Gm-Gg: AYBFou1NCPT+O70qisKPHXOIG4rsGImq0j0PfPCZevXUXSBuocZ/BFZtbfkRI7piCbR
	luMyet8OFRLurX0zSsqZwDyu8q4dWD6NoyjRfMEW44erdySKOAbmzClkVTA1i2pNToNMg1jbAuO
	BPK3o1kzrhG9tL1QVe4fOlrG6oNcEsZBlU989ux5LmaSJn2Jz0RWBJTNiHpgIp/gurV9P3jn5Ec
	R4dCVWCrcXDwV6mGWtE/hOtjR5cZ/LQc9lKjj4mR+qKAVHhrrGbaODwvb219zpMTUz2ct1WDoVF
	GsPS906XtE0d917ucmrNN3hktdpL80GEdmrsf5KTjD6OjBGDBCEreNN3BcUP19mpJ1erNwK/2CA
	akZFRIcBM2jtyIJy0GQkQEQ==
X-Received: by 2002:a05:6102:2d04:b0:7cc:22a0:de89 with SMTP id ada2fe7eead31-7cc926699a3mr1620667137.3.1792659716453;
        Thu, 22 Oct 2026 02:01:56 -0700 (PDT)
X-Received: by 2002:a05:6102:2d04:b0:7cc:22a0:de89 with SMTP id ada2fe7eead31-7cc926699a3mr1620635137.3.1792659715973;
        Thu, 22 Oct 2026 02:01:55 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a55c001sm82124366b.31.2026.10.22.02.01.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 02:01:55 -0700 (PDT)
Message-ID: <8750ffa0-33bc-48c3-b136-fd3aa4d75743@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 11:01:51 +0200
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
Subject: Re: [PATCH v4 5/6] arm64: dts: qcom: kaanapali: add iris video node
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org
References: <20261001-kaanapali-iris-v4-0-642f9ac5e699@oss.qualcomm.com>
 <20261001-kaanapali-iris-v4-5-642f9ac5e699@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261001-kaanapali-iris-v4-5-642f9ac5e699@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzNSBTYWx0ZWRfX6U6O2dnHEYEs
 Ub9b7jECDEEpeCquSO9RY+lj1HvHJp1OdtGqSn9U+xERbcOuFK3RtG9nbuekHn29W4YOIok7dO5
 3O5TFOMJXgVLdZinpBn59ESGgAsR39bpZvpPkt4/C74B9HDzgS6dOYV/RxaicSPeppn4SEvZpJa
 jh9IB1ydO3Vt1gTfaPTt5EzSPI7HAe4vBjrYlKpugusasMxk5Ogwzy5sc39Dh41ItqR6w3YlcLm
 8s0Xg5+NKyuXRdhWB0WVlv63W25TkMPmuOAjUJcy1PEXCC6HJBAb/Dd243vOmzWi7ybfI5h2/iZ
 q5DpBvz0qc1RnMG13Fh8+QaJFPGkaBgLQIVleMLBzeSZE0sAYfzwg4mEu6PV9ubulOJHW95+mBw
 BURTVZJwQ6DvF+6JzQ1tuyNTu45wZv2SbrePl24tgT2+il0yRAUg0kExC3I+TVFDK4zmS46UFCO
 j8wko/JcyV6NrCpWFOw==
X-Proofpoint-GUID: zCQsEw7z3ePjALnscDI24_-j5aiQgyw4
X-Authority-Analysis: v=2.4 cv=feg4WEQF c=1 sm=1 tr=0 ts=6ad9d105 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=fK-bvxQjctYCA93nC4kA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-ORIG-GUID: zCQsEw7z3ePjALnscDI24_-j5aiQgyw4
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzNSBTYWx0ZWRfXy/3dqDjHPVro
 qHzXCsKHMSnyT20H5675wJkWZl78qY6C0fgKgfMp2et/l3snEHd3T4lCxLTGYWMRKetWZGW9pTC
 kjXqb/vkDExyi9bdSgVsMQzX5HSo/Gs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 spamscore=0 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220035

On 10/1/26 5:17 PM, Vikash Garodia wrote:
> Add iris video codec to kaanapali SoC, which comes with significantly
> different powering up sequence than previous iris generation, thus
> different clocks, power domains and resets.
> 
> Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
