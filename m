Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63DEE446839
	for <linux-media@vger.kernel.org>; Thu, 20 Aug 2026 13:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787231842; cv=none; b=EJKbKpHq3WTncZN26nurmE4WlVQ87W4/TpFGA4dgYVo/hybNQjeGf+HWI7WkkjwYN0sD2eItlIyNrseHzFAI0or8Un24Rtp3TxbnZq5860Y3UZrSRLEGiyvtZsaaJmxDV31Z4nQTmWdnO9mNn08G9xukw7zmBnNBMwHXeuVO5m8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787231842; c=relaxed/simple;
	bh=1CnNo5c3+W4kz6Kt7wqmydjbAinEf2KlvzTzD+ptxmQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EseZN/c4eXAHBTrUT83Fp9DKJe52HSymQQj4q9/UBpym/cpG9tsw9skB6HpifDPmrLXksXO6/vaIlMG7kTSY3Fveh8umIddQJqWqIPd2zhmsUdYLmzsV2n6oHPY6CWsijA6D7ZqQ5WpO23KWcQyAYhnAgjo/Ebm74yoO4sUIwQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gmoEhjUd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dvyUrF+q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gmoEhjUd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dvyUrF+q"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67KA3F683454839
	for <linux-media@vger.kernel.org>; Thu, 20 Aug 2026 13:17:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FRn7XK+ROzWG2rvgcKJwV7AzQsMgAI1TASr45vyqJ98=; b=gmoEhjUdDJpy3Un7
	/05JKM/eYIVdcr6EnZripaPAzrd+h18Y3/X4BYTI1o9xfVe3V9Tl9rUy2CfpyEVZ
	yrTcp/V7k5Oy31pSO4x8XRACgLa7ATmqePbt+0E12TuFjTX+1JyH/nXayvJfsYYN
	CEdwN4sv13gS3VDObVLzPhxRCSeyzH8FvRDuOD1Oc3/R5czay27AoE/19XJY+xz/
	CVLEl/bbEVrodJd/I7qw87+Ut4tMpKsAMHeMdp7WD4TqUHgocIMV6yWiRsW/2/Gx
	s0yBt/SS1Gg8oli0M66XIDC/mVKLNPqUeZPEDvIUd1gR64Elbgf0U9J6io6uPf4z
	Xmpdog==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5yg88p9s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 20 Aug 2026 13:17:18 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d63bad3d09so3121575ad.3
        for <linux-media@vger.kernel.org>; Thu, 20 Aug 2026 06:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787231838; x=1787836638; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FRn7XK+ROzWG2rvgcKJwV7AzQsMgAI1TASr45vyqJ98=;
        b=dvyUrF+q1pk4WKMhrCV9k3xjbE3iLrWg0vupzgDJA+zQu1rsZo5FuHkqVp859MdueL
         sT6LtrtzBvbTLC9xSVORPQp8rc6L7Rm1Zqg0Af/v9H9BFPQ1g88/lHUfJeILnXHQWl9h
         J9l9BKQjMHZp1Jd9HaopEwmTE42FI5INA81t1zp40UGCEEeD/xp5HK+ca5ZIzT5Qe8FE
         2dJf8jpN+0U+uwQFsUwRhz09lRSZ3LEintgmprZLHB12zQelpGDqYg0Y3HZuf8eAx9O3
         SEAwF+0IRrNgaH247dJMkNqSqVUvrgkGXPtJcBbX80UWh/frfad4DLCyLIsYqBsYedPh
         eeTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787231838; x=1787836638;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FRn7XK+ROzWG2rvgcKJwV7AzQsMgAI1TASr45vyqJ98=;
        b=RKbmW297S7wZEw+HgZ8eP9b/pkWLEqg8YZxWmf0eNtOzxa9tHvWf9jqDF9PBYDGgeT
         kCxM4Vdl79Lgn3VWztDjnaTuqV2+HBr9oZjJiWnBX+HnH5pGy8N4JGTTI9+FLhjQCcEK
         9erpMekP4kv8sf1r45N81XHiHAI5KVQ6x9CTVIP2AZU/YwKxIYO/nbrYqrSfPsK7Ie7Z
         OC5g9J3Qy6GVfBUbonyhlV+JQbWICHmnqFuraQAd8d4UL2QGIAsGBgfwh03AifOAytKG
         agLHDIC++F9sAodDhnLhIKVfL9dkegLm1wmu1P40x7hW8Lh/3QAXZp9jZ6qr9pF0W19I
         ej5g==
X-Forwarded-Encrypted: i=1; AHgh+RpIE7JpH2e04W8qUuTaQ28CR9fK1SDngNmzcQNPy69q2MCtKzkHoCloqIgQLEqkKAO402IFZ0NadyUvzA==@vger.kernel.org
X-Gm-Message-State: AFuF++l/af/xBOLLpPbcpD1CZlKYhsF6+I6sQ/mVx+tjZZW/9dnAG+ya
	SyL5XqaozrPSMYdIjVlIoOfTd838Qt+lpbf6TcDJ8PT2rxzpSEfs60Vb7gE6OTCyAdewsQZywOs
	n/JOaOzLBkqp6otUkNZIzg7MsHCsTBBKBbxw7uq/ZUH7YklmARDUPuZVpzOzBMEs9hw==
X-Gm-Gg: AR+sD13r0F4QUJ/iUftwN8+tYRf+98gYC+U3hCBDHsM7ss7y8D6YSv7iT/XBEY2xxkv
	h2iM7Y6UOxhBx0Z2A1b+Y+GwF2w+Cnm3nUBXbcfyncI7nnVR23/KZsmyFOHbcwN5UdpMq1r1vIi
	Nqh1cgUHFGRSm4ltDAbBaMGO5RmwMZya6hius+kmykpwjpsISQeHU5l/qF0LAIe7J1bulN7JxXW
	VJkqCbhG0JorE6Wb5q+0dSsCWDL2QEUrcwurdKeylgyRe16bKPkrv3tkaHyQZSQLlg8WdgYSbaA
	nxhc/14LmmQGej1JhfmST8jSDGKiu3iikvvkn2Qltz4d5/REzGfL/VQkOLQJgagbY3xaqOGoaZN
	9QhiFmrcj0zPsVuke8l694wKpwLNwLQ==
X-Received: by 2002:a17:90b:5484:b0:37d:f983:7b5 with SMTP id 98e67ed59e1d1-3958110cfc4mr24511169a91.9.1787231837600;
        Thu, 20 Aug 2026 06:17:17 -0700 (PDT)
X-Received: by 2002:a17:90b:5484:b0:37d:f983:7b5 with SMTP id 98e67ed59e1d1-3958110cfc4mr24511026a91.9.1787231837065;
        Thu, 20 Aug 2026 06:17:17 -0700 (PDT)
Received: from [10.219.56.166] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416ae143edsm32627819c88.10.2026.08.20.06.17.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 06:17:16 -0700 (PDT)
Message-ID: <d39fe14b-1fd6-476e-9e5e-f4030c60b66c@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 18:47:05 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/15] iommu: Add QDA compute context bank bus to
 iommu_buses
To: Jason Gunthorpe <jgg@ziepe.ca>, Krzysztof Kozlowski <krzk@kernel.org>
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
 <89ec74da-15ed-4278-b651-5c753fa4f146@oss.qualcomm.com>
 <20260818130724.GA5482@ziepe.ca>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <20260818130724.GA5482@ziepe.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA5OSBTYWx0ZWRfX3jWBGtDYxxb6
 ka5Hp74a27NXJRENshXV0pCQOX0sKYyAytjSxsZ5f2wdv6/JNG8YRsU+2MA+9XPQtADJJApqzFu
 MaTTHfdNUPUxuAA3/mzGFm9mG9OOmmE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA5OSBTYWx0ZWRfX6stteMpmEi/y
 mK27WKe181czjvDCGFKYDFJSF4JQ/o2MxybTN4J4m6mtK8uLDVXNRCA1wkwzSjhBADc0EgvJLY0
 BlxWODddYxvwWIsEyWXgLybvCPXO3lGCxiFSccsXCCLH04csKUHv/RyVCzYAQOb978+WALN1UUD
 nQnk6n0pFXgSajLQzus819Oy0kTiG5Zjw2dY6hLXodanK0lKUZQ8HgZvNJtDDeMdC52Y9DH4fef
 mM39i5CSAWCUvGPuV7HrIAAHufitROZcvZMqWyCz1+SOtNoVi3LBDPICUIUYcqYCbdYtC/r6895
 zf09TM/oDxwczz/1nlkmVsBL4wazoo9ekkNDZxA5NoCayxIQx6gSXMGODGQiLLRKC+vCKqDxZX6
 YgzrNOfI151NbOO0br1HsVcTOiD4bJzc85PjH5Uc0QDCkLmN7zZAb94RsrqFvH01xPiWs5Ch3ni
 7rNL37PXD0EMh0DmxsQ==
X-Authority-Analysis: v=2.4 cv=Y7/IdBeN c=1 sm=1 tr=0 ts=6a86fe5e cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=9jRdOu3wAAAA:8 a=gAPlAFmufI-heuDFQeYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22 a=ZE6KLimJVUuLrTuGpvhn:22
X-Proofpoint-GUID: o5y6FregT-WI_F6do5ICzqmpQUgs0wOf
X-Proofpoint-ORIG-GUID: o5y6FregT-WI_F6do5ICzqmpQUgs0wOf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 clxscore=1015 phishscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200099

On 18-08-2026 18:37, Jason Gunthorpe wrote:
> On Tue, Aug 18, 2026 at 10:40:25AM +0530, Ekansh Gupta wrote:
> 
>> The CB child nodes are not separate addressable hardware — they are SMMU
>> stream-ID assignments described as sub-resources of the parent DSP
>> interface. 
> 
> So this is exactly the same thing.
> 
> Read my remarks here:
> https://lore.kernel.org/linux-iommu/20260618151745.GD231643@ziepe.ca/
> 
> The DT modeling for devices that have multiple stream-IDs is to list
> them all in iommus list.
> 
> If you don't like that DT modeling then you need to start out by
> explaining why not very clearly.
> 
> There is undeniably a Linux gap where it forces all streams in the
> iommus property to share a translation. This is a *linux* problem in
> the iommu subsystem and DMA API. In an ideal world it should not be
> fixed by hacking up new busses or mangling the DT.
> 
> But of the easy options I think hacking in new busses is the worst
> option and has already been basically NAK'd for the hamoa project so
> please don't use it here for a diferent qualcomm IP.
> 
> Given several qualcomm chips now have this same issue I strongly
> suggest qualcomm consider trying to fix the root cause and provide
> some way for a Linux driver to progmatically "unbundle" the multiple
> streams.
> 
> It would be much easier if the HW properly supported actual sub
> streams as we do already have a programming model for PASID. Maybe
> some kind of driver thing to reconstruct the iommus so that each entry
> is exposed as a PASID in the API instead of an alias or something like
> that would be an easy direction.
> 
> Jason
Hi Jason,

Thank you for the detailed analysis and the pointers to the VPU
discussion. I understand your concern about proliferating custom buses
for this class of problem.

I'm exploring an alternative approach that avoids the custom bus
entirely and will try to address this in the next revision.

//Ekansh
