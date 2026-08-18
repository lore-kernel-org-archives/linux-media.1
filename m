Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 277CB3A4F2F
	for <linux-media@vger.kernel.org>; Tue, 18 Aug 2026 05:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787029839; cv=none; b=mtyVcYq7EAO7WCwdWKWd/KV7hj82srOE5QhGodBITaMXIhb11r3cqi6s2kZ2VNWcCJkir8Io1R+lphCWErqkhyC2V6LYg3wpUnmbEsurhWUqBXjuIHiamiDdrjll+WMhOZluk2HvwgJELyFCxFibjNzj3THhgQlC4kbwwvcEAAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787029839; c=relaxed/simple;
	bh=FeAbcPh2BNksaU1ol+KzsK0r4wOWdTJppcdaT2TRPqs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sSOGiS573mgBiqCzpkuAbDUQKsyEReqi80JRcB9umZtHvV0Ux9XfG2VP65NwrIa5PiRlHNLTyGNvDSr6ZM0CMbuAa10w0OGgjspeM5cNIkHc+3MGqUriTsmbXGcUuDaglZzu3t1zzsZgUnDsikeo2IrMrRXqOFP4A8zDgUu33y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KeBhHxQZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LWr7poZJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KeBhHxQZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LWr7poZJ"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67I2YPpV3761854
	for <linux-media@vger.kernel.org>; Tue, 18 Aug 2026 05:10:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Rp3lIMjCbjVBjSLiXhtJRxpN1gXNwjBR1B2cE1UgyMk=; b=KeBhHxQZWxpTR36D
	Psjvj/wq85jpkNoelRCr7GA7IQCCNbmQzbbatB7HF/+kMmEmIX47iSfKo78TrcSi
	zRz5ZSG449nqvSpSoNWzt68dQQgrrECiYvvocNwe0bQUC3g/OuRn/tEfNoxb24oC
	O9wbXTcyPL56yRHFNej8KVXdeaEMBbZEEIPNDfRrpfJcoG68OgijLhbpI6ejiKy9
	0/VB2vb/qCwEl8lPPqalgpvM78u5K5Sp+CNMHTxsKImtrqVSh44YqH9H+pABffO5
	hr6Tf/yxspMv8oPqYzuJdIWNp2SdtEDSQsiwbvkCPxvoGVfB+nOTF1tlZ9n7YP78
	D4B/iQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4eqtrhpb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 18 Aug 2026 05:10:37 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84857446424so7227858b3a.1
        for <linux-media@vger.kernel.org>; Mon, 17 Aug 2026 22:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787029836; x=1787634636; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rp3lIMjCbjVBjSLiXhtJRxpN1gXNwjBR1B2cE1UgyMk=;
        b=LWr7poZJYk7Q0HTF5LwrWCT9KE4JuohiFX3PV+0O4QlVUd0fXDrxhbK9qUC7HsnJaf
         rNQ6/FfjGdng7iKIft9KFK12ZpAfHG7VeogePVdd5k2jeX8bY6RWpUdWocaW1rQ5NOhx
         99iAa6i0hHaiEY+krpniHI5EFQHpVETeZX5FI8xDeS2/vfddChZO67qTSCzgc8f5KOHD
         8rM662Fuh8v7cHO/p7py8HFJO3etIDGjYUYDEzc5M9Qtkj2opIZNy3EowEryaU1E8uZK
         7shtfAzhDB7RIFDlCqeFv1btfd4hM/u7fqWUlpYBQZxj7xPFIdJabOO0Y+5pWIN6rQRG
         ZvRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787029836; x=1787634636;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rp3lIMjCbjVBjSLiXhtJRxpN1gXNwjBR1B2cE1UgyMk=;
        b=fZsXDvOiy+3AuH1A1VwK70esLHcfauHo28cKV64lwZZiQbddwWkcWvwMujpgrNOxwm
         hbQGf6DZZ78tVgYCMSujkoNEb8z2CAVsLQ5bchMZDa3Lsp/QMHM1t7OzB75hrTYGNeeg
         cY3b82WhGZTu5cGj1lTm2C3cgEG9YcTX4yIfP1JwZTopJoW0bOYChAD6ZjCeWivsFtXt
         PBfXoomlNwbHznlMXbWCt+0nlWyS90U2H0dQVTjB+7fY4xt7EY31AZx7qgJYak/eHc1m
         fjkCjHd/UYrD21Km/8IlK5NSBkYeSUkcOsWYj27AGjR0pDUlJvroZUemVuD/JY44cx01
         HozA==
X-Forwarded-Encrypted: i=1; AHgh+RqJ6mSvbHQEuP2TRMRtanKAb81ajwL4UkE//eQka4f5zzkJrvHOx4bsdr/QgOxPn6TC7TmTmvpcAIYqiA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1NpR8XSNIAM3lz4+8+FxD9Wct9rCe+uS8Z2FHG0fwMiD1WUfa
	bWelCTl2Ye0lCZCLTRcb2ktgZqj32zDCO/+s81L3awGJpfTQ02KCgnuR6pGow/ToEfJ/up0sn1c
	bKXn84/S6kXkDlMvlbCa3foVOELpnsq8lVqbsgx8ceU31OsfOO1s9Fgxt/c3rnXzV8w==
X-Gm-Gg: AR+sD10clvCp8St2R49qGNjGMZcqJs+/KPH849UccwgeIZHxYZin63ZqFSQUvpjA91r
	DuVs6VMI1CDL8chKACIhSCGBwUq/g5d9aLURw95JXaYtDDkYxp7ZqaD2jFSNootDtJDvWNBX1/W
	jBbl5Y9s9LTvcexvh+s98lqhhH+rtXJN4qcwA4L8P5BA6DODyAiazYD/I3qQKoSqObHtoTfnC7z
	2QmcR3bppm/YCO0i8KsBuJU0a2y3zWTrytznktP0cEnmKjTI4u4yS0iBAbIgjYw4vq0IpN2ovOt
	rC98WLM3sRT0CmGL8br00LLSUJsQsUrhMIadiWS1+6e3oNDx9EVZ1P30LDb4zSoT8Z8oknj86QB
	1/O5HnrK+rgN570+wEnJVXSj9bMJV8A==
X-Received: by 2002:a05:6a00:188b:b0:845:e8b9:347 with SMTP id d2e1a72fcca58-84fddfe099cmr29499656b3a.13.1787029836085;
        Mon, 17 Aug 2026 22:10:36 -0700 (PDT)
X-Received: by 2002:a05:6a00:188b:b0:845:e8b9:347 with SMTP id d2e1a72fcca58-84fddfe099cmr29499576b3a.13.1787029835654;
        Mon, 17 Aug 2026 22:10:35 -0700 (PDT)
Received: from [10.219.56.166] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-851b6ff2232sm1015652b3a.52.2026.08.17.22.10.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 22:10:35 -0700 (PDT)
Message-ID: <89ec74da-15ed-4278-b651-5c753fa4f146@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 10:40:25 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/15] iommu: Add QDA compute context bank bus to
 iommu_buses
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap
 <rdunlap@infradead.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Bill Wendling
 <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        srinivas.kandagatla@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, llvm@lists.linux.dev,
        iommu@lists.linux.dev, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org
References: <20260817-qda-v2-v2-0-69a02e9090d4@oss.qualcomm.com>
 <20260817-qda-v2-v2-5-69a02e9090d4@oss.qualcomm.com>
 <20260817134416.GA1415075@ziepe.ca>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <20260817134416.GA1415075@ziepe.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDAzNiBTYWx0ZWRfX33s987CXEiHE
 Zace/izYERh3zfk458xMGdbjq0pcB9n109iMDUxZPNPx/tOh1khvtWjccMNKkLAyPO+fo6pOSKB
 T0LCbRNnp5j5SxRykbzkRpCc4mnOo8g=
X-Proofpoint-ORIG-GUID: pO0Gz1OkGwyJzW_hcazXGr_BezfjRVpU
X-Authority-Analysis: v=2.4 cv=UfFhjqSN c=1 sm=1 tr=0 ts=6a83e94d cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=UlZBYPnkdO8YS_jrOJUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: pO0Gz1OkGwyJzW_hcazXGr_BezfjRVpU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDAzNiBTYWx0ZWRfX54ldrkf0C+rs
 IQRa6oVlPoX8Q3L13DGEJg/VtUZ/wt2TSI/dEnh4BFjJRVYZLqG4BR4X99NH3MLk0Ol4XAwq2IO
 3gZBeY8LTSa/++AZsNdhZxAEw2WxD99cqKwN/VtdGcX63TcmAIjWs8uMvtB48Fg+EL0cfOCDavh
 lpwvMPeRyIBGVzuprekeSfSqQfF+Kd0WSFvzQb4FCHJvXusbAXBan9ixXPiX1vvRa1tbjU7Fjj0
 rCa/eV8s3QhoJKj/HlJRg+6sALzU8OoKMpzWo1Grs8fwbxW3oihCFRftBL0o3/KKlhFYpdj5eZk
 E8dRepWpfGckVlxeo3ocIS6dVE+KQl0krGkDMrSo8iy0gM7fJT4e3QZ3m0Uwb5mpWAdu2Ds/ALq
 o2puGFeM6KhKogSMoHz6kHoF4l9M0lKKnvUgUmbrYeE765p0uRpveC0tRsjE5tTDfVVejM+vEqE
 ch0KmgzsowyLd3oK4UA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0
 spamscore=0 priorityscore=1501 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180036

On 17-08-2026 19:14, Jason Gunthorpe wrote:
> On Mon, Aug 17, 2026 at 10:17:40AM +0530, Ekansh Gupta wrote:
>> Register the QDA compute context bank bus (qda-compute-cb) with the
>> IOMMU subsystem by adding it to the iommu_buses[] array.
>>
>> The QDA driver creates synthetic devices on this bus to represent
>> IOMMU context banks (CBs). Each CB device needs its own IOMMU domain
>> so that the DSP memory manager can enforce per-session address space
>> isolation. Without this registration, the IOMMU subsystem does not
>> probe CB devices for IOMMU groups and of_dma_configure() in the bus
>> dma_configure callback has no IOMMU domain to attach to.
> 
> I didn't notice a clear explanation of the proposed DT schema for this
The context banks are described in DT as child nodes of the fastrpc
RPMsg endpoint with compatible "qcom,fastrpc-compute-cb" and a `reg`
property for the stream ID, this is the existing binding in
Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml. QDA reuses
this schema unchanged.
> 
> But it looks awfully similar to the other driver that was creating a
> kernel synthetic bus for actual real HW, that wasn't well liked.
> 
> What is this for? Why can't you have a normal DT binding for the
> iommu with normal devices?
The CB child nodes are not separate addressable hardware — they are SMMU
stream-ID assignments described as sub-resources of the parent DSP
interface. Using platform devices for them was explicitly rejected by
Greg KH [1] and subsequently using a generic shared bus in drivers/base/
was also rejected [2]. Greg's conclusion was that each driver needing
this pattern should have its own custom bus type.

That is exactly what QDA does: the qda-compute-cb bus is a per-driver
bus type with a dma_configure callback, following the same pattern as
the existing host1x_context_device_bus_type that has been in the
iommu_buses[] array since 2021. The bus creates devices synchronously in
probe, calls of_dma_configure() via its bus callback so the IOMMU
subsystem probes them normally, and tears them down on remove.

[1] https://lore.kernel.org/all/2025062434-reviving-grumble-1e53@gregkh/
[2] https://lore.kernel.org/all/2026042442-luxurious-antonym-f20c@gregkh/

//Ekansh>
> Jason

