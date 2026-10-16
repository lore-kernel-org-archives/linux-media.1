Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26121478E5F
	for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 11:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792150570; cv=none; b=QRH70Q5ya3hVNBqX9Te0AlHACkhHPyUDugfZE1CDCOjK8gf4SennErxwtCyy+zDAmTUL5MeBZ1uRzOEklGFVfNWmshczRIQwUxsE7v4HXb7FTrRBArMjVNwkWsPhNdi5jOfI7zYWvV0khRMg18Hc+OQvAEQG469jpXn52zlH0CE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792150570; c=relaxed/simple;
	bh=t7vjI3D8+2hpRG8hMeo2NZw/dSf9FKKg05cLMXn7q38=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Mtn0fSNo8mNPSo/NTcsr5gr+xSrUU+/30OHRDzKWuXH1rvqUyzDl9cXbOyaO9bIQc8vYnQ687pTIK9C21Exc3edEyyxMazrwRoczyyuLdgfAJg5f5WAvOcWWdnduWD/5f/Ose5a4YxIEP8hU7KXlcg7w7BY960K8TswX6ETNoLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mVQ2E3tN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OII1qXMo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mVQ2E3tN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OII1qXMo"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GAAL0L488592
	for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 11:36:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p9ksAcVBjdGqd34D51W9ej9hy2JTcpACMlbd8wtFSMY=; b=mVQ2E3tNY9aRs3L8
	4d2tL/WbYSrzKEFQiibEOcePQM/k8n8ntLf3KrIqPiT9azT80N7Eds1o7OcccYQF
	7mB/NuOT3K/5PhUYFZRSR19kJ5q8glTYGTs/leNvodLhY9rzXQ+QpQF3TyJ1GqIX
	6jjsiDapMcLbsO2UzvLVvJEoaDhWRAsE3ohr56BxGYKZS9IqLY3kwbSsKkEFUsf7
	WyMX86GD5Js7c+U6AKabfe3wRsLrvmbXYnSwgM/T1NZmMEnCBTrdAlP1Xhr9YaqZ
	5eBLklcsU4ARdxUC5kXdpMRLKxcR3XbCqcqLlelIc0nqQBMrWqa8mL4LUKA40oer
	4IK8/A==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbcjt9n7n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 11:36:07 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-341eff9e381so17618146eec.1
        for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 04:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792150567; x=1792755367; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=p9ksAcVBjdGqd34D51W9ej9hy2JTcpACMlbd8wtFSMY=;
        b=OII1qXMoxmrElYD4oCjGt33y2mvWi9VWKg64j6VAFAd8QlxHWIwNzIciJGFR9+A1um
         /jrebh+WBjXFPZFOwD+PCCBYBCiMiOICdQ8ykvnkZ3BlT2MIqJ+8RiGUfUFVD4Uw38JK
         MfsSuwuYiMKY6fkb9dRjJ5FXnlaMND9Wj5ftZckmV7Ijnq9A8In3ZxMxop0BYZjyVi29
         SvdcjadWnM3sNT259azTe1Mwc5DbxuV9LvHjufpIw9RtAMUKaYashWzCFQ779QxrJdps
         cv4fSy04793JZXZe1gAR1FQ/Jq/NUdWpwzfMWFJV76CwLlNplNmPb6ZYfwFyelyrMiqD
         CK+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792150567; x=1792755367;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p9ksAcVBjdGqd34D51W9ej9hy2JTcpACMlbd8wtFSMY=;
        b=ixltpopb44JTtJ2ai6GWpnyhCk+ttOGi+4PgDjgIpDorFgfqIVXRT82Uwlu80zxjgI
         bpBGvNIC0v+f1kLti5ByWsY5uQn3Q/hXEwTaBCa72nmV+ES31wx1ExqYZcLwDy1AVrFV
         5t55UlcuccHMX7S8dbidUSXvRXqYpjLiw0I4msoZb16EkRUEIEjFGgegfE0uoQj0irAJ
         FWwHaf6l3yxwuyKzJa8CGTIYIcOiLZaP9S3KZPYjmN2jU2XXOrlvL8Kdlb/xvuQMT6be
         9OGAJD2cJg/HpKQXuKvOJYzs1kQhrNy0T9iMz1iz5ofalQZZK4mqeZtwYBUhdgBlXO2S
         qF/g==
X-Forwarded-Encrypted: i=1; AKwUvBwOndrGh3oawlotyPkbRROQA0qoVnnBUTTEjkO2Ow+ORQhMnFh+YPFvoQpP+29zHSQVE1W/eYLH0u6Cwg==@vger.kernel.org
X-Gm-Message-State: AFq9FYLa/cRXZWGgB5uJq0CMOh6gnfv6FYt1TrPbI1iJIwaUvpUR6JPa
	aFhiW2gBc15CV3vGbzeaxQ1eSZ8sivVdK8IcSeItyJgiGdqGtDt7s0cxcnIJuV4jOnGpTgvEv3Q
	3xsXNz7dT7tPqQdVWMPHhhdCsHXXh/AJxsmKqckta/AV16nxwnvvsTQ8lnSS8x6ntFQ==
X-Gm-Gg: AYBFou1C7yXgq1SMtK1EYGAS5imDNQh+l4e+Yx67z7f92lLxzMfYNIpOwA1ftm8BhBl
	Q+IQ1TaFHs08BKYf2htbEGVznYXp++yh638zQfDLPMxavGjbpllOT+Bvura35yzhzbjHAjIfdeX
	iZ+S8IgyLTFyc/l/37CTDarYl8/Nmp85/1t+530Mm968c5bQeo/mtxxLQbrOtg8rt0kc8eAGIEI
	qf44dk8fgybUd2U8J9FTTQYszpo0tu6G5VJMDwjfXSC/yMx1u/iz6PD/M7Zti71RbE1f9RWI4bk
	QXNJS0uPcdd5a1ULOccGqY16sB6D19w6ao+GkeQYG0YvOHy+7xGjsWyeW3WfVfwHpjjekj2cI5G
	O3LimjvFPK2CGZbI2og/U4tSHcz4=
X-Received: by 2002:a05:693c:60d4:b0:359:2a1f:520 with SMTP id 5a478bee46e88-3592a1f0673mr27197011eec.24.1792150566622;
        Fri, 16 Oct 2026 04:36:06 -0700 (PDT)
X-Received: by 2002:a05:693c:60d4:b0:359:2a1f:520 with SMTP id 5a478bee46e88-3592a1f0673mr27196976eec.24.1792150566030;
        Fri, 16 Oct 2026 04:36:06 -0700 (PDT)
Received: from [10.206.111.19] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3608308a87csm10678942eec.28.2026.10.16.04.35.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 04:36:05 -0700 (PDT)
Message-ID: <b92c91ba-6a1d-4c9a-8c5c-d4ed7654cc99@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 17:05:58 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Subject: Re: [PATCH RFC v2 1/4] phy: Add MIPI C-PHY mode and configuration
 options
To: geocausa@gmail.com, Bryan O'Donoghue <bod@kernel.org>,
        Vinod Koul <vkoul@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Suresh Vankadara <svankada@qti.qualcomm.com>, tjose@qti.qualcomm.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20261016-x1e-cphy-rfc-v2-0-377654253193@gmail.com>
 <20261016-x1e-cphy-rfc-v2-1-377654253193@gmail.com>
Content-Language: en-US
In-Reply-To: <20261016-x1e-cphy-rfc-v2-1-377654253193@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA0NiBTYWx0ZWRfXwG9x3xlTF62F
 ooH127VjMi6Os4SlJOxcep4MlG6qNv4MIXqsC8XE8m6a8tUY25E80cvPhN5FXhHSQdN4Zxt9qQN
 hubs/CvQqX6yhdnGYPsmutMTQ5El6nLbLEjHqD1ned/GFnChEcl2gSXj9QoA579ENax/PQPsyDL
 LOQyniwUU3p1egWc0mON4m/DRuk8Qm/AXcVEGuk0YljSPX4UawvIekZuRqeSrAkhdrdx3l8zc2P
 7bLP5vZnHY/RzpmcTYleagizM3NqmqOmvqgouxRfpcMGq5VqxIIoCi+o5pd24a6UX2KV4nFIpVB
 BWCPuEE5bGESSZOBenjMWIACkYJbBx+Skto6zDBUY/HmHgFyw7ryHp/pKkZUPpLhYxxUt+A96qz
 hN0wFo3b4RVuFdBHqzyVxb6E/FbCYAznXTcrBJI+ae08f9SRczm19e/0kcrHEh2mCAhgG3Wgb7w
 w3YxfhnGAgKFmigcVFg==
X-Proofpoint-ORIG-GUID: tddZ970r541NvhNxKUJl_4VuOvdnf-BM
X-Proofpoint-GUID: tddZ970r541NvhNxKUJl_4VuOvdnf-BM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA0NiBTYWx0ZWRfX77t8AF4TvQQq
 05mTASxE7LK+XZGMx9uhyZMpRv7CNxbXURakyJDPlDzadJMNh7I1X7I8WvoeEoLCRKkXueB49Nc
 vZfCrvGo2+3ZToqyx2Nb/veYLae1cQg=
X-Authority-Analysis: v=2.4 cv=VpS2kO2n c=1 sm=1 tr=0 ts=6ad20c27 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=KKAkSRfTAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=XL7EWEVnQUwZ90-4yZcA:9
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0 clxscore=1015
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610160046



On 16-10-2026 16:27, George Neacsu via B4 Relay wrote:
> The first user is the Qualcomm CSI2 PHY, whose X1E80100 instances carry
> the C-PHY front camera of the Surface Pro 11.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: George Neacsu <geocausa@gmail.com>
Reviewed-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

-- 
Regards,
Nihal Kumar Gupta

