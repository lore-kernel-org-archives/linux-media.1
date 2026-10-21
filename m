Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792569860;
	b=SG/BEFQ/yn0pl4N6Mo06HYkD4PsTkPuXJRHIddnSHOPS/UiphmPKRoOEoLbc7e941BRS
	 nf3jbQmvRelxzTPcgUcE9/29A2TW33gWU1a8Xk8iLfhojYu+UTpmAo/uW6HOviRHsEKLV
	 8pgh0V78ZkbCf+vT4Ga0aVv1JwO5d67b25LV/z7vVOYGNQoAthTQXMGlMhVE4dnmhab5+
	 +6eRKiid5pN8rjTAdhlXIO9dkIufU+NNw41VzCZY4/4/JAZ8WwJs4yTWhCiZq0Pk6qPJe
	 8iMkPcjn9OYIpKsbdIn4mYYSh425OEzyy6vyJbODhnQcnkWNyHu5yTtXhTcPvkHDL6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792569860;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=376e3NZ04AYvXJ05krt9Fdz8ClOb73elsktpTuyFrOM=;
	b=XcG9Tj3PcvvNCDUJZZ/ijBhqTWC1KHZ93IEjkTfiNDcczsnShTXxm8GjfCyWBjPSrye+
	 SAwmnwzLf/bMXu9BHfibRLMWH4c3zv0Sru8cLq/kTN12VJwYhFEe27WjfpyMWNy9CpAa+
	 KAxBK0/r5YVYnn6XEWbqMjGBIzblBrN88Ttys1UhdHNATC+JohenhhbmnNh5am146P1q0
	 s8tO/KDVqv9VW/GgDynohORSlQAYfMqijlLGJ1TKFOooTyexznEFXosE1FRRt2uWP4+4h
	 QOGuH8ikzmR+0WkxQcdOWBPBhnoh9WqDfd7+HbU+iyAEEYahb8OHH7VTG7Uy031XTlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mrO1mXf7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kRyQHIqR;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD99606A31D
	for <linux-media@vger.kernel.org>; Wed, 21 Oct 2026 08:04:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDD99606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mrO1mXf7;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kRyQHIqR
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5jJNd2848213
	for <linux-media@vger.kernel.org>; Wed, 21 Oct 2026 08:04:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	376e3NZ04AYvXJ05krt9Fdz8ClOb73elsktpTuyFrOM=; b=mrO1mXf7S9FLD5rt
	zKEStQDCnxwR4ZDxHSlqz3JTMFtg3oROyZU5AEL+R3ooq3uwBCRJeyqdJLHRCRRI
	Yje7ETm+9urgF9k2KzPwRzNV+cbyV+Vi9zXzVPtHdBmydn3WLjN1cXLOUY5oYp7l
	0sYyvlI5KgIqc5PhEtyXtcVoBtlbnpGa6v5XuOZfjjOPcNE8fHV2jQSb8LaYUz1b
	louPFnH5RuizqSBpbwmd6CdWh1i9ucm1fIkNULWBrbKBUsDUeyGwKYQR8p65/Pei
	RPMD7S8ks94DhKIL3V3hNZk3s5yPSG6vWFXq7SALTpBpz49CknchAmL0pwvnTZJh
	0wcElQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heeb9aggw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 21 Oct 2026 08:04:18 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f3960dca5so15143385a.0
        for <linux-media@vger.kernel.org>; Wed, 21 Oct 2026 01:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792569858; x=1793174658; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=376e3NZ04AYvXJ05krt9Fdz8ClOb73elsktpTuyFrOM=;
        b=kRyQHIqRh1abyHBwXj9qN2pXyLNMPAdpUqEUtNyDDOpWat1pwCbj5e5fi7saFrlfoB
         9rWuvqhzxXAh33b8cp2x0Q/fanZk+wiGjANin+99KwOGv3gp9noJVsiorJM/YwMDNvkj
         xsemtIrF9CwsML1IjYBByuppZpAe3GeArCYWgt8S7iPl5P3UGRlDgeWbwdSyKKmLMxo0
         ouDZ5yZU0cWVUSMm8VvNlHomYfjlDxb4zx35a0UpkE/Uv+4nR4njWOUp4IQWTsyFYWzB
         KDB0H+o+XrC9mSbCBlYD6W0lIMNvGaCdEiTuSa85vet8RgWohJqLFmQn/7OtS6UbpbUB
         JHhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792569858; x=1793174658;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=376e3NZ04AYvXJ05krt9Fdz8ClOb73elsktpTuyFrOM=;
        b=dC9lL24hug2jWj/0XvKYpxyQ7KEU/tVOmKDsqcjTXgJly4XYlQSwF1A00GuNZKiMUY
         y9FTQxi7qmiVgRvxeGwIsbVjgQmxyuOT1iL1PqcNk8KxBbeiQ5AchIXkUelJsnoErJAI
         0hEY2GxjO6b0NFQ+lI1A86kvs6mMi2wY3PJFwZlOlhh34MtAmbah96WTPaoZ5G33NtaC
         YxNz1bDtGgzvhT+Zs4IwligF3w37KO+DeBMPo1qFR5828tZFfHuW57y1AsAU/gXox6SZ
         kMKTLw69ZhzgWOElmiO1fSSPLV/NlAVQgb88rIkCxENvYR8yfDfEZUDbC3I0tiXhYC48
         vWvA==
X-Forwarded-Encrypted: i=1; AKwUvByIOxAzxsX8Z8zmcrwZl3DhYi/I4r+2D+j0aloAgP7Gom4NxgImgDvUwyxV+D7njIR/O41/1A7zELjt1g==@vger.kernel.org
X-Gm-Message-State: AFq9FYKZf0IUctre2+JBfDGMc/05A6z63JavXoC5AMfV5Y9ySPYfs2pL
	7rVfMdBN+LE5UsdokqFKQqzQ3I4ceEMPoaMOp0cC+VaIHN71gffvW3xdJug1OgBYu/7Z1wk/+FC
	6OePQt+cyMMU/ZqFmvyII4K3E3zHmF65g8/fDQs4Ue6RnmfNtfbgn04Aw9jr3GgFL2w==
X-Gm-Gg: AYBFou1o0fiN+M7uXDaNTHix9MkEPtQXeXJbyly+vZfCvXIj8H7Lbw0uRzmw3EF6aaD
	UxgoJlWngPoAS3eD9r5xrY02jCSxzF4oUu5FniC0BsErtzBYVLoYK7YTcWq/d6Q0UEen9mcviHf
	GV8j4k47NRiUuSntYG8d+tGvePy4JbqU7uPMH2LdfAYeV9B7PiD/hKqLBu9ldncmRPh+ckQR8lD
	hmNoGGhZyAARJDASToWKTNkJyh7CKoJEYQ5R3+er9BSyIs9zktnuH8npSaphVJoN+yBmLX/p5nN
	V/i7n96rhaOST34AE/BgzkJROR3mnBT2tsDyytb5LN4GbjSkAmRteBT7VKUHCd6Ok5Yk794kI/t
	okvNySGriHBpb7ASRdzRmGA==
X-Received: by 2002:a05:620a:45aa:b0:939:9205:4d78 with SMTP id af79cd13be357-93f57f96010mr324546885a.3.1792569857908;
        Wed, 21 Oct 2026 01:04:17 -0700 (PDT)
X-Received: by 2002:a05:620a:45aa:b0:939:9205:4d78 with SMTP id af79cd13be357-93f57f96010mr324544285a.3.1792569857519;
        Wed, 21 Oct 2026 01:04:17 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4030daf5bsm547898a12.6.2026.10.21.01.04.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 01:04:15 -0700 (PDT)
Message-ID: <b620b2de-77dc-4d90-acd6-464a85ec674f@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 10:04:10 +0200
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
Subject: Re: [PATCH 05/10] clk: qcom: cpu-8996: move off the ACD leg while the
 PLL speeds up
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Ilia Lin <ilialin@codeaurora.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Christopher Obbard <chris.obbard@oss.qualcomm.com>
References: <20261019-msm8998-fix-clocks-v1-0-370949e4d8a0@oss.qualcomm.com>
 <20261019-msm8998-fix-clocks-v1-5-370949e4d8a0@oss.qualcomm.com>
 <c3ac769f-59be-408a-81c8-9d6a2693d3f2@oss.qualcomm.com>
 <iqwdlpjvsilp2zwvp4kljoc4txwaw6h6ndz42hgvakfcgc4lqo@ajr7xrkiwmle>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <iqwdlpjvsilp2zwvp4kljoc4txwaw6h6ndz42hgvakfcgc4lqo@ajr7xrkiwmle>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzMSBTYWx0ZWRfX+EdonF5M/5BN
 Izo0dpn0xMqnnUZa5P5ZW1gUYL86++dklylsn7pUcbUdyFmsmDrIGTv6WlizehAOz2IdQyKeCSZ
 x/nEa4RbC0L/4YM1SkH+zSJkj95ewLc=
X-Proofpoint-GUID: pZBUMVvSPKjlCdYuStamzYeDbCxjq4TO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzMSBTYWx0ZWRfX0Fv1V1SR63cp
 5uTIOEaGLMA25j7qNgOZ5sc9ZFlHAFTWTA/Dpv7cBzKhPj8mr1RTED/2WrHJd/X5LGK1d0RWkq8
 modaN6+5XKSOJ0S17j6AQWFIomvHDPPe1FDcoWJlBazA0TYNHAcllbCvInflQbwtfJYn6u6L7yo
 86+5JmCYy8D/i1pALdGrw5kgYQeGb1EVvP5LXFXhvaFhDAgkUTjSljWNeIFl6QSHgNXJUYMIb1Y
 TaoVoUDgbT4oNyOLzqyOQXJa27ElDOk+1qEZf3HjHzrll+7a0ITqeHpIfMA7NvYyNDoXgshTn1u
 47uFcfvEK9Apz7cL9frGKhYKvncTRkbS9seUmIXLw+8Puc9sKZXC+uwclk3sQnvhJlqe3QZJ+9l
 f5eZSXuI74gwjvECeSOVj7bc8GwIVMBzDa0dYqClMmMSNXx/wHkCT+fGU2C34xvz0BV0BgA7ZLr
 b9ALqHB0NoBGmhoucqw==
X-Authority-Analysis: v=2.4 cv=R42WitRX c=1 sm=1 tr=0 ts=6ad87202 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=zcdO2QGPM5nA-iYd0ZEA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: pZBUMVvSPKjlCdYuStamzYeDbCxjq4TO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210031

On 10/20/26 12:10 PM, Dmitry Baryshkov wrote:
> On Tue, Oct 20, 2026 at 08:52:49AM +0200, Konrad Dybcio wrote:
>> On 10/19/26 3:41 PM, Dmitry Baryshkov wrote:
>>> The MSM8996 CPU clusters sometimes run at half the rate they report
>>> after going up between two frequencies above 600 MHz, and stay there
>>> until the cluster drops below 600 MHz. The PLL, the muxes and the rest
>>> of the cluster clock registers are all as expected: it is the ACD that
>>> latches at half the rate when the PLL is reprogrammed to a higher rate
>>> underneath it, and selecting the ACD leg again clears it. The driver
>>> only moves off the ACD leg when going below 600 MHz.

[...]

> Downstream isn't keeping the main output below 1190.4 either. After
> pre_set_rate(), cpu_clk_8996_set_rate() asks the HF mux for the target
> rate, which makes mux_set_rate() set the PLL rate and then switch the mux.
> So the main output follows the PLL up to new/2, e.g. 1075.2 MHz on the
> way to 2150.4 MHz, on every increase above 1190.4 MHz.
> 
> The main difference is where the cluster waits before the PLL moves: downstream
> first lowers the PLL to 1190.4 MHz and parks the output at 595.2 MHz, while
> this patch parks it at old/2. Both are lower than the target rate. Following
> the downstream approach would mean reprogramming the PLL from inside the pmux
> notifier while CCF is changing the rate of the same tree, which feels incorrect
> to me. Also it wouldn't lower the peak.

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
