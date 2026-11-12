Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794490853;
	b=jTpM8qYt8q4DcneV1vSnE68QnQs1fpXoWGHlsu9Xy3fP5tuobXWl5HpLJdw4bC76arc0
	 DGlr6ojj75YpQ65EbgG1pDtArDI7YVkEE6IN1lagzywII2OKXkHeNG3TMWYe5CntTqjmi
	 V4Ffwam6bNiOERDlkiyUeQ4Q4apiJVfTxQguA5Ml7i51uC7Z4W8QhYBOZFUNGwABodTym
	 0jJRi0BWtWHWOcGBf2f6xuQPB5p7R99e7UgUsWR4s6EvcPDtyonl1B4IS5lfWd9nHYvhV
	 hiy96kpxROH1wAvqCUFQd5kDYWq0nv+Tm3qHsmlwPYCcvQhq4EXOEHr+cY40C5OPJ3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794490853;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=qKf18yeaPGfHDQplZJqxsRf6LqNoo+87TaDvh3Wdj9M=;
	b=c4V16qfs4WSM4+oLXTUUi4MUymjgplXclQ34yFnO91CcthMNiBshFp8vkwODmVSzQ/x8
	 LB8PL38f3my5Q9xXXRmZDMtL1gAhGMXqn+ERKdvtvLWqROAgfQhFhuamO4GtjbIcBFFDx
	 yQAgPORUyZSQ/RGZQpL8ssZpDh7c48uDp5oJBO+kd0DM+fnVs7xptYNnXAxjmbUlHO3u1
	 EcGN/eJCpolUVQvfGsxn6pZvcDB84N64vHpHJB2rxwY9ONm4LfxhOat5awkA3ppgz91JC
	 F5OA4qvutmknOgpwl6r1gQUjWMdFUzrZ/6zlS7ja0kylxTOXhsvZIx5aDrkFN+8HMng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MXJW4p4q;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J1ka7+F3;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85FDB606A884
	for <linux-media@vger.kernel.org>; Thu, 12 Nov 2026 13:40:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85FDB606A884
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MXJW4p4q;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J1ka7+F3
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC7iw6U126141
	for <linux-media@vger.kernel.org>; Thu, 12 Nov 2026 13:40:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qKf18yeaPGfHDQplZJqxsRf6LqNoo+87TaDvh3Wdj9M=; b=MXJW4p4qCPwmk/Nj
	siwIg8CGYz4mbx14lK8b/4E+PnycciVQXlZJAZ8KGyrp72XmYPlT6XINOryUMlVD
	nDORnlOrglRbxPRrD8Ce94CVNek//0daPypSbJ7FrPd+8429gRKZ31NGBbZDFxDb
	CQt1dWund3Qs79JYMVks4RK/cbVJ1/caZ9wFdGJgKC1/BXyL6IZ5rat16Vwp5mnA
	Ec60Smk3bCyg/RuP0INway6N9K9eppnWti6IFvRizqfIFbF5MzmukU1O7+1fLGpe
	z5VKzpKHuTBX5By+fOfQ2f41A0wbe/foYCdXKRmuYzDkNkPVbdMbfQsP3lTXjq54
	YLAyEA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw9a097ts-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 12 Nov 2026 13:40:51 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91c6c1e082bso15249076d6.0
        for <linux-media@vger.kernel.org>; Thu, 12 Nov 2026 05:40:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794490851; x=1795095651; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qKf18yeaPGfHDQplZJqxsRf6LqNoo+87TaDvh3Wdj9M=;
        b=J1ka7+F3vP3etLz821DEvFnAK9yZKftEAFZobn6gK8xarwo3HbMt7m0B+d+70dk5qK
         Z5OINJiz/T3nDrt9i8OhxCnZwOQIVdTEfmOrXTpjw3C6I5Orpf6YNyr5seinCwoUvj62
         c8K5y4yUDI9DGCZNv8Dqv4MJWga5zRsyVZ0dT0rz7dbEKeJOaNZKQedhfuIRMFLzIalN
         2d8JUbLgddFR1N6WpZEregESKUBxdWucqX31tTirsSCdvMa6POcAO2+Ii0q+O0ILjpvq
         VDKReKW2BKseBzoc21rvm+lddVyxfz5DBDAmOm7c6UiuEWip6iy/7G04UZH5aSQ4hqjF
         ILOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794490851; x=1795095651;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qKf18yeaPGfHDQplZJqxsRf6LqNoo+87TaDvh3Wdj9M=;
        b=aabWFEcb5xWEm6kfntp+sFmhcf0t10Hfgu35BxUnDlKkVhWCbCeUHmdaToOw1wAfSh
         lg2EX81+A5UEfEAE4kXvNbUi+PeGAmJz5eq4KliMgWho5YC1FQsS23vYlrY723gXwVHo
         UHKmHcrJXoQuudACcfWXz6jDIkTmwxL1yVn5GmBlsPA6VRCKNeQnjll2nIPB4awx6OGZ
         DULMkTsbDhaY6o3KniXiAOBx+HdbWM6DKuCov1/kGaraKNWQ1nga9Ro0x174eJegO3Qd
         daali/bvRHp7KIgmQwZJu96aJA4/cD+PQ/lag4dNqxpIUnGspDdpNF8RzhkGKO/ASTbY
         vvhQ==
X-Forwarded-Encrypted: i=1; AL+hErG+b9rYmZD7nnGP+xHAHrHRmg6bHLJaelwQHyIO/GRn+W1B1FaLujZE0TLHuxRxABmfrbqDc3nqJ9fLbQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9oBEf1EtuYemDRKqfcKwqkq8XwquzvopzuGoALkz8vrPaF8hTk
	HMPhEUqCtmBeNShFr36Y+w/0wj6zAGC34UjUxO8mps+QKn3ksHbQll6GSp9z4kwM6EZYCzruxz1
	Ajkssk1YSwITGyIIeiCL8/49D0o2H/I2gyOn2tAy0N7ZCcIV80C6QvpQ4ykXME/teoQ==
X-Gm-Gg: AYBFou0FbDqiqL3T2Hjzfz8nA/RVgZiL9rOlLYE8DvREYUHw07gIJBSb6HuTIF4IAmr
	fvqIJ0bONfEt9MMwCH4Iju8/IdZv+ULqQ0ng9GwzjH/IIOE7vi94vvpeFcfvcZe2a56SyFb0IHT
	RBCftI+eFKSN7nbVp5iN4+Lu1OuOyb5Bjq53gIT/VqZ1+o3igVtT9c5B0u2TPGSY0LtbqTRHFKR
	bUEy3UUjy1HtzDMiAGN24MmEESL6tseyVsn4KGXjIbSkP4bE2UhR7ldjse3h7OJGK1DQMaou7kE
	4Wi+HRBOFrEfAeZezckbTAP261/JoEfsTne9ugzsN6wlLLTKKwe9Z37hvLYgIr+4KiyAH+HUVyO
	Rk3sD+qNPQoPxs+RM18DwOgN/3dcn40h+rPiIcaVXHvFWYtg4i5p9f4SKkHuIX71e1if1YJQHpm
	gJOjxc
X-Received: by 2002:ac8:5d8f:0:b0:535:b545:e926 with SMTP id d75a77b69052e-55956e5d8a7mr45380991cf.27.1794490850611;
        Thu, 12 Nov 2026 05:40:50 -0800 (PST)
X-Received: by 2002:ac8:5d8f:0:b0:535:b545:e926 with SMTP id d75a77b69052e-55956e5d8a7mr45380501cf.27.1794490850119;
        Thu, 12 Nov 2026 05:40:50 -0800 (PST)
Received: from [10.206.104.93] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5550b942e83sm74301171cf.18.2026.11.12.05.40.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 05:40:49 -0800 (PST)
Message-ID: <dd62aee3-4f23-4904-827c-7f776c4be60a@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 19:10:38 +0530
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
Subject: Re: [PATCH v7 3/5] iommu/of: Make OF_IOMMU depend on OF_ADDRESS
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Vasant Hegde <vasant.hegde@amd.com>,
        Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        David Woodhouse <dwmw2@infradead.org>,
        Lu Baolu <baolu.lu@linux.intel.com>,
        Jean-Philippe Brucker <jpb@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Tomasz Nowicki <tomasz.nowicki@caviumnetworks.com>,
        Eric Auger <eric.auger@redhat.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Joerg Roedel
 <jroedel@suse.de>,
        Srinath Mannam <srinath.mannam@broadcom.com>,
        Oza Pawandeep <quic_poza@quicinc.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Alex Williamson <alex@shazbot.org>, iommu@lists.linux.dev,
        linux-kernel@vger.kernel.org, virtualization@lists.linux.dev,
        devicetree@vger.kernel.org, kvm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
References: <20261106-add_iommu_ranges-v7-0-5c0f72083e52@oss.qualcomm.com>
 <20261106-add_iommu_ranges-v7-3-5c0f72083e52@oss.qualcomm.com>
 <yvkcq3zirv5tz2amfbk52a7smbsqs7jrzdisq3qxzw6xkoxklu@rplx3gvxhcoz>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <yvkcq3zirv5tz2amfbk52a7smbsqs7jrzdisq3qxzw6xkoxklu@rplx3gvxhcoz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: HSfu_ANpKbGRSTPOtheOtqx3ZJcGYN_7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA1NCBTYWx0ZWRfX2g4xnJc0y1vf
 GBEjOa8j34/XYOEl+QnFJf6YjD/8LDxdyUVdaOrCoNrjaqhCLt4qIJu0xELSGZKwrv934T++F7n
 iR9Y1jU/2gsi9ijfJYewToeHMvIiNwSWB72s+Wrdt7AKcgUsTw9Um8VABk4QNl40P2qqFh3NmXV
 5uI5RAHFm169GYaXF+HRzPCn2tJUHtxX5w+DIA2GH9MX394e8wQgnX1hdyncSJ84928wD42eCSi
 32Rb9Q+iMjB+dNXpe76lQRseecxs5hq1Z/T21ZErv6nYjKn40kqCInYkB5KVkBP0niXXWakXihk
 HsTmdxdYGce436phMUAyHpiyxemO7XIJbJww6EBZF4I695GdGaMkj8wgFnXy7whvkdYjR//rQiC
 hNW2qfKCAYxnHUV7Fq6W7Ak6nY8Wdvx29AC0FUk+c0Urh+HrJ9MCN0BVtAkSJMKL4Ei1UAwk5ti
 F3JoZOBAXsWzgGDcq7Q==
X-Proofpoint-ORIG-GUID: HSfu_ANpKbGRSTPOtheOtqx3ZJcGYN_7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA1NCBTYWx0ZWRfX9XZeIukwNWzY
 J2jIn/dDDJp9zBr26EW4frW32qgd9BiSkb99Zp1yTpGDQPDzNp1D/l5tuPj+YhDOCYnbAYlaWxP
 fU7u4JMdryaZpW/7vSBD/dX9RtD3cwU=
X-Authority-Analysis: v=2.4 cv=COG/zhrD c=1 sm=1 tr=0 ts=6af5c1e3 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=UM6UlptfRCpVODDSDqIA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120054


On 11/11/2026 6:33 PM, Dmitry Baryshkov wrote:
> On Fri, Nov 06, 2026 at 10:44:26PM +0530, Vikash Garodia wrote:
>> The OF_IOMMU code relies on OF address parsing helpers, but the
>> dependency on OF_ADDRESS is not expressed in Kconfig. As a result,
>> of_iommu.c contains CONFIG_OF_ADDRESS guards and a __maybe_unused
>> annotation to handle configurations where OF_ADDRESS is disabled.
>>
>> Make OF_IOMMU depend on OF_ADDRESS and remove the now unnecessary
>> preprocessor guards and __maybe_unused annotation.
> 
> Why? What's the problem that you are solving? Why is the current code
> bad?
> 

The commit describes the problem as "The OF_IOMMU code relies on OF 
address parsing helpers, but the dependency on OF_ADDRESS is not 
expressed in Kconfig"...and instead the code had checks for config or 
__maybe_unused for cases like sparc.

It was discussed in prior rev
https://lore.kernel.org/all/20261104160346.GD3951195-robh@kernel.org/

Regards,
Vikash
>>
>> The only architecture supporting OF without OF_ADDRESS is SPARC, which
>> does not use OF_IOMMU, so no functional change is intended.
>>
>> Suggested-by: Rob Herring <robh@kernel.org>
>> Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>> ---
>>   drivers/iommu/Kconfig    | 2 +-
>>   drivers/iommu/of_iommu.c | 4 +---
>>   2 files changed, 2 insertions(+), 4 deletions(-)
>>
> 

