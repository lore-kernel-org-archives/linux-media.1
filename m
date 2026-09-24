Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B8F40BCDA
	for <linux-media@vger.kernel.org>; Thu, 24 Sep 2026 06:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790230986; cv=none; b=FoES3rEq81t5S3LoXxen9n2Fqj7yYJBRCZ5rXo6nuxFd0o8gtWJNylQmO+msLY17k2FFtSxsD9t9Xcab3C0fzW5gx3zCTrYND17d2Q8ToECXkzxhKBvwZgOtXWozFQ0XGmiqHGGWHAN5xLnAG4xv7sI21sA0vSE1JxDlESikXPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790230986; c=relaxed/simple;
	bh=DIxSGZ8DeYjNjy6dHDVKdNmqwxDzn46HxwIrpPxP1HI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r4f65Ir/JqD7myH1u+JYyUcX1XDpsCf8XC1LoqWwtpzbBbh+b6NxkgK9LSxMVHgM7aLbthU/gsoABU0aWti7vTWCy+kfn+5x3ycmnvv0HrVZ8Y+icRQkjmt/idflXlPkzqFu5RgVv97NGw3iNJxfmAWJniNgoJLl6Qak6JW82fQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HzhmHREo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b73G8GqP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HzhmHREo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b73G8GqP"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O5eN5B582521
	for <linux-media@vger.kernel.org>; Thu, 24 Sep 2026 06:23:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PA731byDGeXSZbDTVW2VGa/gXS3hFkz79wPYyybQKUw=; b=HzhmHREo0hyXuSgc
	tWfkaF/CedPdMucb69PB8gQR/qu6FpXrsaeZQSLwyKnH1VUQ5KQ2q1aZUtAlHbc0
	OA9eBvpsdeb2knUaimhvPLTMYhplTBILqSwYP8eyifCkhjbM9lXZEkH/koqjFZ+H
	LHfaKP3YX7i/YI1+0ngroFLEhHxYvFSIOcvasUyaP8hTD62TdwOIgWjxpxXZBCBO
	5duEc9SlQWLGHWnN0TdZQ2KvFF95+NraXIcCLpBh1g4bGsx9991VZzHtO6yMkgyf
	Cfe4ujiA/7ZkseK/cIZhXSJjDlbgOo6Vvew6RfpuqVdeY+Ls76lhgEqIJ2TmyF9P
	2A1atQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvfmwkkec-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 24 Sep 2026 06:23:02 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-313d1015161so776590eec.1
        for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 23:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790230981; x=1790835781; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PA731byDGeXSZbDTVW2VGa/gXS3hFkz79wPYyybQKUw=;
        b=b73G8GqPH05guVITNpTUbZpw94uZXJlER4VyxpFrUA/uEBq7Ql54G4COLeOQafQZtc
         +FI6gBA3E17A1hGwtzlKtnml1m39KxMB5GNan0g4EH1oLZ+fN67bx3o+gDq2Wpis5S+4
         lAXIu3AL2YQG9ZZ5SvWsUz2VbF9bg3Oz6PNE8BL3gJh+yl2yBqLHpnVscOZk4YZYiU4e
         5XTNhlM5cR1FOoZvO87/SOi48U1qUsysXHunavXtB0Dr4JHixgEh7LN4eWuLmRDyj3ws
         b8dKV7Et7pQPKCtgy4m//KyksqLcGZm+ipyUVsleG7AccQ+1pHI+O/iv5iOAfyZfLhKW
         E+/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790230981; x=1790835781;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PA731byDGeXSZbDTVW2VGa/gXS3hFkz79wPYyybQKUw=;
        b=LoE8l3Ke/Lu6ej7E+4pgG2/Cmi+jH32b/2X/88/87NjhE/oXqBcong3doPRaycbYMA
         Ijz2gaFAfXY2KVkAVCHu2Upx1IZneatXmdZV+ubn6C1umeW4m1zmU1H3YZGZful24ffG
         ECoufl7+rrCQbPzzTkrkMPc/IHCNxnXfqaYT4l9My+Wtt54TuxEhUXUAsv+pcs4QGCJo
         vtiQkyy85fyIPwhSHRJrM6W9iO6JZtzdd0aP8l/yuto8jiE3SMQP4bG2wPHbwB4sBhXS
         IcGrpXlmBSkrqt+X02NVj+EWVfJ89zda9dzXameN6FYGJNG6USjIu+wwASzly4uUDcbS
         tG7A==
X-Forwarded-Encrypted: i=1; AKwUvByMKOcNZFFFYp6CMMfQEF9mqbNQ0hLHT6tVKlYb4EN+4YpTCEx7E1T3JdTa9FZE1U9q9G5/j9jsimnw+g==@vger.kernel.org
X-Gm-Message-State: AFuF++nLlduP2Uv2cXQsXImB5EgXyl807kZ915WD1w157COYHIrdBqk0
	7aRTcXUPuxkbB4yOdn3TQFDpHoOd/cEjpUwL/oEyo4p/5yYVGoc87sxlwniofYDNBZc9lOCYhnr
	jFOVrKiJHxgBLRZFEpxRx3RwtkVBIpNuyTkdxCg2T0+EACYseuoZuL7C53cCFNFc8YA==
X-Gm-Gg: AYBFou2KM2gGOeVSNQQUZIQJuA6B1FpsO3Q1STEBL1h7633hFr89C8lHv8Oh4ltVj14
	5Yl2GbqzVdchRYIz5dRMmPwPdRDZ2RFJMNKRQRAprN7g1ThZSV0NlCm32yNO51nKAMa0nDD90Db
	/SmAOK1+sxHkAFTLZddL+t6U8KSV/Z2t8ACVMRK3gQgu0zZtLRKvqVM+qZgpzad53vT0Ywx3YiY
	ZleNZg0qZ2vbCbU3aH9YU59ISiyrSnGBEeS+XAx5ztX977sOLQ16RU6c97PVvQYZnE+RZjrncD+
	5tk2jDJ5W9hJx1d9/pMwV+BJ2u+/0Dz5Kjiogu6BJ8Ot2kbDihBmx07q3BKtlmM4dT716nwPW85
	phOn2s+O/jQcN7ybAV1bvmXwQ5+n/gx4=
X-Received: by 2002:a05:7300:ec0a:b0:33c:14c9:c79d with SMTP id 5a478bee46e88-34004b8b5bamr1650020eec.9.1790230980996;
        Wed, 23 Sep 2026 23:23:00 -0700 (PDT)
X-Received: by 2002:a05:7300:ec0a:b0:33c:14c9:c79d with SMTP id 5a478bee46e88-34004b8b5bamr1649979eec.9.1790230980341;
        Wed, 23 Sep 2026 23:23:00 -0700 (PDT)
Received: from [10.206.101.140] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e96258978sm10403751eec.14.2026.09.23.23.22.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 23:22:59 -0700 (PDT)
Message-ID: <82ff93db-6478-883b-7afc-ee4db79d0353@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 11:52:52 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 0/4] media: iris: Add support for nord platform
Content-Language: en-US
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260919-nord-iris-v1-0-94428761ec06@oss.qualcomm.com>
 <arPYfVPIWblIayxl@QCOM-aGQu4IUr3Y>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <arPYfVPIWblIayxl@QCOM-aGQu4IUr3Y>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDAyNyBTYWx0ZWRfX2vgGaFnDotkQ
 uzmkWbE2gmJoA+aujQNVUGeYC+yxg/cnP4vbdTXPBDqcUlTNvwex94pljOiWH8SuIh71t2CcyHn
 Ee2nqvGPxZF6b3XTUcsiy7K51m4WJLJpC5FS4JSCuLEhw1qdCp2gijNe113gKiPTyeOzMgFmuqD
 tNHZ8kHoFC4kXZtTJKr48O5x/+B6btm9/eZL4ZcyLJIZ6w+ZNeBIIYyEHRYfvhEzkmZ9I1otk50
 kFHuOAoEqcFLobkUTJBYU6A8nfcyOj/ijKL4LKViqwRNq6qSbG8lS/Lc7ULLIjB3uFnxwtf9ZQ5
 osMvxlnESMUCyiES53U9cAQ3zqnFc10H1mgIPgvXMpYxGcsSZaQCvzjOdjdQUWb0rRzs4LFozn3
 apEN6PsuBR/7JBbP+iJqFW6camoHt1oRIZcbYtPstXeW4wfMJZ/k6tpUxS4NFRgraqZH56KAxl7
 Cg3DN7PhQJx/NxIkJjg==
X-Authority-Analysis: v=2.4 cv=WK/qzXsR c=1 sm=1 tr=0 ts=6ab4c1c6 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=RCdEPBNKmkqm1uLn_m4A:9 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDAyNyBTYWx0ZWRfX4xL9qU1WZi2B
 ZH9GL81e4URDk48a5DW7+9koQzocPBvFhtEL532E0IhiBXPrzwu9JqbG9FwCgNTd7A34GkdYL3A
 BOCwgxKEXIii+7bIEcO3eHmSFOmqfQ0=
X-Proofpoint-ORIG-GUID: V9DnGOl5bMpQCXE2OM_ULGQVq5ux3fB2
X-Proofpoint-GUID: V9DnGOl5bMpQCXE2OM_ULGQVq5ux3fB2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240027


On 9/23/2026 7:17 PM, Shawn Guo wrote:
> On Sat, Sep 19, 2026 at 10:14:54AM +0530, Vishnu Reddy wrote:
>> The nord platform integrates the Qualcomm iris video codec hardware,
>> which is compatible with the glymur based iris implementation.
>>
>> This series reuses the glymur DT schema to accommodate nord iris
>> support and adds the required iris device tree node to the relevant
>> nord device tree.
> [...]
>
>> Vishnu Reddy (4):
>>       dt-bindings: media: qcom,nord-iris: Add nord video codec
> The binding should go through media subsystem. That said, this series
> should be named with "arm64: dts: qcom: ..." and only contain the 3 DTS
> patches.

Are you recommending splitting this into two separate series, one containing
the codec binding patch and another containing the three DTS patches?

I can certainly do that, but could you elaborate on the reason for preferring
that approach? I'm trying to understand whether this is due to the expected
routing through different trees/maintainers or if there is another consideration.

> Shawn
>
>>       arm64: dts: qcom: nord: Add iris video node
>>       arm64: dts: qcom: nord-ride-embedded: Enable iris video codec node
>>       arm64: dts: qcom: nord-rrd: Enable iris video codec node
>>
>>  .../bindings/media/qcom,glymur-iris.yaml           |   6 +-
>>  arch/arm64/boot/dts/qcom/nord-embedded.dtsi        | 114 +++++++++++++++++++++
>>  arch/arm64/boot/dts/qcom/nord-ride-embedded.dts    |   6 ++
>>  arch/arm64/boot/dts/qcom/nord-rrd.dts              |   6 ++
>>  4 files changed, 131 insertions(+), 1 deletion(-)
