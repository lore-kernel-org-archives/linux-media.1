Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793199990;
	b=b+GWQs6g0PbDw7HYQYXKFpH6CO+EGQWALeFVneVV1NInmM6/xZIxnA6qxfQeiYBUBYIU
	 tPxULLKYfQB/i1R23ItJNxuMpqiYoGm25vSx3bqG70HWAPTavUSi6N4ZtMS0UAH0UYVMl
	 gEFCDNULdLHFEEjwgEN6ncOBydwqFdukZPoWd+heavHrFBd+dhV9CpL11uRF7lTyVmBMF
	 lmm+jHu3hRsf51zBC76NDAd8+q8XGq3BgacQk0O2HeaS3LrR1R5X3q6Z3u/bmr2VZI6St
	 Ur6fZktk1Fo0MMLvKMRXI8qONmy3MdcYDaRNL0C3EQfz3/O7ZfJHtC1V8y/AdaeLqmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793199990;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=+NeF5xb5H70Cmn8d9aPiULwGwjwCvFvdZqpmCdvf/iE=;
	b=p0dErHPaBfzkzhQXpczfhy1KCKp5apfBOQodcI8i3KBqkGvjFYDvsX/Giw/zbI2X6Ilz
	 9A8J9uGqHNDfCejAXLU/H+s+4gsyCV0V9yFQTJKXN8g2W98KAW7oYJzcGC4Vb8ZEsKjLR
	 V+OJL0S3iksngujIBmlcCsXd7uOrRrK59vsb4USYGhiCncDC5UL7BG1BiS41H9o9b8Cxd
	 R/4jWE3pQgQ0TeAlFksUhaQixeLnukXbQTfqZ9OocRCmAcoJHlkUOimHEUltIVCyXwkkW
	 4fcAv/qUeeLQWxIx8H5rqgLyNS9QMasjaBc+/MMd/vn1Bpgw0G+MkGM+7Kms7gUlv8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QgKlVf1L;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BnZSNFYl;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3612606A31F
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 15:06:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3612606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QgKlVf1L;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BnZSNFYl
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBeD9L1607030
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 15:06:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+NeF5xb5H70Cmn8d9aPiULwGwjwCvFvdZqpmCdvf/iE=; b=QgKlVf1LGwoeRbtl
	QTxEpQuZ/oBKBtEJQqNnPb3YNR3Agj8a11xGXVGVWrDtrS1Hd4O7jX2TdpbSQfQD
	yhiNPdQkXfLuSYM5zkkZnJrkX5tLRWgR9WK+JxMpEihPK7CZznw2QB9x+yTgDi5L
	I6RW8SJmJld7PMym473X5feE9ZrI9bUytwVz2ZA9sPbnmaMiP5jLtCHZQaeOwpAn
	0RZzLzolyQZ2DHgIIKDVEG/LntFdk3iIyx4ghJQ3Ezluksbfkn+6qbS6k7ll/ivV
	ZRwUHAzMX9MUsQ0jHbwny88iOr7TFyblwSZeQ6pZcvCrKZ2Lx5HF9QPkubGaYTzQ
	PtIPmw==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk7g7jt5f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 15:06:28 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-97e8be2221eso254052241.2
        for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 08:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793199988; x=1793804788; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+NeF5xb5H70Cmn8d9aPiULwGwjwCvFvdZqpmCdvf/iE=;
        b=BnZSNFYl0hUDimnobcFGhJ9Z+tCzvEkqnxZ4PNKQ5R+LS+PwyQOEcM/w0zT5CrHDv2
         m/Vs55cnKAMxTeJ7Pri3PNC9rpD1np7SoHydMDMaCNzmigPoL4fibVrZOTmq5py2s/04
         LmpTHQJT/lDQaL3/iLipCHFWt7W8w1KGoG1YP7/NzMUEhlEJdtoTv2FYIsNcxiY8tNih
         8kVKugtB2F3APlyV2ButnLkawWXf8eIg8WWqnmkWqPHja80DuNQo7IeUf/WnEpUP9/3r
         XTZE9IAULJEZDVUsUz0pkd9K2ynyRRcUbof+GRpT/vowVZ5q0kvHk3czoux4Jfw9p4CQ
         i1kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793199988; x=1793804788;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+NeF5xb5H70Cmn8d9aPiULwGwjwCvFvdZqpmCdvf/iE=;
        b=w02D0KG/8v7+awyzKsfnxdcCVwdj47/vdORodd4gBIeFsA6bVn1jEdigKQyfIBkePQ
         k1IHrOebHEiuT7fqvFIqi5AsG19axbN6nmt3E06VQBzv+1m2NODW17cb4CmmAy9nd0Sm
         7KBakEAtV+1TCSRVskH+zkFej3IGpnXAegakVKrbMYX0jb0zbKjkiConVh2JkW78Aw8z
         ZFLmGPlhcq2WWf+HR9cLjlkdmg9nxbV5/JjNUATRmxVM7VjzXUc/CxF10RjqRmuNDG9Q
         jARL4ogJl52aRYDxe6m+kN082arl+yUEfHyvHnQk2VoyuzYVbeR2AeVw7SEg92jUw+T3
         qo4g==
X-Forwarded-Encrypted: i=1; AKwUvBy0r5JWmkLkpUHnxqpbD/PcUIeAcxoU/SA+deMzzwRF9fA2vMgltp1jI1yPo8Fv+qxA0IKGQlp8+57KHg==@vger.kernel.org
X-Gm-Message-State: AFq9FYK1Aqp003rLDDqLEeQKhLOC6hgY5hSsjjg2BYn25BJd6Ppe6oKh
	xGCsj1Tz4ilFeDjyMjiar/ZdwOGkWOmXSmWHTrtfgE6VE2tGvJTuzlO/aCz5j5mzFoDUjjMHDh3
	qJrgGQcNkd7L+Y20dDsZmw0PTnoiqxPXuxSYA1Uf+J2YKOmu7YsOqtSkLTnf/iYD7EQ==
X-Gm-Gg: AYBFou0IfzGrOnRQgMsdql3rduNFOOyVO4fRekgJI9Ike7FaSNr9UhOgQ4XysocS3RH
	G5G04si0Nfu1upPJRpLUUa2EaWid7VENt57CAJSaQCjJtWz1KHTd+98T6+KB/Ysu4qcfeFq3bY6
	u5fsHmNMGKvNy87ZS1w8yLaTdvy+bq3jMloQ3s0pWK9uGXE88VqZYve9AXu63h3Aksqkb91YLN1
	OLB4xJxWOxKBNGl+DITJx2sOU7atV1qYgip1BFo6PA+kzoPIi4L9Cz2/TaEVUyhBWcMchbtQfM7
	3M+1MvalTHY5BMhPKVyDL7xoOtYtbYnYjJnjdYcIk0Pbrll3gTJxEyG8Wf2rijEvGX+ZWphfsDl
	sXntgeGsYW6jJ7JGB0VFXQkKL6BjwTY1d21LBVcsbYfXVG8h5xS9+6BpoQYv7nbWj2sQoaMhXtf
	Cw/U58LGvXpuGj
X-Received: by 2002:a05:6122:2805:b0:5ea:c11b:432c with SMTP id 71dfb90a1353d-5ec4cc44655mr1202118e0c.15.1793199987840;
        Wed, 28 Oct 2026 08:06:27 -0700 (PDT)
X-Received: by 2002:a05:6122:2805:b0:5ea:c11b:432c with SMTP id 71dfb90a1353d-5ec4cc44655mr1202078e0c.15.1793199987228;
        Wed, 28 Oct 2026 08:06:27 -0700 (PDT)
Received: from [192.168.1.31] ([85.196.172.179])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd4ea0ccsm626317566b.16.2026.10.28.08.06.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 08:06:26 -0700 (PDT)
Message-ID: <5e30518c-c6d3-458f-a0ba-f202f5b428e4@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 17:06:24 +0200
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
Subject: Re: [PATCH 1/4] media: qcom: camss: clamp VFE clock rates to the
 highest level
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261023152857.2859767-1-atanas.filipov@oss.qualcomm.com>
 <20261023152857.2859767-2-atanas.filipov@oss.qualcomm.com>
 <CAFEp6-2tC+uFJSG8xOhQdrhfCqoDuhm6q0rYc6cROoUG_r1vtQ@mail.gmail.com>
 <dc87be81-0fcb-46ea-b9cc-42866cca074e@oss.qualcomm.com>
 <07f884f2-bf92-4264-a289-d40fda9508e3@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <07f884f2-bf92-4264-a289-d40fda9508e3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2MCBTYWx0ZWRfX0Fyr4KTnUHtz
 TVFXQ4Wq1Hf5AkYlpUf63One7Tv3EFZ7lC76MB2/YQHljImbKIO81aOitxg3yjbUUDdW9D3r7zG
 m02mdbqzXJFK+rUv8Wfvfr2ES1ObwD8=
X-Authority-Analysis: v=2.4 cv=SoIFe/O0 c=1 sm=1 tr=0 ts=6ae20f74 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=Q/e3f29T3Hw2hnAEzBPF7w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=D-oFrpvt22n0kU7c7gUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-GUID: puUbBokuyXkOKxEOsKAxuTXjVBCeGvBq
X-Proofpoint-ORIG-GUID: puUbBokuyXkOKxEOsKAxuTXjVBCeGvBq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2MCBTYWx0ZWRfXxLq+juJ4XZkC
 hK4F8JiZcND/5mtda4MStp332JuhNv7N1CbI5pSKQv9R6wC8ywi+8gO7SKbAir3241jvYwwThHy
 mbkhHqIHukdYQinJRNCV4BKnw703jmpOZMYHASJVOKBjU/uyYu9Ymud+v9nyqJA8ABc1GDBQCk/
 aQMlfgmbUWn7xHUWK9FULft8Cp5fwtB7PRTNu8IW7GgLyHHu0BR2OvGRJ/hHyiTAZR1eQvQI8ug
 X+YxOFmcpJ5jweI05I3Jdt+lNZy8DhPG0eJxwnjAZzC9xdOzDQMxIA+bdZXehc3cFiFWxAImyMO
 BDGpOCUlYpuTlXDVsNLCjZrwMMYceq0pUtyYM9QvxeX3U2LEQhmmD+8VKOohcay8sIknGiqKCN1
 wRF8llBCoxp723eaJreL8EX97opsx0W23eCKbnYm+R5c48xwoneG6ok1mQ9ocnuMyzplnzm7vgb
 SAWwF8dvlqUkrzUTSlQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280060



On 10/23/2026 10:07 PM, Gjorgji Rosikopulos (Consultant) wrote:
> Hi Atanas, Loic, All,
> 
> On 10/23/2026 6:50 PM, Atanas Filipov wrote:
>> On 10/23/2026 6:45 PM, Loic Poulain wrote:
>>> On Fri, Oct 23, 2026 at 5:29 PM Atanas Filipov
>>> <atanas.filipov@oss.qualcomm.com> wrote:
>>>>
>>>> The VFE fails to power on when the pixel rate exceeds the highest rate
>>>> listed for any of its clocks. The rate tables of the VFE clocks are
>>>> independent and need not have the same number of levels, so a clock
>>>> with a lower top rate than the VFE core clock, such as the SC7280
>>>> camnoc_axi clock, makes the VFE reject pixel rates the core clock
>>>> still supports.
>>>>
>>>> Clamp each clock to its highest listed rate instead, and warn that the
>>>> pixel rate exceeds it when the clock lists more than one rate. Take the
>>>> clamp into account when another line powers on an already running VFE,
>>>> so that a clock running at its highest rate does not reject the
>>>> request.
>>>
>>> IMO, this function has become a bit messy. We should split the core
>>> clock selection into a dedicated helper, as it is directly tied to the
>>> pixel rate. The AXI clock scaling/selection should be handled
>>> separately, potentially through the interconnect (ICC) framework (when
>>> available).
>>>
>>> Regards,
>>> Loic
>>>
>>
>> I completely agree. I just don't want to mix the two issues, as 
>> requested by the reviewers. IMO, if we can reach an agreement on the ICC 
>> migration, that would be great.
>>
>> Regards,
>> Atanas
>>
> 
> There have been several discussions about this topic. 
> I would like to summarize the background here and reopen the discussion
> about the direction proposed by Atanas.
> 
> The issue initially came up with the JPEG encoder driver, which is
> represented as a separate device. Dmitry identified that changing the
> camnoc_ax clock from the JPEG driver conflicts with CAMSS.
> I will not revisit the discussion about why JPEG is not part of CAMSS, 
> as this has already been discussed extensively.
> 
> Currently, CAMSS is represented as a single device and drives the front-end
> blocks that write data to memory, such as VFE, IFE, and TFE.
> 
> Depending on the hardware architecture, CAMSS may contain different number
> of front-end blocks. Some camera subsystems also contain offline engines
> like JPEG and OPE.
> All these engines write data to memory through the internal CAMNOC and
> share the camnoc_axi clock.
> 
> The relevant topology can be summarized as follows:
> 
> CAMSS device: Front end -> CAMNOC -> MNOC
> OPE device: OPE -> CAMNOC -> MNOC
> JPEG device: JPEG -> CAMNOC -> MNOC
> 
> An ICC path is already available for MNOC, and each device can vote on it.
> 
> CAMSS currently has two issues on this topic that need to be addressed.
> 
> 1. Clock aggregation for concurrent streaming, As described in the cover
> letter, CAMSS currently does not aggregate the clock requirements when
> multiple front-end engines are streaming concurrently.
> 
> 2. ICC bandwidth voting
> The currently available MNOC ICC voting is implemented using max bandwidth
> values. This can increase power consumption in single-camera use cases.
> This is not included in this patchset.
> 
> Addressing the first issue depends, to some extent, on the direction we
> choose for CAMNOC ICC support. Atanas has proposed two possible approaches.
> 
> 1. [PATCH v2 0/3] Add Qualcomm CAMNOC ICC provider
> 
> The patchset adds an initial CAMNOC ICC provider with multiple ports, where
> each port represents an engine client of the CAMNOC.
> 
> This allows a device such as CAMSS, which is represented as a single device,
> to vote independently through different CAMNOC ports. The CAMNOC ICC provider
> can then aggregate the votes and calculate the appropriate camnoc_axi clock
> rate.
> 
> 1. [PATCH v3 0/3] Use icc-clk for the SM8250 camera NoC AXI clock
> 
> The ICC framework, together with CAMCC support, can represent a clock as an
> ICC provider. The implementation is relatively simple because it reuses the
> existing infrastructure, the camnoc_axi clock only needs to be exposed as an
> ICC provider.
> 
> The limitation of this approach is that a device such as CAMSS cannot vote for
> each engine independently.

After carefully reviewing the ICC code and discussing it with Georgi Dzakov, 
I believe this assumption is incorrect. ICC aggregation is performed per client,
so each VFE sub-device can call icc_get() for the same endpoint and achieve the 
desired aggregate bandwidth. So i think is better to continue with this approach
and see how the things will look like with camss and jpeg migrated to this provider.

~Gjorgji
