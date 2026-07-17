Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1893349CD6
	for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 03:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784260117; cv=none; b=DxqghsDqG+tNmFwBdFVE734CgMMc/RBKG22+UgWL3ZBykSy8Y4a+7VZ9CI61PssBotltb4GULTOFvNdZOomT0wWsoiMQ9yWLLNQX9lyUc+CFkQbI44riVoh16FoSyHHgZoq0RHRUkDuFzqha57VUZmqJ4WdXhIVy7T3vrX+4qMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784260117; c=relaxed/simple;
	bh=Sa3wk56MV2g/ndnDgfSJgHE84Rp9SbiopO4rIgP3Ijc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r02nmygvkfHiTN4p4OP/4j4hNCkZ5qnr//Xh7PHk7PjwXg9OR5/ywlR1eu7PiW0C053z8tGVry9DsYq1SCWawfirZ7/dOhh0DTH11zHD9EkSvlT7BlIWFsLP7evFxXHwgPPwgB1qZiFJA2auHRxPRu2ewF7LatKWdmlh9hVMwMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jqmxyi0B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g6eDH9QD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jqmxyi0B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g6eDH9QD"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H33jKH337982
	for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 03:48:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Sa3wk56MV2g/ndnDgfSJgHE84Rp9SbiopO4rIgP3Ijc=; b=Jqmxyi0BoBIbO7SH
	m4Ze+Co4+zLo2mX7ah0CABGEPhAjxVMyzc71vmcub7tF7atTvUJkSB44okuHQQcP
	awn8Iz15DQw4Sj9zMck6wwsJ/Gek6PjVqht7DBltNUJgKWUVQsgDIba344ThT8db
	eu54JqhePGGKoamLY+e8C3vKaEfleJx2mbpS0+vxcmxDGPTqLtRxYgSOSz7C7RH7
	30SGP307HrIG7NGIEcwgV5LKq3apqmMKpcG9lse66cO4HO++QSeAGKUrKo8qb1ms
	arGsRtJvB1OEUvCm7Oz2SbzSxhP8uAm+myA6oV+RBwNrxoY1eA9iaR6m7gh3ojY1
	1BWKCg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ff1weaekc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 03:48:34 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cee894b3d8so71866025ad.2
        for <linux-media@vger.kernel.org>; Thu, 16 Jul 2026 20:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784260114; x=1784864914; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Sa3wk56MV2g/ndnDgfSJgHE84Rp9SbiopO4rIgP3Ijc=;
        b=g6eDH9QDP1QGbOadxYNxryuYZKcaMd7QR3/VccOyX5cLUT8WuVNJ72vCPFz6uIwkoE
         abOEBNZ5iHT6UtwZVqIIJ2qGiay6B+ThbBDtXadbRRxU8+AAV9cyT70JkMbPvHvcMM9/
         ynJArGapXbLd6++wBTAhBjk6vh2CyAtAr1zGQ9vGmZQOLv/38BIy6T33JGYmpBckeySw
         ew0TXCjgS6jsGpPk/pxInA7XdfL5bQAUrVA5yJXP4pCOYc3iQkynlVq+XTU6SO4KRCjQ
         B3MNCqK/ztZdjKxzj+r1j/ewfYGF+VvpDZGWittBxZd13q9d8ft5AfaXKm9idlSGlQre
         ordA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784260114; x=1784864914;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sa3wk56MV2g/ndnDgfSJgHE84Rp9SbiopO4rIgP3Ijc=;
        b=NAifAOcZXqkm4p9ZzFIXcaCcCv5PiknGX/b01o5aFd2AF28qbJrwLhhK3ZuhuYvczw
         HR1d0VKWv3P4M+QoC4Pedqy6/hFf5yJeAGo9cebPeq7Agh24Jj8DHbK5dV9afVpJxNo8
         I2rvNQ4Bk0i8ZVOqFy0j10TFGtgm1gVxpCr5TuxexSXOj6qByyJRpO3wMAmTEE4j/Dia
         DEkoht5cHLG4NvR+VviVgrhyS6QC64ptL41LdVdgVyy3hVsMirEJwI4aq/f5vcR+/J68
         QS13NgBPb02pPC9+LQpSoW9kLFWOtDwSb8XMZlgkrcE2AIFHWtKRaBDhmDvNMs7u3VQg
         zpUQ==
X-Forwarded-Encrypted: i=1; AHgh+RouNl9lJ2JuTYhFS2/Iq5a8MMkTGB5tEXiSaQkurJBqSDS4VHGNJIp9WhN7bBuLcifIQlKKJf2WyiVf1g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzfeCNIlkbOcbe2jnaLDuChFBWr8Ffm5BPP/6OJxgw2kCFtGjo9
	pUN6WduVZDgBacwLgZGq5EBZXFakIdmMmhWGnQjmzfyQuTW4WIlobsAhmi3ilp1BUpBFmfVYWxd
	0Cxbue4uNkvfVUSDsk3eaucyKXdB9FRrixKFg7G+B/g0dQzte/yemcnBZDPkiZLRJFg==
X-Gm-Gg: AfdE7claLGmqDEmxU+X6qouZ9ORjmbh0eivjYUmwdPWKd0Rk0BVERGpljtwhfCxsJBt
	e2bWSrM+U0Ar/9+WW6fmbJvNSd1tSpfPAOHi6l7P+mo240nNOTY0yrCRvjiNacJkN1iw7y86+EY
	dbUMGDBYD83pooZE6U/tnyVEPieYXWD5fx5F/UOPVqPGxa5DlMdITgZFD7SBt/EmnkItOEPTPUz
	6FEbC5rnf995bb8vQARr6ShMVxAdzlvOG/DSdupAAy2qEI2KKXSwXedoEYos2Q+ZB5CpCj68Ftv
	BicIFW0ZY73JDbwGfKnUW2IjzNN/q8u4n8vOjiJF3W6RpCHNBcUt2SyMoEcat88PssywYLo/HS7
	cFoaQtr7o7X8zI6eS/K2ysx4hK3YNh8w8
X-Received: by 2002:a17:90b:4c48:b0:387:df8f:1402 with SMTP id 98e67ed59e1d1-38e4b57e9aamr785466a91.35.1784260114122;
        Thu, 16 Jul 2026 20:48:34 -0700 (PDT)
X-Received: by 2002:a17:90b:4c48:b0:387:df8f:1402 with SMTP id 98e67ed59e1d1-38e4b57e9aamr785438a91.35.1784260113651;
        Thu, 16 Jul 2026 20:48:33 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429fe4677sm1547122eec.11.2026.07.16.20.48.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 20:48:32 -0700 (PDT)
Message-ID: <8ebd304d-b03d-a8cd-2bf5-a45763780098@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 09:18:24 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v9 01/14] dt-bindings: media: qcom,glymur-iris: Add glymur
 video codec
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
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
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260715-glymur-v9-0-8cf2cbe12a07@oss.qualcomm.com>
 <20260715-glymur-v9-1-8cf2cbe12a07@oss.qualcomm.com>
 <20260716-soft-dexterous-adder-badb49@quoll>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <20260716-soft-dexterous-adder-badb49@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDAzMiBTYWx0ZWRfX//vneZjLr5h1
 3GicdL6In+34rzA7soWRYC8+9zQd66+YME4cyfWAr6at3IqdLfyE6zzTH9xJ/5EZn03M7CNYCQ4
 mv8jILJ+NSPzRSbMu+HiN6KobbOHiNzWDRNnjNNQrLyUcjKO9iS49xfElmBZxRwQhwACkv/nCc0
 F7AERD3mPGXg+XBtLLpIJzaqEY2hWinNQ64AdFHiyMfUI8V7JFVhAh1s8bNQS3fSy3XXzajrWN9
 8gjgoLYtYy4hZUY1Vl0+TJUu4H4AOc3PQOaIXC9vsFVKLuor6hvcE7SvoCCGbCETOVAT8XFHzYI
 MGbyPJ10iNh3cLZtpU2N3f2iwxiHuIyPM+TPn1+OHvZTKngNIKfK7ZJ/Pqq4ZHEx1rvvV+HvDrA
 e26qgLiMMn64io3R0MrlCvyjjKeu4p8WJIZKtZ1j8lIy3J1LNH1f+++FqmnAKs3qDznNag3Zvj7
 Zik22mw1aeqtIk9B76w==
X-Authority-Analysis: v=2.4 cv=JJ8LdcKb c=1 sm=1 tr=0 ts=6a59a612 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=Mf6ET5Z485SzACLcFDwA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDAzMiBTYWx0ZWRfX3BabLx+NjN4h
 nmsRNYUbI3pJDR+Ys5TmnBwQYKmoq1TCP1D028tTwAPdTVkneLBp6x6qgAHLuZAw/6v07VMfc1z
 i3W7scqdLJYuqR3v6YRZCK+DcXWv8FM=
X-Proofpoint-ORIG-GUID: _cLrU_6PZlMfyl8CP2Ne1UN2qJQ2hi9Z
X-Proofpoint-GUID: _cLrU_6PZlMfyl8CP2Ne1UN2qJQ2hi9Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_01,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 suspectscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170032


On 7/16/2026 1:10 PM, Krzysztof Kozlowski wrote:
> On Wed, Jul 15, 2026 at 07:39:55PM +0530, Vishnu Reddy wrote:
>> Add device tree binding for the Qualcomm Glymur Iris video codec. Glymur
>> is a new generation of video IP that introduces a dual-core architecture.
>> The second core brings its own power domain, clocks, and reset lines,
>> requiring additional power domains and clocks in the power sequence.
>> The current maxItems constraints for clocks and power-domains in the
>> common venus schema were sized for platforms available at the time of
>> authoring. The glymur platform introduces a dual core architecture
>> that requires more clocks and power domains, exceeding these limits.
>> Raise maxItems for clocks, clock-names, power-domains and
>> power-domain-names to accommodate the glymur platform.
>> The glymur platform-specific schema have fixed constraints for these
>> properties, so the common schema only acts as an upper bound.
>>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> You must drop the tag, you changed the binding significantly without any
> doubts.

Ack

> Best regards,
> Krzysztof
>
