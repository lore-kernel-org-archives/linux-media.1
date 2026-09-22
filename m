Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F211D4E36CE
	for <linux-media@vger.kernel.org>; Tue, 22 Sep 2026 13:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790082147; cv=none; b=jSDPqZYyFejCNiUL6Tl464L1WpQbM5XR2CMNVF9OXVRmAYcYgFN/JYszawLL3WJLtx4BPCFSoa0JmG1BeP7HNp1ahuFmxtfLTQp6Mo7n3ay3aRxUMewayzUSmGlQV+fOVXi+qO0kVn+i8bDJQ365CLIL4//Ld9NefLqQ7yB82Mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790082147; c=relaxed/simple;
	bh=LLUNgr+JTLVIsA7tRQ7tzGf4PiaoeK1+F2kHwWJ+SUY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M/JrqamYfSslKn6FTuakMuVZbGSUDZGVQiIVQjNAVEA3+/tSLg/YipNK5xFUNinTz9zCzpXVwmPfPcz4UDuK3NVQVdTI5a7lDz22+1BR1Pwj5Cmw2WlXLi3fQ4R/svaJmxo1QDqGE5lIChk1j43awqyaxxgfSrQW0ocSEQBICZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cq+N7rmM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OtLMKEBd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cq+N7rmM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OtLMKEBd"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MBPX3m3487073
	for <linux-media@vger.kernel.org>; Tue, 22 Sep 2026 13:02:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vMPZw4XRMMmJIbHmlyrL3fJr
	7/HG4Z5DoMUR3Yhy7x8=; b=cq+N7rmMhHSRdt792B97zQ4tvO6DSCzyCokGEWgP
	0l7nkIikD8mjnvCxj0XfM+sExJ7pauZdmeyr5WuEzEgstdeVyM5IQYkK/9jAqLHy
	t2AgS6URL3HMRrhXZ2ojUbN+pSVIDMmTiRXcP9MdDucV8QlgaL7xGIMTKLCiXSng
	1j6BY1HkLDQFRe0E22et/Koh70oEHiOcgW1caZrJhgsQ6PTFXa1ohFHBnRtRox9i
	Pj9CKtXGkjuhWudQcS/NPYIm/ycI9VoJ4k9mbcgBVQPgKEX2xTRZyYFU60l6fBpv
	o5JmEsuAEwKiszx7RRbOQRqWqH5QhM612JzYXUaAfbg+Sw==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gudw0k0tk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 22 Sep 2026 13:02:23 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-98087b0c5deso3233611241.2
        for <linux-media@vger.kernel.org>; Tue, 22 Sep 2026 06:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790082142; x=1790686942; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vMPZw4XRMMmJIbHmlyrL3fJr7/HG4Z5DoMUR3Yhy7x8=;
        b=OtLMKEBdqP3wwCHeZ3PsiYXoQF44c+9dzil/i0UztF/2kphFU4uK08ug7+Sz02UumU
         TrLDHp00ZJAoEeISMz2JBPf+Qoq0i80uCWCNdhU0AQHa4qtiNWKFUcUxO57P14DIm+42
         QkuKViPVq61WiNoLwB+Oho+qVROl4Bo+t+iTTWjgsOMQkuzIhvlSglLuLkFDUSWWKURA
         SJaaBX01Y3ZIQ3N/hvyMZtqEwWiOqkNuxn4a+6GN4ifnGhqL8hrDkbHnwWtwnmnLVrS2
         dv4mlFzn5Mwm+on5i4q6cS0JL1QCLBH+W9c78t7FsBUS6Um1HeFICoz8JiTjxfvsFQt3
         mnGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790082143; x=1790686943;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vMPZw4XRMMmJIbHmlyrL3fJr7/HG4Z5DoMUR3Yhy7x8=;
        b=pWJ9IEm6dSvvW4x0WdS38iI/ZaFtpVHdeeKcaZoZ7qIUYMEjkubxx73TQ3mNReW5pg
         8WjdNr24qRf68VKfv/v95b2WTqChztP9m/KzriS3+7vLkijIf3mIn1mWk6zQpKd8P4yw
         exaasA5/05ULKxyOZKBXjvsjTgrInWC7DTCp0eAki/lbxrpIoKPeOjCNdaT1q3nmbqv6
         LCpJvbvfIFu1d/soxskLfaTeE3+qfrjHzJTQD4c9lI197eDvnz/UXuxiOGSf1DCtWWgo
         N1H7fjbyMceFGDyRAmmPt93IDUmQzogEg+ZJe70NlLKN0s+5KaxVMrfPScTY3gJQT8hb
         Bl3Q==
X-Forwarded-Encrypted: i=1; AKwUvBy2Kvvl5t3XwhV7LwG0xNQsa1pCsvNUp9eFFMCzfg9kAp6h+ble0ISYhsTFDmG2W81AiF6WIMMaRiPO1w==@vger.kernel.org
X-Gm-Message-State: AFuF++mMdV6TvS8qvJusuCUIx9vz1JPLPf7UOJFjYdY7NTCxxx1L/R3c
	10Qd8fWKIrKqmuzXCiU8EiUFXFWpqqCHjbVDdz+xz1FM4JnaMoYfACifrzduCM6WrviUgNfJOyV
	myG31nQJs6XV1VTk3zhxA82/YJgU0Q9AAg6syOMHfqfcG0MzdlZErXLeYdhKi1uijiw==
X-Gm-Gg: AYBFou2m+wLKg7wCzt1GKJVRLBJAGm+AEUXMTJOy5btm5WNyG7J85mQSrl2n8oE+bzN
	RpXa1tPLrc55d2Y5tvXmztR6yM4ZdIRa9UripQDIctmFvCU4+WfqkuCKcy5pvYz3MeWOQCQONrE
	3A/x4kzSS/YEKes6qW3quV5/oiHSXwNSptsug6l83ZtETUmElFn/NEtE1Eo3BL8qQ+1OIFX7IkZ
	/qlCtt6AvGtIwLavmtZBCjgSUBKt2lWl2KFjtorRIrfDMbrUqO/0W91J6/UAcykdS4zz9EsLdTr
	sKIAWeUM0XvuIsDd7acckEPpapeHIhZWXogxRiMdVzbBd6ysWMesH2Cojauol4L7mJdta8HcMin
	1KYdjyc4qiD5IjNncQqEqS2i3R/mKeo37WMEmmbdxb17a+/u2VOIQl1/P8b+qpe9OoOYcDsfGO6
	YRwJATAw5dz9a5
X-Received: by 2002:a05:6122:54d:b0:5c9:c60e:3a47 with SMTP id 71dfb90a1353d-5c9c60e3d80mr5853037e0c.19.1790082142435;
        Tue, 22 Sep 2026 06:02:22 -0700 (PDT)
X-Received: by 2002:a05:6122:54d:b0:5c9:c60e:3a47 with SMTP id 71dfb90a1353d-5c9c60e3d80mr5852752e0c.19.1790082138994;
        Tue, 22 Sep 2026 06:02:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8d46d670fsm479365e87.40.2026.09.22.06.02.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 06:02:17 -0700 (PDT)
Date: Tue, 22 Sep 2026 16:02:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 4/9] media: iris: Add power sequence for glymur
Message-ID: <f5ynb3fixzn2fy4f4cjvalw7n2jbbrejd63t4p4455gktwa6yx@erkmcd6x7vu6>
References: <20260917-glymur-v11-0-e0c8bc914742@oss.qualcomm.com>
 <20260917-glymur-v11-4-e0c8bc914742@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-glymur-v11-4-e0c8bc914742@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 2q2gZi6-pL3mg5emr-D4EungITMAaT3L
X-Proofpoint-GUID: 2q2gZi6-pL3mg5emr-D4EungITMAaT3L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDE4OSBTYWx0ZWRfXyQ6oDIN5z3W/
 HGKjW20eBz+mrkDu9QAafAZ4BNT0GJh6NWXO0mEWrOtRo1zclTBQTkYvhiVeokfK2sgqykoYM5E
 Covql9eQS1PAkWLlsxwqI6Ldztew9Pv7Q65Wk47re+X9bDWhNFvzC7Ze+A5NqXoDJrIYVYtfFIN
 i2/ubQJWmWRyKtsM8m/8zTrr4SInOHhB+Yy4P0CVgypKfhYOMPf3OwGH4bazBIogJ5gJS3xdkTs
 +mNSSBjF9D98aWGE27bnEUP/vxECiLoutbH6niQk2oZxsNyCesbFGBCfgoiu4pXYS1iEX22+hps
 D0cFe7EBu7QdtyfYnnRZotZ483DvYCELqTgyXSG4qS6wXz6Ox7SUnLdIXaQoCpy410gf+2RsOmo
 PTd+Kak0hCcR9QwdlH6/Z3SZWYvLLkZm7d42YdaHmpITgUgG0NnRgjH5ENU5SuxGlkguLOt8F6p
 YE5JlQexxxsXDlTc0bQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDE4OSBTYWx0ZWRfX6aQYVMbk3a8Y
 3q/tEJYAAV2w8J90jOhQJudQ2QkYPASsnMn2Q9j/1ipq81yi3r8t9aHcH/1SFZkH22zHV95DZaq
 hbRjDwx/CBobcONu1hlr7tb73izED68=
X-Authority-Analysis: v=2.4 cv=TvFzFzXh c=1 sm=1 tr=0 ts=6ab27c60 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=7ng__jp-IBtt9HV_xosA:9 a=CjuIK1q_8ugA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220189

On Thu, Sep 17, 2026 at 10:30:23AM +0530, Vishnu Reddy wrote:
> Glymur platform has two video codec cores: vcodec0 and vcodec1.
> Both cores share a common clock source (video_cc_mvs0_clk_src) and the
> same power rails. The clock dividers between the source and the branch
> clocks are fixed. So when both cores are running, the source clock always
> runs at the highest frequency requested by either core.
> Since both cores share the same power rails, the power corner cannot be
> voted independently. Scaling one core's power corner up or down would
> directly affect the other, leading to under or over-voting.
> For these reasons, both cores should voted the clock and power rail must
> be based on the workload of both cores.
> 
> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_vpu3x.c      | 127 ++++++++++++++++++++-
>  drivers/media/platform/qcom/iris/iris_vpu_common.h |   1 +
>  .../platform/qcom/iris/iris_vpu_register_defines.h |  12 ++
>  3 files changed, 135 insertions(+), 5 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
