Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795778248;
	b=PNpoHEehGwlnw83WmNx6YrTi0U6yrkzK2RgX7oyT5XhrB0IqUqza9pBcswcnYbkuPZuH
	 lSFth1iG8/5CzcTl0Ah2Q21ts5QipcoNh3MWzX/P8w2LR2t6F/oyUaVEhcKa/FNxI6VRu
	 95ofH0pZ/EZDd2w6u0a67Cmm/gxa0manMptJqMCoZprbUQto67VlhOLJ/RD2XCI3pyl3q
	 O5Fa5Jtz9tk9sp4B2iPjrt+xmEVTATVfTSVJiBYPpBJXjYCuyC0iVeW3vrERZUabli+Cv
	 8wGbeLXLNJ7psZo4y410sA79ZtDTRyMRYDdtlPfnxFnXoHNC9GqAfYYABi790KBPrfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795778248;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:From:Subject:To:Cc:References:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=J7aET/IE+2hW6emFP8wLbbJY1PHnS1Od0budwcNlMXg=;
	b=32mbUItTuR65AaiOq6m58mNxoZC3m1L5+nn4FEy8mD6bz6PgxVFjZeBec62Rk8SCn3Cx
	 clQRDJCPbJJke4XYau0fxySP9sESioKpXkDz829J6Go2qNX6/ImwlCfH27vrP1nNuhGGU
	 9lZRPyMiendcbSvQ0wqVA5fcdfi1jHwWwukEWowmCScwWMpZMhUSlE41LNT0C8hOYtYIP
	 6zhgWYhlfPo+Ue3ZdAHxOCdkFQuSPCn/f6JZkOcAKuiDxqPjW9Aha4NDYdpTD+QS1l7M8
	 J45BRU6JT8zeW4sUSADuZX4B7T4cFc9N7txtFATG94A6MVz0s0xbd4GO7lu9yenzzsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Q8WXuqQi;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XOi7nnMV;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 089D7606A33B
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 11:17:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 089D7606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Q8WXuqQi;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XOi7nnMV
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARAsIcM3609926
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 11:17:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J7aET/IE+2hW6emFP8wLbbJY1PHnS1Od0budwcNlMXg=; b=Q8WXuqQinCBwbiJn
	4oRswH2mSYR0tnsYMicZFgbpNJmyCzC9UonrGq9n92rlESDShcFvdSUoqKKig4y+
	PUct07VsBNXwNZiaYgydtLr+/NU6P/6lcg9Tjy5iju+w17rGhL4ktPrYYaWekp+9
	YJ108jywd0GpQR1yzdTDR5m/AGkpGB+9xi9WAxKqSvIGzgLl7xWu2STWlKBfA/ZC
	AQp7eNGB+YO2rWe1jH0z0D7LX0aDDr/7ebh95cuPpRH5N1cFSC5V+WnxKjluEBXC
	39T6dz441YC+IC33RHH64FyE+7GbmaVYIz8/tqsOuRU6uY5gLszrjNxYmPq5z74a
	BruI8Q==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j73dh9cad-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 11:17:25 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2f0651873abso58270235ad.2
        for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 03:17:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795778245; x=1796383045; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=J7aET/IE+2hW6emFP8wLbbJY1PHnS1Od0budwcNlMXg=;
        b=XOi7nnMVutF0Y7QfWmOL2L0+xNK/UkjG1RjYSJ7k9h2pNW7xK2MyO32/YZ7emLhOlx
         jOFEhMHEI5+F1Z7WuUAgNpD0snCe3tqNh7JljCSfIYgkfb1MRDtvdIRcHTZ64JRjhYTX
         iPtKQJfXA9LNILofmRsu5jEw+eWLYjZVMY9/Oq8Kq3DtKsDeT8Y5BPYwRZWoHJBmdTuF
         kEWDCQp5DwhJFQWYSWE9s9q0pcfrkTpIu7hoewtXaIcLRBU0cyEgemYwMTymIwpRtZM+
         QWLuCtibYRuJa/gPI+Ah8B5PGuAtG2NKUPKRs9cEXKtVsOA6lJwUaB7orF/BdC7CUwij
         BU7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795778245; x=1796383045;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J7aET/IE+2hW6emFP8wLbbJY1PHnS1Od0budwcNlMXg=;
        b=ePp88FS5qlb/qYCCk2FVMwjn8XSeVqIX+1fcgAXBtxd3VzNGcVM4FaocKCN2I8/Eqr
         Fikox3hyY5DlmVBIb9I+EfgRWuc8TgIFfzf96grgN+vgwr9Qca52y+uXVuWa9haZkJPe
         lhMHNMBl+XtuTl2v+XRVD0U6V0uDduPa7OrUGEVvjz8qYSf4pAV/0EyH95PgWJMhTOna
         27SIUES78kqP3/ns/AaWzwN0h/cyi6ddldnA1XNwzDD/ykzoSd7QD7VdnfvJ1rrpJNdX
         dcBwULE8OU7D+x68Q3Rx8OtltD9YjrfYISsrSCs41AlocyzUnUrUO8D6J03Nm0JJYI/4
         oGuQ==
X-Gm-Message-State: APuU4Z91C2PvCWzjiyJbyG9sND0Qf+zyU7lP7SNpS4E4KB2wthwkg/Aj
	0edr8Sej6i2W2Vx9O4sYBdinPJOjcAdFSs4GHzFeDFWMzt6Ga+GH9HaLfQb1ZEFjUcQpsq1FqXa
	rKZQ2LVBhVQx3T23K76CSJazZfqi0IMB2eKNN7krzAs5Dvww8NQT0PYUb03TGKFcERQ==
X-Gm-Gg: AZFdTZc69pmInMYrDpnmg7tmXAcQ2BPGPZ+n7rkNhBAUpefkV2IUobqYuj6X/QRgDpG
	MXQPObu7bLLMWJdFfXTDzosnNaAmXcBp+bB+A7vJpuNCIr/yNdPjB+37d+5Yi1v3eHu/VoNUDeU
	rZslHp5NXxhzUDbmOss2DoGPYf9sdSerR9T48OARwcoxJJcG8EyGVoHquunNlEPOo3jtohWBUo/
	XRqFqCwKTMHldFwygXrryVWp7Ypp+0ch2qZWsTWSynBWDWmIWJOaOMLHCQupOwi1qerTdTVh3jb
	kJD4pm8m6w36gGGgnWMS11wZla0o9ezbry8Si1nnj15Ap5bRdFd9MwevFzH7qdlCgiCSbBGwgtm
	unfN2XN0dHxU83fR1Id0IzDG+vPUJA8M7L4Jh49w+UpsmWX4wJhXccvrwa/RS7Ps1Qnzz506Bmp
	+1
X-Received: by 2002:a17:902:e542:b0:2ed:12af:13ab with SMTP id d9443c01a7336-2f03f2570admr213221975ad.60.1795778244511;
        Fri, 27 Nov 2026 03:17:24 -0800 (PST)
X-Received: by 2002:a17:902:e542:b0:2ed:12af:13ab with SMTP id d9443c01a7336-2f03f2570admr213221575ad.60.1795778243931;
        Fri, 27 Nov 2026 03:17:23 -0800 (PST)
Received: from [10.206.111.19] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0ea6a8sm116521515ad.36.2026.11.27.03.17.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 03:17:23 -0800 (PST)
Message-ID: <34619214-35bc-4ac3-8eb4-92b9d3e1bc1e@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 16:47:18 +0530
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
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/3] media: qcom: camss: csid: Stop using csid->id as
 both index and identifier
To: bryan.odonoghue@linaro.org,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Suresh Vankadara <svankada@qti.qualcomm.com>
References: <20261127-camss-routing-fixes-v2-0-b7152f0af49a@kernel.org>
 <20261127-camss-routing-fixes-v2-2-b7152f0af49a@kernel.org>
Content-Language: en-US
In-Reply-To: <20261127-camss-routing-fixes-v2-2-b7152f0af49a@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA0NCBTYWx0ZWRfXzVG2YczxDlUs
 ljB5pSIj/jTieaGsc68HY62EXPvf/iWbdRvv/FdngeZAuMzVgaoqBfCCt4DESP6bKDCSRImgXRT
 KzTa4aj7fcSo6mjB31XTudgJwBZR6ORWxCWgESyJwN8MTJXBGEgmyCrHelHVl3O9qRjY830Qu0S
 WWjde6+p3z7nCc2w3eQE4xRLByOQE/RpWwiqiBUG8Ux2n4lW/BdvJoHLopygCDjYCfumpx3v6uw
 kdC5LtndsF+nDa2IGMsytXEdHHHu/HdamBP7FAm1VNAyRv1j2cGX+Fd1GsRkjJNmmz3WkvoSExu
 7+ZAlFy04yq80UqjkOyD//maYZTRbXAxd3ZP1tc9Uv3cVI+1XBgiNKY3BjMjldaOuYzIctXKnnd
 7B5ZfqACVgdeiPSmrgu9RamW3GT3srUlhWzFF+SQcGQCmhYMzcUCMu/Z+eDIuFZUgDPOFyJHTiV
 onHR8E1RrUSm7vGeegQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA0NCBTYWx0ZWRfX10JcQC+5YvBL
 FpQWIlFAkZ22qq1YccFQAMMEPTD38pKrF0HUEpcKnf6VDPJFtH1FhMd9OFIjG4pXHbKAXTX8bcy
 miszX4tkgBrIcgolAmzamI3ptWIfPMM=
X-Authority-Analysis: v=2.4 cv=FfiiV5+6 c=1 sm=1 tr=0 ts=6b0966c5 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=cXrFbpxloNIy6EuSPpUA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: wvxTgFz2kXakKukAp3uoicbuJE6IEoxd
X-Proofpoint-ORIG-GUID: wvxTgFz2kXakKukAp3uoicbuJE6IEoxd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 impostorscore=0 adultscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611270044


On 27-11-2026 09:45, bryan.odonoghue@linaro.org wrote:
> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> We have thus far used csid->id as both a hardware identifier and as an
> index to the array of CSI devices.
> 
> This is obviously not correct, but has thus far not been obviously
> damaging. Removing a piece of dark silicon CSID2 on x1e80100 we see that
> the reliance of csid->id as both hardware id and index is a brittle
> happenstance.
> 
> A previous patch enumerated a .id field in the CSID resources structure.
> The purpose of the id field is to denote hardware identifier.
> 
> Instead of maintaining both an hw_id and index field in the CSI
> data-structure pass the struct resource field to csid->id.
> 
> Use helper functions from a previous commit to differentiate between CSID
> hardware-id and CSID index where appropriate.
> 
> A level of granularity doing csid_index() and csid_hwid() in separate
> patches wouldn't work as we need to change the subdev_init() index and the
> meaning of that index atomically.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Tested-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com> # Monaco EVK

> ---
>  .../media/platform/qcom/camss/camss-csid-1080.c    |  2 +-
>  drivers/media/platform/qcom/camss/camss-csid-340.c |  6 ++--
>  drivers/media/platform/qcom/camss/camss-csid-680.c |  4 +--
>  .../media/platform/qcom/camss/camss-csid-gen3.c    |  4 +--
>  drivers/media/platform/qcom/camss/camss-csid.c     | 34 +++++++++++++++-------
>  drivers/media/platform/qcom/camss/camss-csid.h     | 17 +++++++++++
>  drivers/media/platform/qcom/camss/camss-csiphy.c   |  2 +-
>  drivers/media/platform/qcom/camss/camss.c          |  3 +-
>  8 files changed, 51 insertions(+), 21 deletions(-)
> 
...

-- 
Regards,
Nihal Kumar Gupta

