Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792673731;
	b=j33w54XcidLZtxfCdCqGCj55tfk8Mq68fldidb/8YOx0C0jCINA9d9t/OqncZTvclZL6
	 ncbtwkJxvQOLMaGeG3jVD0Y59ISGURdOuqgW69sVGulrjJ2pOEs1hPtL29PYOQAyNSa7l
	 6PHvGHCyp9VOWLW+o8A16tMqw+mKWo7jmgYuDdAKBx2NabTPyyOZdSMtLOkVJgA/qHEmK
	 XNU8Z2sfnx/uyrC3RR3+pF3Zom6O/g7G2hoib48o0DJ2ZcwUmDHzPNIHK37HJf18Z6Csr
	 L0NZa+6BIJ0vOl2qzlXL74kdSG99nAA6m5eHKZzgQF5/T1Ode5RLfGzm7t2cSNwSsig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792673731;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=leDyTJY9NS6Z1+Njn4Gg8waWet+YoE03GVarnhfMHY8=;
	b=v9MmOhLpFxmsvNNruWsKln+sjLqc8K94wLeMNVtIaWMo8QGIKJ1etW+m05QrEKsOTBLX
	 D874MoW69DCwp6nqp2t6ESlLFHoWrJcwiUhEDhOSxiSJ4CKHYCaUS3r2nNDsZNKMFwEWj
	 wGY+ynCBGm6td9V9cBVWuKybFuQahccnB1cbR6ohOp0b9TNel6W0TbZ2nZQboG7DOKx12
	 hbGdPr1XvbIfQ0O9HwOyttbkZbcVd0rdxhotIyZPlz0244sNy56NLMZICz5sBLYeLKcVT
	 HkfaLyLW2DsZrcTOt2nsiyOMWNaH8Q97pNw1BTL/Xlr2pZg/VtOuLs1gfzEODtKIKDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ewbtfGhy;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TAAE2GqQ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14332606A31F
	for <linux-media@vger.kernel.org>; Thu, 22 Oct 2026 12:55:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14332606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ewbtfGhy;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TAAE2GqQ
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M9xlHQ2573576
	for <linux-media@vger.kernel.org>; Thu, 22 Oct 2026 12:55:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	leDyTJY9NS6Z1+Njn4Gg8waWet+YoE03GVarnhfMHY8=; b=ewbtfGhyd7uCDjsG
	8gynG80J5ZuMmR+WohY/K1VLHL9vQryvjtE7EMyqMJk+UA1FEQ/AfDCY46e0Dwou
	T4pD5E4yBgLXRj+w/kt9SYkJeUwuND4LE6WsFq2gtcEc5XaXewfc+7nSJeLuHczi
	Im1ZbgE5JM9T1q98t2be0vbpCy/YKzMhbd6/BpfT3wlo545HgUGouS6IXdhgV8pb
	i3VyUjaLtkWc9WwDAgvxGVPNkHx1+Ua4+oy0RHGDsQsxuwp2dhQbXQz9Uw/1Rp9S
	qwOm1ieJRfE+UaR4tDky7FazqQti4xZVVZMdtJ2YtkimqwXvatji3BgL+xP0mX0N
	dg5EzA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93akfta-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 22 Oct 2026 12:55:29 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cb93c874bso166238985a.0
        for <linux-media@vger.kernel.org>; Thu, 22 Oct 2026 05:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792673728; x=1793278528; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=leDyTJY9NS6Z1+Njn4Gg8waWet+YoE03GVarnhfMHY8=;
        b=TAAE2GqQzoniE4biKzCA9XkoX7xLXJAacobrlWkoyXuMeVZ12SoO8Hj+UqBB4mYSSd
         JTv38fWH2YeyxrGs5ZAmGREkOusXR9OXxmw4OeGMT90Zm0kYpc+IBtz1jtQTM5KmN0h6
         V3XXGvel5cI1l3jz1zgeu+DCgMSlC2adxCEBO4ZRxtw8cx1VJ9kwP9B667jez2tuLG6J
         lyvr6EO51AndiXovFGbljebBIiW1rEvmXySWGcuEU6T97zY6YGa2M+mxmHZ7puFGnkgA
         bN3xjMfQUmODD5uXSj0LB6XOF6EPXmA/sWRXzwbXcuQGkWfYZH7x+vkHKUBcK9zMkZ9b
         WEiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792673728; x=1793278528;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=leDyTJY9NS6Z1+Njn4Gg8waWet+YoE03GVarnhfMHY8=;
        b=H/VsyvI34rvQLECibgWn/xfzgPNwcVa/6JB1NdMTWtl1Il69P09FVjtlDyN2RknWLm
         UGIs1e/LdvH9Ht1PxJL3UgjpdXF8xSgSO+eW0mpcp466LogwSNqSmyb43vcuArlpZjfv
         i9itoQGqd/XlP+CjflDvInkMUC2TtzmgAvm9byWMB8C+nS+Kp9JwbQ+x6lWRelnvnVt9
         6El1hELZvsnDx3x8OakE6FEc4aIOUC4up0QBXjCTko9GQ6g+Rv4gWtdtm3uaFV3ZumiZ
         8vUpL4QC9UGTvnkh1wjyBIgdwT2ISZUO5Stvw3YaE7ddiMFMLi0Bxyo+6IE2IHAXjeVs
         yOYQ==
X-Forwarded-Encrypted: i=1; AKwUvBz/PV9C5qjdZSjLO3QGTl5AzQmkGypU2Q6/yTuJSz5za/di+Lgnja1i7iGiyH8cYx/L/tcqElGNhNL8sw==@vger.kernel.org
X-Gm-Message-State: AFq9FYKcwqJfaHKV42mQcsts09q0mJPmxjVteC6B6ZXi/rWadkYlKXQL
	YSw7uoRXfRyIGLyHC5Ky+0qWVjAqRgcaYdpuLte90i0g/CQjdvDEGNxmtWb1n1kL8CcQdsGvch1
	RfYIv7aOPJwpmPnOyIZ+kEJGuENeO0ujr9EMimGsnIO0GxfH2MR+m9ixzlsB5YZvSNw==
X-Gm-Gg: AYBFou2HnF7Muw+Z4YbSp+GR+0pfL6D9GFjSnHmI7hjQtInBAY8ID0zgMwqKUJrxwtV
	PNtTnBjvfS1L+WzfYuXEZP4aaGh8qmlE6WqCRPY1YULzRGShqxdnoYq9SiZGSiBaFjPwfyO4iVx
	cBoK+v+OOErv6I3ludLPtM4XPj1ncWXYGKKFZrriNruTc9hY9sKu8dj8xbsDaT5Uk/j5P4bF/uu
	vxcwIe1GbY63tL1gKHzZoYsCqhQTCEJTYFNt7qu6V97wegNRsHzpYuJEPVAKKArkFf8ufrrPQ9A
	Ol9m37F7M0Yz/7wW+KcidNDvw7U2G5LKq+79l3PwDbEcSByOXWEoKUNRUmohpuuGAyFqOMHhu+j
	KS4CgI2VlrMum0vXSLeHo3VXl+EN4iAnjc4X9V5Jb23DWKYQ3XlFN8kL2iv4cAL4LV/V3kAPAz9
	nL7MWYZ1SynzlL
X-Received: by 2002:a05:620a:25c7:b0:93c:3863:ff7f with SMTP id af79cd13be357-93f6235c83dmr372220485a.0.1792673728138;
        Thu, 22 Oct 2026 05:55:28 -0700 (PDT)
X-Received: by 2002:a05:620a:25c7:b0:93c:3863:ff7f with SMTP id af79cd13be357-93f6235c83dmr372215685a.0.1792673727448;
        Thu, 22 Oct 2026 05:55:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac4f68f317sm7839961fa.38.2026.10.22.05.55.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 05:55:26 -0700 (PDT)
Date: Thu, 22 Oct 2026 15:55:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>,
        "Michael S. Tsirkin" <mst@redhat.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
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
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
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
Subject: Re: [PATCH 01/13] dt-bindings: display: msm: Add Qualcomm DCP
 bindings
Message-ID: <jv334lyhqugggwmagmcsygmymzpb4aa5lncmwl2aosvpe54yr3@do4dp4dztogt>
References: <20261015-jshekhar-drm-msm-dcp-v1-v1-0-48aad0fe4f72@oss.qualcomm.com>
 <20261015-jshekhar-drm-msm-dcp-v1-v1-1-48aad0fe4f72@oss.qualcomm.com>
 <hprf3vrsveovq3hwcgjrfj6uhmlxlq5u5bx4lkbswgxe476qwz@pacalsdgrjx7>
 <ea81fcc1-c7e4-4b80-b65e-f483487bd1a1@oss.qualcomm.com>
 <f7926ef7-1edf-4d74-9758-2ee0c8a795bc@oss.qualcomm.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f7926ef7-1edf-4d74-9758-2ee0c8a795bc@oss.qualcomm.com>
X-Proofpoint-GUID: -5HZ1AgQyVp9wWXka13O_m9o-nTrj7ak
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA1MSBTYWx0ZWRfX1y/SEdMWedH3
 gfN9QeX5BLR+mOVG8gm2GGWmxEzrApHiG+IzjNbJR9lQQPabK9RQ9/rRtBgob9XkU+nyytdNckG
 zHcYUqjuDLMFpmqXi36li5b5atoNj/w=
X-Proofpoint-ORIG-GUID: -5HZ1AgQyVp9wWXka13O_m9o-nTrj7ak
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA1MSBTYWx0ZWRfXznsFq1TXcrRL
 L+N3mYla/kk06VVrUtVIRI+CEytu3HeMjBFuRXTahYTP8j8ZvTDZtq7Tw9ZXHPErxc6mfBxn1KR
 5SxtA4NQUZHpBFga+42kAwhTDK6FWLQWv7CWf3kxb7BbHo2m9Jlu7/z++gtDhlOXOdaLQV2a4lE
 lQM87SyAXcDuGktA62QiaFl0wU1Hbol0NIQ2eaNu9zef0Z+g4l3P4tLdU9bSekQ7gcdSgQaCDeE
 V7cGis310BoDzS1QOkb1lrEjZBi4TTZWnhDuJxEnbcmaEf6yYnSD5fvO6LnsT/cvPmQWuix+8Z1
 FQpCdBRQ0w5Ipr3NfPoO5hMBjDws0aTqgF5HVBPfGFyvDhLC2d1zGz+DDAxDcOkBFAKkGEdkl1Z
 bw9S6u3COv/XgqLnVWvuduxcI08w+ZmlzLxmzTTDbM5SkaUE6UhEruqr/2eOmjmEFIvJ5mzGd0y
 kbKF0TgwZML5OpbBVUQ==
X-Authority-Analysis: v=2.4 cv=dOszC+Zb c=1 sm=1 tr=0 ts=6ada07c1 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=SZj5_u6oW2rcZsOVINQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 spamscore=0 adultscore=0 phishscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610220051

On Wed, Oct 21, 2026 at 05:09:15PM +0530, Jayant Shekhar wrote:
> 
> On 21-10-2026 14:15, Jayant Shekhar wrote:
> > 
> > On 15-10-2026 17:47, Dmitry Baryshkov wrote:
> > > On Thu, Oct 15, 2026 at 01:08:21PM +0530, Jayant Shekhar wrote:
> > > > DCP platforms place the display pipeline under firmware control,
> > > > so Linux
> > > > cannot discover display resources through direct register
> > > > access. The DRM
> > > > driver therefore needs device-tree descriptions of the firmware
> > > > transport,
> > > > display topology, IOMMU contexts, and panel connections.
> > > > 
> > > > Add bindings for the Qualcomm DCP VirtIO display function,
> > > > including the
> > > > INTF graph and DSI host outputs. Document the framebuffer IOMMU
> > > > context,
> > > > IPCC power-notify mailbox and interrupts, firmware display
> > > > topology, and
> > > > firmware-visible IOVA window supplied by the parent VirtIO-MMIO
> > > > transport.
> > > > 
> > > > Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
> > > > Assisted-by: LLM
> > > > ---
> > > >   .../bindings/display/msm/qcom,dcp-dsi.yaml         |  75
> > > > +++++++++++++
> > > >   .../bindings/display/msm/qcom,dcp-virtio.yaml      | 113
> > > > +++++++++++++++++++
> > > >   .../devicetree/bindings/display/msm/qcom,dcp.yaml  | 119
> > > > +++++++++++++++++++++
> > > >   3 files changed, 307 insertions(+)
> > > > 
> > > > diff --git
> > > > a/Documentation/devicetree/bindings/display/msm/qcom,dcp-dsi.yaml
> > > > b/Documentation/devicetree/bindings/display/msm/qcom,dcp-dsi.yaml
> > > > new file mode 100644
> > > > index 000000000000..f7178c66c09e
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/display/msm/qcom,dcp-dsi.yaml
> > > > @@ -0,0 +1,75 @@
> > > > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/display/msm/qcom,dcp-dsi.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: Qualcomm DCP DSI host
> > > > +
> > > > +maintainers:
> > > > +  - Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
> > > > +
> > > > +description: |
> > > > +  A MIPI DSI host exposed by the Qualcomm DCP VirtIO device (see
> > > > +  qcom,dcp.yaml). DCP is a firmware protocol shared across multiple
> > > > +  Qualcomm SoCs, not specific to any one of them; Hawi is its first
> > > > +  platform. The DSI host and its connection to a panel are described
> > > > +  using the standard DSI controller and OF graph properties.
> > > > +
> > > > +allOf:
> > > > +  - $ref: /schemas/display/dsi-controller.yaml#
> > > > +
> > > > +properties:
> > > > +  reg:
> > > > +    maxItems: 1
> > > > +    description: Index of this DSI host among its siblings.
> > > > +
> > > > +  status: true
> > > > +
> > > > +  ports:
> > > > +    $ref: /schemas/graph.yaml#/properties/ports
> > > > +    description: |
> > > > +      port@0: Input from the DCP virtio device's DPU INTF output port.
> > > > +      port@1: Output to the attached panel.
> > > > +    properties:
> > > > +      port@0:
> > > > +        $ref: /schemas/graph.yaml#/properties/port
> > > > +      port@1:
> > > > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > > > +        unevaluatedProperties: false
> > > > +        properties:
> > > > +          endpoint:
> > > > +            $ref: /schemas/media/video-interfaces.yaml#
> > > > +            unevaluatedProperties: false
> > > Why do we need OF graph here? Would it be enough to link one of the
> > > ports of the root node with the panel's input?
> > > 
> > > > +
> > > > +required:
> > > > +  - reg
> > > > +  - ports
> > > > +
> > > > +unevaluatedProperties: false
> > > > +
> > > > +examples:
> > > > +  - |
> > > > +    dcp-subsystem {
> > > > +        #address-cells = <1>;
> > > > +        #size-cells = <0>;
> > > > +
> > > > +        dsi@0 {
> > > > +            reg = <0>;
> > > > +            #address-cells = <1>;
> > > > +            #size-cells = <0>;
> > > > +
> > > > +            ports {
> > > > +                #address-cells = <1>;
> > > > +                #size-cells = <0>;
> > > > +
> > > > +                port@0 {
> > > > +                    reg = <0>;
> > > > +                    dcp_dsi0_in: endpoint {
> > > > +                        remote-endpoint = <&dcp_intf1_out>;
> > > > +                    };
> > > > +                };
> > > > +
> > > > +            };
> > > > +        };
> > > > +    };
> > > > diff --git
> > > > a/Documentation/devicetree/bindings/display/msm/qcom,dcp-virtio.yaml
> > > > b/Documentation/devicetree/bindings/display/msm/qcom,dcp-virtio.yaml
> > > > new file mode 100644
> > > > index 000000000000..018694310dfb
> > > > --- /dev/null
> > > > +++
> > > > b/Documentation/devicetree/bindings/display/msm/qcom,dcp-virtio.yaml
> > > > @@ -0,0 +1,113 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/display/msm/qcom,dcp-virtio.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: Qualcomm DCP VirtIO host
> > > > +
> > > > +maintainers:
> > > > +  - Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
> > > > +
> > > > +description: |
> > > > +  Qualcomm's DCP VirtIO host provides the generic VirtIO-MMIO
> > > > transport and
> > > > +  the host-side IPCC channel used to wake the DCP firmware.
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    contains:
> > > > +      const: qcom,dcp-virtio
> > > > +
> > > > +  reg:
> > > > +    maxItems: 1
> > > > +
> > > > +  iommus:
> > > > +    maxItems: 1
> > > > +
> > > > +  iommu-ranges:
> > > > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > > > +
> > > > +  interrupts-extended:
> > > > +    minItems: 2
> > > > +
> > > > +  interrupt-names:
> > > > +    items:
> > > > +      - const: virtio
> > > > +      - const: dcp_power_notify_irq
> > > > +
> > > > +  dma-coherent: true
> > > > +
> > > > +  mboxes:
> > > > +    maxItems: 1
> > > > +
> > > > +  mbox-names:
> > > > +    const: dcp-power-tx
> > > > +
> > > > +  dcp-subsystem:
> > > > +    $ref: qcom,dcp.yaml#
> > > > +
> > > > +required:
> > > > +  - compatible
> > > > +  - reg
> > > > +  - interrupts-extended
> > > > +  - interrupt-names
> > > > +  - iommus
> > > > +  - dcp-subsystem
> > > > +
> > > > +additionalProperties: false
> > > > +
> > > > +examples:
> > > > +  - |
> > > > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > > > +    #include <dt-bindings/mailbox/qcom-ipcc.h>
> > > > +
> > > > +    virtio@9be8000 {
> > > > +        compatible = "qcom,dcp-virtio", "virtio,mmio";
> > > Is it really compatible with virtio,mmio? Can it be handled completely
> > > by virtio,mmio?
> > 
> > 
> > There are two possible approaches:
> > 
> > Option 1 — Use the standard VirtIO-MMIO parent (preferred)
> > 
> > Keep the parent as:
> > 
> > compatible = "virtio,mmio";
> > reg = <...>;
> > interrupts = <...>;
> > iommus = <...>;
> > iommu-ranges = <...>;
> > dma-coherent;
> > 
> > The generic virtio/mmio.yaml binding would be extended only to document
> > the generic iommu-ranges property.
> > 
> > The DCP-specific resources would be placed on the virtio,deviceXX child:
> > 
> > dcp-subsystem {
> >     compatible = "virtio,deviceXX";
> >     iommus = <...>;
> >     interrupts-extended = <&ipcc ...>;
> >     mboxes = <&ipcc ...>;
> >     mbox-names = "dcp-power-tx";
> > };
> > 
> > The parent uses the standard VirtIO-MMIO interrupts property. The child
> > has one DCP-specific interrupt, so interrupt-names is unnecessary and
> > the driver uses interrupt index 0.
> > 
> > Option 2 — Add a Qualcomm-specific VirtIO-MMIO parent binding
> > 
> > Keep a Qualcomm-specific compatible such as:
> > 
> > compatible = "qcom,dcp-virtio", "virtio,mmio";
> > 
> > and extend the parent binding to describe iommu-ranges, the additional
> > IPCC interrupt, mailbox, and related DCP resources.
> > 
> > However, this approach duplicates the generic VirtIO-MMIO binding and is
> > only justified if the transport requires Qualcomm-specific handling.
> > Since the DCP transport is handled completely by the standard
> > VirtIO-MMIO driver.
> > 
> > Which one do you prefer?
> > 
> > I will be addressing other comments in v2.
> > 
> > 
> > Thanks
> > 
> > Jayant
> > 
> > 
> 
> I think Option 1 is not suitable because the IPCC power-notify sequence is
> required before the first VirtIO-MMIO register access. The standard
> VirtIO-MMIO driver would otherwise probe the DT node directly and access the
> registers before Qualcomm-specific initialization is complete.
> 
>   Would the following Qualcomm-specific transport approach be acceptable?
> 
>   - qcom,dcp-virtio is the DT-compatible Qualcomm wrapper. It initializes
> IPCC and sends the required power notification before creating a synthetic
> virtio-mmio platform device.
>   - The unchanged generic VirtIO-MMIO driver probes the synthetic child,
> accesses the MMIO registers, creates the VirtIO queues, and registers the
> VirtIO device.
>   - The DCP VirtIO driver binds to the resulting VirtIO device through its
> VirtIO device/vendor ID table and initializes HFI, firmware capabilities,
> and DRM/KMS.
>   - The virtio,deviceXX DT child is discovered by the VirtIO core and
> describes the DCP-specific IOMMU context, DSI hosts, display graph, and
> panels.

Anyway, for the next iteration of the patches please be sure to CC
VirtIO maintainers and virtio-related mailing lists.

> 
>   The flow is:
> 
>   qcom,dcp-virtio
>       → IPCC power-up
>       → synthetic virtio-mmio device
>       → generic VirtIO-MMIO driver
>       → virtio,deviceXX DT child
>       → DCP HFI/DRM driver
> 
>   Since the Qualcomm wrapper creates and owns the synthetic VirtIO-MMIO
> device, the parent node uses only:
> 
>   compatible = "qcom,dcp-virtio";
> 
>   It should not also advertise "virtio,mmio", because the generic driver
> must not probe the parent directly before IPCC initialization.
> 

-- 
With best wishes
Dmitry
