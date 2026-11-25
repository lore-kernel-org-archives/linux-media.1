Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795600059;
	b=lfg2dv7qtsg46LZTnqfnpjQ4PXa2Y1kIDDbEuHnlY+VAMYifd00IPVZEWxAoU/qewa3b
	 V6+DbtGqE4UEHYi8jdKWKwYb6DGb88poEsAK1WdD2rphBPiaYhh8edafgjilxT3Ozl6t+
	 E1gVMDxVoxW7tF3GSCvb1LJW2HJS+HzU67P96vTsc3RY2SKEHKWLvsRpMvgoHiC14fmUT
	 SLXQ/FuoKKHHwn4vwu6+jmxnh27PA9CplaDMk+Z+ShszkYHpod0Z3fCaqB2ud4K4Ku8++
	 duhtZq52yMq0rlJ2Mz+OXpnc+nk2ItFoYH457Wv3hC3hdTHAkpXxecvss46S9YD9BAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795600059;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:Content-Language:To:Cc:
	 References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=OwU87xqwIWm/ab5GQ5FLlgo1NwEN7wDgRAgaqiwRAOI=;
	b=EwtEyt9TuAbvMSECXZ4psBER5SvfF7D9jUPr60CWm5g77GFm9bIxwtw4sLrHF56Kkv0Y
	 DXWK6mIm60YJSwD88pBA0NuGVSy6wF9tWr4+4l8ufk0ur0j4br2xgtplfYiWMC9qGDi7c
	 yxukD4rISpnj2bAcJ4DXV9lQUvmO9XTSJBJ8tmYg9StTlgoCYGH38vEEEjoL0zcxfjrNp
	 YaX2aIbWl4UX1kBp1Swv36zsCfxwmnDgwd1Ej4oPVB1dJGN+H4kwS+MUN4rOqtoKJJ+JQ
	 UwI1bLVabKQ2C97YHLmMV0N4Hp0gCVhWICdnJVUf56aM36XpspdjOs1qr/7C22CfQTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Wc0v6/T/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=I8o74it+;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9094E606A321
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 09:47:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9094E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Wc0v6/T/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=I8o74it+
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP6d2Mv3601426
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 09:47:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OwU87xqwIWm/ab5GQ5FLlgo1NwEN7wDgRAgaqiwRAOI=; b=Wc0v6/T//zOgi/kV
	Dvnswvuqy8DOPsBRut8jHdj3lf8SBHw6Rg0jgoG39nISG6LcbRjYmnyu1EJcZqSH
	RvAtqFrd8xSy5lWjeeMNwT0dQxT/SXjKgQiFmNtnuDCBHDLdJgX6P03eMcPztGXF
	gBtD5LfkQJmvmfUJshiBwB+BLEh4RYaxF1ZoHWQeqx3c0ColoeOu1gLqD7Po6pO9
	rKGZGxTY+4nimE3YIrdBL9ONTqZhofqcq1lRb2rw45FKJ+OCtPP26N9VqzN2wo7X
	+8nxqSBYlcTeESdO5yjmQ5lrm34BhNLrlgxG43TMejfRbh2DiR89GMmb6ocD2owp
	2LyLgA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5mqbj454-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 09:47:37 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-386c3309469so1762549eec.0
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 01:47:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795600057; x=1796204857; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OwU87xqwIWm/ab5GQ5FLlgo1NwEN7wDgRAgaqiwRAOI=;
        b=I8o74it+Za/xLr7v7u3b9UCBNHYvaqdZBN0XPNAkSR1gb01DqMMstfX6KwDpTOFpFw
         D11qI1v4JU73d95w+UNCl5qt6mOzhJz/Z1W5I7aH2ialqUNCYe3yB5x+RFyb6EcgusnE
         iB4E3qAF6VKLu6aunshk6TQDFDhBHnck6XwWyLSlXYnnTvTjbxBvXbZBk3NVs95/WU9B
         fbsLv6EtOBZUe1F/Wz/Ll5h87JgpmU0VpuLZGgTM/YXRi7iALAnUnj5Bxl5deFxpGnSo
         GQMZfhRNerbjAuZ10hudgK/Fb06Dar2spy/gewdBlzBs0E/KKHaBHz8VHoNsiVwB/0x6
         iKMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795600057; x=1796204857;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OwU87xqwIWm/ab5GQ5FLlgo1NwEN7wDgRAgaqiwRAOI=;
        b=b5bCyMYuNamkI8h137EGcLe2nF+Zcjf7t9XnhJftBJN45gXFfl62ayYpf5vnJQYeY5
         tl7AJBDRjIuDVNw7xRHMjicIgS7jgpYpNB1r739BPnenFyWbxkKthQ0SBem2SjkeSb7B
         puWpBRyq90wXY8FKPpKbepm8GWNDCdzSadTyoroClS0DtzruAS1hFIk+crfoJv4huUhn
         dnFUxkMH+O4VMZJ+pbLc3WLbwQ75R16zG6ipEM/0FhsJN/4lo7cV74xRYwt1+Nc6LhLs
         7XmoTd94C81SfbkIweyUUZa7BAinPgjr4smcCTstfqrpPO3sMxFywooKR2/7U1sOvOVt
         UEtg==
X-Forwarded-Encrypted: i=1; AL+hErHjMlq7Z/nJQCm6HTRNi7pvhy+W314xWTfKBxv+NxSa2uTm7dKUnGbVA0W45HqpWdhjqGq9L1Wkn6jH/w==@vger.kernel.org
X-Gm-Message-State: APuU4Z/uvRtW5CXcRv6yq/wUbTs82Lc3ZkmwBzLDiO5K8LQhz2WaNcRL
	FwsTikjuJQyNH+2ufCqelXMNKSZBUr5c/4Wf97tzjIWBcYDtJiwcqzvAUcMNGxhL85D7BkOZkSi
	2dPsMgSxDY7tbV7sNOW9+HmHeetGNeGpkjbggDtEPFxEgKL4SD02IFzHgcKuGp3EYVQ==
X-Gm-Gg: AZFdTZeuiLmMK2nraiMDQ2lCcPp/OspQ/xf1M6vEzNC79Ed0rCDwsZulwMJW9eRji+D
	QnfePqGwK1xMnx+gji8AQJgbpGy/qA+mCuyqQqHJVGzVfwAjT2eVCeVg8sHEA92KKvaegQmk5vV
	cNnyyvxXNudS86KKM95l5+jTrDG6E4bhvJnSObCH/Fg6XIKQbePCPK/15OxW/+VctriEL91uwit
	gQs8m0TYYJbGd4CbcpsR+pPthaKF4e4cOrYieDmFOLEKTVyYlntNB/r/lMdlMcV20hMXUtx3VJe
	4Z+7cOrONq2M3Atnzmqrgp1uk/2eV6WCDualr5RVL8Fnbt4d/iEcnkLlVKY0smicJZDlzoEQzh5
	GthVFxr0O3f08dxTtsq9GEaMOBtjQXmUYWVttckht5Svd26Sf2gbgOQKl6pFFopbq/Eu/1GTy3M
	+0kQtnYQ==
X-Received: by 2002:a05:7300:881a:b0:385:8aea:11bf with SMTP id 5a478bee46e88-3858aea13eamr20788265eec.41.1795600056876;
        Wed, 25 Nov 2026 01:47:36 -0800 (PST)
X-Received: by 2002:a05:7300:881a:b0:385:8aea:11bf with SMTP id 5a478bee46e88-3858aea13eamr20788241eec.41.1795600056302;
        Wed, 25 Nov 2026 01:47:36 -0800 (PST)
Received: from [10.206.101.140] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd4efesm54307397eec.12.2026.11.25.01.47.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 01:47:35 -0800 (PST)
Message-ID: <3cbcbde4-39bc-dc36-72a6-b5171ee6730c@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 15:17:27 +0530
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v12 2/9] media: iris: Enable Secure PAS support with IOMMU
 managed by Linux
Content-Language: en-US
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20261125-glymur-v12-0-5c34dfd73fc2@oss.qualcomm.com>
 <20261125-glymur-v12-2-5c34dfd73fc2@oss.qualcomm.com>
 <20261125082430.ekstreufyimdwhzt@hu-mojha-hyd.qualcomm.com>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <20261125082430.ekstreufyimdwhzt@hu-mojha-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzOCBTYWx0ZWRfXyScabtaz7njc
 iYxUN28+HG8TSYeBmzuoQSqB20FwUcp6rC4rDf+f2yRd7UFY8OYE/2jr9CPfC7iawfflvrIthEC
 VUQ5Fp4m3Q69O3noKix43wiiZlUi7fY=
X-Authority-Analysis: v=2.4 cv=Bb9NQbt2 c=1 sm=1 tr=0 ts=6b06aeb9 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=dg-V5EUWANZTljz0_-gA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzOCBTYWx0ZWRfXwXBzb8RwHByA
 5pYachvhBX6aQSmeb5i4RUNFuMphYppgWZUL8++57oFPMD8axUMhhglVd1UlMZaMNGlnkDl1xyh
 feJ6y5OFwWtULQZSts6dnMuTO8nGAC1tFr6IFf6YYVkuGN7Ypbzu/GZg85licOMsQNNw29Xgu8U
 V1te4UqRHm55MCvdbT9gAe5zEMYazqgB1THKL7i9P58O+hKbbRx8wkLe3UmnknGRJlHJ7UmbFs2
 +aHXyvY8EIIfJt+T1PdTq/V4Pql4nME8dm5qMa21ICHKNsoOvnqN4UFqn1XXmBfABtQdmhNxjfd
 Obaoc0mFvs1pzOCx2B04OmICz5T+wA2wX7xH+DsfiKU2fLo7Xn1NQbjii0ZlhnzgrEq2MpeaeAu
 ZtLL6b/WvJ5OstYdaIIFdp97ktdfP9x0xqODVIvnq5AGGbKOIFyNXF/x/6rcwkd7rYxBRjgBqHg
 wnAleFnZIt0rcMJ6eTw==
X-Proofpoint-ORIG-GUID: Gz-Aa9kLzG7jQ6F7p9EkzXmzpXlhzmeG
X-Proofpoint-GUID: Gz-Aa9kLzG7jQ6F7p9EkzXmzpXlhzmeG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250038


On 11/25/2026 1:54 PM, Mukesh Ojha wrote:
> On Wed, Nov 25, 2026 at 08:54:09AM +0530, Vishnu Reddy wrote:
>> From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
>>
>> On platforms where a hypervisor is present, all Secure Monitor Calls
>> (SMC) are intercepted. For qcom_scm_pas_auth_and_reset(), the hypervisor
>> registers a Shared Memory (SHM) bridge over the Peripheral Image Loader
>> (PIL) memory region so that TrustZone (TZ) can access it, forwards the
>> authentication SMC to TZ, and upon return maps the PIL region and
>> triggers the co-processor bring-up sequence:
>> HLOS -> Hypervisor(SHM setup) -> TZ(auth) -> Hypervisor(map+reset) -> IRIS
>>
>> On platforms without a hypervisor, Linux drives these steps directly.
>> The SHM bridge infrastructure required for this is already upstream [1].
>> To isolate firmware memory in its own Input-Output Memory Management
>> Unit (IOMMU) context, a dedicated stream ID (SID) is required. This SID
>> is specified via the iommus property of a video-firmware child node in
>> the device tree. A firmware device is created from this node and mapped
>> to the SID.
>> The presence of the video-firmware child node is used to detect whether
>> a hypervisor is absent: when the node is present, Linux manages the
>> IOMMU directly; when it is absent, a hypervisor is assumed to be present
>> and these steps are skipped.
>> Extend the Iris driver to support Secure Peripheral Authentication
>> Service (PAS) on platforms where Linux manages the IOMMU, by creating
>> the firmware context device and performing the necessary IOMMU mapping
>> when the firmware device SID is present.
>> [1] https://lore.kernel.org/lkml/20260105-kvmrprocv10-v10-0-022e96815380
>> @oss.qualcomm.com/
>>
>> Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> Co-developed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Link: https://lore.kernel.org/lkml/20260105-kvmrprocv10-v10-0-022e96815380@oss.qualcomm.com/
>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>
> Looks like it is almost two month after which you posted this series,

As listed in the cover letter prerequisites, this series depends on several
patches that required review and any follow-up updates, if needed. Since this
series would not work without those changes, posting this revision was delayed.

>
> So, I posted a series to move every mdt loader user to move to new pas load API.
>
> Please review this as well.
>
> https://lore.kernel.org/all/20261116162148.2864501-5-mukesh.ojha@oss.qualcomm.com/
>
>
