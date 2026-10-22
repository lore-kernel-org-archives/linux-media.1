Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792673545;
	b=r6snE9wtn0ye2TMQ054Iqy2l8D0DaWynAtj6IDFMbJqb3e/0cAsuZ5BS8ktDBOeiuIeO
	 jaJTInjA6HsoxySRcsmgTPIK/nSRBKjiiaSw0c0mK0ZN1nCkWEtNmYOZGnZmCwgzjChg7
	 +lL4HwlwsAc2uREA2P8dFSR5YV9IdxbkZwMV4T7LPcNkXtTV4nZuR8hK4RpPD6Pcsj6TU
	 Z/E4p51kGasf+kCIEM8i+BDaPPjHOY8tPCY/oUzAxtOQ/474xHgbcbBSVfr7nAfJPDgkH
	 GjbJIzLUXRzB/GDh2q23Gh922+XyWIKDTbFrkIcevzRyHu3Gs3M56D5NImBbyh2/FgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792673545;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=zSQPAtesTEdiMBUjd/2CJ4F2wEY/qZhqqsQihlJ4XBg=;
	b=CTVSS5O1Ey7DouUQF8aN9Ueb9p0Mi2wOZLutTSHRLosxHixfyV9PX+OCgUfJef/AHXVC
	 wtT+8lxeZhAxm3lIjvcINB0ffLurOUHgOFRTatMx2V/vvLvNS/PHy5oZAx4VsHcGX+s6H
	 llHJAYBED7gflax7li29r/Zq3kqSwtO549EE1n6S9kU98VyN29PSG9IAHkuFJxQhVY9E9
	 ibRZdL9nPLf6YgZKGWcIMKX5HTWAH30lptSxuxloJSOhqYepBGtDtElLsHPBlmGcSRw57
	 hDOgwd7APfHLIGAM8CCoAg2mMtsE16MYwPTC3EqPrstMle5kwSJZn+C/3SIMHpECgUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HsFBnS5F;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PyeNCtry;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 974A5606A31E
	for <linux-media@vger.kernel.org>; Thu, 22 Oct 2026 12:52:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 974A5606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HsFBnS5F;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PyeNCtry
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M9xquG3478831
	for <linux-media@vger.kernel.org>; Thu, 22 Oct 2026 12:52:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zSQPAtesTEdiMBUjd/2CJ4F2wEY/qZhqqsQihlJ4XBg=; b=HsFBnS5Fv3bTET6N
	83BhsGN7E/bGWWqjqaynZBFwpQEZAN++Yw550oO7AQaITWTmv756jybsKbXzjq3g
	v8GMcab3u6oFEaJtVbszXgXKjwTjk9HLc+ht8xq6vQoFWfZ5dqw6w0YzM3IK5wMi
	qIm9Fr8qkR5C8EhfHKQIAB+sfCknI4NCg+CoKhPYXzPqRuhaeONlXgBGUHdjHaIK
	fFusdQygjF6GgOekdeTJMNUkwoYzN2Z6sytunYrdosqd0mx06BLKFqtzC0BAUuJd
	+F1s+diOc/t2ar2be7oeCLUkIZ54diZ5gZXe37zcbmTKGZXnBfs6veZ9hFHZoHM9
	nwvMSQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93a3g46-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 22 Oct 2026 12:52:23 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f33438950so405514285a.1
        for <linux-media@vger.kernel.org>; Thu, 22 Oct 2026 05:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792673543; x=1793278343; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zSQPAtesTEdiMBUjd/2CJ4F2wEY/qZhqqsQihlJ4XBg=;
        b=PyeNCtryGeEJHvcCXWr+C7FMUXtYEQTD/IkiS7pKrptxItL3JpEYdHeMG68YILfh5y
         njOH6CUXDsV5Jmo1RGnc6MxPR20FS1LWwKJoA7NkRJMGTvNAONzrxaGYcq0ESEWHQR/R
         YfQJl+ydY922yHDFCVmDZ1I2X4OIcWpuhqLP/I4mIWZpHDi1y/ino6y8GIeUCkTsdcSj
         23sDlm2w9X54sNsDcUXxKG2YVPnVHE9qa5VdK6Q7t+cWGYSUeQOONrFY/MUSSjpRQGr5
         5DAu8TosqZccAU1lqWQDRC50Rppehjo3zF2c2LDGn/7+H26bSx/qgf3vY+qOYkIYRdRq
         RKQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792673543; x=1793278343;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zSQPAtesTEdiMBUjd/2CJ4F2wEY/qZhqqsQihlJ4XBg=;
        b=kERzRtHJbIVz070pqPDpHOn9zvh375ozz6Occmd7Lzdcy4FDJE20aP3lHDAZvQo0Xh
         jLhkdHQQ+Cn9kbo7TfJxFJfq0BlolekF4U/hL+FRvxOFtsOt0FrfxdikC0ZXBES6CcNR
         Eof8N8H6or7z9eJpKmqKGcliCLXA43/wZNpJXmtbJ9HqitHzhxj1v37DK5TMQhqJBuML
         RdtKvVS031TN8vD1Ld3NOe2bCV92qlGONu6N7hbywSydxb7qQZ98tqSysAOcj32+x3sb
         C/zoaL1wDQ4QJltRW0rtAQKQd0PCIi+RDF/RoRbhNcE/izVvX5nRrWOj+YisDVYEHQmz
         5zDQ==
X-Forwarded-Encrypted: i=1; AKwUvBy19UbYJ0WOdFRintejfY3dKPrtEwoD1cHGAqeFfybJfLwC4fLfPAnJnz9y5+NTKeyHuoHKvctvu79xgg==@vger.kernel.org
X-Gm-Message-State: AFq9FYJ3+TdDaHLjVlkYIDDItz1WfJfRhcxTCpYYM+xaK6wvOIpQDnDh
	DsYRLDG0yNFV4Dr8RHsI/u7d99S9ldiot1lsmSnSQAsZ8hk8M0pRk6mcGBH+ib8Ot0ybECOmwMV
	8QfbGQqgth/WAMIOdEU2r167eFLfSdPwd4p7FRgfczqK41xbsjKopS3K1+4Jm9us+zA==
X-Gm-Gg: AYBFou0gyF5N7O1PFlor92L4ew/nYXU81gThgM34fUSEK8GHwWWAdrG79z0ebQRDuqM
	u+9HszwywqvIjI6qnSt+CJ4qVE/DHO6TIFyQi0V9hhRvQbvsRrwnPostWJoDKwrLFiS/FvRn6l1
	LSg9VQD+PY7ZS4Y3A4VYSR0c0tztrfhcr7+tW/EYg7X+K/i91wv+rYVMduoW9BLzS0xvW1Opaol
	NSya0MJAWHvZ7tdHI03CAoMqd56v0rBzQQehv2uvKGeYqGk5jPQs21n/5S0RatTP24nR3MlZx4e
	IwVieLJ1DN49oilHXUPyOvHQOCp8Af9QlIHbToSt30F4Fe6ghFt3XPkVe11kOsN1BGyQHQU5r+7
	6YIe7z0P9PnY21wwaWnMRs1qi5+c/hU13Iq1R0CtMkATJDWV6AyOiPW6f5dm+RWs/2/GbExMVL3
	Jb8VnRFTqlmomV
X-Received: by 2002:a05:620a:2995:b0:93e:c12c:f134 with SMTP id af79cd13be357-93f5803c527mr942187085a.79.1792673542537;
        Thu, 22 Oct 2026 05:52:22 -0700 (PDT)
X-Received: by 2002:a05:620a:2995:b0:93e:c12c:f134 with SMTP id af79cd13be357-93f5803c527mr942184085a.79.1792673541916;
        Thu, 22 Oct 2026 05:52:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfae6337dcsm93302e87.72.2026.10.22.05.52.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 05:52:19 -0700 (PDT)
Date: Thu, 22 Oct 2026 15:52:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
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
Message-ID: <b7kf23jpwkqhpbmytuomofiewx34qxrjn2zqq3ydhnl4jk2smy@bb7h5vecnnag>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA1MSBTYWx0ZWRfXxHD4198fMpno
 W1NoUaoyEpCD/Hry2x2rXHBmb/TjTRpMXFTaPCNWTGCxTSZSKh6zo4jZgsA/11zXHVOGnPVhy2i
 55SpbwXPFrNNenzXE4W05IQ4BdJ/5q4ICAIsU4hRHqkMitQJgPlSdCpxtsdRFbA37ecAZTpopL5
 nyzBN2cQAjjgPDJ7f9bKha8nZp/e1I4ssy2Y3QELThGaMILPz9PFLjJd7lelISq871ej28k7/So
 61rNtBBFgDAJPPOhTiQ8uV4MP/gahV5piNii2xvMbIzVUQD9XbOBn3aVUbsGo+Ak+e/dflpwzsL
 AJVjgRBP6lxa4mPCRDDNACS9Lb6WHDGO8i8TK7k6qcrZfwu7ho/Up3ZkjEWxdXCyY47o+z/wisJ
 DDN1zQSwTPFwzglKvjaHkHgGzhTG02pkAKe838TpgmAJmPWTPbrS0UwkkZPH2OX0qe2kt3odlRf
 70+wvpg87PkKlsUjcZQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA1MSBTYWx0ZWRfX4slldsNYFEu8
 a4MV1Om3WWfAr86tCKLiYvzNSOUqd49DIX7/c07/ryiICE3WKpym6VbT1qiQNYOzshcfYKloz1h
 9mpY24q8lGdqGbQnjn8ELd+3fy75amQ=
X-Proofpoint-GUID: mocc5k-dHYW5D7wUw3fym41MOEMzq_s7
X-Authority-Analysis: v=2.4 cv=NaFzRGD4 c=1 sm=1 tr=0 ts=6ada0707 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=SNC64sLV-JS3cwQd52MA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: mocc5k-dHYW5D7wUw3fym41MOEMzq_s7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 phishscore=0 priorityscore=1501 adultscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220051

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

Good. Which means that dcp-vrtio device isn't compatible with
"virtio-mmio" and can't use it as a fallback in DT.

> 
>   Would the following Qualcomm-specific transport approach be acceptable?
> 
>   - qcom,dcp-virtio is the DT-compatible Qualcomm wrapper. It initializes
> IPCC and sends the required power notification before creating a synthetic
> virtio-mmio platform device.
>   - The unchanged generic VirtIO-MMIO driver probes the synthetic child,
> accesses the MMIO registers, creates the VirtIO queues, and registers the
> VirtIO device.

Why do you need a synthetic VirtIO-MMIO? Why can't you register a virtio
host from dcp-virtio? The driver is not designed to work in that way.

You have two major options here:
- Copy relevant parts of virtio-mmio to the dcp-virtio driver.
- Turn the core parts of the virtio-mmio driver into the library, making
  it possible to share the code with DCP driver.

>   - The DCP VirtIO driver binds to the resulting VirtIO device through its
> VirtIO device/vendor ID table and initializes HFI, firmware capabilities,
> and DRM/KMS.
>   - The virtio,deviceXX DT child is discovered by the VirtIO core and
> describes the DCP-specific IOMMU context, DSI hosts, display graph, and
> panels.

With your suggested codeflow, what happens if the dcp-virtio driver
suspends the DCP host, making virtio queues unavailable? How would
virtio-mmio know that it should also prevent the access? How would you
suspend it too?

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

Good.

-- 
With best wishes
Dmitry
