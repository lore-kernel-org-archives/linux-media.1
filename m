Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794406391;
	b=efH6TjDI45+NmfdEO76b6MqzMLh4YVdWSpKZRwOenF+W2SPjNcYfTOtGm3SJ0FRwgKEJ
	 kh6cSahwb3nfUHzukPVjiS+vVMN7KL4pYcoz+QJY/EoIXdJgal+pk4syyseP9pHPiYit9
	 asQoigQ1tDiB10leuSs8AUkaOu4mUxNUQapa8kfh76epslEravvgjuweGVOTj7blMqLk+
	 jhFvYdF+apNtYZtoOzuyj1OJTijckpxeDG9Y2IHbSVKtA3d/W3LpzKvJAG16duvDEMRKc
	 qWRUrvetZxEe3H1rHeABn9/+quEhSfOHAGCuMUaI6Mhi68RrnNzBhlkc/O9OBKO5b4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794406391;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=llfh8etuwqMEBoatS7BG9atTA4vpv1pJNPCbkPuzpyI=;
	b=fa1ozkBjQc8ARsygtHTeaqhUcyeT+rlh2sxRegVuucMFmE+FtEux8T/Ho/KKDYJX0I3Z
	 PUWYtnXKcdCAcRL9Gg++7BaF4ofMvqi+Zhp2v05R4cFWHW+VHOF0A/YljhFj1H9v+6JGk
	 5tQd/rqHAiamiemn2b3Kr4vJxSiwPCmVOCPdOS++oNOKRi7BRhY77TCp5mUeJj3PJebd2
	 rxkHGUrbrVdbTW+XqLrCjrxTbbpbfwc0Qra3lJ1EDnZTo9Pka6P52k7JZui24j5Lu42nV
	 kjhNI+YE61CN9dLXZx+pTTiA101weZlmg7YyRl4VLQPU7BOW1lMpokrO0zNwVSy9TRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="ZCbj/bq/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WTD4xvli;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F223606A33E
	for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 14:13:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F223606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZCbj/bq/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WTD4xvli
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABCZNAb708117
	for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 14:13:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=llfh8etuwqMEBoatS7BG9atT
	A4vpv1pJNPCbkPuzpyI=; b=ZCbj/bq/7etR5mduMsXYp0jpAwQ/AZdMzdYdASci
	VmMJONZ+iJEIUbANBiDjtZphcWabwse7wGo9h645cixX6XcXKZ/uGGfPLJ4JCERB
	e8I7/d5uvjtX6Fw9P/v8ncTMUJg6MECCmrpbVV9qB8RiuOe8CAEq5tV0DSgzvrXS
	ey5Gg1BPNsa8KT+NcxPxPlnh+AJcYxc7TyWgZXzrM+P5SfYUHqybWuG1ftpAHVZW
	5w25MerOy+XYX+KP/GioZbvtfeBkosizv8g9POZL/G7BWgPNt+jueA+IlNyGQM38
	I9qm7lpjucG7INeL2Za54FsOjajj4386I+7u307pJIeOXw==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv9b33u3a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 14:13:10 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5eabb3a1bb8so1026830e0c.2
        for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 06:13:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794406389; x=1795011189; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=llfh8etuwqMEBoatS7BG9atTA4vpv1pJNPCbkPuzpyI=;
        b=WTD4xvlimwMrg0z+1mJjTCXHFIUaicF2Qp7y0bhilWeVCOAyP4dGnKk1LjpvQEqb0K
         mKGyLWJY+McuA8+6xUgewkZsD80mnA8jX5OMvBY1LDF5Z6TH53K9v4fnUGdnyZnbBKhf
         dRfafsWkFDBJ9TlhzuRfcudpB7IBDdsZ6/ZGWUiS3Ht7HL9KA/SBfTmCpZBSL1CP7iSS
         G1WoO1o3qrPDToUWad/WpmUKlL4mvBg3dVizS+fH1eguutNuO0rlwJ2hiEuc3Y7hoF03
         T2n31CpVHeQiTKGr0IYARsxSQIDwqSLKDXLmdUVG43AyE/EmSZZxmv1eJ7azpoGy64QL
         vtrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794406389; x=1795011189;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=llfh8etuwqMEBoatS7BG9atTA4vpv1pJNPCbkPuzpyI=;
        b=W4+YzQ5mqr3apHZAAJnqzIeo+3G+TjY4tTzUf8Ih9wg/39FP73oTp6QPETe9jcm+Xy
         /rBcJDwHQAuW4wO/ejegLjcNVikgMQfEWMNskPxGV9iryj1qW42uMeztbJvKluwsYu4w
         tBXPvLuo9jlYZommFyxCh8c9sPSIl1NUXgBpPad94YCikSKtITv2VSpLYwAsFQTpB9I5
         qBWxRBFNiPpR9s4kx0E9L3MiYJv0sKwmQbkvVviA//LBF4tEq/iTey23LPjbBIzIjUrG
         Swa3cnEiSVCyXGtd0KPm1Fpg65vsg0WI5sckdBTMJfBgTlaRYPu63Jahv+Jit5NbCOa3
         CVKA==
X-Forwarded-Encrypted: i=1; AL+hErF3Wdt9s/g75OQdyowNRdJ/YR9uqIKfn/Y6lomHp/kVNjR+NrhF4ZTOctjiL+d3wiUWD4rVA9PxMWqBuQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9dKWQS8iYZbrgH0DivFwPeMJrDukO1j957Gp71PPULBDsRdUOG
	YOObBkWf5TTAnoWjsDjJejQeYtdKyykuKFFQN6eJZgcow27vVMJ8gGHXHuJAQHPGAKfS9X8Lw+l
	9RwLCER3mQP4gq1Qvtnakm+9WGB/hbbyT1bmjAbZZijkofa6F1L0YwezaKfwoK2OgPQ==
X-Gm-Gg: AYBFou1KSVRerbDSwEiD+FP5J5zb/z9x/49TfvcunBAAxGOI7+tbxyhAyq9tSQ5GMac
	9wlfxafyqdJZM7BPp0OS8XtCQyOyt42ysCAWTX5CUGu9DK4Wq3i28InWeeUuQSML9F89EhSWEY+
	LQPWg8N8ra1EOafE1bJJvmA9mxtYQ0pHYpc566hbRZhJ7LuDR8ZufgJDhzuUkaqrBUF/ywGPWNR
	TgaJsNgrFL63zF9nC/SbR90w0GLJHQlLCc5X0BSBk0AiQyzh5uaIK28/n4DSt0Kq9crrtYilVMr
	r0i6xO/fUjuGE3THFR9wpN1G28zlr+pRerN04SSPB+tis7bViRdZ8EbL54O/Il+zbFcDuVHKfqD
	FR31ETOlyMvNOTxNmekXFRmxlWjxpKQKbE2LvRuU11zVDShiUsnf1reOrM+U3ZEsoIOnpij4gt+
	omqeXROkIUeckaw6lqzT4j87FDHcPIbyRKI1vTmZpVFywWqYT1dhvDmz4DDdQkXw==
X-Received: by 2002:a05:6122:1b09:b0:5ea:94cd:c5d7 with SMTP id 71dfb90a1353d-5ee1c462ffdmr791573e0c.16.1794406388829;
        Wed, 11 Nov 2026 06:13:08 -0800 (PST)
X-Received: by 2002:a05:6122:1b09:b0:5ea:94cd:c5d7 with SMTP id 71dfb90a1353d-5ee1c462ffdmr791529e0c.16.1794406388144;
        Wed, 11 Nov 2026 06:13:08 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c157bb7839sm956114e87.74.2026.11.11.06.13.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 06:13:07 -0800 (PST)
Date: Wed, 11 Nov 2026 16:13:05 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowangio@gmail.com>,
        Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
        Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Flemin Jose <flemin.jose@oss.qualcomm.com>,
        Mahadevan P <mahap@oss.qualcomm.com>, virtualization@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, iommu@lists.linux.dev
Subject: Re: [PATCH v2 01/23] dt-bindings: display: msm: Add Qualcomm DCP
Message-ID: <34hgm3yw4z4kbulvgpg7c2iunyui5ljn2l6fqq47prc7s6hycn@c2rnwvhcn5x6>
References: <20261026-jshekhar-dcp-hlos-v2-0-7cf014efdee1@oss.qualcomm.com>
 <20261026-jshekhar-dcp-hlos-v2-1-7cf014efdee1@oss.qualcomm.com>
 <fzchmbho74ii6d2zhzni4qy4g74hiwv4fwf5xudrqdrstt6klm@7wdoo4acr6fm>
 <0bf2075b-e507-4b81-a563-f7b4e7e2cbc1@oss.qualcomm.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0bf2075b-e507-4b81-a563-f7b4e7e2cbc1@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=GKGdgeNK c=1 sm=1 tr=0 ts=6af477f6 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=XCsYekLr3cgse1I9aysA:9 a=CjuIK1q_8ugA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA1NiBTYWx0ZWRfX3E8QZ59UOCjc
 oAOV+w60qQUGb6hNo3mXIWnHs8VEsRSE+QeBuwRLyDbXiy3jdOeBIke5aDF5WFRtKEaVhtr6ePo
 71oiT9ms+/aqy5uQesLtAmCnB3EZHaO9x3e5Rr14vyJcwWI9H4mYkf10zdYKoCQiftRF7u+z/U6
 wb+P2zlQpcRaMMhu9tVQN39gofJ8Nlekh76PD/BCBRpIxjzcYAOGjpUpx16hb3JDIYLz3aQgDGu
 Wpn9Q7W+vX1RIjc84RFReUOOo/sf1djHu7+OB7aPGvTgGa7+Q6O2wjT+udZUiV/6CsbCj9vt7W4
 IpQf1KX4H3ozXkhL7qUW7pe7yf/Uu12qVCYxeE5l3qc38FepKlV7AELnwUViTL0nMWQldQa3CXp
 4yPg+AeGPxlb8jg9cd47W9GBnwLpEnt7gpeXDarW89yzPmwSKtNEGi101kGLPe6u4M2BR6e94sZ
 yhxAayZ8fzT62+rFO8A==
X-Proofpoint-GUID: D6eFOTNa5RUExjmFXqKCzEZ4wcq880SA
X-Proofpoint-ORIG-GUID: D6eFOTNa5RUExjmFXqKCzEZ4wcq880SA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA1NiBTYWx0ZWRfX+LUYKwHSJNfc
 ZhxxsKz7OrDAxYDf1IO9i3z76rK1xr6l8Kc2n5aYGX8Y4spoARu3vB+yY2FDu5cCM+rP/Z14wHx
 cxomxPGht8N7XlP4+HV07zuuSp0nPMw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501 phishscore=0
 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110056

On Wed, Nov 11, 2026 at 12:38:54PM +0530, Jayant Shekhar wrote:
> 
> On 26-10-2026 15:27, Dmitry Baryshkov wrote:
> > On Mon, Oct 26, 2026 at 11:51:11AM +0530, Jayant Shekhar wrote:
> > > DCP platforms place the display pipeline under firmware control, so Linux
> > > cannot discover display resources through direct register access. The DRM
> > > driver therefore needs device-tree descriptions of the Qualcomm transport
> > > wrapper, display topology, IOMMU contexts, and panel connections.
> > > 
> > > Add bindings for the Qualcomm DCP transport wrapper and VirtIO display
> > > subsystem. Document the IPCC power-notify resources, transport and
> > > framebuffer IOMMU contexts, firmware-visible IOVA range, INTF graph, and
> > > DSI panel connections. The wrapper creates a standard VirtIO-MMIO child
> > > after the IPCC power-notify sequence has completed.
> > > 
> > > Assisted-by: LLM
> > > Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
> > > ---
> > >   .../bindings/display/msm/qcom,dcp-dsi.yaml         |  79 ++++++++++++
> > >   .../devicetree/bindings/display/msm/qcom,dcp.yaml  | 123 +++++++++++++++++++
> > >   .../bindings/virtio/qcom,dcp-virtio.yaml           | 132 +++++++++++++++++++++
> > >   3 files changed, 334 insertions(+)
> > > 



> > > +
> > > +patternProperties:
> > > +  "^dsi@[0-9a-f]+$":
> > > +    $ref: qcom,dcp-dsi.yaml#
> > When adding DP support, would you add more devices at the same level? If
> > so, we risk getting a warning about multiple devices using the same
> > address.
> > 
> 
> Is it good to model each firmware INTF as a single interface@N node carrying
> the INTF reg, with the protocol-specific DSI or DP description nested
> beneath it?
> The driver can then obtain the INTF index from the common parent, avoiding
> duplicate addresses across protocol types.

Yes, it might be good, but it's not what is happening here. You are
adding dsi@0, although, I guess, INTF is 1.

> > > 

-- 
With best wishes
Dmitry
