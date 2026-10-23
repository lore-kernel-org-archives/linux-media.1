Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792743040;
	b=EV1s1/bsbDy1P4w00b4K0wy5U6D9HUTNn56xfuK5NLToRKwQZM+sE8dn0Z8tZ7P7Luqw
	 cZvBQZhymOg49Ys2IqCs8eExjIYpZ7d/roMCGCA2/7TJSEib5ITF0ngp/WpZb+82cRzVe
	 rKPjq4qwRCqc+/jZ1dKglLofJxuWF4DO3Czn/SqupaIBZC5yuhbRqvkfDhuBYxy8nxCRR
	 /pUtZRiD8oykPAG0G9F/tBRStVCrGXtPxNr1+FBWHNRRKKDadlorb05IWT+GXteeRaiaT
	 KbtqNd6lENuYcSqPTmftexQAstkjoI5I7Y1LcYWxctxwHJz4ftIl5brJrikMbPOBhbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792743040;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 X-Google-Original-From:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Qt1u1PGQnVLwLZKEH+hp9Dtkn1RKbERmxA8BWP6q4N8=;
	b=KX2eXiaQVkocOgT/P/gDTy/og7KhWkkEqBgH4XvUVLvxC3ia9Brb1/A+wrN8ZdGFiN6X
	 nZ8YIcdjHT5X21cbQX0xQNzTE5aSGrkPSWsdZYBF/NtrlPnAhxdWelAMs8WJ5+TozTlwk
	 mqKMvt8h7gwMWLYIyEoDwiPaqg6VQdx+XY3/BHXWdzafKjUBdf8Sy7SMNx4D1J8qreBd4
	 7RK3lxNJDcJBRStVcPNVUdUXCNo7j9SHufIt8X94FK8hJkCmTndpCUn74m7mXuKqBHjo+
	 zwGE2uuNY2g4s2Ul+ba8Wyzt+4M6I2N4I945ghgs0acJpwn2WcC1rh/aMVVoQBuT8iA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U7fHBr2Z;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e45Izuit;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E187606A334
	for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 08:10:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E187606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U7fHBr2Z;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e45Izuit
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N7F88E1200806
	for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 08:10:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Qt1u1PGQnVLwLZKEH+hp9Dtkn1RKbERmxA8BWP6q4N8=; b=U7fHBr2Zzr5BzR0l
	GZ4p+H51nKm9WVAQPxZtK5Fxkawu2eyIUw8uq1dLaEEiMmoXZzBSEOt1Ca9eoWJh
	Lmldut7xSV7XBgCfpN1LqCL+BlRp56ZaYaSsa4GwxE5GF1t7f/hD6UuuO/Nb3+Ie
	pzBPhe/0u5Dl7/AVXrCPWXw/OJQQoSxrCbRu2YwIGvD6Eh/ZW3w29qV+5Ex5n93u
	V0Ekb2Macw7YJI7/WfuTkPsM2grc2qboRWV1y9a+c6TX6khVSg8MVWZxO16ccf14
	DwWONyUX847Rs1JDb87TeUaYuMA/se/zirkPxWskU8S8qCLB8g+30G4DDdGoCCK/
	zHAsZw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqms2mgx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 08:10:39 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3aaf955db5fso1078186a91.0
        for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 01:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792743038; x=1793347838; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qt1u1PGQnVLwLZKEH+hp9Dtkn1RKbERmxA8BWP6q4N8=;
        b=e45IzuitG6Hw89f+NJpwhNPo7fkPr1mPDbK5eNSuPgeGFFPxZgTihpkaIE5kSnEpm2
         8eEz86Q+00rU62TzH/J89CW09JSQBz7m0+19upcVb4m9kUBJa+n3BFO/MLwkcGm7f9lR
         rG60NjoorCDNbBeaALnYfsrBabFXNiKFOuKXl3v27p9xU2xriQExjJbO2I/7QbQpwNRm
         Pf1H34Rqvvj9b82SyQVVmjbtEB0mosfLqp4v4+vOFwudUv6mXMFKnwOk1Wo+V1YwVn+/
         7rieHIvIXkzENGZXQo4DTI/SDgh40bjscMXXphHeU6/RK/ENh+6Nr4TcXYTVmdARCvBJ
         sJug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792743038; x=1793347838;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Qt1u1PGQnVLwLZKEH+hp9Dtkn1RKbERmxA8BWP6q4N8=;
        b=X0areBN5/eEwKdy8WalRQ2UIKSai5p5R8jZ7OmM+k760Mjb/hZ/tU/7M9vnsZ7rpdQ
         KKIWVVHGmngchvVwuWxvWabWVwtEcuULgoyDFm0AufLZ+HCV6vReepivQ9jskMhMX2ni
         PU3bol6lirfJYuUy2pIWdpVPYx1B59sjfTb6Z99epIqHafa/ZSYOjScnIA5fGafc26B4
         PW3UcC4wdpp5HMsDbVgFNyfFnMSoFZLm2cK2sj0uOPmaC8lop524T34yfNfOBEA+hvXM
         gbrYzQ3tYU6qg3t+nDC4/ecNacBW4yZlL440rwi28w6LHgT7ovuhJrcBDwQJv1EXxLqm
         VjNw==
X-Forwarded-Encrypted: i=1; AKwUvBxw951DY+fO6LW9E3lFKQA0XlrCoEQO0YPGxwnAWLOQ7GAz1E8UkLb+wxXZD8cimjv2aGw+6goqSaUJAg==@vger.kernel.org
X-Gm-Message-State: AFq9FYIr6PxfJZZV8jlMrHB8/FvwbYcgrgN7aw+RyOaEKO81sdDAa3KD
	8N8E2eRdqUI4hnn2e07M1gZBG5A1jIHkIY7oxUzUwOEmF7FABVJM3XlFbrx4TrIYxBsJYd4q7NG
	whp8z4TPT6NkJxF8NOxXBKqpLHNnHrWDPpetvNk0eOXQkwqdHrawsC442RjqpATeGyg==
X-Gm-Gg: AYBFou2OJRQHHaWn+U3ZfUH/kVfqdDEqfpcs5T5ZEwJnI9rE4TrjAeJZOhRyeT+nmGN
	JJYThyxI8xgShGltNkimT32lKAAjlGkALpx938LGWb/tTXzj2qv2em2fwsW+PA0S5pJsKC3v7Cy
	fFzhq22wvqzLl+mYxYXMvqb+BG0q8UCuKYTjZB7Zogh4AbnZkltLVXTWbl33AIeYBCF0GrMWYs/
	TLNgjIePaSO4VN/alY0Nsqg/pbaPwPq81fUAp/3Pm0u7WIjT7+WRn412KaWsZ7z5j4RhA16tprr
	lHhqsbNfqIDPfNmjbiwo1jx8/C3OlRtruYL6rxZTipMZoT/n5e2JjOEfaoI+6hzvirSAQnUsdS5
	2/45bXmfGiu/coQbYvQY8Ofgbh1c3iaXvdA==
X-Received: by 2002:a17:90a:dfc3:b0:3ac:97e3:7389 with SMTP id 98e67ed59e1d1-3adce072ca9mr1162574a91.44.1792743038026;
        Fri, 23 Oct 2026 01:10:38 -0700 (PDT)
X-Received: by 2002:a17:90a:dfc3:b0:3ac:97e3:7389 with SMTP id 98e67ed59e1d1-3adce072ca9mr1162541a91.44.1792743037308;
        Fri, 23 Oct 2026 01:10:37 -0700 (PDT)
Received: from [10.204.79.28] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adcb0a11fbsm2517749a91.4.2026.10.23.01.10.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 01:10:36 -0700 (PDT)
From: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
X-Google-Original-From: Jayant Shekhar <jshekhar.shekhar@oss.qualcomm.com>
Message-ID: <ae967eb1-cc54-4733-9e89-bc375e1cbfd6@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 13:40:25 +0530
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
Subject: Re: [PATCH 01/13] dt-bindings: display: msm: Add Qualcomm DCP
 bindings
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        iommu@lists.linux.dev
References: <20261015-jshekhar-drm-msm-dcp-v1-v1-0-48aad0fe4f72@oss.qualcomm.com>
 <20261015-jshekhar-drm-msm-dcp-v1-v1-1-48aad0fe4f72@oss.qualcomm.com>
 <20261015-heavy-clam-of-sunshine-8fe831@quoll>
Content-Language: en-US
In-Reply-To: <20261015-heavy-clam-of-sunshine-8fe831@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAzMiBTYWx0ZWRfX4DSG/0ri8N+e
 GyGCG3SEdHRzjtMGklcnK+Ih6njIznlFnpT5a3Qq9QfbC7dsZji2l6ULKpifib0wGATRagwUotY
 KhjsJKmJaHI2Gqnfk4c08kdDzNBQ352rzwxe/Azrm4oDvBIF+0vfhwuXt6kW3nAcl3wHNDpQMlu
 /hvwMX5f+72xuiIe0UzZkeDOcPEy6W45kVobUr0oVurPkA6ljP2pvdEowjkrRA+Ffx60m1uJ6dj
 dRCcZcjBN8f+8CKqIRlg6GP1arcWXJGhMEBCrrX7RQRb9TfXmbCVoeZDsz9vuIdubDHG0uXIRwu
 KxqAveM8qI4cPEjIPlBF/W9sz2y8Wz2bBiniOKmhxsHN3qgTaDiCeCWksBTYro4r1g2Y6ZPJ6ql
 wpjnrAg6SNjwLxL1cyn4AxoJRahfRDEyG+ZVmV46ZenwmqTObMGoS6CwTzG94hnB3PkEZeFp5kA
 jKrW63ZgaxSR9hGzYoQ==
X-Proofpoint-GUID: IzPOFf4lFHnZHHX0n8BH3o4nUoZneXmy
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAzMiBTYWx0ZWRfX2wY9TC8QtH+y
 NGl6g1/pszQvoB6TJE6vhUH2o6iQUSxjbDPlk9sRpDXfo3LXI7ZfZ2cWMxlCR81HpNoIXRFjsCc
 cC3uWoh4CSo0wM2xK7ZxchvYMfHOc/s=
X-Authority-Analysis: v=2.4 cv=UdbE26SN c=1 sm=1 tr=0 ts=6adb167f cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=P-IC7800AAAA:8 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=CvYCOFMdU_owP9l6gQwA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22 a=d3PnA9EDa4IxuAV0gXij:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: IzPOFf4lFHnZHHX0n8BH3o4nUoZneXmy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230032


On 15-10-2026 16:20, Krzysztof Kozlowski wrote:
> On Thu, Oct 15, 2026 at 01:08:21PM +0530, Jayant Shekhar wrote:
>> DCP platforms place the display pipeline under firmware control, so Linux
>> cannot discover display resources through direct register access. The DRM
>> driver therefore needs device-tree descriptions of the firmware transport,
>> display topology, IOMMU contexts, and panel connections.
> Due to dependencies this cannot be tested, so limited review.
>
> A nit, subject: drop second/last, redundant "bindings". The
> "dt-bindings" prefix is already stating that these are bindings.
> See also:
> https://elixir.bootlin.com/linux/v7.1-rc7/source/Documentation/devicetree/bindings/submitting-patches.rst#L23
>

Thanks, will fix this in v2.


>> Add bindings for the Qualcomm DCP VirtIO display function, including the
>> INTF graph and DSI host outputs. Document the framebuffer IOMMU context,
>> IPCC power-notify mailbox and interrupts, firmware display topology, and
>> firmware-visible IOVA window supplied by the parent VirtIO-MMIO transport.
>>
>> Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
>> Assisted-by: LLM
>> ---
>>   .../bindings/display/msm/qcom,dcp-dsi.yaml         |  75 +++++++++++++
>>   .../bindings/display/msm/qcom,dcp-virtio.yaml      | 113 +++++++++++++++++++
>>   .../devicetree/bindings/display/msm/qcom,dcp.yaml  | 119 +++++++++++++++++++++
>>   3 files changed, 307 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,dcp-dsi.yaml b/Documentation/devicetree/bindings/display/msm/qcom,dcp-dsi.yaml
>> new file mode 100644
>> index 000000000000..f7178c66c09e
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/msm/qcom,dcp-dsi.yaml
>> @@ -0,0 +1,75 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/msm/qcom,dcp-dsi.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm DCP DSI host
>> +
>> +maintainers:
>> +  - Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
>> +
>> +description: |
>> +  A MIPI DSI host exposed by the Qualcomm DCP VirtIO device (see
>> +  qcom,dcp.yaml). DCP is a firmware protocol shared across multiple
>> +  Qualcomm SoCs, not specific to any one of them; Hawi is its first
>> +  platform. The DSI host and its connection to a panel are described
>> +  using the standard DSI controller and OF graph properties.
>> +
>> +allOf:
>> +  - $ref: /schemas/display/dsi-controller.yaml#
>> +
>> +properties:
>> +  reg:
>> +    maxItems: 1
>> +    description: Index of this DSI host among its siblings.
>> +
>> +  status: true
> I see slop, I finished here. Mind this maintainers summit words - if you
> use AI, you must use good one, not the shloppy slop.


Will remove this in v2.

Thanks

Jayant


> Best regards,
> Krzysztof
