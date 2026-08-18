Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F423AFCF2
	for <linux-media@vger.kernel.org>; Tue, 18 Aug 2026 05:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787032343; cv=none; b=qvkn4VW5Eqoi55N/VnMi1d15/thK8s7mKgou/ToD6ZBsSm1TK36jDeWQfWW9pU1PEl+WwRdA0jEpsuXDBQQHijh6M4qjqPrIck4tAIkK3rvW2RaQi1XKLa1JFbqXcN8KgG5ut/BTV/8z6gDnlBixXr5PDun5nlvL2auk7lRB/+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787032343; c=relaxed/simple;
	bh=Vqa8rQTBY3Zk3hkVDjVZQpf12nyCayVJDNTfdX7cKMU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=krDkvEvmDETSBGWZKMjQPKh4phcFyQstefGClP/8xktRC2aDUmgqCsmv1AWH92/GzRCxWDm6owq7htinM6OstJA1/KjfcrkyzFYMLJSqfsnSdn8gV58yG4IHEYxEPMEEeJk+LSWo+W1225EornbAPZZKe0hwIrV2IErjlVWHFPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SldZMb+Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f3wC93tN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SldZMb+Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f3wC93tN"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67I33vaF3298706
	for <linux-media@vger.kernel.org>; Tue, 18 Aug 2026 05:52:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xjYcnSrjSmgMzkRMxQam0GLR8tuJBIbwpiu16ja4GG4=; b=SldZMb+Zwc0l7/OG
	VMJ5pOsnhgpR2d8vJWDIFpUgn9RmdHDUlNOxDuTQ1jPuhIfd4zNWZYhwBkQFtXZU
	5t1uSxLpO5uIbAg0oUQUantoiZCuNBdpwDUOyooVOivP5ujX91pf1tqA3E138In5
	p7ajf20i/n1Guk9Z1wfhuh9dTFdvf2p9jtX1wzQbuUPCgYJGvER9q8h2oSjIkE9K
	LlwMujYMfVLZw34PIqC86VEgA9pOAfYQ158AwCI1rw6qtMtjl+djaoaM6T7XHt3j
	BPLnCBbUkt+apwC0A+IZxEpDEpCRhoPz+IV7DJLbJvrljST7LqCm1DiXASw6AtAz
	9CGDYQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4f5prn11-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 18 Aug 2026 05:52:21 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cc86a9ef97so85137145ad.3
        for <linux-media@vger.kernel.org>; Mon, 17 Aug 2026 22:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787032341; x=1787637141; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xjYcnSrjSmgMzkRMxQam0GLR8tuJBIbwpiu16ja4GG4=;
        b=f3wC93tNOUlH2z3ca9/zmOoAAQCWXwE4ncuVAOc3/VwbAVJfPjUJ+GCUIM18q1rL9T
         zAfPrl23g+jpCHFETlBmTdl3wZaKyYN08ld95rRff8Lj/IFyFYihTN+W1v+jTsiLHgU0
         4b8FfNdPNOkCZARUbv9Tw1mLlYwtclOT6nENFbSkSb2inU2XKozUyhxxCNgb0CrgSAAY
         G4ZPZ6bN6id8pd+rFU7Hz34eNmJDRcX7nKWiQH6dVwYuUaj4jmqwJQ6CgIDDuEXPTuzV
         iAk38lcd8zRZtPLDckVKAf5r0NIhOeezNB0uaBb/0CBm5kcHOvmdgLd5KF1LddNivBvj
         PLOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787032341; x=1787637141;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xjYcnSrjSmgMzkRMxQam0GLR8tuJBIbwpiu16ja4GG4=;
        b=GPWacMyvX/TUUJ6CpZeGkje0b6wyKztTaJaCaegqAGzbsl8EuUyC4rygxniCKfoLf1
         xS5+BEblYgHrDY/kDLqqP9oBa+LWJoSWeHLCPuyoILKmAeZMAnJX0vkjCCFGCYJvv6Pv
         OFJYMbnqLv/TA+dP8EYUXitLt+ocHbxhM8X3TnXek3uB05iTInRZGRSD4RW/Pfc7LCfO
         BHVllHo3hNrrIaJ7bLEseo9MEMaPoe2N84XfDK230/NcyKWeu9POm63wdpR+jE1glIWA
         pWfXyeZ82uEW8Vs0jeSo9lr1E3R7yOaAHz6dt076f5TaAPtjTsEixy5tNPr43kroLGKM
         B/Sw==
X-Forwarded-Encrypted: i=1; AHgh+RpmiSeI1GODn/H2pFOZFy9r3a2i/NAWjnl11WJ8Fz6IeAnZS+EFvWp7G4K6hmtr+nuzqHRqlenjAsQhkg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxQ70ie7In7Zmtvy5GAvq49Xx+ocI1FmF+aIMGD4nWy9M72v3de
	vWfEhKAxV0dy5sBpsmpzwp7T9T8QEGChVTvqC66tFFVfVE56NaCbDv1+Uot2CARIbmo7s4LO1BQ
	vwFHihcEAKAcnrNpb/UbAPVvw3XZkdAnexMBlEyk4ypVju8ZeVHAoq4u2t9mPK1NwQA==
X-Gm-Gg: AR+sD1313czes46mzSHg3t7XT2ASksfAs1Wgn38mC2O5DGDr3s+n3yPmKqFlChl1wUH
	eW0M4UxZABoUWEWb2LYRC9yratqCV76lvurOo7h84/OW9EsdEY/0hQpxpW989B91grzWWqC9Z5/
	b7SsKhIiNvcv3HXfV4HqxSRY1qYdmSL6FOweRQGlNOocVXoxVT5SAz5dIa9SNtOaGzMBaiqNEEz
	Ag590ik2b0QiDJh8e71DBv9Aobq7DrKfkHb56Vyp//GVgTRiom72oAdBqWQUt9Se7e7bugwU+pX
	TF+MB1BOVKj6WwdEmE1GySBxp+c1HF+vwnP0faMtgitbAJv8QMgW6jbwcj/8RtDkJJ6gjRGiPwf
	xkGzBt/vtrz6BAyBN3Z3h9bPo1umj4Q==
X-Received: by 2002:a17:902:f543:b0:2ca:6eca:492f with SMTP id d9443c01a7336-2d5c5381b3fmr57275045ad.14.1787032341114;
        Mon, 17 Aug 2026 22:52:21 -0700 (PDT)
X-Received: by 2002:a17:902:f543:b0:2ca:6eca:492f with SMTP id d9443c01a7336-2d5c5381b3fmr57274255ad.14.1787032340674;
        Mon, 17 Aug 2026 22:52:20 -0700 (PDT)
Received: from [10.219.56.166] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d5c1ef0147sm10197055ad.77.2026.08.17.22.52.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 22:52:20 -0700 (PDT)
Message-ID: <50b067ad-0ccf-4b9b-9116-c95f40105140@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 11:22:11 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/15] accel/qda: Add DMA-backed GEM objects and memory
 manager integration
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
        srinivas.kandagatla@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, llvm@lists.linux.dev,
        iommu@lists.linux.dev, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org
References: <20260817-qda-v2-v2-0-69a02e9090d4@oss.qualcomm.com>
 <20260817-qda-v2-v2-9-69a02e9090d4@oss.qualcomm.com>
 <pm5yr7fovkav4cuat5zqn3ngf2fxzrqutsgyaobwp5djv4xkuv@in7n4o3x3x6y>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <pm5yr7fovkav4cuat5zqn3ngf2fxzrqutsgyaobwp5djv4xkuv@in7n4o3x3x6y>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=S+/pBosP c=1 sm=1 tr=0 ts=6a83f315 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=5LPJMhapKY6Lgul3swkA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: vrApHGbWNRVbg8Q0OWX7uq0uz64kM0SE
X-Proofpoint-ORIG-GUID: vrApHGbWNRVbg8Q0OWX7uq0uz64kM0SE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA0MiBTYWx0ZWRfXwazcoc10urEJ
 ByZAxmm0DhIKBMk4d44v9LZzfxQhwLGtXbRdWg9cm6xWS7o3HXlWvuskGUlrMAQuDM7c/VIxNNL
 OXoShOo7qUtxpuRvT6lofXaVJeKjuDR9caTFv27Nvv42DiTNMGnflmMJqmpld525i7jNGcOxNVy
 CVrfjE5zNUYXI3Bh68sReFHzpxUv4hpZ7y+9W6SfhFEjBZPwJuTvLxucjoxQxQnqcqrwUeYqP3I
 CHrHuEMapaxvKpJs9nhJSpH2dlnAbX17khqfimUI13e8PeZg424v+h3zK2FrqlYXuCYiYXX2jNg
 G7empurRw9sGm/DuTTWeqlJvgmLn3Zs6u67XGrlV87fOhB1CUeEoBbaOi3XApEr9TCSap5BBdCv
 nn1bD9G+imwYgytZoz8JXONbfMPxWhYU43KRoZhBNwIdgQu4+YZZrbhv8PRwAwMxNzXopdh5a0N
 XHPtUgz5ltLvA8AjlcA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA0MiBTYWx0ZWRfX5YZrfaLG5p1K
 UlMhOxw2xzT1RIKIUSGc6MDFjNf4Zn9i8giSsCRB97+3B9MqOjsfdNNOVB/9Yx+R6NI/94Ei+OD
 66YwGWVD+a62SVKQsQst3/AB+8xHtIw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180042

On 18-08-2026 09:18, Dmitry Baryshkov wrote:
> On Mon, Aug 17, 2026 at 10:17:44AM +0530, Ekansh Gupta wrote:
>> Introduce DMA-coherent buffer management for the QDA driver, wiring
>> together the GEM subsystem, the IOMMU memory manager, and a DMA
>> allocation backend.
>>
>> +
>> +/*
>> + * The DSP identifies the IOMMU context bank from the upper bits of the address,
>> + * so the stream ID is folded into every address handed to it. The DMA API only
>> + * ever sees the plain 32-bit address, which is why the context bank devices are
>> + * created with a 32-bit DMA mask.
>> + */
>> +static dma_addr_t get_actual_dma_addr(struct qda_gem_obj *gem_obj)
> 
> Let me propose a very simple rule for you. Unless you know what you are
> doing, all function, struct and macro names should start with qda_. The
> to_qda_foo(), I think, is the only example up to now where you don't need
> to have the prefix.
ack>
>> +{
>> +	return gem_obj->dma_addr - ((u64)gem_obj->iommu_dev->sid << 32);
>> +}
>> +
>> +static void setup_gem_object(struct qda_gem_obj *gem_obj, void *virt,
>> +			     dma_addr_t dma_addr, struct qda_iommu_device *iommu_dev)
>> +{
>> +	gem_obj->virt = virt;
>> +	gem_obj->dma_addr = dma_addr;
>> +	gem_obj->iommu_dev = iommu_dev;
>> +}
>> +
>> +static void cleanup_gem_object_fields(struct qda_gem_obj *gem_obj)
>> +{
>> +	gem_obj->virt = NULL;
>> +	gem_obj->dma_addr = 0;
>> +	gem_obj->iommu_dev = NULL;
>> +}
> 
> These functions are called only once. Inline them.
ack>
>> +
> 

