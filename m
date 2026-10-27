Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793101909;
	b=lLBGm2f9tSwEKv4qQ+mgGLWZt39JBZ5KsePBUDwTe354YsjKzzFBQZoPEpWQd2kF8NvN
	 XDwSnw4xmA8TzYlh70gAfTfdkjoWLAlOnPurmRmucAg/4lTso1rIprnkXwxhW7h3iMfDt
	 5ATXItuQnjfSpUw8K3pQVCdyqSISuh9KGckqmKWJNzNBnkFXTJhCW7W7/bsu57a/pQRPB
	 1y0+2ae83VBVyOx6U8m269PGNjmyE5nL4CkucyCvMnE0CKVovCiEerYeTxh3HS1SZ2nJG
	 Hh/4l2NMRRNRH6tLkGQOaGHs+RzLFAXeLeO2POH4ZbLzBBysa7ZdGvgFKenwD/CSVSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793101909;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=4W3OqlKiBwfz5eOJMTRV/rIcRtmzZqXVHzyrSvnxP1E=;
	b=eeJrXqKsF97q0XAvfoJNte6jnW7zvkJVjSH5oOzuBzNeRmg08TOcIHF6tQIdWE5W9fbV
	 15+bNUnOZ3SqFss0/EIKqoiYjtzthlh3K+XmmFGOdX4AGDHK9XK3mSKs54ijEkDgrDQkB
	 J9KbxjZ9Um5GWqJ7RX3lQ+vmSVdK96cnuBvtGqZ3dyhqxXLreowHvyGci9ZHjm6CT7wyr
	 7npTnxYWyGjz3HcMA6tkpwmxRs5BwHG5oprl6MvQq0FCkJjkey/0xAr222WMAvoU2yWh1
	 k6jOejawz6G8chlF6UY/V9txYVafEGKIPC1RHxpWmZPbs9KxzvBJDxeih2h+8r6vahQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D1mfuL7S;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ODjG4Tp6;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FB1F606A31A
	for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 11:51:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1FB1F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D1mfuL7S;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ODjG4Tp6
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAdvBi1614507
	for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 11:51:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4W3OqlKiBwfz5eOJMTRV/rIc
	RtmzZqXVHzyrSvnxP1E=; b=D1mfuL7SsPPdywV1ReO5FFA7LhAPLjwRRqGIXf5P
	zHtT9DGm5cK7aTPGPks/P9Tp3ff5LKQNkHUi1YVw4uQZDKdHMtxyca9OI4ORMxWA
	M0qHs20gmke7Jm1Ro6H3/CpWT8JkzH30zVEyPPuQ0OswNev4I7RQ381fWXOClVRR
	kQX9ZFhdwY6v6uMd2DyCDn12HCMkp8yv0W+efd9Ulldrq7jkk9bxcvNyyaiHrIm1
	yOCyBIWEwV9qfwg1kOiGI/p/GoLgs/KhI2n87VNnAom40WMY+IqIvknE8yLyux3S
	7OOPInAJcEHMHv+WquBkag64NvySmob2o+UL6KSZatGoeQ==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjqf5s0wj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 11:51:47 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5eac74b0596so3884843e0c.3
        for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 04:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793101907; x=1793706707; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4W3OqlKiBwfz5eOJMTRV/rIcRtmzZqXVHzyrSvnxP1E=;
        b=ODjG4Tp6sYiSpQUj1ak18Nww2EFA8xoVf4jLK4DanUOjGarjW17SW9/Bdw4Y/IYMbt
         UTTNizatXJaJs7YM0F3QMpZMTkpby4dHrLUk9ux1xLGeZvMzEZ7ehivcczSpuo8hpNED
         lpLKJZUCA1xJMNnkY+MEBjQFR5TFa0g1gSIWfq0LdmHoWKo1hS3ipCokM0PYhu+yVbmE
         e9LKIUzDl7oQOnBr8BjER4Obe1uPx5xEjmbDXi5mIk8fC7pM/UmJCxyHyzFJ+S/wmZdS
         IY9ssstHX9apHU6RjJisdqGsV0g7PMSFoe0MTCsw1vUP/MRcpl3nFeFx8uYGwc+5RK6+
         7s0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793101907; x=1793706707;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4W3OqlKiBwfz5eOJMTRV/rIcRtmzZqXVHzyrSvnxP1E=;
        b=dyC8gtZNCxR0BA2A+p8ZZ+KJfjpxW2Cfy4V02k5d/gSidiwnAHkrXpyd/c6a9XTnlr
         m+ST/k8lXLZ4oSGWQFK9K4BjyjDurBct5AdAzHkWi64rfQpPNynCtIB0TiA0OeLafssN
         lbaqvYZyDgrKZLHq/S3CwBXOIq8gH20OUl/ijypi2Hqr7uqtpTTM7w3T2QJH294DyJVD
         RstNmdFmmovrKiPAMDu6Tuk+SqWrZotvSRBLomBL80r3Fy0kpS8JSo+VEmXQ15WpGkG8
         MGUe1fJ7b3xi2Lc/v/VETCkZCfC9HUK2Sr+twtTSRbIUAUmYBznMoJH5UA0GCGQq3IJt
         VEXQ==
X-Forwarded-Encrypted: i=1; AKwUvBx9dv9B9PWxkQAi0buBnyBi4VeNhUlJC6BcD+MJ/teVjdfUG/bJBgM456USACwT5X9UveWfgtjhPZfU8g==@vger.kernel.org
X-Gm-Message-State: AFq9FYL26vgr3zCy5Dvi2dr0aVqD/VWxCu543g+dX/mI6Y7rF6ypTCl9
	CWg/0OhL9nxO7CClpf3nkzAMk5Ag7QKxz3DJSlHR+Ka7ZcDRuEt0XUv7d+skol+gNuGJQLOGwnX
	SUF1VkOK7m6WUrMcGti4/zQdPisYXDoD2W6h2qxfLN3zEp1jHlnVlLh4Zqy2WP25izg==
X-Gm-Gg: AYBFou0xJdtGQn8ByrhMzRvgGBjP5eP9PuM/w0ovk9cmIGF3FV0DlbAcJJzp31nZq0N
	bAGcfMix4YoUd0G6QPS+u1dKZ4OprgErdbwkWaIMbx+/KlnzeIU00pSVw6sswiqAzPhiw/cZj4v
	iqEW3awlpkjbkII9rBnu89EmCU77dYVaQZ3yuysUOJaCKbR7gxfJszOEk0lrNvqJoD0rLBLtqJE
	6nsvn8C8AeKyFF0fOjOWRCqiv/bqoJG35e89k/uzZCm5gSBDP2+XJ8kRWGBEOE5SzmILanDsJup
	2shDvhxb4PVJtOQ2m4ziwZMK+8RaPr4QQx1Y1Nn+sHU5lopqh4BDiik6unRBOQxKa5oUneYdc3/
	5rpHHNzFbZzT98agYWi9KfM/5JKamgXQ/P2mNNrOYINkBU2TP/pzLnSwQeJ825X3sZYpWndszD4
	vestZfvCH7wk1R
X-Received: by 2002:a05:6122:6990:b0:5ea:e324:7c15 with SMTP id 71dfb90a1353d-5ec232ae080mr3936903e0c.15.1793101907203;
        Tue, 27 Oct 2026 04:51:47 -0700 (PDT)
X-Received: by 2002:a05:6122:6990:b0:5ea:e324:7c15 with SMTP id 71dfb90a1353d-5ec232ae080mr3936868e0c.15.1793101906693;
        Tue, 27 Oct 2026 04:51:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac70993e89sm24077941fa.9.2026.10.27.04.51.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:51:45 -0700 (PDT)
Date: Tue, 27 Oct 2026 13:51:43 +0200
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
Subject: Re: [PATCH 04/13] drm/msm/dcp: Add IPCC power notification
Message-ID: <t3vxg46g7jac5th3hrrs3zchss6lzmgm2ga5qkro4cepr3qmnb@ddosuavblhuy>
References: <20261015-jshekhar-drm-msm-dcp-v1-v1-0-48aad0fe4f72@oss.qualcomm.com>
 <20261015-jshekhar-drm-msm-dcp-v1-v1-4-48aad0fe4f72@oss.qualcomm.com>
 <u7pcn75yh435vuuwqezml37bqfzdztvrywggbmkydkilwe5yzp@myijo4wd2bob>
 <db88a83c-29e6-4fb9-a874-15c0f186e14d@oss.qualcomm.com>
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
In-Reply-To: <db88a83c-29e6-4fb9-a874-15c0f186e14d@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0NyBTYWx0ZWRfX2HezyaEPr9nL
 FMlu4Wh0N87Rzzri+m+qc11O3PjmRfJRZPphvWF79P/2QMVLv8u+B4yw4mpA313GYea6+evL1Xu
 AEqNqm1cg7HY/rVB++SxY6QUCD3h7RI=
X-Proofpoint-ORIG-GUID: ETsAlOlogFpz1utCIKjcpOzVsmFah_t4
X-Proofpoint-GUID: ETsAlOlogFpz1utCIKjcpOzVsmFah_t4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0NyBTYWx0ZWRfX6U0LzlwWf63+
 mvZHivCxb3FvIdRPH7dPIl44AygeIitDkFoHGlB5GIhv7z/YRFjj03j3hMPcmRXi890oDJ0FBS0
 QFnSZhUmJJu0MFPG5Uqb7cCuQzRoR2/ksQDC6pB/IwwQ9eAf3TQBnWl+iEpuPl6zf2YrIRebRdB
 MYP3ZjSJPgpnfZrAIQKOB0vH+DAa4Z+H4QZEgSBlq8C0PZemTFWr7tcWHwRQPhGbNoKeajskbwA
 0qG0vFF+U+3D5q/J/fCo2aXpf0FJdeyucg9k099Ryy0MZwEcEgXZY+h6Tds6uWhA2MXdXxZNeMD
 uYDFUa3VZX4SZM+sGuUX/BSJZJlvaRlg5zMFb/zQ6vSTFZybPYsDyeJKgakDf3pqj6dGUK0S9F2
 5dA+Mx/br+m+y4aAfsSnSM8VctuTldWJYiLSn8CllMeipRVP2gjEl9++0PwdTd/3KxmFHii/V8q
 dsQua7Z6aKF02BnFZqg==
X-Authority-Analysis: v=2.4 cv=UOFIjyfy c=1 sm=1 tr=0 ts=6ae09053 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=75pfyCq1Idx6z_e0LXYA:9 a=CjuIK1q_8ugA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 clxscore=1015 impostorscore=0
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270047

On Fri, Oct 23, 2026 at 12:37:30PM +0530, Jayant Shekhar wrote:
> 
> On 15-10-2026 18:12, Dmitry Baryshkov wrote:
> > On Thu, Oct 15, 2026 at 01:08:24PM +0530, Jayant Shekhar wrote:
> > > DCP may be power-collapsed while the VirtIO transport remains available.
> > > The host therefore needs the platform IPCC channel to wake the firmware and
> > > to receive notification that it can service HFI queues.
> > Is it allowed per the VirtIO spec?
> > 
> 
> As we discussed, its not compatible, will address in v2.
> 
> 
> > > Add the IPCC mailbox client and power-notify interrupt handling. Wake DCP
> > > before VirtIO queue activity, wait for the firmware acknowledgment, and
> > > notify the response queue when the IPCC receive path completes.
> > Don't describe patch contents. Describe your design decisions. The
> > reasons for the flags, init/deinit functions, etc.
> > 
> > > Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
> > > Assisted-by: LLM
> > > ---
> > >   drivers/gpu/drm/msm/Makefile       |   1 +
> > >   drivers/gpu/drm/msm/dcp/dcp_drv.h  |   1 +
> > >   drivers/gpu/drm/msm/dcp/dcp_ipcc.c | 212 +++++++++++++++++++++++++++++++++++++
> > >   drivers/gpu/drm/msm/dcp/dcp_ipcc.h |  56 ++++++++++
> > >   4 files changed, 270 insertions(+)
> > > 
> > > +
> > > +/**
> > > + * struct dcp_ipcc - DCP IPCC power-notification state
> > > + * @client: Mailbox client used for APSS-to-DCP notifications.
> > > + * @power_chan: Mailbox channel carrying power notifications.
> > > + * @resp_vq: VirtIO response queue notified by the IPCC receive path.
> > > + * @power_notify_done: Completion for the firmware acknowledgment.
> > > + * @power_notify_lock: Serializes power notifications and teardown.
> > > + * @power_notify_pending: Indicates an outstanding acknowledgment.
> > > + * @state_lock: Protects shutdown state and response queue access.
> > > + * @shutting_down: Prevents callbacks from accessing teardown state.
> > What is going to access it during teardown? Can we shutdown in a logical
> > way, so that there are no accessors after starting the teardown?
> > 
> 
> The access can come from dcp_ipcc_handle_rx(), which is invoked by either
> the power-notify IRQ handler or the mailbox RX callback. An RX callback may
> already be running when teardown begins. Without protection, it could
> complete power_notify_done or notify resp_vq after the queue has been
> detached.

THat's what I called correct sequencing. Make sure that events are
properly ordered. That is, disable / mask hardware event reporting, make
sure that the events are processed and completed, then teardown. See how
IRQs are being freed.

> 
> 
> > > + * @power_notify_irq_wake: Whether IRQ wake was enabled.
> > > + * @power_notify_irq: Power-notify acknowledgment IRQ number.
> > > + */
> > > +struct dcp_ipcc {
> > > +	struct mbox_client client;
> > > +	struct mbox_chan *power_chan;
> > > +	struct virtqueue *resp_vq;
> > > +	struct completion power_notify_done;
> > > +	/* Serializes power notifications and teardown. */
> > > +	struct mutex power_notify_lock;
> > > +	atomic_t power_notify_pending;
> > > +	/* Protects shutdown state and response queue access. */
> > > +	spinlock_t state_lock;
> > > +	bool shutting_down;
> > > +	bool power_notify_irq_wake;
> > > +	int power_notify_irq;
> > > +};
> > > +
> > > +int dcp_ipcc_init(struct dcp_ipcc *ipcc, struct device *dev);
> > > +void dcp_ipcc_set_resp_vq(struct dcp_ipcc *ipcc, struct virtqueue *resp_vq);
> > > +void dcp_ipcc_deinit(struct dcp_ipcc *ipcc);
> > > +int dcp_ipcc_send_power_notify(struct dcp_ipcc *ipcc);
> > > +
> > > +#endif /* __DCP_IPCC_H__ */
> > > 
> > > -- 
> > > 2.43.0
> > > 

-- 
With best wishes
Dmitry
