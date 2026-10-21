Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792581845;
	b=zarKpFmxFw5e4mGj0zpWx6iG/YIJuuL3cpn9kM2aORq36mOx7jkxNv59WJDm6WGCfY6E
	 snrio1OhC/x+R/tZ1XwuOGOZVIS9IUruUTLXlY7HGSEBNyiD/1SwOnX7JXZduifhDnKrt
	 0oyQmqtLruKnnjy8TE8Hf+wF4Qs7lREwEjlKgNvS+Azv45TijZ0cJaxXWpyjrR97SeyY4
	 1Mk8kZC7hGh801OyCl5Z0tmljEZ4xMTVoxphBpl6hCMmtdPpys2Y8WF3joOHSYyAeTrhO
	 LM56P9Kh3Hpr1El6iI3D+fn3UT6YtQvGB51ULF6GdbJc62R6lf1kgFoAmaY5inBQ+pg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792581845;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ouy+lNJFQV07YpOgTzFfZDe5bIi4Od8Q0LOxRIrmGqU=;
	b=D0JMe9vkFqU/BUqC6Icr4KRC0Cj1uDq9psdrXZJnwAIEJF/22YVDu0OIpftdbZVtrF2/
	 taD33U0shZuL3kpNa2hSu7CgtoU2MR1GZnGkzZ+cjePwScMLLfeF0M4xV3CKRPj6X6FfC
	 vnbTUz/1uILKP9H76p4BQJ68QOCdbqqsh9Aiphz30UyqS/t7CacxnBo1gWV2yLvMjvn16
	 2ePKYVRgir4y9EGxFShjTrh8Rd1hjr0C0u64f5dDBbowRakBnzysG+qC7jE0hA4Ei5WzD
	 nUMxP0oJON7YO+Uh100z5gIGMl8AseQ7rhLD/XTJlGKa6OQ5MZLxNgEJWQqRg4GTb4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XcK0r2QE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GT9ukZUk;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAFE6606A319
	for <linux-media@vger.kernel.org>; Wed, 21 Oct 2026 11:24:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BAFE6606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XcK0r2QE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GT9ukZUk
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LA5kBr3015975
	for <linux-media@vger.kernel.org>; Wed, 21 Oct 2026 11:24:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ouy+lNJFQV07YpOgTzFfZDe5bIi4Od8Q0LOxRIrmGqU=; b=XcK0r2QEfl8UDzkl
	K/afw81W8dmX8Xi6An8NA/wlU+g7WBHE0T3PAuo4AgSGg4lT5Tx8AGHtrNLc2vlB
	v86y7yaJ6wOKgfBKIqmVxh6gXm4ibLxaLt3bOSoexMoN6IIxiDrZW+dK+hTzuphT
	PiGjMCHAhGR9rzA6LdQazd/gk5Eshv5sQRM8OhXeClISnXLewDxJLX9/Xl1PKDkF
	hblX5vmd9iNM/k44G5zhOtTZbEO9fzq/U9d2qpdKvdjyaKVQkhcl5sXiq8bFCRZS
	6V0pyiSbJXq+heeDuUHAln0qvBvHC+XaBsFouB5y9myzIx3bo4fVjNapPclhOo01
	icElhw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hesy78sjt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 21 Oct 2026 11:24:03 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e9821ca96fso6098865ad.0
        for <linux-media@vger.kernel.org>; Wed, 21 Oct 2026 04:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792581843; x=1793186643; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ouy+lNJFQV07YpOgTzFfZDe5bIi4Od8Q0LOxRIrmGqU=;
        b=GT9ukZUkjFrBWaiVdPX2DI/oB/6bR0JPePYMEY4QGjyRJ4xbOvhw6bQjA/bsV0ryJi
         BrqMSkANajoEz4gyRSTWM3K7VVKlLWkg/VcMkcqJAs+AGuHcNXCK0t38f9s0VXoPV4Gg
         V2+/geCKU1SjatlDpvSarg2sbA/QZOqXaWYMjoSvdsS4+K9YTFu/JXoQiA/yh1+CZx3X
         4+qUNHyl9ERMIG4JcFrBiJww6nKfLDwt2ApvWc1yu2KZvk8KgJym7n90YIjXmrwa3m41
         Ni0UGn4all7EH49Vai25IZ5bGgKvyqk06DoGn+1h/fCOTb6qftyxoQaDcUh0p/Ua9nIc
         Eg9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792581843; x=1793186643;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ouy+lNJFQV07YpOgTzFfZDe5bIi4Od8Q0LOxRIrmGqU=;
        b=XK2Q2n48OjFhlWSoaOhjRMaquksdDHP/BlLWwN5Y8LIHg305oHRBxW0VGe13ZCrwTa
         P3kojCL8YquJaCcWfd4SjTG5281vvkJuiQPWIhDoCJm84bCtiXrzpfGc83nqpwUHUbes
         QwE17youed6+fSYggLlKFOV39s4/mWTSAHGwMYchOlsoOKu1PvM12x7fkrwgeiOLzp1j
         bS6JJ9O6leK3mUoyn+p/xSfPKac6txQRwVL/Vje4//QlBufjr8zLWZZ2gMo+awa0rESz
         8bBtcq/fZB7imRkYhRQlJOUz/v2OlDaCXKNq48pfNEgYjW6/I7ysyOK1bMpmUIoo9JjE
         5lLA==
X-Forwarded-Encrypted: i=1; AKwUvBzKw8unuc8vo3jkR2uFTehKGAmnbVU7FkqwQeqYhNzSlSYd4Bkk5lZvIpEI5VxkD9ejeYEzap2DswvjUg==@vger.kernel.org
X-Gm-Message-State: AFq9FYIYTjwsB1XyFfDor2CsDA0vO5OU60xMY5qBvUGPCGRSv1qFnkwx
	iHAfZK36AYrgMFpO8ZaKt2uGkU1sBr7LcLK/VbSJuMos7Ql8U8mhyj1vBEZ33afZQ0y/4ZdoqXe
	KzgiL32Qypmx207QWFKwDiZ5vjr8lKyUfpjT3ujKK1EEr1SbBJQtVN1CTgVGz84ZQEg==
X-Gm-Gg: AYBFou0hBFQvh82CUESuwwbzo/tSlwI3nKwWJPGYtQzg99tpvhAYZKp2VNdb7Fg1p2n
	IkotX767hYNIy1vIdh8enWtgCIr1fdsDDDuRnqSiek/fnH0bCa4vzoP2ILFgTz9abCMxqiiKiHQ
	YysLGg+52chMCrqJqDQVH3OsqOUOCRvJHc7iQvsHbZ9hUU9/L7Y4g7N7NBUDmiF9DQYcMGFjOrc
	fuoDyVGLh7WuwM/SVw3CMU69eZwgiZqQG+6RvhBkXGjWXlctsQWa3jP9HOw3AJQIDinLeKu4f4e
	Qh70NAdyCMsOJpUKV/qywgkOb2tudkbkZfYFp6yiU2rv5bI4GgYIZ//0emS7kP/+8iwJJkWRZsW
	8y0Oduv48A14Sq7vI/2oTfamMKzhfbl0x76CmE508OxLFW1EOZ5u9LG1euvav
X-Received: by 2002:a17:902:f606:b0:2dd:ad74:ac2e with SMTP id d9443c01a7336-2ea43e2407cmr14564415ad.23.1792581843244;
        Wed, 21 Oct 2026 04:24:03 -0700 (PDT)
X-Received: by 2002:a17:902:f606:b0:2dd:ad74:ac2e with SMTP id d9443c01a7336-2ea43e2407cmr14563935ad.23.1792581842315;
        Wed, 21 Oct 2026 04:24:02 -0700 (PDT)
Received: from [10.239.96.176] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea3b4addfbsm9853035ad.74.2026.10.21.04.23.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 04:24:01 -0700 (PDT)
Message-ID: <c1a0dfe9-34bb-4d24-9644-0f758aff0af0@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 19:23:55 +0800
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
Subject: Re: [PATCH v21 04/14] media: qcom: camss: Issue stream-on REG_UPDATE
 from CSID
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Bryan O'Donoghue
 <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
References: <20261011-kaanapali-camss-v21-0-04fd28d815c6@oss.qualcomm.com>
 <20261011-kaanapali-camss-v21-4-04fd28d815c6@oss.qualcomm.com>
 <3843110c-4766-4352-ab2a-6d3017336534@oss.qualcomm.com>
 <dbde0e35-8246-4f69-b3be-cd617a1767d9@linaro.org>
Content-Language: en-US
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
In-Reply-To: <dbde0e35-8246-4f69-b3be-cd617a1767d9@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: xDDwFYc4yud6vcRmSpQnd8c2siuRc80j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0NSBTYWx0ZWRfX+eGGw4ZN22Gq
 nWh3v7UOBu+YRQ1x3ekXwqZOu1fxxEh+uFyLq7J3/aU5f3sUHWrMANxs1+1T+1bYyZKrqxcwfdS
 xijCgy/DjcAjMnR3YWh8Vm8ffjW/ai5a9KNn/ez48EWoi6kPiD+vjggiIelIAuv0n9ie1YXu7NN
 eNutAHSBCBauwbYTFCR337GxEb5eqT8qPTCz8Pa2wPhYgTDhpRjikOe6DKUTdlkaWAvZGbGLaWj
 i6jY2NEdef56VSXqP1uH8hTsZ+30CKgtUynZl7TabuDco0iVsmimwQMRFcHvj7DwAPpDlepGyMI
 1iFNZhwafRFgDXbxZLiuHO4Xh0PKOUfM8sxkcWLO6MfJYkG7wTOVJqm4QNvOnu1OeR6Bf5IlPGd
 x3O/PYswmzKTbOF4ylTR/zuwvQ8Oe8hyfDerbOCbRqJLVVaboGCMY2q9vNoYlaO0gDndbELoMSW
 wJRbVfgamYEctcqQKSg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0NSBTYWx0ZWRfX4PsfP2eZo3kv
 h5yUmfg8SOsFVhD45O7CCWV69aZiThwJUe1aIx88vCMa13kutJRzVpc8IKbZqRo9ZL2fWiF4N0E
 ESiHlRH/jCAwWqIsL3wG6u1KXS4FfJQ=
X-Proofpoint-ORIG-GUID: xDDwFYc4yud6vcRmSpQnd8c2siuRc80j
X-Authority-Analysis: v=2.4 cv=IPaXmQvG c=1 sm=1 tr=0 ts=6ad8a0d4 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=S6ipaplINJmNe55hSBAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210045

On 10/21/2026 4:53 PM, Bryan O'Donoghue wrote:
> On 21/10/2026 08:37, Wenmeng Liu wrote:
>>
>> Hi Bryan, Hangxiang,
>>
>> On 10/12/2026 2:45 PM, Hangxiang Ma wrote:
>>> On stream-on, CAMSS starts the subdevices upstream from the video node
>>> through their sink pads, so the VFE is started before the CSID.
>>>
>>> Starting with CSID 680, the REG_UPDATE is issued through the CSID
>>> rather than the VFE. However, vfe_enable_output_v2() still issues a
>>> REG_UPDATE after queueing each initial buffer, before the CSID has
>>> configured the stream. The VFE then never signals BUF_DONE. Therefore,
>>> the CAMSS now issues the REG_UPDATE from configure_stream() on CSID 680
>>> and CSID Gen3 instead. The operation happens after the RX configuration
>>> and before the RDI path is enabled.
>>>
>>> Skip the VFE-side stream-on REG_UPDATE only when the CSID connected to
>>> the VFE sink pad implements the reg_update callback. Platforms whose
>>> CSID does not provide this callback, as well as lines fed by ISPIF,
>>> keep the existing VFE-side REG_UPDATE.
>>>
>>> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>>> ---
>>>   drivers/media/platform/qcom/camss/camss-csid-680.c |  3 ++
>>>   .../media/platform/qcom/camss/camss-csid-gen3.c    |  3 ++
>>>   drivers/media/platform/qcom/camss/camss-vfe.c      | 37 +++++++++++ 
>>> + +++++++++-
>>>   3 files changed, 42 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/media/platform/qcom/camss/camss-csid-680.c b/ 
>>> drivers/media/platform/qcom/camss/camss-csid-680.c
>>> index 345a67c8fb94..556cdfef6207 100644
>>> --- a/drivers/media/platform/qcom/camss/camss-csid-680.c
>>> +++ b/drivers/media/platform/qcom/camss/camss-csid-680.c
>>> @@ -296,6 +296,8 @@ static void __csid_configure_rdi_stream(struct 
>>> csid_device *csid, u8 enable, u8
>>>       writel(val, csid->base + CSID_RDI_CFG0(port));
>>>   }
>>> +static void csid_subdev_reg_update(struct csid_device *csid, int 
>>> port_id, bool is_clear);
>>> +
>>>   static void csid_configure_stream(struct csid_device *csid, u8 enable)
>>>   {
>>>       int i;
>>> @@ -307,6 +309,7 @@ static void csid_configure_stream(struct 
>>> csid_device *csid, u8 enable)
>>>           if (csid->phy.en_vc & BIT(i)) {
>>>               __csid_configure_rdi_stream(csid, enable, i, 0);
>>>               __csid_configure_rx(csid, &csid->phy, 0);
>>> +            csid_subdev_reg_update(csid, i, false);
>>>               __csid_ctrl_rdi(csid, enable, i);
>>>           }
>>>       }
>>> diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen3.c b/ 
>>> drivers/media/platform/qcom/camss/camss-csid-gen3.c
>>> index 0fdbf75fb27d..830c9c818d3d 100644
>>> --- a/drivers/media/platform/qcom/camss/camss-csid-gen3.c
>>> +++ b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
>>> @@ -219,6 +219,8 @@ static void __csid_configure_rdi_stream(struct 
>>> csid_device *csid, u8 enable, u8
>>>       writel(val, csid->base + CSID_RDI_CFG0(port));
>>>   }
>>> +static void csid_subdev_reg_update(struct csid_device *csid, int 
>>> port_id, bool is_clear);
>>> +
>>>   static void csid_configure_stream(struct csid_device *csid, u8 enable)
>>>   {
>>>       u8 i;
>>> @@ -230,6 +232,7 @@ static void csid_configure_stream(struct 
>>> csid_device *csid, u8 enable)
>>>           if (csid->phy.en_vc & BIT(i)) {
>>>               __csid_configure_rdi_stream(csid, enable, i, 0);
>>>               __csid_configure_rx(csid, &csid->phy, 0);
>>> +            csid_subdev_reg_update(csid, i, false);
>>>               __csid_ctrl_rdi(csid, enable, i);
>>>           }
>>>   }
>>> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/ 
>>> media/platform/qcom/camss/camss-vfe.c
>>> index 2680a9914765..16a0b5663fe2 100644
>>> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
>>> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
>>> @@ -502,6 +502,37 @@ void vfe_buf_done(struct vfe_device *vfe, int wm)
>>>       spin_unlock_irqrestore(&vfe->output_lock, flags);
>>>   }
>>> +/*
>>> + * vfe_upstream_csid_has_reg_update - Check whether the CSID feeding 
>>> this line
>>> + * issues its own streamon RUP (i.e. its configure_stream does the 
>>> RUP).
>>> + *
>>> + * The CSID->VFE link is created in camss.c for all CSIDs and VFEs, 
>>> so the
>>> + * upstream entity of the sink pad is either a CSID (possibly with 
>>> RUP) or an
>>> + * ISPIF (no RUP). Only enabled links are considered.
>>> + */
>>> +static bool vfe_upstream_csid_has_reg_update(struct vfe_line *line)
>>> +{
>>> +    struct vfe_device *vfe = to_vfe(line);
>>> +    struct camss *camss = vfe->camss;
>>> +    struct media_pad *remote;
>>> +    unsigned int i;
>>> +
>>> +    remote = media_pad_remote_pad_first(&line->pads[MSM_VFE_PAD_SINK]);
>>> +    if (!remote || !is_media_entity_v4l2_subdev(remote->entity))
>>> +        return false;
>>> +
>>> +    for (i = 0; i < camss->res->csid_num; i++) {
>>> +        struct csid_device *csid = &camss->csid[i];
>>> +
>>> +        if (&csid->subdev.entity != remote->entity)
>>> +            continue;
>>> +
>>> +        return !!csid->res->hw_ops->reg_update;
>>> +    }
>>> +
>>> +    return false;
>>> +}
>>> +
>>>   int vfe_enable_output_v2(struct vfe_line *line)
>>>   {
>>>       struct vfe_device *vfe = to_vfe(line);
>>> @@ -511,6 +542,7 @@ int vfe_enable_output_v2(struct vfe_line *line)
>>>       unsigned long flags;
>>>       unsigned int frame_skip = 0;
>>>       unsigned int i;
>>> +    bool rup_in_csid;
>>>       sensor_pad = camss_find_sensor_pad(&line->subdev.entity);
>>>       if (sensor_pad) {
>>> @@ -523,6 +555,8 @@ int vfe_enable_output_v2(struct vfe_line *line)
>>>               frame_skip = VFE_FRAME_DROP_VAL - 1;
>>>       }
>>> +    rup_in_csid = vfe_upstream_csid_has_reg_update(line);
>>> +
>>>       spin_lock_irqsave(&vfe->output_lock, flags);
>>>       ops->reg_update_clear(vfe, line->id);
>>> @@ -552,7 +586,8 @@ int vfe_enable_output_v2(struct vfe_line *line)
>>>           output->gen2.active_num++;
>>>           ops->vfe_wm_update(vfe, output->wm_idx[0],
>>>                      output->buf[i]->addr[0], line);
>>> -        ops->reg_update(vfe, line->id);
>>> +        if (!rup_in_csid)
>>> +            ops->reg_update(vfe, line->id);
>>>       }
>>>       spin_unlock_irqrestore(&vfe->output_lock, flags);
>>>
>>
>> According to the hardware documentation:
>> Starting with CSID 680, CAMIF has moved into the CSID. As a result, 
>> RUP is now issued by the CSID and propagated to the IFE.
>>
>> Starting with CSID 980, software must also set the SET bit in 
>> RUP_AUP_CMD after issuing the RUP/AUP command. Otherwise, the hardware 
>> ignores the command and the corresponding register update does not 
>> take effect.
>>
>>
>> Bryan, according to the HW documentation, the change itself is 
>> consistent with the required programming sequence. The main question 
>> is whether this is the right implementation from the driver 
>> perspective, or if there is a cleaner way to handle it.
>>
>> I have tested the change on the Hamoa EVK board.
>> Tested-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com> # Hamoa EVK
>>
>>
>> Thanks,
>> Wenmeng
> 
> OK thank you for the explanation.
> 
> OTOH I agree with Loic's statement - it is cleaner to subtract the 
> callback and disjunct on its presence than to add a flag to the same 
> effect in reverse.
> 
> ---
> bod

Hi Loic, Bryan, thanks for the review. I wonder if it would be better to 
keep the check on the CSID side?

vfe->reg_update() is also used outside stream-on, such as bufdone, queue 
buffer. It must be implemented in VFE. We only want to change the VFE 
behavior at stream-on stage, in function vfe_enable_output_v2(). So 
making vfe->reg_update() optional could affect runtime updates.

Maybe the cheapest way is still to check the CSID side reg_update 
implementation at stream-on stage? I'm very glad to hear your 
suggestions. Thanks a lot.

---
Best Regards,
Hangxiang
