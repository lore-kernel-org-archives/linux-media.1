Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB57F48FF6B
	for <linux-media@vger.kernel.org>; Thu,  8 Oct 2026 10:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791454771; cv=none; b=b8BMAeF0UZUOtFNvLmzzEupeW89RBA3NAhV5Hx5rXTi1pB1JIVQ+tpQIHKBzYp4fWazrwxry9c3hfU9ga3hQCVyd44VOAdKp+fio1DkJmFDI5NxVdZDfamSJO9VlMU38nXDB3eKSMvGiE98tV6wFjQFS9zq7VBdlF+vSnuHW914=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791454771; c=relaxed/simple;
	bh=Q+U7N1X2iZ8frTocNg8k7yx0PelE5xfCMhY0GDGx7nU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mUgrXqtiohbWuOfY2imvV40IsytuxnMRlP4b4lZKaTzdKJP02G7m25kXGaGOOLbrzGtPY5SGo6lwf9EhfgyW28ificBFsLmKDRppXffdYJi85vVG8PFahMx1Tz8mpYmAZZkQmwgjWjGNhWSUZ3OyWIjdbiqB5HsBegblTelydME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lp7fiQ4V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C1LFGctu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lp7fiQ4V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C1LFGctu"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987L3wm2068024
	for <linux-media@vger.kernel.org>; Thu, 8 Oct 2026 10:19:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=S92mSD6nzFAHFvI5wGu0aDKr
	kCuwEVmxByGF5utkGRw=; b=Lp7fiQ4VcAu1MS6PlRHXbvCKrkUUV0yUBUzrQNNP
	Derk7SJx0BYRNygC7aa1r6/C2uL5O4e7cMxEAGvcM9NCjxWgKQnm8nNyU/KC6DUf
	HsvWN4GufGZnQBXYvcttPcNjH2V92q/zTXtk1lJKnHro1tLt6jcV89iGrcwazIOG
	RYenwL2Ds/aDSBwody4KZKqm+hcDOHHt7zYcYOpXvFIODh3UvaUINc4QCtcZHOmz
	w+qj0IiUY+KW+1z+XjtL7bP8SIxG0H1B5MEr3nrw6zX/c3sEOuToEXyktOg5Z5fJ
	+21GIyE2m2DHkU4RqA4SF3TSWXTRp3SVwiPnIRLilrNa9A==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe3jdtb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 08 Oct 2026 10:19:28 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-914321eb48eso75831876d6.3
        for <linux-media@vger.kernel.org>; Thu, 08 Oct 2026 03:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791454768; x=1792059568; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S92mSD6nzFAHFvI5wGu0aDKrkCuwEVmxByGF5utkGRw=;
        b=C1LFGctuu8gS7jj4n9dGjG4JO1yNTOYdvfPmmgtWKUN+P8exwW3bPHBfLip1fZkQOu
         F0jqZyKkVNHdKI1uowmhmErrHKPq1/nM4lMmrKAGi28/UjSQtJ+pi0jQscL1WCKIgOxG
         cZoz4eum2FT2y60XI/kCsgCYSGaPlXYY98I+EcVMjdJjvuTt0vkKkX+jFm4G5ekLWpWX
         HzebHtN1NatPgGrzdju9//IdZ231uQYcCChLQp10evzT4FVR7ihxDIrSAlPnfsL9c12J
         +9t1SB6y9u2X1n5NGuM4I4Sz70PWTBxxOCQbauLGOsDoTPn+kSgmazGzn5WA+RYFBFXU
         3mAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791454768; x=1792059568;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S92mSD6nzFAHFvI5wGu0aDKrkCuwEVmxByGF5utkGRw=;
        b=fdDXI50dzMF6qVskhSPxJoY1tohTloD2Fo+20Jl2Y/GN9DqwtUHpFZADUvNSBT5yeT
         vJbuvMAyT4N4njkDZICaFlm02B7CyjSdKDb+SfSjP1HwopBZTGeqpCYrKVMAYD7lej48
         2HTvSa/5vg5W2x/orjzmxMMl5Pt7g9YlOAWflW8j+ilnJucCpf4yS6gwxUn4zEzedKZi
         z3DvhCe+6QSjV4zZtwZ3vQupWAYEelg6nQQC2LWqQbPhT0IUPhq8N8jaBI5Vox4C9XkM
         8sHmcsa9MuVh+RllGz6cI+w3cTQi43Ni3Jk8GN5PxSna3BY4y1OP1TV4gDH2qmHcCLMj
         QH+w==
X-Forwarded-Encrypted: i=1; AKwUvByq8AInqdcWVuSIE42ekcXDwU1X1t1QNTiLpF/Z1H3VGSuETQoAOvOp6vpDS+8xZ+OMLnFlp/+L9nrQtg==@vger.kernel.org
X-Gm-Message-State: AFq9FYIGsXKV7wS5PdUFFNIV9GBda+v2Bo5CtmikHeThOjKibv0Nwehh
	Qvz9kpuPGlED+ej8Wuxh497n98hw0Zismigsje0/HHREU4iLPjlyq4UtYNV/fdDD+fz2BIgfqCY
	G7RgmUxE0TiQ9+1jqYaNCy7PBl9hfiTLspFuBIFY7gymsiiwTI6mxzc9zWH0WndiOQw==
X-Gm-Gg: AYBFou1DbyT2lPpVTXqoY/TVv+3aw0G1X/oIx2izKzhe2bmlNImyllmcDZcvp5S83LZ
	KPaaLvv0NK+Ht5Iyl3HxyoGe2ZGI4l8kas6v3KDO+llvqepFEO2n9CZ4OH9fSBR2SeuTWkNMQYI
	+Hc/hCqG8ekcB3ul6zCiWI16OUyHIQsZuld4mN30o/jVHbuSS0v/FIMh5EiLEpUxbMbPMQt6BbL
	1bQE+WDJl5jwTH8y0ZEtjngA9/GMq8S5WOCxCZHlhyzmZlkMGrqSMOu1qghuMSHnf8YQ5R7pmHD
	DcOxqFpQH+q3VSl7HJ+Th5qN4eMHCkvjTXpkL1ME8K4cX55s3k9/bNrL3bCk9L2rsNqzxj53tX6
	bbbcmRP53IRr/cuzLj8AkkZ+ptUfxUy+wgDpYoy0CSlmZTS+o3BebaziPqYAbrlatUQkJWj0mt9
	PoHqZaPzwBI5JR
X-Received: by 2002:a05:6214:f0e:b0:90c:b843:d679 with SMTP id 6a1803df08f44-9199784318amr96342086d6.29.1791454768008;
        Thu, 08 Oct 2026 03:19:28 -0700 (PDT)
X-Received: by 2002:a05:6214:f0e:b0:90c:b843:d679 with SMTP id 6a1803df08f44-9199784318amr96341536d6.29.1791454767485;
        Thu, 08 Oct 2026 03:19:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a9a1d756f3sm16832381fa.25.2026.10.08.03.19.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:19:26 -0700 (PDT)
Date: Thu, 8 Oct 2026 13:19:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Abel Vesa <abelvesa@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, iommu@lists.linux.dev,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH v5 11/13] arm64: dts: qcom: monaco: Add Iris context bank
 subnodes
Message-ID: <tokbngwltq6n5aeu6tcl7hgbpfugxcipptbj4a2tkpinlr4vxs@vlilcuxjtt5k>
References: <20260926-vpu_iommu_iova_handling-v5-0-0322ca5dc10c@oss.qualcomm.com>
 <20260926-vpu_iommu_iova_handling-v5-11-0322ca5dc10c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260926-vpu_iommu_iova_handling-v5-11-0322ca5dc10c@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=NchzRGD4 c=1 sm=1 tr=0 ts=6ac76e30 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=e5mUnYsNAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=G2U8quZLHxfXJRKprjwA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA0MCBTYWx0ZWRfX4qV5CW8Wh98x
 bgIkzG9xBhqEUTbk6a4USDq1bfZslGOOcbFARn0L6BoYceW1TmRMRKlpKqubZPzjBfOm3oNiGjm
 P8y+LATNdUQQ0dnRKcU48tt2mGcLUBI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA0MCBTYWx0ZWRfX4NGCMobS0VZ5
 ZWWvUX5U8nfPdkC66ggy9d65QyprrBKuiGA5nhS5ZLAvlWk+BuONbHtkwG/5o4b7i1+Gqzdm95d
 m5ufRLQJ0KAZUeY8I4vE1vOSL6GLb070NR6+idFttIVae1O582J1MAewn8O42upLRULQKMNBRH3
 RBTAcABgQWswn8TJoQT0b+pDBevHiGdWleK1mmBq2tihL9oNQXbaVN8nPvC0fM636SMdx9r2Qq7
 X3UCNbDXQgSxtILR8NvkVTQI669R/bxWn5S4ptRPEEqas0qGF/d0KCIxzjKsaE0m7XNrJiSDQJm
 b/Q9i//zxKwkDKuMqsoQPOONrFM9NtPeLTNQWdgTwCdkvzIG9H1qzQGjyG7/UBHB35abZG1TdUg
 v0I5gl0g1LPfJ7QwdhRXE/5e0JCz4pv7+nvSo1Mv9etKQdAwqzpxic2x3WrCrK3YUI5lM/5bEkh
 dw/29Hw5FU6RYNhRiOw==
X-Proofpoint-ORIG-GUID: Eo4Kbgv9PUm6zO19ZwD54W0CiISDP4dK
X-Proofpoint-GUID: Eo4Kbgv9PUm6zO19ZwD54W0CiISDP4dK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080040

On Sat, Sep 26, 2026 at 12:04:10PM +0530, Vikash Garodia wrote:
> The VPU issues DMA through several SMMU streams, and the hardware does
> not give every stream the same addressable range. The non-pixel stream
> cannot address the low 600MB of IOVA space, while the pixel stream can
> address the full range:
>     +-----------------------------------------------------------+
>     | non-pixel stream addressable range (600 MB - 3.5 GB)      |
>     | 0x25800000 - 0xe0000000                                   |
>     +-----------------------------------------------------------+
>     | pixel stream addressable range (0 - 3.5 GB)               |
>     | 0x00000000 - 0xe0000000                                   |
>     +-----------------------------------------------------------+
> A single "iommus" property on the video-codec node puts every stream in
> one IOMMU domain sharing one IOVA allocator, so nothing restricts a
> non-pixel buffer to avoid 0 to 600MB. Once an allocation lands below
> that boundary the hardware faults, which shows up as unhandled SMMU page
> faults and spontaneous reboots:
> https://gitlab.freedesktop.org/drm/msm/-/work_items/100
> 
> Given that the address range restriction is for specific VPU stream, it
> should be ideally be moved to that stream. To achieve the same, a subset
> of streams is now represented as subnodes, so that each can be
> associated with its respective addressable range. The design was discussed
> and agreed by mainatiners here
> https://lore.kernel.org/all/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kernel.org
> 
> In the past, this limitation was addressed with an iommu-map approach,
> with the iris driver dynamically creating the devices. That approach
> was later concluded to be a hack to avoid having subnodes, and was NAKed
> by the iommu maintainers. It was discussed in detail here:
> https://lore.kernel.org/all/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kernel.org/
> 
> The video-codec node includes address-cells, size-cells and dma-ranges
> to declare 1:1 mapping for DMA translation to the parent.
> 
> Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/monaco.dtsi | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
