Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85368489FDA
	for <linux-media@vger.kernel.org>; Tue, 22 Sep 2026 18:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790100686; cv=none; b=TLc0NhagtC9MT9WSiaBc3g3IxNrpM6MwvvBJNk9Yy/U15v0mrnp3qRw1zSlqgoawP0J1sOMF2lAivSR6nX4AnBNirWfD9GCsOeGdxLtaL8vsF2STCmbzUj5IiXfHbKLtVJjUHJjwnB4OP2OnqB/gflX0QQK4nrzjJC3X4raUfhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790100686; c=relaxed/simple;
	bh=YKr6r9TaiLIpPUWDV0xkTF5KFQVZkNaHc0UaH2PmIW0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YKKM9Iy4H/8XarFSEe0brbuMwVoKZ7RofaZrat1fDtRq3wH9feJGuHj7Tpfm9POQaDP1iomeJqDTw92yGdIVlyQry7nkRRTBmo/ttbvmFPtFmquhTbsyOZbsmkPy/J4DXvMftdZoFAmI2566d6kjIn7pKpOgBUuzP3EcZ6WAkqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mq5xR74s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bYFa9eYh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mq5xR74s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bYFa9eYh"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI76TY2033340
	for <linux-media@vger.kernel.org>; Tue, 22 Sep 2026 18:11:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CWIwxqyDzc+G0ifYXGQ0NxRUVu17NP66iLLTZQkvEVs=; b=mq5xR74s0W1iC71v
	Ws9VU0XAi9kOtRct7TTaPdoE8RuEL1VVSPqK7qk0nybUd3UX+hHdBIWBMfVzrWja
	7Tpsz6h1G0PdGMgtV4dtbzWBtqQ5bBQV9hro28fTJjsrHssFqa37sALSzSnZ1+EM
	jN2T3cgXUVT+F1mfaCskhJxcvQn5C5m8quVh5KMY4S9EbYQfB5IPNOzJKTTqIbWY
	NtNuQMRxA0BhBzQpPEzIuMF16WxinLFR47a8AwHUD8oqzCmujTfSBlkVfDzTcTjc
	kj81I4PQqA8LdZ9rpXhzB6cZzMczvMe5fdoOG6u+gPAWTgKixNOwFjYDuw7HZU82
	RLOcvw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gux8c062p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 22 Sep 2026 18:11:23 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3284bbaa89dso250970eec.0
        for <linux-media@vger.kernel.org>; Tue, 22 Sep 2026 11:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790100682; x=1790705482; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CWIwxqyDzc+G0ifYXGQ0NxRUVu17NP66iLLTZQkvEVs=;
        b=bYFa9eYh/va1t6V08/+/fa/b8Xj0qCb04Ozc3qBhF6u2VC2k4v/kkXR6naAF7wSbk0
         YuYVXHNEOeNMeFbYGp4RD1I1DjlQhcIhfp/uOd5o3eGLzz7F8FNc/csFeARSnh4Cim9v
         JorqThyojkP6Cf66kdVX91cN3kafpnQtwwPtcB0AuGS0BOulGoA/sZ7+Dc6vod6qy5R5
         0KC7ISYfr3rAvlW5NSZjMVpChdLb74itVSYnOZ2+wvGRNnLBVABhzOfYp/VNwQ7Xv4HS
         vZm2EhCRpRmvwunPjZPSOsudO9yqp0vQ0/UMbINVVjKdLORKTFiYJQIWW12Kfvw3LlvN
         m4Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790100682; x=1790705482;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CWIwxqyDzc+G0ifYXGQ0NxRUVu17NP66iLLTZQkvEVs=;
        b=vXQQTjHj5RsILKsvmXolUlpGoYY/hXRxZSML0b/IPFGc1znVjFZr3GBUnQI4bMELet
         Bp7VH23Or0XcRk2QffH4kJj5GmOppGWc07s+0hYXKDJgsW0G1OZrnecpJcIjRc3nPmcF
         qdpUllPuQAhwcLwc4qn80EVzpL4TPcTJ89/HNMY0uELLWnymdMDiRC3rA3eXNxZHWprt
         MsSmkBB4LN+Pg3LGVDC50/2/PkL0uM6gZUZF5Mwerw0yq4Jf/os+jXvVFDh9XjNZdOMq
         zcm6+EdYJxovRVHNBEza5qpWAeTucc5YLRQFI7FY8YEVLJFiuUKoZ4HTTQMlQ6qTYPWn
         HNcA==
X-Forwarded-Encrypted: i=1; AKwUvBwnvmY1S6ywtowkwpZXTPsSA50d26ueI+Zmkn68T7vyCLlwjaUTRTt3buLAtCBLqU6jXQvHrhb33uFnSA==@vger.kernel.org
X-Gm-Message-State: AFuF++kZiAu81GL8FLoGZjDm3ymjl0Y7FM7CWsQiJzmRA64W78PmBUTj
	j/UOXw0WIUZbIkMXI90lswggYqBNxM2ZPFeGF+3UsAJUCLltcoSo2aSCIaynuTMHGwEJ8j0tYGL
	w1mlRFb20+AaBePqYaH/5sp46i24cs40v3vBjVDG5sbHe1ORrMeAQ+BRET2OAWF5S9g==
X-Gm-Gg: AYBFou1i7x2OLiFaZ3RcPxAfhlinzeY4M6wlQ9CG9xs0dBRAzCQ4vc024+dsCL8W0XP
	Fp+xtw64qQE8PyMLdY5PYBlJNat5eO4HrdeWT/wx/TCc8dm0k0yNCJ/f3CE15lFjUgeNNHP77tn
	nFG2B2Ycg4bdglwB01lV87BoplWoAdCynzAF1xtoVfoA4UP98B5APnzoFf3W+evdudjSZSIlyph
	kDG5FYGL3mRbBKUxn8fEucUyNzm0BNhN7HwuYmARAbUN1V365remGREYn8dj7lHWgXwrTkBOjCR
	OYt61Z3HnF+tqY19kPWBO40XgTlLG9wuWI9D+EPRYvfZuVxWxq5joYmqPrpOGYifFm1r22AOvhb
	XRwHeTK8XPEOGZSYfMFMq+desC4AuBxjPNg==
X-Received: by 2002:a05:7301:8605:b0:334:30bb:5e87 with SMTP id 5a478bee46e88-33e8e3af1d8mr90103eec.36.1790100682244;
        Tue, 22 Sep 2026 11:11:22 -0700 (PDT)
X-Received: by 2002:a05:7301:8605:b0:334:30bb:5e87 with SMTP id 5a478bee46e88-33e8e3af1d8mr90065eec.36.1790100681597;
        Tue, 22 Sep 2026 11:11:21 -0700 (PDT)
Received: from [192.168.0.172] ([183.83.143.245])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e95c7d003sm16349eec.9.2026.09.22.11.11.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 11:11:21 -0700 (PDT)
Message-ID: <7bcc736f-e994-463a-b363-9854aafd5649@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 23:41:11 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 6/9] media: iris: Add support to select core for dual
 core platforms
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260917-glymur-v11-0-e0c8bc914742@oss.qualcomm.com>
 <20260917-glymur-v11-6-e0c8bc914742@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260917-glymur-v11-6-e0c8bc914742@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI2NSBTYWx0ZWRfX0s12ha16cSCG
 xA+/SVaLuavNrv0VURXI1g1l4v2/5v58hDAkjF7HQMb71VpMdAO229XASufOWJ7D8yUG3daIuio
 fRSOMgHKPthbcUqxf7C5zHfvGS8UOHaIR4GlXAS/rddHxL7FHXD0YGbN3hZJ0MAnK0JZS3aUX9o
 IJAmQkGva7lGnEXqbwiEP27cYBSN9K897FnJDGdHirvSVQeyV+C7LjQgalNqFihTL1JDo47D/Y8
 q4b/kfNqoQN/mwgH38ynjP8aHelQ6m75xotoGUp1uc+mTVrp/VO+3ZhBffssgnCDbIbWvo6ZQLN
 VrUGqqGCw8+/NGnqqd1cyeuI7P9vxXhRKVWmKKiPE55YC6ipvnTtqAc7z+OLPWRCkeqmiR8nC+c
 oP6yuQmR5Q3Lwqy2BheC6xP2KcR/71wHG1nWvwe6tW+hRziRyfjycCTp4DOll6y5UH49Ns01uPa
 9r76asWPJyi/DB0M5SA==
X-Authority-Analysis: v=2.4 cv=P9evFSAu c=1 sm=1 tr=0 ts=6ab2c4cb cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=d+GKXRUq2vCLDWIvqUj1TA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=0GF_beopZQ-buuiTRkAA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: zbZlOcjCVPNMhuJg1Vrj4VGQZpMGZ1UH
X-Proofpoint-GUID: zbZlOcjCVPNMhuJg1Vrj4VGQZpMGZ1UH
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI2NSBTYWx0ZWRfX35I4agpqYlQp
 M2RpdPqK8gQmqPoBxjaz5kQkbBoIl8mtKUC2kPXyZ1GDAU5/LFig4hLEaz47FsUKSWePBpF8UO5
 +RASAAgyZVoNJQA+yLf/DQuzONR812I=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220265


On 9/17/2026 10:30 AM, Vishnu Reddy wrote:
> On platforms with two video codec cores, select the hardware core for
> a new session based on the current Macroblocks Per Frame (MBPF) and
> Macroblocks Per Second (MBPS) load on each core. The selected core is
> communicated to the firmware via the HFI_PROP_CORE_ID property at
> stream-on time.
> Since both cores share the same clock source, the required clock
> frequency is the maximum of the aggregated frequencies across both
> cores.
> The total session count limit is scaled by the number of cores, since
> each core independently supports sessions up to its own limit.
> 
> Reviewed-by: Dmitry Baryshkov<dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy<busanna.reddy@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_common.c     | 10 ++++
>   drivers/media/platform/qcom/iris/iris_common.h     |  1 +
>   drivers/media/platform/qcom/iris/iris_core.h       |  5 ++
>   drivers/media/platform/qcom/iris/iris_hfi_common.h |  1 +
>   .../platform/qcom/iris/iris_hfi_gen2_command.c     | 19 +++++++
>   .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  1 +
>   drivers/media/platform/qcom/iris/iris_instance.h   |  2 +
>   drivers/media/platform/qcom/iris/iris_power.c      | 20 ++++++-
>   drivers/media/platform/qcom/iris/iris_utils.c      | 58 ++++++++++++-------
>   drivers/media/platform/qcom/iris/iris_utils.h      |  3 +-
>   drivers/media/platform/qcom/iris/iris_vb2.c        |  4 ++
>   drivers/media/platform/qcom/iris/iris_vidc.c       |  6 +-
>   drivers/media/platform/qcom/iris/iris_vpu3x.c      | 66 ++++++++++++++++++++++
>   drivers/media/platform/qcom/iris/iris_vpu_common.h |  2 +
>   14 files changed, 174 insertions(+), 24 deletions(-)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
