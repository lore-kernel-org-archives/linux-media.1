Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793009997;
	b=w6R7wlAR7Z2sX2qQDngP+0T4jG4hobOCy7AkcJLpbiA2RcFzqhTzImlDGgQiH+Tikigi
	 y8pLbZ8kcMdZysiTaHX/6gj/tr+JXsDWsXpRn6MqI8gjszapCGkH3/EZlwmKJk8FeLEvv
	 dCsB6bjS6yKRz5bFnZd2LTqeKo/6zYB8Snl1IbGaA36ZQj3oKQYvAAJrjeyvc0RcU4H7p
	 8FJNoqjMI4U8Yb2wHWPQiZ4SfuTQXmhj2WIwVMxcV00+Z1PsJpYTs53+vjgqy+GGXKY7z
	 SMx77XsEZqjlQQun2gIsC++4dl370vHI8yC6gEKSlgdhvZA2v+gLNSOVjV5upDSOlmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793009997;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0d1AZOuu17x2UJYa5tXiu0AYveVDNIUyu2EW7x7PGi0=;
	b=Q7YScx0/3Nu+FRbuKNemBSMTw1oV/QggJrZ1IAfGR1PDUPn4emEj9s6apw5YVPYKqHmy
	 BgR/53N/3D5CpbPBddU7UQuNC/Jzp9MnLJKAaXp5wGVi3M/h7UsI9UOD6SNUYl6hlkeD5
	 MBO2+olE9Gk3CdgA8Fw8GKA4B5A7f2lBffoijVJUgB0Ec/SW9/RkIu+GH5QAs7RXBKFme
	 LSUcTNSvrnhCSuEfqqtbhwN+cqugwvlZ9bB6fGkUK70dZyiX/UvdZi5Y1DGDX5otZmggG
	 54Tji3i09bdT6tGuGbazkOqWmSI0ipEB4ts6Q0yVExR7yhfIHEoaZ1VEKHiXSZRx0aA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iG7uEmRH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=S16lIbFK;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B2A8606A31F
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 10:19:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B2A8606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iG7uEmRH;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=S16lIbFK
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4aPrf2222502
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 10:19:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0d1AZOuu17x2UJYa5tXiu0AYveVDNIUyu2EW7x7PGi0=; b=iG7uEmRHrz2nY6ZQ
	qdfXjpFDxtIuoB54amFfslMLk2lyWrApABuyXNM/prMFFhb0eZQTdvQQmSwZSmeR
	P2Itb0Vd3aOACtLYDfNclmQki/Xm5b7/Y/fogMLOSR6c8vuf2nNwnfmnHQ1kxVTo
	8/g4NRErnM8FfV5y9oECOeIGwrLqPaPNkRUOBgxRPR9twWXYqwbMG5Oxh+dnn2NZ
	MHzvISixMZ1cYA4ooKwj247NCQDEYHN94FAzl5ZNSeqqRY1zq/JjyaqqTxHeLITP
	KvojHGmvFYS/Ztl4x+BIdJNMTEK8LQyl2XRwbepebw/VVaXUzGh+TynZsanz9x4H
	yOtGLQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhvdd9ney-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 10:19:56 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7c15deb3794so542617137.1
        for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 03:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793009995; x=1793614795; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0d1AZOuu17x2UJYa5tXiu0AYveVDNIUyu2EW7x7PGi0=;
        b=S16lIbFKdC1K8VCHS1n1bdK0VdAcHyBHl1pX7UrAkXZ8MCtRUrIHQrwtbbAHrEqprZ
         D94mw+Sb/yUYjfy2q7ucb0xJqS4HlwA6TV/vA1gtwzft+s8mJWjBQddBYo7WJRAw9eJN
         S6f9W9L5WyVCNXvszUV/veTedqRtLZjzgNjYr+t+ymyqJ5nprEi0w6xP2EHghF7dFjEo
         nghqW2afBlEffky5KiTlhP50OIo7jzD4EWBMfSpiXmA4UKLBhcNB9XbdfCJuwCeC3Crm
         77+9bM/incXbt8b35xwAuT6ug5S46GC2EQr6UYeUUj56OEbjozy8eJXf4vSfOs3Sx7IJ
         O6Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793009995; x=1793614795;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0d1AZOuu17x2UJYa5tXiu0AYveVDNIUyu2EW7x7PGi0=;
        b=DG9DKVt2hDOOvnLpmXKVLgdpngB66qZWXw3QezEwj/SuyOACh5xzcwYzD/l6Ct+vNa
         7ExWGUZsMUkoIOPZUu9ggw+58DutdzxtRlVUIccO2IEaKpjgrTPBA2ZCmZDgY9+VWZ46
         oy3wta7tknVzkvieLUbLUGXG8SxCxOCMu6qztd/xY8QFQOjhCpWSuW0hG5dINhMoAfPP
         3q4xchWBBSeGKyFy/ovBUwAb9LVd7HJ0OTv+HWsypSmT2tj2SWE3QWrIxot/BivQKagR
         tjUqxZzZkPMVg/+bW9Y14cEyVAramZtMlUaBzE4tClij7jM48lM3wavIvqAljShO8cEi
         wRKA==
X-Forwarded-Encrypted: i=1; AKwUvBzlQ3QTqJaBqjfrhSjkwzSwFT0vYnWZPnfsBt78pYEShcMUhch4xflILMTbEsYqY4QduZwkeiXYF1wEIA==@vger.kernel.org
X-Gm-Message-State: AFq9FYKvIBV/gSCwh5RTa59ZnGovXQdkp+MgvFGRKpLrS/GTU0EIGxgs
	awGCgGh0GPWEJh/jcaMX3alM62QXu4Q/cjYlaV1nL4sgSt6tBMl6m/mWDB5MfbZj2AeLPWK59LC
	9yV3o3qgWynEBTCQYayEupvjJXu8l5nBmMmYcjBShSLGCt789GbFbn3LBBFZe8xWvmQ==
X-Gm-Gg: AYBFou0xGs4CWWuHlJxzKcUL0sVmrM9kh/N/Er7OePvt7xvSSly8njSdLKT/+K9wJdp
	3Xfbt3rwO72dUfBt/AGw2CBD2sD9rsiQkCct1N8DWTR+Ot4AfKzenTYsIQD7bJEzx7shBNSjhry
	LLWgmNk+AlaiYIlANowoi1AVm68ez50sn1/+BTNUdWXra/6NyxZUFjBK6U8QzuvDpjTskooiPeR
	YwDs1q2uinHzXKVpn+KLi8DxqrnXcZ2IfhFIOmuloOPZDthENg6Kq+8LuNbHh07i+jyfkLaQnY7
	3TCY7Q1U+UinofaJstRvE61xUTYG4dPk5Xas8YZSA+E/X8b1TmWvbz5s24v7PJ9dMZO+iDYigyD
	ddG75R5brOFAKvejrFVJ4Neq3FEZKLqiG30yDo4lexPdzzsTJCZGuOfCbwheWKHIDzr1v74/u6S
	DleA9MAthLLC1s
X-Received: by 2002:a05:6102:508e:b0:7cc:1a41:20e7 with SMTP id ada2fe7eead31-7ce5cc8d17bmr1599794137.7.1793009995226;
        Mon, 26 Oct 2026 03:19:55 -0700 (PDT)
X-Received: by 2002:a05:6102:508e:b0:7cc:1a41:20e7 with SMTP id ada2fe7eead31-7ce5cc8d17bmr1599773137.7.1793009994712;
        Mon, 26 Oct 2026 03:19:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac709f3a4csm18119321fa.25.2026.10.26.03.19.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 03:19:53 -0700 (PDT)
Date: Mon, 26 Oct 2026 12:19:51 +0200
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
Subject: Re: [PATCH 08/13] drm/msm/dcp: Add DSI bridge
Message-ID: <ztyi4f5u7h6bmm6755j3xzf25gvguqswiwwpfm5vj5ye4sfl5d@t7vwsro3kewu>
References: <20261015-jshekhar-drm-msm-dcp-v1-v1-0-48aad0fe4f72@oss.qualcomm.com>
 <20261015-jshekhar-drm-msm-dcp-v1-v1-8-48aad0fe4f72@oss.qualcomm.com>
 <hftbao746gtvza4vkmeo4jvvgrgzoyrifdpsu4w7vcy4w5qskv@4afg7wpdw6gm>
 <a27903fd-c122-4ba1-ab84-fd3fb282fc77@oss.qualcomm.com>
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
In-Reply-To: <a27903fd-c122-4ba1-ab84-fd3fb282fc77@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: ykabGWoPoZVkm_vgc5Y5KLfsb0nW5NIu
X-Proofpoint-GUID: ykabGWoPoZVkm_vgc5Y5KLfsb0nW5NIu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0MSBTYWx0ZWRfXz69cI2Z+rvxR
 fGMEpku1HyOQqyAF1FGm65AuEMgDYrcqDDFYri4qD0W7MK7hupEZ0Ib6WC7irL/MWFPDKJvOELc
 6iO56mDFgFIiTd9a5yevrsqq8IIYkEfzYWKhPXv33YFa7DLWXOmNzgQ6dmWhYxGtpJZb9cgnXq4
 HpkU0dAZHS+qPp8xY7weBptwtG+OUzILUyDlsE/dan6OippgcERlvG5aJ4PnrC+bdqWXbNnSstA
 uKHn4qrj/TFMWvH3dWYiAsaE3TqBZMI22H0uZ7/rfhcXvffWvhVfrXnXGAIhFVzTnajEHZbQSPx
 1lsW1CUFOPjN5CMR4C6iqU9ndFf8nfcYSnnklXOvLm228pJv0+aAr0XWt14gW0UN1o+htv2oc+O
 S0/u7BBIpdFmbICzsjgoNlWd/aa4qD4AgnYNhHHbk+spdxSrxvWNcj+BxB/p48QjNM8T4s/v5tU
 inGuMBbh+2PQHHwKRyg==
X-Authority-Analysis: v=2.4 cv=N8+8hG9B c=1 sm=1 tr=0 ts=6adf294c cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=B2W7agYZx9Fm13VZOvYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0MSBTYWx0ZWRfX+Usge1IXgN8S
 O2Bmqz3T/l8T37hOnb5fm156Uvao5RFzQ8/g1lJo+u6M//DOIvd6xBihrnGUBj4mjoJeJc1QDkJ
 /nXTQjavSIiaao94KA9S1iFRYP9ftrM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260041

On Fri, Oct 23, 2026 at 12:47:10PM +0530, Jayant Shekhar wrote:
> 
> On 15-10-2026 18:26, Dmitry Baryshkov wrote:
> > On Thu, Oct 15, 2026 at 01:08:28PM +0530, Jayant Shekhar wrote:
> > > The firmware owns the DSI controller and display session, so the DRM bridge
> > > must translate panel and connector operations into DCP HFI commands.
> > > 
> > > Add the DCP DRM bridge for the MIPI DSI pipeline. Translate panel, mode,
> > > power, DCS, and display-session operations into HFI commands, together with
> > > the KMS session preparation and CRTC integration required by the bridge.
> > > 
> > > Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
> > > Assisted-by: LLM
> > > ---
> > >   drivers/gpu/drm/msm/Makefile             |    1 +
> > >   drivers/gpu/drm/msm/dcp/dcp_crtc.c       |   14 +
> > >   drivers/gpu/drm/msm/dcp/dcp_dpu_kms.c    |   45 ++
> > >   drivers/gpu/drm/msm/dcp/dcp_dpu_kms.h    |    4 +-
> > >   drivers/gpu/drm/msm/dcp/dcp_dsi_bridge.c | 1140 ++++++++++++++++++++++++++++++
> > >   drivers/gpu/drm/msm/dcp/dcp_dsi_bridge.h |   69 ++
> > >   drivers/gpu/drm/msm/dcp/dcp_plane.c      |    8 +-
> > >   drivers/gpu/drm/msm/dcp/dcp_plane.h      |    1 +
> > >   8 files changed, 1279 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
> > > index e7d24be72113..9910bd4f306d 100644
> > > --- a/drivers/gpu/drm/msm/Makefile
> > > +++ b/drivers/gpu/drm/msm/Makefile
> > > @@ -72,6 +72,7 @@ msm-display-$(CONFIG_DRM_MSM_MDP5) += \
> > >   msm-display-$(CONFIG_DRM_MSM_DCP) += \
> > >   	dcp/dcp_crtc.o \
> > >   	dcp/dcp_dpu_kms.o \
> > > +	dcp/dcp_dsi_bridge.o \
> > >   	dcp/dcp_hfi_core.o \
> > >   	dcp/dcp_hfi_crtc.o \
> > >   	dcp/dcp_hfi_dsi.o \
> > > diff --git a/drivers/gpu/drm/msm/dcp/dcp_crtc.c b/drivers/gpu/drm/msm/dcp/dcp_crtc.c
> > > index ede81881d495..fb8920d44f8a 100644
> > > --- a/drivers/gpu/drm/msm/dcp/dcp_crtc.c
> > > +++ b/drivers/gpu/drm/msm/dcp/dcp_crtc.c
> > > @@ -147,6 +147,12 @@ static void dcp_crtc_atomic_begin(struct drm_crtc *crtc,
> > >   		return;
> > >   	}
> > > +	ret = dcp_dpu_kms_prepare_crtc_session(dcp_kms, crtc);
> > Do you have the session mechanism described somewhere?
> > 
> 
> The session is an HFI display session created with HFI_CMD_DISPLAY_ENABLE.
> DCP requires a valid session ID before accepting destination-ROI,
> plane-property, and frame-trigger commands.
> dcp_dpu_kms_prepare_crtc_session() finds the DSI bridge associated with the
> CRTC and calls dcp_dsi_bridge_prepare_session(). That function opens the HFI
> display session once, stores the firmware-assigned session ID, and publishes
> it to the CRTC.
> The session is then used by the remaining operations in atomic_begin() and
> atomic_flush(). The bridge’s atomic_pre_enable() verifies that the session
> was prepared, while atomic_post_disable() sends DISPLAY_CLOSE and clears it.

I didn't ask to describe it as a comment. I really hope to see some docs
in the driver.

> > 
> > > +			dcp_dsi_bridge_get_mixer_count(dsi_bridge,
> > > +						       &state->hfi_panel_config, mode);
> > > +		state->hfi_panel_config.topology_enc_count =
> > > +			state->hfi_panel_config.topology_mixer_count;
> > > +		state->hfi_panel_config.topology_intf_count = 1;
> > No 2:2:2 support? Can we just drop DSC support for now and add it later?
> > 
> 
> The current series supports a single DSI output with one encoder and one
> interface. It does not support split-pipe or 2:2:2 topologies, will be added
> separately.
> DSC support cannot be removed from this series because the Hawi MTP test
> panel requires DSC. DSC is part of the panel/DSI configuration and is

That's a hardware problem. Use a different panel for the initial
validation, then add the DSC support on top.

> independent of split-pipe or 2:2:2 resource allocation.
> This series establishes the basic topology and HFI/DRM plumbing needed to
> validate the DCP KMS backend. A follow-up will add dynamic mixer, encoder,
> and interface allocation, including 2:2:2 and other split-display
> topologies.
> 

-- 
With best wishes
Dmitry
