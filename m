Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795631033;
	b=CwATu6cF12474jFAMimDYNUbeFrZX+eusHFRiBqari58by1yUxz2kp7foDNRa559iBBf
	 0OCvaPtZF9oq8J+kMjvs1ypxtE8AGNdaWmeI5d1FR+A6MgfbbxAjNAJ7QdwwbfWO07AWM
	 Hv4JuHkt3PSfKYb20wjy87z5P3X4XjRfCMP6KYc/lgwk4+89fs4tDATrG6bCPBVoh3orr
	 FLBFW94huOYccf2Hv6Gl/JnVsB3ZakZbC0bP1jHbeVNkAMxTp+WeoKlW1MSL2lIn8QzUq
	 clZPSN0bgqtcWXtwEL6Qu8lXx0NR7jx3Smd02zXRl5Owz6gYDpNls9XVWXBkKxqpYvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795631033;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=73fJimGnv4XXi5i7GcWuvOiVYX99er6k8QowDhkp+Ek=;
	b=P4P6veDX0dP9jRgRznDLWnTYDbuV0PBVrqbNoXNKRQjgW/T7rsg60Cprm6XBNMN/7Lil
	 0cOWnbbUzTdB58q39/E0rmCFL1kdGK9hSff1pl9mx3IugP9F+6rDmSTdC7uPADAx2RXqy
	 DsFyMsc6UkJLAxmtbIscbLYr8OpSJPZ9kFILd5OSwgJDUkBCt8esLtsy65TeQT44DT1e3
	 qzcHfZHRHg8oe1Dpj9WqvSXblX2OYKjfLa/hiZRHYOFQwoCIhyY99bbbIXRKxs6GDAH1U
	 xT7bB41rgeDCTRsQvhvRNxs6Rapi7Ityf+sx+juBCnPW3aXJwwDBXStZVdMaSZ3nb3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O44QGPgW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gGWqqXCs;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D415606A337
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 18:23:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D415606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O44QGPgW;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gGWqqXCs
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APGQ6tO1670804
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 18:23:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=73fJimGnv4X
	Xi5i7GcWuvOiVYX99er6k8QowDhkp+Ek=; b=O44QGPgWvVI/aWO3tBOCd8f3cm1
	rNF6YZHpAlIWYz7df5JGd2qsyM9SIisi0DDB1ryb1drfSiXbmffXa7k0f6VW7g/R
	21aoA1tFIGCguIWn65GXzpZW+ij5rj8ActDdtmjwO7KOzGWM9755mRTmycKxSLJu
	bGO0qV9uIDq3wEs8wDKPNBmY2xDusrATkcBv4mdLgCFZiX1D9kGQ1avTRWOVbOis
	LBi5UhOFM4xRz56DkI4KBBdtpZiyFHBgkDyZywLJvtLlI2qOiaPT/xh4xkTIn3JY
	6NSyBq4xsJx4v1RTVS8+8G7Fmkkpr3zKkdYCy9Ua+8NtAm1c+IHKogBQpog==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j62varj7k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 18:23:51 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-9211d51dcefso113264116d6.3
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 10:23:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795631031; x=1796235831; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=73fJimGnv4XXi5i7GcWuvOiVYX99er6k8QowDhkp+Ek=;
        b=gGWqqXCs2d9PKlOcJEpSFPiabx1hNA8tfHJazCrOV408DKTle42nXzZW9l/JZJzFc3
         RI8Wno/PoWpl1RFrfH5SbNHjjr1RIp1HOIpNoLYBvGwU9Ke/3uBbpFqPz8t38ut9ALhh
         sxFKS6yIkQP2D7mxxtS3IN5dXdTFKAi+Vd9xYjcVCUVt0/BBafe0xTYip8oiN5Dr7oco
         xU+jETBBGJ/E14zLMb/VzNNgIxX00XiDO1NNHvEizT5VtrUlLageT0z9MgVm/euL2r2F
         WrVmkyRiAv/bggbTvY7Vgc18p3119XINz+sF69d2fH0SQuIPGFc9il07p8bNYtvEvA3s
         MX4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795631031; x=1796235831;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=73fJimGnv4XXi5i7GcWuvOiVYX99er6k8QowDhkp+Ek=;
        b=XfDIl965SDY/Mau92DEvRHnJ1mWKoVzI3IjFaRpkVsWLW5cHwXyDgA5S9dtP0rj0Ng
         UCTQ1f0bifEtSiw6CbcSBTj5/vuAojnejcu9IdUhx/hP6SmXN4lFv57J3FvyfB3OAlGz
         WHBj0uk/1ZU5Um+DsNTR6cmxXO5FOq0bJp//qnNVM+ZWpuLwYxMi9z6a7AcqO8oIVSqc
         pFXaWh6Pgq4IoVAD8FfZQQI5qnXsMcvjdhhwD0ek5K9zxSJ0ealM5kf7qQ0nyPYKqIw7
         oQoZE8n8JnnHJvz6GbOvQQvn0RP8gHS82+vix97FJ3/B8PGePYJe7EEbd4FQdhdfBdb5
         ZE0g==
X-Forwarded-Encrypted: i=1; AL+hErHH6DxouNqUmWNJInh1RA3QRZI6fDd8uyhV0bzrCPx8Hbf33JsXRi15J69/Id6ijgREsInUgy1KkjzI/w==@vger.kernel.org
X-Gm-Message-State: APuU4Z+0J5y/S4ragC33o8+iue4WlYKSFcm3o4T9PbYWY0wqrxvXmiWD
	U0Lxa2iNvTs43powZ494jry0YquaBhdAmleSFedd7LWVNwTzgv4X75X64DxIt53e+NMi9YjIr4x
	ZJ3RwgbXrSAlEtv2nYI0wedKl8svgSUrpUG/W+A9wmGsJB2Rh0sjkQ2mJ2s886D5pHA==
X-Gm-Gg: AZFdTZcIQgVtnrX2lKC3A0N/rakrhWIMS70YTMobUOrCoBQbF1Sz/0/vX40676BXyst
	PjPWntKmUr7aXtcyVgXcpgluo4XaaPq8NOlrktXplQqsaTIzXbZVR2X8PLLQIs6MdK+ndfhcKDb
	J2YcDgwUH5n+tZjdjsXaeZJMFAEyjoDLD6z83g3Wra7aNwd7Dvuw9aLtxnVNQFnGgNTkJyLRClm
	Bz1hxl63PBjnGozdZAYSdygaLBoLHioYf/mkDri4oY/e+xCV8W2G32EIucMESzBwtI5/lo3dgU6
	treEp51Wq4ckA9qY18RckTDBnDLXWTizOzIo/e+w05EW0zEU+DIAwnjbLRiLB6auG7OiAjdbfFU
	M3WQc6lKo+Pmkuej8PARBE6WDbWILb09/d0SOay9hzJyJCck9rIu5gvpTLS5Dl8Ttk511qKmk4P
	MWc7sR
X-Received: by 2002:a05:620a:40d3:b0:94a:9c0:c337 with SMTP id af79cd13be357-94a09c0e30dmr366538785a.46.1795631030575;
        Wed, 25 Nov 2026 10:23:50 -0800 (PST)
X-Received: by 2002:a05:620a:40d3:b0:94a:9c0:c337 with SMTP id af79cd13be357-94a09c0e30dmr366533485a.46.1795631029982;
        Wed, 25 Nov 2026 10:23:49 -0800 (PST)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab65cb42absm37185609f8f.1.2026.11.25.10.23.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 10:23:49 -0800 (PST)
From: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, Hitesh Patel <hitesh@ebytelogic.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
Subject: [PATCH RESEND v2 05/12] media: qcom: camss: Add per-port config to CSID configure_stream
Date: Wed, 25 Nov 2026 20:23:19 +0200
Message-Id: <20261125182326.2767771-6-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261125182326.2767771-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261125182326.2767771-1-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA3MyBTYWx0ZWRfX59nh6H1gOY7w
 JwYkc9RcsQ4ef01ezhz1YRJbhRbjz35BFHBJ9ryF8V45sSOPZVLJg7CsXVrq/pSHZqzCURQGQCe
 nJMcDnEKq9EhG3xvQ6tfQFGdFLVGKTw=
X-Proofpoint-ORIG-GUID: UTDm_JgPBbmbiRCmBP8x8PqscsfeIEhG
X-Proofpoint-GUID: UTDm_JgPBbmbiRCmBP8x8PqscsfeIEhG
X-Authority-Analysis: v=2.4 cv=QZPzLcbv c=1 sm=1 tr=0 ts=6b0727b7 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=LTdo2yCfIfbF-FAaOukA:9 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA3MyBTYWx0ZWRfX/RNhNKcqcTxV
 roFfWjcweUaAlJEAXmsfznUOgFALpndGLAlTmm2VKaUnyp7JizVWOHkUDCQPZcfmfllBzmlxRR7
 ZiCAaFZUDNwXVqavFY9mpaf83kb3D+TB5IWxyz+h9XRq6tKlxABeXjn/CgNVW1o5KiYCN10W3+s
 4xUcvrtTom43iKZYyi+TgElR2ipqdAm/xSvdbnxWMDeNiDrYJkKv192WcJEptR448hRou2OMWzF
 acouMFCUiM0iJ1WrBZ3qyCQfYpTjKENno+dC5v0QWmer175BeuOI0NhNzP6AcAgMClgPCkWEh5w
 qCHdEqTwXeWrJDMddkTlj76h0+OHMj3qZS10HXQT+0rTdsUjjHiG2IB1Fmxk/7vid6XomFv9Qho
 +/EEol/Nw3Gkm14uxVrFJMnGvqwNqdjcB0G8F9F5R8hG8QDOk6fxiJkGTly/bWxHRhQyLCsZ03x
 ofrfH/jRcSIsmYyqzLQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_04,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 malwarescore=0 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250073

Add struct csid_port_config {vc, dt} and change csid_hw_ops's
configure_stream() to take a port_mask and a port_cfg array, replacing
the old single enable-only entry point. Bit(i) of port_mask selects
port i (pad - MSM_CSID_PAD_FIRST_SRC). The VC/DT to program for each
such port comes from csid->port_cfg[port], which the csid subdev
is guaranteed to populate for every port set in
port_mask.

configure_stream() remains the single entry point for configuring
CSID input streams, used by both the legacy (non-streams-API) path
and the future streams API, selected by streams_enable. The legacy
caller in csid subdevice populates csid->port_cfg[] from the
negotiated format (VC 0) before calling configure_stream(),
matching prior behaviour exactly.

configure_stream() is a single function pointer in struct
csid_hw_ops, shared by all six CSID backends (gen2, gen3, 340, 4-1,
4-7, 680), so its signature is updated for all of them in this same
commit. camss-csid-340.c and camss-csid-680.c replace their internal
csid->phy.en_vc loop condition with port_mask; camss-csid-4-1.c and
camss-csid-4-7.c are legacy-only, single-port backends and get a
purely mechanical signature update, with port_mask and port_cfg
unused.

Signed-off-by: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
---
 .../platform/qcom/camss/camss-csid-340.c      |  5 +-
 .../platform/qcom/camss/camss-csid-4-1.c      |  3 +-
 .../platform/qcom/camss/camss-csid-4-7.c      |  3 +-
 .../platform/qcom/camss/camss-csid-680.c      |  7 +--
 .../platform/qcom/camss/camss-csid-gen2.c     | 54 +++++++++++++------
 .../platform/qcom/camss/camss-csid-gen3.c     | 34 ++++++------
 .../media/platform/qcom/camss/camss-csid.c    | 18 ++++++-
 .../media/platform/qcom/camss/camss-csid.h    | 21 +++++++-
 8 files changed, 103 insertions(+), 42 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-340.c b/drivers/media/platform/qcom/camss/camss-csid-340.c
index 42ff629ce410..46fbc46102e4 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-340.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-340.c
@@ -146,14 +146,15 @@ static void __csid_configure_stream(struct csid_device *csid, u8 enable, u8 port
 	writel_relaxed(enable, csid->base + CSID_CTRL(iface));
 }
 
-static void csid_configure_streams(struct csid_device *csid, u8 enable)
+static void csid_configure_streams(struct csid_device *csid, u32 port_mask,
+				   const struct csid_port_config *port_cfg, u8 enable)
 {
 	int i;
 
 	__csid_configure_rx(csid, &csid->phy);
 
 	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++) {
-		if (csid->phy.en_vc & BIT(i))
+		if (port_mask & BIT(i))
 			__csid_configure_stream(csid, !!enable, i, 0);
 	}
 }
diff --git a/drivers/media/platform/qcom/camss/camss-csid-4-1.c b/drivers/media/platform/qcom/camss/camss-csid-4-1.c
index 6998e1c52895..c3e00de326aa 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-4-1.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-4-1.c
@@ -44,7 +44,8 @@
 #define CAMSS_CSID_TG_DT_n_CGG_1(n)	(0x0b0 + 0xc * (n))
 #define CAMSS_CSID_TG_DT_n_CGG_2(n)	(0x0b4 + 0xc * (n))
 
-static void csid_configure_stream(struct csid_device *csid, u8 enable)
+static void csid_configure_stream(struct csid_device *csid, u32 port_mask,
+				  const struct csid_port_config *port_cfg, u8 enable)
 {
 	struct csid_testgen_config *tg = &csid->testgen;
 	u32 val;
diff --git a/drivers/media/platform/qcom/camss/camss-csid-4-7.c b/drivers/media/platform/qcom/camss/camss-csid-4-7.c
index 66054d4872e6..2e8aea3ee545 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-4-7.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-4-7.c
@@ -43,7 +43,8 @@
 #define CAMSS_CSID_TG_DT_n_CGG_1(n)	(0x0b8 + 0xc * (n))
 #define CAMSS_CSID_TG_DT_n_CGG_2(n)	(0x0bc + 0xc * (n))
 
-static void csid_configure_stream(struct csid_device *csid, u8 enable)
+static void csid_configure_stream(struct csid_device *csid, u32 port_mask,
+				  const struct csid_port_config *port_cfg, u8 enable)
 {
 	struct csid_testgen_config *tg = &csid->testgen;
 	u32 sink_code = csid->fmt[MSM_CSID_PAD_SINK].code;
diff --git a/drivers/media/platform/qcom/camss/camss-csid-680.c b/drivers/media/platform/qcom/camss/camss-csid-680.c
index 452640e72f6d..a864dcf7a1e8 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-680.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-680.c
@@ -310,15 +310,16 @@ static void __csid_configure_rdi_irq(struct csid_device *csid, u8 enable, u8 rdi
 	writel(val, csid->base + CSID_CSI2_RDIN_IRQ_MASK(rdi));
 }
 
-static void csid_configure_stream(struct csid_device *csid, u8 enable)
+static void csid_configure_stream(struct csid_device *csid, u32 port_mask,
+				  const struct csid_port_config *port_cfg, u8 enable)
 {
 	int i;
 
 	__csid_configure_top(csid);
 
-	/* Loop through all enabled ports and configure a stream for each */
+	/* Loop through all ports set in port_mask and configure a stream for each */
 	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++) {
-		if (csid->phy.en_vc & BIT(i)) {
+		if (port_mask & BIT(i)) {
 			__csid_configure_rdi_stream(csid, enable, i, 0);
 			__csid_configure_rx(csid, &csid->phy, 0);
 			__csid_configure_rdi_irq(csid, enable, i);
diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen2.c b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
index a351ac4b9172..1ed7ca63907b 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-gen2.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
@@ -255,13 +255,8 @@ static void __csid_configure_testgen(struct csid_device *csid, u8 enable, u8 por
 	writel_relaxed(val, csid->base + CSID_TPG_CTRL);
 }
 
-static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8 port, u8 vc)
+static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8 port, u8 vc, u8 dt)
 {
-	/* Source pads matching RDI channels on hardware. Pad 1 -> RDI0, Pad 2 -> RDI1, etc. */
-	struct v4l2_mbus_framefmt *input_format = &csid->fmt[MSM_CSID_PAD_FIRST_SRC + port];
-	const struct csid_format_info *format = csid_get_fmt_entry(csid->res->formats->formats,
-								   csid->res->formats->nformats,
-								   input_format->code);
 	u32 val;
 
 	/*
@@ -283,7 +278,7 @@ static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8
 	val |= 1 << RDI_CFG0_TIMESTAMP_EN;
 	/* note: for non-RDI path, this should be format->decode_format */
 	val |= DECODE_FORMAT_PAYLOAD_ONLY << RDI_CFG0_DECODE_FORMAT;
-	val |= format->data_type << RDI_CFG0_DATA_TYPE;
+	val |= dt << RDI_CFG0_DATA_TYPE;
 	val |= vc << RDI_CFG0_VIRTUAL_CHANNEL;
 	val |= dt_id << RDI_CFG0_DT_ID;
 	writel_relaxed(val, csid->base + CSID_RDI_CFG0(port));
@@ -334,22 +329,47 @@ static void __csid_configure_rdi_irq(struct csid_device *csid, u8 enable, u8 rdi
 	writel_relaxed(val, csid->base + CSID_CSI2_RDIN_IRQ_MASK(rdi));
 }
 
-static void csid_configure_stream(struct csid_device *csid, u8 enable)
+static void csid_configure_stream(struct csid_device *csid, u32 port_mask,
+				  const struct csid_port_config *port_cfg, u8 enable)
 {
 	struct csid_testgen_config *tg = &csid->testgen;
+	unsigned long mask = port_mask;
+	bool config_testgen = false;
 	u8 i;
 
-	/* Loop through all enabled ports and configure a stream for each */
-	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++)
-		if (csid->phy.en_vc & BIT(i)) {
-			if (tg->enabled)
-				__csid_configure_testgen(csid, enable, i, 0);
-
-			__csid_configure_rdi_stream(csid, enable, i, 0);
+	/*
+	 * Testgen has only one configuration for all ports.
+	 * The csid guarantees that the enabled_ports is set/cleared
+	 * after configure stream. !csid->enabled_ports is
+	 * on first enable, (port_mask == csid->enabled_ports) is
+	 * on last disable.
+	 */
+	if (!csid->enabled_ports || port_mask == csid->enabled_ports)
+		config_testgen = true;
+
+	for_each_set_bit(i, &mask, MSM_CSID_MAX_SRC_STREAMS) {
+		if (enable) {
+			if (tg->enabled && config_testgen) {
+				__csid_configure_testgen(csid, 1, i, port_cfg[i].vc);
+				config_testgen = false;
+			}
+			__csid_configure_rdi_stream(csid, 1, i, port_cfg[i].vc,
+						    port_cfg[i].dt);
 			__csid_configure_rx(csid, &csid->phy, 0);
-			__csid_configure_rdi_irq(csid, enable, i);
-			__csid_ctrl_rdi(csid, enable, i);
+			__csid_configure_rdi_irq(csid, 1, i);
+			__csid_ctrl_rdi(csid, 1, i);
+		} else {
+			__csid_ctrl_rdi(csid, 0, i);
+			__csid_configure_rdi_irq(csid, 0, i);
+
+			if (tg->enabled && config_testgen) {
+				__csid_configure_testgen(csid, 0, i, 0);
+				config_testgen = false;
+			}
+
+			__csid_configure_rdi_stream(csid, 0, i, 0, 0);
 		}
+	}
 }
 
 static int csid_configure_testgen_pattern(struct csid_device *csid, s32 val)
diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen3.c b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
index 231b53d3e44e..f270c17d041e 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-gen3.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
@@ -161,15 +161,11 @@ static void __csid_configure_wrapper(struct csid_device *csid)
 	writel(val, csid->camss->csid_wrapper_base + CSID_IO_PATH_CFG0(csid->id));
 }
 
-static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8 port, u8 vc)
+static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable,
+					u8 port, u8 vc, u8 dt)
 {
 	u32 val;
 	u8 lane_cnt = csid->phy.lane_cnt;
-	/* Source pads matching RDI channels on hardware. Pad 1 -> RDI0, Pad 2 -> RDI1, etc. */
-	struct v4l2_mbus_framefmt *input_format = &csid->fmt[MSM_CSID_PAD_FIRST_SRC + port];
-	const struct csid_format_info *format = csid_get_fmt_entry(csid->res->formats->formats,
-								   csid->res->formats->nformats,
-								   input_format->code);
 
 	if (!lane_cnt)
 		lane_cnt = 4;
@@ -193,7 +189,7 @@ static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8
 	/* note: for non-RDI path, this should be format->decode_format */
 	val |= DECODE_FORMAT_PAYLOAD_ONLY << RDI_CFG0_DECODE_FORMAT;
 	val |= vc << RDI_CFG0_VC;
-	val |= format->data_type << RDI_CFG0_DT;
+	val |= dt << RDI_CFG0_DT;
 	val |= dt_id << RDI_CFG0_DT_ID;
 
 	writel(val, csid->base + CSID_RDI_CFG0(port));
@@ -242,20 +238,28 @@ static void __csid_configure_rdi_irq(struct csid_device *csid, u8 enable, u8 rdi
 	writel(val, csid->base + CSID_TOP_IRQ_MASK);
 }
 
-static void csid_configure_stream(struct csid_device *csid, u8 enable)
+static void csid_configure_stream(struct csid_device *csid, u32 port_mask,
+				  const struct csid_port_config *port_cfg, u8 enable)
 {
+	unsigned long mask = port_mask;
 	u8 i;
 
 	__csid_configure_wrapper(csid);
 
-	/* Loop through all enabled ports and configure a stream for each */
-	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++)
-		if (csid->phy.en_vc & BIT(i)) {
-			__csid_configure_rdi_stream(csid, enable, i, 0);
-			__csid_configure_rx(csid, &csid->phy, 0);
-			__csid_configure_rdi_irq(csid, enable, i);
-			__csid_ctrl_rdi(csid, enable, i);
+	/* Loop through all ports set in port_mask and configure a stream for each */
+	for_each_set_bit(i, &mask, MSM_CSID_MAX_SRC_STREAMS) {
+		u8 vc = 0, dt = 0;
+
+		if (enable) {
+			vc = port_cfg[i].vc;
+			dt = port_cfg[i].dt;
 		}
+
+		__csid_configure_rdi_stream(csid, enable, i, vc, dt);
+		__csid_configure_rx(csid, &csid->phy, 0);
+		__csid_configure_rdi_irq(csid, enable, i);
+		__csid_ctrl_rdi(csid, enable, i);
+	}
 }
 
 static int csid_configure_testgen_pattern(struct csid_device *csid, s32 val)
diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
index 0f819c34e760..2efaeef83606 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.c
+++ b/drivers/media/platform/qcom/camss/camss-csid.c
@@ -783,7 +783,23 @@ static int csid_set_stream(struct v4l2_subdev *sd, int enable)
 		for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++)
 			atomic_set(&csid->sof_seq[i], -1);
 
-		csid->res->hw_ops->configure_stream(csid, enable);
+		for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++) {
+			if (csid->phy.en_vc & BIT(i)) {
+				struct v4l2_mbus_framefmt *input_format =
+					&csid->fmt[MSM_CSID_PAD_FIRST_SRC + i];
+				const struct csid_format_info *format =
+					csid_get_fmt_entry(csid->res->formats->formats,
+							   csid->res->formats->nformats,
+							   input_format->code);
+
+				csid->port_cfg[i].vc = 0;
+				csid->port_cfg[i].dt = format->data_type;
+			}
+		}
+
+		csid->res->hw_ops->configure_stream(csid, csid->phy.en_vc, csid->port_cfg, enable);
+		csid->enabled_ports = enable ? csid->phy.en_vc : 0;
+
 		csid->phy.need_vc_update = false;
 	}
 
diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/media/platform/qcom/camss/camss-csid.h
index 8edb258b0ae5..5f09beffa5f5 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.h
+++ b/drivers/media/platform/qcom/camss/camss-csid.h
@@ -72,14 +72,29 @@ struct csid_phy_config {
 	u8 need_vc_update;
 };
 
+/*
+ * struct csid_port_config - Per-port CSI-2 virtual channel/data type
+ * @vc: Virtual channel
+ * @dt: Data type
+ */
+struct csid_port_config {
+	u8 vc;
+	u8 dt;
+};
+
 struct csid_device;
 
 struct csid_hw_ops {
 	/*
-	 * configure_stream - Configures and starts CSID input stream
+	 * configure_stream - Configure and start/stop CSID input streams
 	 * @csid: CSID device
+	 * @port_mask: bitmask of ports (bit i = port i) to configure
+	 * @port_cfg: per-port VC/DT, valid at every port position set in
+	 *	@port_mask. If @enable is 0, @port_cfg can be NULL.
+	 * @enable: 1 to enable the ports in @port_mask, 0 to disable them
 	 */
-	void (*configure_stream)(struct csid_device *csid, u8 enable);
+	void (*configure_stream)(struct csid_device *csid, u32 port_mask,
+				 const struct csid_port_config *port_cfg, u8 enable);
 
 	/*
 	 * configure_testgen_pattern - Validates and configures output pattern mode
@@ -170,6 +185,8 @@ struct csid_device {
 	const struct csid_subdev_resources *res;
 	atomic_t frame_sync_users;
 	atomic_t sof_seq[MSM_CSID_MAX_SRC_STREAMS];
+	struct csid_port_config port_cfg[MSM_CSID_MAX_SRC_STREAMS];
+	u32 enabled_ports;
 };
 
 struct camss_subdev_resources;
-- 
2.34.1

